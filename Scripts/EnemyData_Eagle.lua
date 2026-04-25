UnitSetData.Eagle =
{
	Eagle =
	{
		InheritFrom = { "BasePEnemy", "BaseVulnerableEnemy" },
		GenusName = "Prometheus",
		RequiredKill = false,

		Groups = { "FlyingEnemies" },
		MaxHealth = 8000,
		CannotDieFromDamage = true,
		HideHealthBar = true,

		Material = "Organic",

		ComboPartnerName = "Prometheus",
		PreBossAISetupFunctionName = "EagleBattleStart",

		SpawnAnimation = "Enemy_Eagle_Invisible",

		OnDamagedFunctionName = "CheckEagleRetreat",

		MoneyDropOnDeath = { Chance = 0 },

		SetupEvents =
		{
			{
				FunctionName = "OverwriteSelf",
				Args =
				{
					GrannyTexture = "GR2/PrometheusEagleDream_Color",
					AddOutlineImmediately = true,
					Outline =
					{
						R = 230,
						G = 23,
						B = 0,
						Opacity = 0.8,
						Thickness = 3,
						Threshold = 0.6,
					},
				},
				GameStateRequirements =
				{
					{
						PathTrue = { "CurrentRun", "IsDreamRun" },
					},
				},
			},
		},

		DefaultAIData =
		{
			OlympusStartWeapon = "EagleDive_Olympus",
			OlympusEndWeapon = "EagleFlyUpWhirlwind_Olympus",
			OlympusWeaponOptions = { "EagleRollLeft_Olympus", "EagleRush_Olympus", "EagleRush_Olympus", "EagleRollRight_Olympus" },
			OlympusWeaponCountMin = 3,
			OlympusWeaponCountMax = 5,
		},
		WeaponOptions = { "EagleFlyUp", "EagleDive_Solo" },
		Using =
		{
			Weapons =
			{
				"EagleDive_Olympus",
				"EagleFlyUpWhirlwind_Olympus",
			},

			Sounds =
			{
				"/SFX/Enemy Sounds/EagleCall",
				"/SFX/Enemy Sounds/EagleAlerted",
				"/SFX/Enemy Sounds/EagleAttackScream",
			},
		},

		AIOptions =
		{
			"AttackerAI",
		},

		FledVoiceLines =
		{
			BreakIfPlayed = true,
			UsePlayerSource = true,
			PlayOnce = true,
			PlayOnceContext = "EagleFirstExitVO",
			PlayOnceFromTableThisRun = true,
			PreLineWait = 0.75,
			TriggerCooldowns = { "MelinoeAnyQuipSpeech" },

			{ Cue = "/VO/Melinoe_0988", Text = "Flew off...", PlayFirst = true },
			{ Cue = "/VO/MelinoeField_2804", Text = "Blasted bird...",
				GameStateRequirements =
				{
					{
						PathFalse = { "CurrentRun", "SpeechRecord", "/VO/MelinoeField_2804" },
					},
				},
			},
			{ Cue = "/VO/MelinoeField_2807", Text = "Fly on home!",
				GameStateRequirements =
				{
					{
						Path = { "GameState", "EnemyKills", "Prometheus" },
						Comparison = ">=",
						Value = 5,
					},
				},
			},
			{ Cue = "/VO/MelinoeField_2806", Text = "Bye, Aetos.",
				GameStateRequirements =
				{
					{
						Path = { "GameState", "EnemyKills", "Prometheus" },
						Comparison = ">=",
						Value = 10,
					},
				},
			},
		},
	},

}

OverwriteTableKeys( EnemyData, UnitSetData.Eagle )