function DreamRunPreRunStartPresentation( usee )
	local unequipAnimation = GetEquippedWeaponValue("UnequipAnimation") or "MelinoeIdleWeaponless"
	SetAnimation({ Name = unequipAnimation, DestinationId = CurrentRun.Hero.ObjectId, PlaySpeed = 2 })

	thread( PlayVoiceLines, HeroVoiceLines.DreamRunEnterVoiceLines, true )

	wait( 0.5 )

	SetAnimation({ Name = "Melinoe_DeathHover_Start", DestinationId = CurrentRun.Hero.ObjectId })
	PlaySound({ Name = "/SFX/Menu Sounds/CauldronSpellCompleteNova", Id = CurrentRun.Hero.ObjectId })

	wait(0.5)

	thread( DoRumble, { { ScreenPreWait = 0.02, Fraction = 0.15, Duration = 0.7 }, } )
	AdjustColorGrading({ Name = "Chaos", Duration = 0.7 })
	PlaySound({ Name = "/Leftovers/SFX/PlayerRespawn" })

	wait( 0.2 )

	AngleTowardTarget({ Id = CurrentRun.Hero.ObjectId, DestinationId = usee.ObjectId })
	PlaySound({ Name = "/Music/DreamStartStinger", Delay = 0.3 })

	wait( 0.5 )

	FullScreenFadeOutAnimation( "RoomTransitionDreamIn", "NightMoon")
end

function DreamIntroEntrancePresentation( currentRun, currentRoom )

	local firstVisitRequirements =
	{
		{
			PathFalse = { "GameState", "TextLinesRecord", "HypnosDreamRunStart01" }
		}
	}

	AddInputBlock({ Name = "DreamIntroEntrancePresentation" })
	AdjustFullscreenBloom({ Name = "Dream", })
	if currentRoom.HeroEndPoint ~= nil then
		AngleTowardTarget({ Id = currentRun.Hero.ObjectId, DestinationId = currentRoom.HeroEndPoint })
		Teleport({ Id = currentRun.Hero.ObjectId, DestinationId = currentRoom.HeroEndPoint })
	end
	LockCamera({ Id = currentRun.Hero.ObjectId, Duration = 0, OffsetY = -50 })
	PanCamera({ Id = currentRun.Hero.ObjectId, Duration = 2.6, EaseIn = 0, Retarget = true})
	wait(0.03)

	SetAlpha({ Id = currentRun.Hero.ObjectId, Fraction = 0, Duration = 0.0 })
	SetAnimation({ Name = "Melinoe_DreamTeleport_FireLoop", DestinationId = CurrentRun.Hero.ObjectId })

	FadeIn({ Duration = 0.0 })
	FullScreenFadeInAnimation( "RoomTransitionDreamOut", "NightMoon" )

	wait(0.2)

	thread( PlayVoiceLines, currentRoom.EnterVoiceLines, true )

	wait(0.6)

	CreateAnimation({ Name = "DreamTeleportPoof", DestinationId = CurrentRun.Hero.ObjectId })
	PlaySound({ Name = "/SFX/Player Sounds/NyxTurboBoost" })
	wait(0.1)
	SetAlpha({ Id = currentRun.Hero.ObjectId, Fraction = 1.0, Duration = 0.1 })
	SetAnimation({ Name = "Melinoe_DreamTeleport_End_NoEquip", DestinationId = CurrentRun.Hero.ObjectId })

	AdjustFullscreenBloom({ Name = "Off", Duration = 1.0 })

	if IsGameStateEligible( CurrentRun.Hero, firstVisitRequirements ) then
		wait(1.2)
		SetAnimation({ Name = "MelTalkBrooding01", DestinationId = CurrentRun.Hero.ObjectId })
		wait(1.2)
		SetAnimation({ Name = "MelTalkBrooding01ReturnToIdle", DestinationId = CurrentRun.Hero.ObjectId })
		wait(0.45)
	else
		wait(0.7)
	end
	RemoveInputBlock({ Name = "DreamIntroEntrancePresentation" })
