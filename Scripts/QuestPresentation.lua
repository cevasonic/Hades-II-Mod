function QuestLogOpenFinishPresentation( screen )
	if screen.AnyNew then
		thread( PlayVoiceLines, HeroVoiceLines.OpenedQuestLogNewQuestsAddedVoiceLines, true )
	elseif screen.NumToCashOut == 1 then
		thread( PlayVoiceLines, HeroVoiceLines.OpenedQuestLogSingleQuestCompleteVoiceLines, true )
	elseif screen.NumToCashOut >= 2 then
		thread( PlayVoiceLines, HeroVoiceLines.OpenedQuestLogMultiQuestsCompleteVoiceLines, true )
	else
		thread( PlayVoiceLines, HeroVoiceLines.OpenedQuestLogVoiceLines, true )
	end
end

function MouseOverQuest( button )
	local screen = button.Screen
	if screen.SelectedButton ~= button then
		screen.ProgressPageOffset = 0
		QuestScreenShowDescription( button )
	end

	local selectButtonText = nil
	if GameState.QuestStatus[button.Data.Name] == "CashedOut" then
		if button.Data.InterstitialData ~= nil and button.OnPressedFunctionName ~= nil then
			selectButtonText = screen.Components.SelectButton.AltText
			if not GameState.PlayedQuestInterstitials[button.Data.Name] and not SetThreadWait( "QuestInterstitialPulse", 0.5 ) then
				thread( PulseContextActionPresentation, screen.Components.SelectButton, { ThreadName = "QuestInterstitialPulse", InitialWait = 0.5, PulseOnce = true } )
			end
		end
	elseif IsGameStateEligible( button.Data, button.Data.CompleteGameStateRequirements ) then
		selectButtonText = screen.Components.SelectButton.Text
	end
	if selectButtonText ~= nil then
		screen.Components.SelectButton.Visible = true
		SetAlpha({ Id = screen.Components.SelectButton.Id, Fraction = 1.0, Duration = 0.2 })
		ModifyTextBox({ Id = screen.Components.SelectButton.Id, Text = selectButtonText })
	end
end

function MouseOffQuest( button )
	local screen = button.Screen
	SetAlpha({ Id = screen.Components.SelectButton.Id, Fraction = 0.0, Duration = 0.2 })
	screen.Components.SelectButton.Visible = false
end

function QuestScreenShowDescription( button )

	if button == nil then
		return
	end

	local screen = button.Screen
	QuestScreenRemoveDescription( screen.SelectedButton )
	screen.SelectedButton = button
	screen.ClipboardText = button.Data.Name

	ModifyTextBox({ Id = button.Id, ScaleTarget = screen.MouseOverScaleTarget, ScaleDuration = screen.MouseOverScaleDuration })

	Teleport({ Id = screen.Components.SelectionMarker.Id, DestinationId = button.Id, OffsetX = screen.Components.SelectionMarker.Data.ButtonOffsetX, OffsetY = screen.Components.SelectionMarker.Data.ButtonOffsetY })
	SetAlpha({ Id = screen.Components.SelectionMarker.Id, Fraction = 1.0, Duration = 0.2 })

	-- Remove previous description
	DestroyTextBox({ Id = screen.Components.DescriptionBox.Id })

	GenericMouseOverPresentation( button )

	ModifyTextBox({ Id = screen.Components.InfoBoxTitle.Id, Text = button.Data.Name })
	SetAlpha({ Id = screen.Components.InfoBoxTitle.Id, Fraction = 1.0, Duration = 0.2 })

	ModifyTextBox({ Id = screen.Components.InfoBoxDescription.Id, Text = button.Data.Name, UseDescription = true })
	SetAlpha({ Id = screen.Components.InfoBoxDescription.Id, Fraction = 1.0, Duration = 0.2 })

	-- Reward
	local useCompletedDecal = false
	if GameState.QuestStatus[button.Data.Name] == "CashedOut" then
		SetAlpha({ Id = screen.Components.RewardClaimedIcon.Id, Fraction = 1.0, Duration = 0.1 })
		if button.Data.InterstitialData ~= nil then
			useCompletedDecal = true
			SetAnimation({ DestinationId = screen.Components.RewardClaimedIcon.Id, Name = screen.Components.RewardClaimedIcon.SpecialAnimationName })
		else
			SetAnimation({ DestinationId = screen.Components.RewardClaimedIcon.Id, Name = screen.Components.RewardClaimedIcon.AnimationName })
		end
	else
		SetAlpha({ Id = screen.Components.RewardText.Id, Fraction = 1.0, Duration = 0.1 })
		local resourceData = ResourceData[button.Data.RewardResourceName]
		ModifyTextBox({ Id = screen.Components.RewardText.Id,
			LuaKey = "TempTextData",
			LuaValue = { Icon = resourceData.TextIconPath or resourceData.IconPath, Amount = button.Data.RewardResourceAmount },
		})
	end

	local decalName = button.Data.Decal or "Blank"
	if button.Data.CompletedDecal ~= nil and useCompletedDecal then
		decalName = button.Data.CompletedDecal
	end
	SetAnimation({ DestinationId = screen.Components.ShopBackgroundDecal.Id, Name = decalName })

	local newButtonKey = "NewIcon"..button.Index
	if screen.Components[newButtonKey] ~= nil then
		SetAlpha({ Id = screen.Components[newButtonKey].Id, Fraction = 0, Duration = 0.2 })
	end
	if button.Data.OnViewedVoiceLines ~= nil then
		thread( PlayVoiceLines, button.Data.OnViewedVoiceLines, true, CurrentRun.Hero, { RecheckRequirementsPostWait = true } )
	end
	local functionPlayed = false
	if GameState.QuestsViewed[button.Data.Name] then
		functionPlayed = true
	end
	if button.Data.OnViewedFunctionName ~= nil then
		if not functionPlayed then
			thread( CallFunctionName, button.Data.OnViewedFunctionName, button, button.Data.OnViewedFunctionArgs, textLines, screen )
		end
	end
	GameState.QuestsViewed[button.Data.Name] = true
	GameState.QuestsUpdated[button.Data.Name] = nil

	ShowQuestProgress( screen, button.Data )
