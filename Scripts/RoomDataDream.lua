RoomSetData.Dream =
{
	Dream_Intro =
	{
		RichPresence = "#RichPresence_Dream",
		SaveProfileLocationText = "Location_BiomeDream",
		LegalEncounters = { "Empty" },

		EntranceFunctionName = "DreamIntroEntrancePresentation",
		ExitFunctionName = "StartNewDreamRunPresentation",

		HasHarvestPoint = false,
		HasShovelPoint = false,
		HasPickaxePoint = false,
		HasFishingPoint = false,
		HasExorcismPoint = false,

		TimerBlock = "IntroRoom",
		BlockCombat = true,
		-- IgnoreMusic = true,
		Ambience = "/Ambience/RemembranceScreenAmbience2",
		SecretMusic = "/Music/HypnosLullaby",
		ReverbValue = 2.0,
		GlobalEcho = 0.5,
		DreamParameterValue = 0.5,

		NoReward = true,
		NoReroll = true,
		ZoomFraction = 0.75,
		ZoomFractionAlt = 0.85,
		FlipHorizontalChance = 0.0,

		SkipLastKillPresentation = true,
		ChallengeSpawnChance = 0.0,
		WellShopSpawnChance = 0.0,
		SecretSpawnChance = 0.0,

		SpeakerName = { "Intercom", "Hypnos" },
		LoadPackages = { "Hypnos" },

		UnthreadedEvents =
		{
			{
				FunctionName = "CheckConversations",
				Args = {},
			},
			{
				FunctionName = "SelectNextDreamBiome",
				Args =
				{
					ForceHBiomeRequirements =
					{
						{
							Path = { "GameState", "RoomsEntered", "Dream_Intro" },
							Comparison = "<=",
							Value = 1,
						},
					},
				},
			},
		},

		ObstacleData =
		{
			[803590] =
			{
				Name = "DreamRunInfo",
				Activate = true,
				ActivateIds = { 803591, },
				InteractDistance = 200,

				UseText = "UseDreamRunInfo",
				OnUsedFunctionName = "ShowDreamRunMessage",
				DestroyIfNotSetup = true,
				SetupGameStateRequirements =
				{
					{
						PathTrue = { "GameState", "TextLinesRecord", "HypnosDreamRunStart01" },
					},
				},
			},
		},

		EnterVoiceLines =
		{
			TriggerCooldowns = { "MelinoeAnyQuipSpeech" },
			{
				PreLineWait = 1.5,
				RandomRemaining = true,
				BreakIfPlayed = true,
				SuccessiveChanceToPlayAll = 0.05,

				{ Cue = "/VO/MelinoeField_5264", Text = "Is this... a dream...?", PlayFirst = true, PlayOnce = true },
				{ Cue = "/VO/MelinoeField_5266", Text = "...I'm back." },
				{ Cue = "/VO/MelinoeField_5267", Text = "The realm of dream..." },
			},
		},
	},

	Dream_PostBoss01 =
	{
		RichPresence = "#RichPresence_Dream",
		SaveProfileLocationText = "Location_BiomeDream",
		LegalEncounters = { "Empty" },
		NextRoomSet = {}, -- resets biome depth cache

		EntranceFunctionName = "DreamPostBossEntrancePresentation",
		ExitFunctionName = "DreamPostBossExitPresentation",
		IgnoreExitDirection = true,
		UnlockWithoutDoors = true,

		HasHarvestPoint = false,
		HasShovelPoint = false,
		HasPickaxePoint = false,
		HasFishingPoint = false,
		HasExorcismPoint = false,

		IgnoreMusic = true,
		Ambience = "/Ambience/RemembranceScreenAmbience2",
		ReverbValue = -1.0,
		GlobalEcho = 0.5,

		NoReward = true,
		NoReroll = true,
		ZoomFraction = 0.75,
		ZoomFractionAlt = 0.85,
		FlipHorizontalChance = 0.0,

		SkipLastKillPresentation = true,
		ChallengeSpawnChance = 0.0,
		SecretSpawnChance = 0.0,

		ForceWellShop = true,
		WellShopSpawnChance = 1.0,
		WellShopChallengeBaseId = 800777,
		WellShopRequirements =
		{
			{
				PathTrue = { "GameState", "WorldUpgradesAdded", "WorldUpgradePostBossWellShops" },
			},
		},

		SellShopSpawnChance = 0.0,

		StartUnthreadedEvents =
		{
			{ FunctionName = "EndAllBiomeStates" },
			{
				FunctionName = "SelectNextDreamBiome",
				Args =
				{
					SkipChooseReward = true,
				},
			},
		},

		SpeakerName = { "Intercom", "Hypnos" },
		LoadPackages = { "Hypnos" },
		StartThreadedEvents =
		{
			{
				FunctionName = "HadesSpeakingPresentation",
				Args = { OverlayAnim = "HypnosOverlay", VoiceLines = { GlobalVoiceLines = "HypnosPostBossVoiceLines" } },
			},
		},

		ObstacleData =
		{
			[800778] =
			{
				Template = "HealthFountainDream01",
				Activate = true,
				SetupGameStateRequirements =
				{
					-- None
				},
			},
			[800772] =
			{
				Template = "GiftRack",
				Activate = true,
				ActivateIds = { 800773, 800774, 800775, 800776, 824064, },
				SetupGameStateRequirements =
				{
					{
						PathTrue = { "GameState", "WorldUpgrades", "WorldUpgradePostBossGiftRack" },
					},
				},
			},
			[800777] =
			{
				Template = "ChallengeSwitchBase",
				Activate = true,
				ActivateIds = { 824065, },
				SetupGameStateRequirements =
				{
					{
						PathTrue = { "GameState", "WorldUpgrades", "WorldUpgradePostBossWellShops" },
					},
				},
				InteractDistance = 200,
			},
			[824417] =
			{
				Name = "HypnosStandee01",
				Template = "HypnosCutout",
				Using = { Sound = "/Leftovers/World Sounds/Caravan Interior/CardboardInteract" },
			},
		},
	},

	Dream_PostBoss02 =
	{
		InheritFrom = { "Dream_PostBoss01" },
		ReverbValue = -1.0,
		GlobalEcho = 0.5,

		ObstacleData =
		{
			[821773] =
			{
				Template = "HealthFountainDream02",
				Activate = true,
				SetupGameStateRequirements =
				{
					-- None
				},
			},
			[800772] =
			{
				Template = "GiftRack",
				Activate = true,
				ActivateIds = { 800773, 800774, 800775, 800776, 824015, },
				SetupGameStateRequirements =
				{
					{
						PathTrue = { "GameState", "WorldUpgrades", "WorldUpgradePostBossGiftRack" },
					},
				},
			},
			[800777] =
			{
				Template = "ChallengeSwitchBase",
				Activate = true,
				ActivateIds = { 824063, },
				SetupGameStateRequirements =
				{
					{
						PathTrue = { "GameState", "WorldUpgrades", "WorldUpgradePostBossWellShops" },
					},
				},
				InteractDistance = 200,
			},
			[824223] =
			{
				Name = "HypnosStandee02",
				Template = "HypnosCutout",
			},
		},
		ZoomFractionAlt = 0.85,
	},

	Dream_PostBoss03 =
	{
		InheritFrom = { "Dream_PostBoss01" },
		Ambience = "/Leftovers/Object Ambiences/ChimesAmbientLoop_StarMap",
		ReverbValue = -1.0,
		GlobalEcho = 0.5,

		ObstacleData =
		{
			[822614] =
			{
				Template = "HealthFountainDream03",
				Activate = true,
				SetupGameStateRequirements =
				{
					-- None
				},
			},
			[800772] =
			{
				Template = "GiftRack",
				Activate = true,
				ActivateIds = { 800774, 800775, 800776, 800773, 822399, },
				SetupGameStateRequirements =
				{
					{
						PathTrue = { "GameState", "WorldUpgrades", "WorldUpgradePostBossGiftRack" },
					},
				},
			},
			[800777] =
			{
				Template = "ChallengeSwitchBase",
				Activate = true,
				ActivateIds = { 822826, },
				SetupGameStateRequirements =
				{
					{
						PathTrue = { "GameState", "WorldUpgrades", "WorldUpgradePostBossWellShops" },
					},
				},
				InteractDistance = 200,
			},
			[824105] =
			{
				Name = "HypnosStandee03",
				Template = "HypnosCutout",
			},
		},
		ZoomFractionAlt = 0.85,
	},
}
AddTableKeysCheckDupes( RoomData, RoomSetData.Dream )