end

function ShowDreamRunMessage( source, args )
	ZeroMouseTether( "ShowDreamRunMessage" )
	thread( PlayVoiceLines, GlobalVoiceLines.DreamRunInfoReactionLines, nil, nil, args )
	GenericInfoPresentation( { InfoMessageId = "DreamRunIntro" } )
	UnzeroMouseTether( "ShowDreamRunMessage" )
end

function StartNewDreamRunPresentation( currentRun, exitDoor, args )
	Stop({ Id = CurrentRun.Hero.ObjectId })
	SetAnimation({ Name = "MelinoeIdle", DestinationId = CurrentRun.Hero.ObjectId })
	wait(0.01)
	SetAnimation({ Name = "Melinoe_DreamTeleport_Start", DestinationId = CurrentRun.Hero.ObjectId })
	PlaySound({ Name = "/Music/DreamStartStinger" })

	SetSoundCueValue({ Names = { "Section" }, Id = AudioState.SecretMusicId, Value = 10 })
	StopSound({ Id = AudioState.SecretMusicId, Duration = 5 })
	AudioState.SecretMusicId = nil
	AudioState.SecretMusicName = nil
	
	local dreamVignette = CreateScreenObstacle({ Name = "BlankObstacle", Group = "Combat_Menu_TraitTray_Overlay_Additive",
	X = ScreenCenterX, Y = ScreenCenterY,
	ScaleX = ScreenScaleX, ScaleY = ScreenScaleY,
	Animation = "DreamVignette" })

	SetAlpha({ Id = dreamVignette, Fraction = 0 })
	SetAlpha({ Id = dreamVignette, Fraction = 1, Duration = 2, EaseIn = 0, EaseOut = 1 })

	CreateAnimation({ Name = "DreamTeleportCloudExit", DestinationId = CurrentRun.Hero.ObjectId })

	AdjustColorGrading({ Name = "NightMoon", Duration = 2.1 })
	AdjustFullscreenBloom({ Name = "Dream", Duration = 3.5 })
	PanCamera({ Id = CurrentRun.Hero.ObjectId, OffsetY = -1000, Duration = 8.0, Retarget = true, EaseIn = 0, EaseOut = 0.1 })
	FocusCamera({ Fraction = 0.6, Duration = 8 })
	thread( PlayVoiceLines, GlobalVoiceLines.DreamRunStartLines )
	SetThingProperty({ Property = "AddColor", Value = true, DestinationId = CurrentRun.Hero.ObjectId })
	SetColor({ Color = {0,0,0,1}, Id = CurrentRun.Hero.ObjectId, Duration = 0 })
	SetColor({ Color = {0.7,0.85,1,1}, Id = CurrentRun.Hero.ObjectId, Duration = 1.2, EaseIn = 0, EaseOut = 1 })
	wait( 1.7 )
	CreateAnimation({ Name = "DreamTeleportPoof_Delay", DestinationId = CurrentRun.Hero.ObjectId, OffsetZ = 200, Group = "Combat_Menu_TraitTray_Overlay_Additive" })
	PlaySound({ Name = "/SFX/Player Sounds/NyxTurboBoost" })
	wait( 0.2 )
	SetAlpha({ Id = CurrentRun.Hero.ObjectId, Fraction = 0.0, Duration = 0.1 })
	FullScreenFadeOutAnimation( "RoomTransitionDreamIn", "NightMoon")
	
end