end

function QuestScreenRemoveDescription( button )
	if button == nil then
		return
	end
	local screen = button.Screen
	ModifyTextBox({ Id = button.Id, ScaleTarget = 1.0, ScaleDuration = 0.2 })
	DestroyTextBox({ Id = screen.Components.DescriptionBox.Id })
	SetAlpha({ Id = screen.Components.RewardText.Id, Fraction = 0.0, Duration = 0.2 })
	SetAlpha({ Id = screen.Components.RewardClaimedIcon.Id, Fraction = 0.0, Duration = 0.2 })
	SetAlpha({ Id = screen.Components.SelectionMarker.Id, Fraction = 0.0, Duration = 0.2 })
end

function QuestLogPrevProgressPage( screen, button )
	local prevOffset = screen.ProgressPageOffset
	screen.ProgressPageOffset = screen.ProgressPageOffset - 2
	if screen.ProgressPageOffset <= 0 then
		screen.ProgressPageOffset = 0
	end
	if prevOffset == screen.ProgressPageOffset then
		return
	end
	PlaySound({ Name = "/SFX/Menu Sounds/DialoguePanelOutMenu", Id = button.Id })
	QuestScreenRemoveDescription( screen.SelectedButton )
	QuestScreenShowDescription( screen.SelectedButton )
end

function QuestLogNextProgressPage( screen, button )
	local prevOffset = screen.ProgressPageOffset
	screen.ProgressPageOffset = screen.ProgressPageOffset + 2
	local maxPageOffset = screen.NumRequirementsColumns - screen.RequirementEntriesMaxColumns
	if maxPageOffset % 2 == 1 then
		maxPageOffset = maxPageOffset + 1
	end
	if screen.ProgressPageOffset > maxPageOffset then
		screen.ProgressPageOffset = maxPageOffset
	end
	if prevOffset == screen.ProgressPageOffset then
		return
	end
	PlaySound({ Name = "/SFX/Menu Sounds/DialoguePanelOutMenu", Id = button.Id })
	QuestScreenRemoveDescription( screen.SelectedButton )
	QuestScreenShowDescription( screen.SelectedButton )

	screen.ViewedQuestProgress[screen.SelectedButton.Data.Name] = true
	killTaggedThreads( "QuestLogPulse" )
end

