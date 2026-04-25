UnitSetData.TyphonHeadAdd =
{
	TyphonHeadAdd =
	{
		InheritFrom = { "BaseQEnemy", "BaseVulnerableEnemy" },
		GenusName = "TyphonHead",
		RunHistoryKilledByName = "TyphonHead",

		CannotDieFromDamage = true,
		HideHealthBar = true,
		IgnoreCastSummonDamage = true,

		ActivateFx = "nil",
		ActivateFx2 = "nil",
		ActivateFxPreSpawn = "nil",
		ActivateAnimation = "Enemy_TyphonHeadAdd_Hidden",
		ActivateFxPreSpawnDelay = 0.0,
		ActivateFadeIn = false,
		ActivateStartAlpha = 0.0,
		ActivateTint = false,
		ActivateDuration = 0.0,

		DeathFx = "EnemyDeathFxIris",
		DeathAnimation = "Enemy_TyphonHeadAdd_Death",
		DeathSound = "/SFX/Enemy Sounds/TyphonStalker/EmoteDying",

		StunAnimations = 
		{
			Default = "Enemy_TyphonHeadAdd_HitStun",
			Heavy = "Enemy_TyphonHeadAdd_HitStun_Heavy",
		},

		DreamBiomeData =
		{
			[1] =
			{
				DataOverrides =
				{
					HealthMultiplier = 0.125,
				},
				AddOutgoingDamageModifier =
				{
				 	PlayerMultiplier = 0.2,
				},
			},
			[2] =
			{
				DataOverrides =
				{
					HealthMultiplier = 0.25,
				},
				AddOutgoingDamageModifier =
				{
				 	PlayerMultiplier = 0.3,
				},
			},
			[3] =
			{
				DataOverrides =
				{
					HealthMultiplier = 0.55,
				},
				AddOutgoingDamageModifier =
				{
				 	PlayerMultiplier = 0.62,
				},
			},
			[4] =
			{
				DataOverrides =
				{
					--HealthMultiplier = 1,
				},
				AddOutgoingDamageModifier =
				{
				 	PlayerMultiplier = 0.87,
				},
			},
		},

		SetupEvents =
		{
			{
				FunctionName = "OverwriteSelf",
				Args =
				{
					GrannyTexture = "GR2/TyphonHeadAddDream_Color",
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

		AIOptions =
		{
			"AttackerAI",
		},
		WakeUpDelay = 0.0,

		DefaultAIData =
		{
			DeepInheritance = true,
		},

		OnSpawnVoiceLines =
		{
			PlayOnce = true,
			PlayOnceContext = "TyphonAddIntroVO",
			PlayOnceFromTableThisRun = true,
			UsePlayerSource = true,
			BreakIfPlayed = true,
			RandomRemaining = true,
			PreLineWait = 1.75,
			RecheckRequirementsPostWait = true,
			SkipCooldownCheckIfNonePlayed = true,
			Cooldowns =
			{
				{ Name = "MelinoeAnyQuipSpeech" },
			},

			{ Cue = "/VO/MelinoeField_3292", Text = "Oh what are those...", PlayFirst = true },
			{ Cue = "/VO/MelinoeField_3293", Text = "Avoid the spines..." },
		},

		MoneyDropOnDeath =
		{
			Chance = 0.0,
		},

		WeaponOptions =
		{
			"TyphonHeadAddCombo",
		},

		GeneratorData =
		{
			DifficultyRating = 25,
		},
	},
}

OverwriteTableKeys( EnemyData, UnitSetData.TyphonHeadAdd )

WeaponSetData =
{
	TyphonHeadAddComboLeft =
	{
		WeaponComboOnly = true,
		AIData =
		{
			SkipFireWeapon = true,
		},

		WeaponCombo =
		{
			{ WeaponOptions = { "TyphonHeadAddUnburrow", }, DataOverrides = { PreAttackDuration = 1.0, PreAttackFx = "TyphonHeadAddDirtFxSpawner", EndPreAttackFx = true, PreAttackAlpha = 1, }, },
			{ WeaponOptions = { "TyphonHeadAddBurrow", }, DataOverrides = { TeleportToId = 793231, }, },
			{ WeaponOptions = { "TyphonHeadAddUnburrow", }, },
			{ WeaponOptions = { "TyphonHeadAddBurrow", }, DataOverrides = { TeleportToId = 779851, }, },
			{ WeaponOptions = { "TyphonHeadAddUnburrow", }, },
			{ WeaponOptions = { "TyphonHeadAddBurrow", }, DataOverrides = { PostAttackEndTeleport = false, PostAttackKillSelf = true }, },
		},
	},

	TyphonHeadAddComboMid =
	{
		WeaponComboOnly = true,
		AIData =
		{
			SkipFireWeapon = true,
		},

		WeaponCombo =
		{
			{ WeaponOptions = { "TyphonHeadAddUnburrow", }, DataOverrides = { PreAttackDuration = 1.0, PreAttackFx = "TyphonHeadAddDirtFxSpawner", EndPreAttackFx = true, PreAttackAlpha = 1, }, },
			{ WeaponOptions = { "TyphonHeadAddBurrow", }, DataOverrides = { TeleportToId = 779867, }, },
			{ WeaponOptions = { "TyphonHeadAddUnburrow", }, },
			{ WeaponOptions = { "TyphonHeadAddBurrow", }, DataOverrides = { TeleportToId = 793224, }, },
			{ WeaponOptions = { "TyphonHeadAddUnburrow", }, },
			{ WeaponOptions = { "TyphonHeadAddBurrow", }, DataOverrides = { PostAttackEndTeleport = false, PostAttackKillSelf = true }, },
		},
	},

	TyphonHeadAddComboRight =
	{
		WeaponComboOnly = true,
		AIData =
		{
			SkipFireWeapon = true,
		},

		WeaponCombo =
		{
			{ WeaponOptions = { "TyphonHeadAddUnburrow", }, DataOverrides = { PreAttackDuration = 1.0, PreAttackFx = "TyphonHeadAddDirtFxSpawner", EndPreAttackFx = true, PreAttackAlpha = 1, }, },
			{ WeaponOptions = { "TyphonHeadAddBurrow", }, DataOverrides = { TeleportToId = 793229, }, },
			{ WeaponOptions = { "TyphonHeadAddUnburrow", }, },
			{ WeaponOptions = { "TyphonHeadAddBurrow", }, DataOverrides = { TeleportToId = 779854, }, },
			{ WeaponOptions = { "TyphonHeadAddUnburrow", }, },
			{ WeaponOptions = { "TyphonHeadAddBurrow", }, DataOverrides = { PostAttackEndTeleport = false, PostAttackKillSelf = true }, },
		},
	},

	TyphonHeadAddUnburrow =
	{
		AIData =
		{
			DeepInheritance = true,

			ProjectileName = "TyphonHeadAddUnburrow",
			ApplyEffectsOnWeaponFire =
			{
				WeaponEffectData.AttackLowGrip,
			},

			FireProjectileStartDelay = 0.2,

			PreAttackAnimation = "Enemy_TyphonHeadAdd_Hidden",
			PreAttackDuration = 0.0,
			FireAlpha = 1,
			PreAttackFx = "EnemyBurrowDirt",
			FireAnimation = "Enemy_TyphonHeadAdd_Unburrow",
			FireDuration = 1.2,
			--PostAttackAnimation = "Enemy_TyphonHeadAdd_Idle",
			PostAttackDuration = 0,

			AttackDistance = 9999,
			MoveWithinRange = false,

			DoNotRepeatOnAttackFail = true,
			PreAttackCreateHealthBar = true,
		},

		Sounds =
		{
			FireSounds =
			{
			},
		},
	},
	TyphonHeadAddBurrow =
	{
		AIData =
		{
			DeepInheritance = true,

			NoProjectile = true,

			PreAttackDuration = 0.0,
			PreAttackFx = "EnemyBurrowDirt",
			FireAnimation = "Enemy_TyphonHeadAdd_Burrow",
			PostAttackAlpha = 0,
			FireDuration = 0.35,
			PostAttackAnimation = "Enemy_TyphonHeadAdd_Hidden",

			PostAttackEndTeleport = true,
			--TeleportToId set in each combo
			PostAttackKillSelf = false,
			PostAttackKillSelfArgs = { SkipOnDeathFunction = true, Silent = true, SkipDestroyDelay = true, },

			AttackDistance = 9999,
			PostAttackRemoveEnemyUI = true,
		},

		Sounds =
		{
			FireSounds =
			{
			},
		},
	},
}

OverwriteTableKeys( WeaponData, WeaponSetData )
OverwriteTableKeys( WeaponDataEnemies, WeaponSetData )
WeaponSetData = nil