function DreamRunRoomExitPresentation( currentRun, exitDoor, args )
	AddInputBlock({ Name = "DreamRunRoomExitPresentation" })
	wait( 0.1 )
	ClearCameraClamp({ LerpTime = 1.3 })

	Stop({ Id = CurrentRun.Hero.ObjectId })
	wait (0.01)

	local unequipAnimation = GetEquippedWeaponValue("UnequipAnimation") or "MelinoeIdleWeaponless"
	SetAnimation({ Name = unequipAnimation, DestinationId = CurrentRun.Hero.ObjectId })

	thread( PlayVoiceLines, HeroVoiceLines.DreamRoomExitVoiceLines, true )

	wait( 1.3 )

	SetAnimation({ Name = "Melinoe_DreamTeleport_Start", DestinationId = CurrentRun.Hero.ObjectId })
	PlaySound({ Name = "/Music/DreamStartStinger" })

	CreateAnimation({ Name = "DreamTeleportCloudExit", DestinationId = CurrentRun.Hero.ObjectId })
	AdjustColorGrading({ Name = "NightMoon", Duration = 2.1 })
	AdjustFullscreenBloom({ Name = "Dream", Duration = 3.5 })
	PanCamera({ Id = CurrentRun.Hero.ObjectId, OffsetY = -1000, Duration = 8.0, Retarget = true, EaseIn = 0, EaseOut = 0.1 })
	FocusCamera({ Fraction = 0.6, Duration = 8 })
	wait( 1.7 )
	CreateAnimation({ Name = "DreamTeleportPoof", DestinationId = CurrentRun.Hero.ObjectId })
	PlaySound({ Name = "/SFX/Player Sounds/NyxTurboBoost" })
	wait( 0.1 )
	SetAlpha({ Id = CurrentRun.Hero.ObjectId, Fraction = 0.0, Duration = 0.1 })
	wait( 0.1 )
	FullScreenFadeOutAnimation( "RoomTransitionIn", "NightMoon")

	RemoveInputBlock({ Name = "DreamRunRoomExitPresentation" })
end

function DreamPostBossEntrancePresentation( currentRun, currentRoom, args )

	AddInputBlock({ Name = "DreamPostBossEntrancePresentation" })
	AdjustFullscreenBloom({ Name = "Dream", })
	if currentRoom.HeroEndPoint ~= nil then
		AngleTowardTarget({ Id = currentRun.Hero.ObjectId, DestinationId = currentRoom.HeroEndPoint })
		Teleport({ Id = currentRun.Hero.ObjectId, DestinationId = currentRoom.HeroEndPoint })
	end
	LockCamera({ Id = currentRun.Hero.ObjectId, Duration = 0, OffsetY = -50 })
	PanCamera({ Id = currentRun.Hero.ObjectId, Duration = 1.2, EaseIn = 0, Retarget = true})
	wait(0.03)

	SetAlpha({ Id = currentRun.Hero.ObjectId, Fraction = 0, Duration = 0.0 })
	SetAnimation({ Name = "Melinoe_DreamTeleport_FireLoop", DestinationId = CurrentRun.Hero.ObjectId })

	FadeIn({ Duration = 0.0 })
	FullScreenFadeInAnimation()

	wait(1.3)

	CreateAnimation({ Name = "DreamTeleportPoof", DestinationId = CurrentRun.Hero.ObjectId })
	PlaySound({ Name = "/SFX/Player Sounds/NyxTurboBoost" })
	wait(0.1)
	SetAlpha({ Id = currentRun.Hero.ObjectId, Fraction = 1.0, Duration = 0.1 })
	SetAnimation({ Name = "Melinoe_DreamTeleport_End", DestinationId = CurrentRun.Hero.ObjectId })

	thread( PlayVoiceLines, HeroVoiceLines.DreamPostBossEntranceVoiceLines, true )

	AdjustFullscreenBloom({ Name = "Off", Duration = 1.0 })
	wait(0.4)
	RemoveInputBlock({ Name = "DreamPostBossEntrancePresentation" })
end

function GetDreamRunExitUseText()
	if CurrentRun.CurrentRoom.ExitsUnlocked then
		return "UseLeaveRoom"
	else
		return "UseExitDoorWhileLocked"
	end
end

function UsedDreamRunExitDoorPresentation( door )
	Shake({ Id = door.ObjectId, Speed = 150, Distance = 8, Duration = 0.12 })
	wait(0.12)
	Flash({ Id = door.ObjectId, Speed = 1, MinFraction = 0.7, MaxFraction = 0.0, Color = Color.White, Duration = 0.6 })
	Shake({ Id = door.ObjectId, Speed = 100, Distance = 6, Duration = 0.12 })
	wait(0.12)
	Shake({ Id = door.ObjectId, Speed = 50, Distance = 4, Duration = 0.12 })
	wait(0.12)