function QuestAddedPresentation( threadName )

	wait( 0.5, threadName )

	local toastAnchor = CreateScreenObstacle({ Name = "BlankObstacle", X = ScreenCenterX + 600, Y = 750 })
	SetAnimation({ Name = "QuestAdded", DestinationId = toastAnchor })
	PlaySound({ Name = "/SFX/Menu Sounds/NewQuestToast", Id = toastAnchor })

	CreateTextBox({
		Id = toastAnchor,
		Text = "QuestLog_QuestAdded",
		Justification = "Center",
		ShadowColor = {0,0,0,1},
		ShadowOffset = {0, 1},
		OutlineThickness = 4,
		OutlineColor = {0.113, 0.113, 0.113, 1},
		Color = Color.White,
		Font="P22UndergroundSCHeavy",
		TextSymbolScale = 1,
		FontSize = 28,
		OffsetX = 0,
		OffsetY = 120,
	})
	wait( 1.0, threadName )

	ModifyTextBox({ Id = toastAnchor, ColorTarget = Color.White, ColorDuration = 2.0 })
	wait( 0.5, threadName )

	ModifyTextBox({ Id = toastAnchor, FadeTarget = 0.0, FadeDuration = 1.0 })
	wait( 1.0, threadName )

	Destroy({ Id = toastAnchor })

end

function FlashQuestLog()
	wait( 0.5 )
	PlayStatusAnimation( MapState.ActiveObstacles[560662], { Animation = "StatusIconWantsToTalkImportant" } )
	Shake({ Id = 560662, Duration = 0.6, Speed = 600, Distance = 3 })
	Flash({ Id = 560662, Duration = 0, Speed = 2.5, MinFraction = 0, MaxFraction = 0.7, Color = Color.White, ExpireAfterCycle = true })
	PlaySound({ Name = "/Leftovers/World Sounds/ChoirZoomIn" })
end

function QuestUpdatedPresentation( threadName )

	wait( 0.5, threadName )

	local toastAnchor = CreateScreenObstacle({ Name = "BlankObstacle", X = ScreenCenterX + 600, Y = 750 })
	SetAnimation({ Name = "QuestAdded", DestinationId = toastAnchor })
	PlaySound({ Name = "/SFX/Menu Sounds/QuestUpdate", Id = toastAnchor })

	CreateTextBox({
		Id = toastAnchor,
		Text = "QuestLog_QuestUpdated",
		Justification = "Center",
		ShadowColor = {0,0,0,1},
		ShadowOffset = {0, 1},
		OutlineThickness = 4,
		OutlineColor = {0.113, 0.113, 0.113, 1},
		Color = Color.White,
		Font="P22UndergroundSCHeavy",
		TextSymbolScale = 1,
		FontSize = 28,
		OffsetX = 0,
		OffsetY = 120,
	})
	wait( 1.0, threadName )

	ModifyTextBox({ Id = toastAnchor, ColorTarget = Color.White, ColorDuration = 2.0 })
	wait( 0.5, threadName )

	ModifyTextBox({ Id = toastAnchor, FadeTarget = 0.0, FadeDuration = 1.0 })
	wait( 1.0, threadName )

	Destroy({ Id = toastAnchor })

end

function QuestCompletedPresentation( threadName )

	wait( 0.5, threadName )

	local toastAnchor = CreateScreenObstacle({ Name = "BlankObstacle", X = ScreenCenterX + 600, Y = 750 })
	SetAnimation({ Name = "QuestComplete", DestinationId = toastAnchor })
	PlaySound({ Name = "/SFX/Menu Sounds/QuestCompleteToast", Id = toastAnchor })

	CreateTextBox({
		Id = toastAnchor,
		Text = "QuestLog_QuestComplete",
		Justification = "Center",
		ShadowColor = {0,0,0,1},
		ShadowOffset = {0, 1},
		OutlineThickness = 4,
		OutlineColor = {0.113, 0.113, 0.113, 1},
		Color = Color.White,
		Font="P22UndergroundSCHeavy",
		TextSymbolScale = 1,
		FontSize = 28,
		OffsetX = 0,
		OffsetY = 120,
	})
	wait( 1.0, threadName )

	ModifyTextBox({ Id = toastAnchor, ColorTarget = Color.White, ColorDuration = 2.0 })
	wait( 0.5, threadName )

	if CurrentHubRoom ~= nil then
		UpdateAffordabilityStatus()
	end

	ModifyTextBox({ Id = toastAnchor, FadeTarget = 0.0, FadeDuration = 1.0 })
	wait( 1.0, threadName )

	Destroy({ Id = toastAnchor })

end

