RoomSetData.C =
{
	C_Boss01 =
	{
		ValidateSecretData = false,
		RichPresence = "#RichPresence_Boss",

		BackupCauseOfDeath = "Zagreus",
		LegalEncounters =
		{
			"BossZagreus01",
		},

		ForcedReward = "GemPointsBigDrop",
  
		BreakableValueOptions = { MaxHighValueBreakables = 0 },

		SecretSpawnChance = 0.0,
		ChallengeSpawnChance = 0.0,
		WellShopSpawnChance = 0.0,
		SurfaceShopSpawnChance = 0.0,

		ZoomFraction = 0.9,
		ZoomFractionAlt = 1.0,
		IntroSequenceDuration = 0.65,

		FlipHorizontalChance = 0.0,
		EntranceDirection = "LeftRight",

		SecretMusic = "/Music/BlankMusicCue",
		NextRoomResumeMusic = true,
		BlockGiftBoons = true,	--Don't serve boons that drop objects

		LocationText = "Location_BiomeC",
		DreamLocationText = "Location_BiomeC_Dream",
		SaveProfileLocationText = "Location_BiomeC",
		DreamSaveProfileLocationText = "Location_BiomeC_Dream",
		ResultText = "RunHistoryScreenResult_Elysium",
		DreamResultText = "RunHistoryScreenResult_Elysium_Dream",
		PauseBiomeState = true,

		EntranceFunctionName = "RoomEntranceCBossPresentation",
		EntranceFunctionArgs = { InputBlockReleaseDelay = 4.0 },
		BlockCameraReattach = true,
		ExitFunctionName = "AnomalyExitPresentation",
		NextRoomEntranceFunctionName = "EntranceFromAnomalyPresentation",
		NextRoomEntranceFunctionArgs = { ReturningFromElysium = true },
		EntranceAnimation = "MelinoeSpellFire",
		EntranceVfx = "SecretDoorDiveFx",
		ExitAnimation = "MelinoeSpellFire",
		ExitVfx = "SecretDoorDiveFx",
		LocationAnimName = "InfoBannerElysiumIn",
		LocationAnimOutName = "InfoBannerElysiumOut",
		UsePreviousRoomSet = true,
		SkipTimedDropResources = true,
		IneligibleRewards = { "Devotion", "SpellDrop" },

		StartUnthreadedEvents =
		{
			{
				FunctionName = "GenericPresentation",
				Args =
				{
					LoadVoiceBanks = { "Zagreus" },
				},
			},
		},

		Ambience = "/Ambience/TheseusCrowdAmbientLoop",
		ReverbValue = 2.0,
		GlobalEcho = 0.35,

		UnthreadedEvents =
		{
			{
				FunctionName = "BossIntro",
				Args =
				{
					ProcessTextLinesIds = { 543855 },
					SetupBossIds = { 543855 },
					DelayedStart = true,
					SkipAngleTowardTarget = true,
					SkipBossMusic = true,
					DreamRunIntroFunctionName = "ZagreusBossDreamRunIntro",
				},
			},
		},

		ObstacleData =
		{
			-- Supportive Shade / -- DieHardFan
			[543023] =
			{
				Name = "DieHardFanShade",
				SetupGameStateRequirements =
				{
					{
						PathTrue = { "GameState", "SpeechRecord", "/VO/Melinoe_5524" },
					},
				},
				DestroyIfNotSetup = true,

				SetupEvents =
				{
					{
						Threaded = true,
						FunctionName = "DistanceTrigger",
						Args =
						{
							Repeat = true,
							WithinDistance = 450,

							PostTriggerEvents =
							{
								{
									GameStateRequirements =
									{
										{
											PathTrue = { "CurrentRun", "EnemyKills", "Zagreus" },
										},
									},
									FunctionName = "GenericPresentation",
									Args =
									{
										VoiceLines =
										{
											RandomRemaining = true,
											UsePlayerSource = true,
											PlayOnceFromTableThisRun = true,
											-- SuccessiveChanceToPlay = 0.25,

											PreLineThreadedFunctionName = "PlayEmoteSimple",
											PreLineThreadedFunctionArgs =
											{
												TargetId = 543023,
												AnimationName = "StatusIconSmileRed",
												OffsetZ = -30,
											},

											{ Cue = "/VO/MelinoeField_4804", Text = "Good to see you again, good Shade!", PlayFirst = true },
											{ Cue = "/VO/MelinoeField_4805", Text = "He fought well, good Shade." },
											{ Cue = "/VO/MelinoeField_4806", Text = "Hello again, good Shade!" },
											{ Cue = "/VO/MelinoeField_4807", Text = "You're not upset are you, good Shade?" },
											{ Cue = "/VO/MelinoeField_5361", Text = "Forgive me, won't you, good Shade?" },
											{ Cue = "/VO/MelinoeField_5362", Text = "I don't mean to test your loyalties, good Shade...!" },
											{ Cue = "/VO/MelinoeField_5363", Text = "Cheers for believing in us, good Shade!" },
											{ Cue = "/VO/MelinoeField_5364", Text = "Sorry about the outcome here, good Shade." },
										},
									},
								},
							},
						},
					},
				},
			},

			Using = { Sound = "/SFX/TheseusCrowdBoo", },
		},

		InspectPoints =
		{
			[801524] =
			{
				PlayOnce = true,
				UseText = "UseExamineMisc",
				SetupGameStateRequirements =
				{
					NamedRequirements = { "NoRecentInspectPointUsed" },
				},
				InteractTextLineSets =
				{
					Inspect_C_Boss01_01 =
					{
						{ Cue = "/VO/Storyteller_0503",
							Text = "{#Emph}The stunned and elated onlookers of Elysium gaze upon this seldom seen Princess having heard only the terrifying rumors of her fury; and paid witness to it all, firsthand." },
						EndVoiceLines =
						{
							PreLineWait = 0.38,
							UsePlayerSource = true,
							{ Cue = "/VO/MelinoeField_4473", Text = "{#Emph}Raaaahh!",
							PreLineThreadedFunctionName = "CrowdReactionPresentationEventSource", PreLineThreadedFunctionArgs = { Delay = 1.25, AnimationNames = { "StatusIconFear", "StatusIconGrief", "StatusIconEmbarrassed" }, ReactionChance = 0.25 },
							},
						},
					},
				},
			},
			[801525] =
			{
				PlayOnce = true,
				UseText = "UseExamineMisc",
				SetupGameStateRequirements =
				{
					NamedRequirements = { "NoRecentInspectPointUsed" },
				},
				InteractTextLineSets =
				{
					Inspect_C_Boss01_01 =
					{
						{ Cue = "/VO/Storyteller_0504",
							Text = "{#Emph}The long-absent Underworld Prince, no stranger to many an ignoble defeat, has suffered yet another utterly humiliating loss, and at the hands of his own sister no less." },
						EndVoiceLines =
						{
							PreLineWait = 0.4,
							UsePlayerSource = true,
							{ Cue = "/VO/MelinoeField_4474", Text = "Hey, give him a break!" },
						},
					},
				},
			},

		},

	},
}
AddTableKeysCheckDupes( RoomData, RoomSetData.C )