end

function DreamPostBossExitPresentation( currentRun, exitDoor, args )

	AddInputBlock({ Name = "DreamPostBossExitPresentation" })
	ToggleCombatControl( { "AdvancedTooltip" } , false, "LeaveRoom" )
	HideCombatUI( "DreamPostBossExitPresentation" )
	LeaveRoomAudio( currentRun, exitDoor )

	ClearCameraClamp({ LerpTime = 0.5 })
	Stop({ Id = CurrentRun.Hero.ObjectId })
	wait (0.05)

	PlaySound({ Name = "/SFX/Menu Sounds/GeneralWhooshMENULoudLow" })
	PlaySound({ Name = "/Leftovers/SFX/BallTossLarge" })
	PlayInteractAnimation( exitDoor.ObjectId )

	thread( PlayVoiceLines, HeroVoiceLines.DreamPostBossExitVoiceLines, true )

	wait( 0.5 )

	SetAnimation({ Name = "Melinoe_DreamTeleport_Start", DestinationId = CurrentRun.Hero.ObjectId })
	PlaySound({ Name = "/Music/DreamStartStinger" })

	CreateAnimation({ Name = "DreamTeleportCloudExit", DestinationId = CurrentRun.Hero.ObjectId })
	AdjustColorGrading({ Name = "NightMoon", Duration = 2.1 })
	AdjustFullscreenBloom({ Name = "Dream", Duration = 3.5 })
	PanCamera({ Id = CurrentRun.Hero.ObjectId, OffsetY = -1000, Duration = 8.0, Retarget = true, EaseIn = 0, EaseOut = 0.1 })
	FocusCamera({ Fraction = 0.6, Duration = 8 })
	wait( 1.7 )
	CreateAnimation({ Name = "DreamTeleportPoof", DestinationId = CurrentRun.Hero.ObjectId })
	PlaySound({ Name = "/SFX/Player Sounds/NyxTurboBoost" })
	wait( 0.1 )
	SetAlpha({ Id = CurrentRun.Hero.ObjectId, Fraction = 0.0, Duration = 0.1 })
	wait( 0.1 )
	FullScreenFadeOutAnimation( "RoomTransitionIn", "NightMoon")

	RemoveInputBlock({ Name = "DreamPostBossExitPresentation" })
	ToggleCombatControl( { "AdvancedTooltip" } , true, "LeaveRoom" )	
end

function EndDreamRunPresentation()
	AddInputBlock({ Name = "EndDreamRunPresentation" })
	SetPlayerInvulnerable( "EndDreamRunPresentation" )

	wait( 0.03 )

	Stop({ Id = CurrentRun.Hero.ObjectId })

	wait( 0.03 )

	local unequipAnimation = GetEquippedWeaponValue("UnequipAnimation") or "MelinoeIdleWeaponless"
	SetAnimation({ Name = unequipAnimation, DestinationId = CurrentRun.Hero.ObjectId, PlaySpeed = 2.0 })
	
	FocusCamera({ Fraction = 0.88, Duration = 3, ZoomType = "Ease" })
	PlaySound({ Name = "/Leftovers/Menu Sounds/EmoteAscendedBeowulfStrings" })

	thread( PlayVoiceLines, HeroVoiceLines.DreamRunClearedVoiceLines, true )

	wait( 0.6 )

	SetAnimation({ Name = "Melinoe_DreamTeleport_Start", DestinationId = CurrentRun.Hero.ObjectId })

	AdjustColorGrading({ Name = "NightMoon", Duration = 2.1 })
	AdjustFullscreenBloom({ Name = "Dream", Duration = 3.5 })

	wait( 0.5 )

	CurrentRun.ActiveBiomeTimer = false
	ToggleCombatControl( CombatControlsDefaults, false, "EndDreamRunPresentation" )

	wait( 0.5 )

	-- destroy the player / back to DeathArea
	SetPlayerVulnerable( "EndDreamRunPresentation" )
	RemoveInputBlock({ Name = "EndDreamRunPresentation" })
	ToggleCombatControl( CombatControlsDefaults, true, "EndDreamRunPresentation" )
	
	thread( Kill, CurrentRun.Hero )
	wait( 0.08 )

	FadeIn({ Duration = 0.5 })