function MajorQuestCompletedPresentation( source, args )

	args = args or {}

	AddInputBlock({ Name = "MajorQuestCompletedPresentation" })
	AddTimerBlock( CurrentRun, "MajorQuestCompletedPresentation" )
	CurrentRun.Hero.UntargetableFlags.MajorQuestCompletedPresentation = true
	SetPlayerInvulnerable( "MajorQuestCompletedPresentation" )
	SetUnitInvulnerable( source, "MajorQuestCompletedPresentation", { Silent = true } )

	wait( args.Delay )

	local backgroundDimId = CreateScreenObstacle({ Name = "rectangle01", X = ScreenCenterX, Y = ScreenCenterY, Group = "Combat_Menu_TraitTray", Scale = 4.0, ScaleX = ScreenScaleX, ScaleY = ScreenScaleY })
	SetColor({ Id = backgroundDimId, Color = Color.Black, Duration = 0 })
	SetAlpha({ Id = backgroundDimId, Fraction = 0.0, Duration = 0 })
	SetAlpha({ Id = backgroundDimId, Fraction = 0.8, Duration = 0.3 })

	PlaySound({ Name = "/SFX/Menu Sounds/QuestCompleteToast" })
	PlaySound({ Name = "/Music/ARStinger_All_6" })

	SessionMapState.BlockInfoBanners = false
	thread( DisplayInfoBanner, nil, {
		TitleText = args.AltString or "MajorQuestCompleted",
		SubtitleText = args.QuestName,
		FontScale = 1.0,
		SubtitleOffsetY = -20,
		TextOffsetY = 40,
		Color = {0, 255, 168, 255},
		TextColor = Color.BoonPatchLegendary,
		SubTextColor = { 175, 175, 175, 255 },
		Duration = 3.6,
		SubtitleDelay = 1.35,
		TitleFont = "SpectralSCLightTitling",
		SubtitleFont = "SpectralSCLightTitling",
		Layer = "Combat_Menu_TraitTray_Overlay",
		AdditionalAnimation = "GodHoodRaysQuestComplete",
		AnimationName = "InfoBannerQuestLogIn",
		AnimationOutName = "InfoBannerQuestLogOut",
	} )

	wait( 3.6 )

	if args.ShowHeartUnlock then
		wait( 2.0 )
	else
		SetAlpha({ Ids = { backgroundDimId }, Fraction = 0, Duration = 0.2 })
		wait( 0.8 )
		Destroy({ Id = { backgroundDimId } })
	end

	CurrentRun.Hero.UntargetableFlags.MajorQuestCompletedPresentation = nil
	SetPlayerVulnerable( "MajorQuestCompletedPresentation" )
	SetUnitVulnerable( source, "MajorQuestCompletedPresentation" )

	RemoveTimerBlock( CurrentRun, "MajorQuestCompletedPresentation" )
	RemoveInputBlock({ Name = "MajorQuestCompletedPresentation" })

	if args.ShowHeartUnlock then
		RelationshipAdvancedPresentation( source, { BackgroundDimId = backgroundDimId } )
	end

	if not args.SkipQuestStatusCheck then
		thread( CheckQuestStatus )
	end

end

function QuestCashedOutPresentation( screen, button )

	local newButtonKey = "NewIcon"..button.Index
	if screen.Components[newButtonKey] ~= nil then
		SetAlpha({ Id = screen.Components[newButtonKey].Id, Fraction = 0, Duration = 0.1 })
	end

	SetAlpha({ Id = screen.Components["Strikethrough"..button.Index].Id, Fraction = 1.0, Duration = 0.0 })
	SetAnimation({ DestinationId = screen.Components["Strikethrough"..button.Index].Id, Name = "QuestLogScreenStrikethroughCashIn" }) --nopkg

	SetAlpha({ Id = screen.Components.SelectButton.Id, Fraction = 0.0, Duration = 0.2 })

	PlaySound({ Name = "/Leftovers/Menu Sounds/ListStrikethrough", Id = button.Id })

	local morosId = GetClosestUnitOfType({ Id = CurrentRun.Hero.ObjectId, DestinationName = "NPC_Moros_01" })
	local moros = ActiveEnemies[morosId]

	-- play Moros' lines if he is available, otherwise Mel lines
	local cashOutVoiceLines = HeroVoiceLines.CashedOutQuestVoiceLines
	if moros ~= nil and not moros.InPartnerConversation then
		cashOutVoiceLines = button.Data.CashedOutVoiceLines or cashOutVoiceLines
	end

	if button.Data.InterstitialData and not GameState.PlayedQuestInterstitials[button.Data.Name] then
		QuestLogPlayInterstitial( screen, button, { CashingOut = true, VoiceLines = cashOutVoiceLines } )
		button.OnPressedFunctionName = "QuestLogPlayInterstitial"
	else
		if button.Data.CompletedDecal ~= nil then
			SetAnimation({ DestinationId = screen.Components.ShopBackgroundDecal.Id, Name = button.Data.CompletedDecal })
		end
		thread( PlayVoiceLines, cashOutVoiceLines, true )
	end