end

function RoomEntranceDreamBiomeStart( currentRun, currentRoom, args )
	AddInputBlock({ Name = "RoomEntranceDreamBiomeStart" })

	-- Fields
	if currentRoom.RoomSetName == "H" then
		local nearbyGhostWalls = GetIdsByType({ Names = { "H_GhostWall", "H_GhostWall_Sparse" } })
		if not GetConfigOptionValue({ Name = "EditingMode" }) then
			SetAlpha({ Ids = nearbyGhostWalls, Fraction = 0, Duration = 0 })
		end
	end

	wait(0.03)

	AdjustFullscreenBloom({ Name = "Dream", })

	local roomData = RoomData[currentRoom.Name] or currentRoom
	if roomData.AltHeroSpawnAngle ~= nil then
		SetGoalAngle({ Id = currentRun.Hero.ObjectId, Angle = roomData.AltHeroSpawnAngle, CompleteAngle = true })
	elseif currentRoom.HeroEndPoint ~= nil then
		AngleTowardTarget({ Id = currentRun.Hero.ObjectId, DestinationId = currentRoom.HeroEndPoint })
	end
	if currentRoom.HeroEndPoint ~= nil then
		Teleport({ Id = currentRun.Hero.ObjectId, DestinationId = currentRoom.HeroEndPoint })
	end
	LockCamera({ Id = currentRun.Hero.ObjectId, Duration = 0, OffsetY = -100 })
	PanCamera({ Id = currentRun.Hero.ObjectId, Duration = 1.8, EaseIn = 0, Retarget = true})
	wait(0.03)

	SetAlpha({ Id = currentRun.Hero.ObjectId, Fraction = 0, Duration = 0.0 })
	SetAnimation({ Name = "Melinoe_DreamTeleport_FireLoop", DestinationId = CurrentRun.Hero.ObjectId })

	FadeIn({ Duration = 0 })
	FullScreenFadeInAnimation( "RoomTransitionDreamOut", "NightMoon", 1.5 )

	wait(1.3)
	CreateAnimation({ Name = "DreamTeleportPoof", DestinationId = CurrentRun.Hero.ObjectId })
	PlaySound({ Name = "/SFX/Player Sounds/NyxTurboBoost" })
	wait(0.1)
	SetAlpha({ Id = currentRun.Hero.ObjectId, Fraction = 1.0, Duration = 0.1 })
	SetAnimation({ Name = "Melinoe_DreamTeleport_End", DestinationId = CurrentRun.Hero.ObjectId })
	SetThingProperty({ Property = "AddColor", Value = true, DestinationId = CurrentRun.Hero.ObjectId })
	SetColor({ Color = {0.7,0.85,1,1}, Id = CurrentRun.Hero.ObjectId, Duration = 0 })
	SetColor({ Color = {0,0,0,1}, Id = CurrentRun.Hero.ObjectId, Duration = 1.4, EaseIn = 0, EaseOut = 1 })

	thread( PlayVoiceLines, HeroVoiceLines.DreamBiomeStartVoiceLines, true )

	AdjustFullscreenBloom({ Name = "Off", Duration = 1.5 })
	wait(1.4)

	SetThingProperty({ Property = "AddColor", Value = false, DestinationId = CurrentRun.Hero.ObjectId })
	SetColor({ Color = {1,1,1,1}, Id = CurrentRun.Hero.ObjectId, Duration = 0 })

	RemoveInputBlock({ Name = "RoomEntranceDreamBiomeStart" })
end