end

function QuestLogScreenClosePresentation( screen, button )
	SetAnimation({ DestinationId = screen.Components.ShopBackground.Id, Name = "QuestLogScreenOut" })
end

function QuestLogScreenUpdateWithCompletedDecal( screen, button )
	wait( 6.0 ) -- wait until the interstitial covers up the shop background
	if button.Data.CompletedDecal ~= nil then
		SetAnimation({ DestinationId = screen.Components.ShopBackgroundDecal.Id, Name = button.Data.CompletedDecal })
	end

	SetAnimation({ DestinationId = button.SpecialIcon.Id, Name = screen.PlayIconGraphic })
	SetScale({ Id = button.SpecialIcon.Id, Fraction = screen.PlayIconScale })
	Attach({ Id = button.SpecialIcon.Id, DestinationId = button.Id, OffsetX = screen.PlayIconOffsetX, OffsetY = 0 })
	button.SpecialIcon.OnMouseOverFunctionName = "QuestLogMouseOverPlayIcon"
	button.SpecialIcon.OnPressedFunctionName = "QuestLogPressedPlayIcon"
end

function QuestLogPlayInterstitial( screen, button, args )
	args = args or {}

	AddInputBlock({ Name = "QuestLogPlayInterstitial" })
	killTaggedThreads( "QuestInterstitialPulse" )

	local interstitialData = button.Data.InterstitialData
	GameState.PlayedQuestInterstitials[button.Data.Name] = true

	SetAlpha({ Ids = { screen.Components.SelectButton.Id, screen.Components.CloseButton.Id }, Fraction = 0, Duration = 0.2 })
	screen.Components.SelectButton.Visible = false

	PauseSound({ Id = AudioState.AmbienceId })
	PauseSound({ Id = AudioState.RainSoundId })
	PauseMusicianMusic()

	if args.VoiceLines ~= nil then
		PlayVoiceLines( args.VoiceLines, true )
		wait( 0.5 ) -- post-VO wait
	end

	if args.CashingOut then
		thread( QuestLogScreenUpdateWithCompletedDecal, screen, button )
	end

	SetAudioEffectState({ Name = "Reverb", Value = 1.5 })
	SecretMusicPlayer( interstitialData.SecretMusicName )

	if interstitialData.FadeOutForQuestLog then
		FadeOut({ Color = Color.Black, Duration = 0.1 })
		wait( 1.5 )
		FadeIn({ Color = Color.Black, Duration = 2.0 })
	end

	PlaySound({ Name = "/Leftovers/Menu Sounds/EmoteThoughtful" })

	RunInterstitialPresentation( interstitialData, { AllowSkip = not args.CashingOut, IgnoreAltAspectRatioFrames = true } )

	StopSecretMusic()
	SetAudioEffectState({ Name = "Reverb", Value = CurrentHubRoom.ReverbValue })

	if interstitialData.FadeOutForQuestLog then
		FadeIn({ Duration = 0.5 })
		wait( 0.5 )
	end

	ResumeMusicianMusic( nil, { Duration = 0.3 } )
	ResumeSound({ Id = AudioState.AmbienceId })
	ResumeSound({ Id = AudioState.RainSoundId })

	SetAlpha({ Id = screen.Components.CloseButton.Id, Fraction = 1.0, Duration = 0.2 })
	if not args.CashingOut then
		SetAlpha({ Id = screen.Components.SelectButton.Id, Fraction = 1.0, Duration = 0.2 })
		screen.Components.SelectButton.Visible = true
	end

	RemoveInputBlock({ Name = "QuestLogPlayInterstitial" })
end

function QuestLogMouseOverPlayIcon( icon )
	MouseOverQuest( icon.Button )
end

function QuestLogPressedPlayIcon( screen, icon )
	QuestLogPlayInterstitial( icon.Button.Screen, icon.Button )
end