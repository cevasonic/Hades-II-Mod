UnitSetData.Talos =
{
	Talos =
	{
		InheritFrom = { "BaseBossEnemy", "BaseAutomaton", "BasePEnemy", "BaseVulnerableEnemy" },
		
		BlockRaiseDead = true,
		IsBoss = false,
		BlockCharm = true,
		IgnoreSpeedShrine = true,
		ImmuneToPolymorph = true,
		IgnoreSprintPhasingStasisStun = true,

		MaxHealth = 13300,
		HealthBarTextId = "Talos_Full",

		OnDeathFunctionName = "GenericBossKillPresentation",
		OnDeathFunctionArgs = { Message = "TalosDefeatedMessage", StartPanTime = 1.0, EndPanTime = 4.25, EndAngle = 270, FlashRed = true, PanZoomFraction = 1.0, MessageDelay = 0.5, EndMusicEarly = true, },

		DeathAnimation = "Enemy_Talos_Death",
		DeathPanOffsetY = -220,
		DeathAngle = 270,

		IsAggroedSound = "/SFX/Enemy Sounds/Talos/EmoteAlerted",
		DeathSound = "/SFX/Enemy Sounds/Talos/EmoteDying",

		Groups = { "FlyingEnemies", "Automatons" },

		Material = "Robot",
		MaterialAlt = "Stone",
		OnHitFunctionName = "CheckUnitInvulnerableHit",
		InvulnerableHitFx = "InvincibleHitSpark",
		InvulnerableHitImpactVelocity = 1000,

		AltHealthBarTextIds =
		{
			{
				TextId = "Talos_DreamRun01",
				GameStateRequirements =
				{
					{
						PathTrue = { "CurrentRun", "IsDreamRun" },
					},
				},
			},
		},
		AltDeathMessageTextIds =
		{
			{
				TextId = "DreamBossDefeatedMessage",
				GameStateRequirements =
				{
					{
						PathTrue = { "CurrentRun", "IsDreamRun" },
					}
				},
			},
		},

		SetupEvents =
		{
			{
				FunctionName = "OverwriteSelf",
				Args =
				{
					GrannyTexture = "GR2/TalosDream_Color",
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

		StunAnimations = 
		{
		},

		DefaultAIData =
		{
			DeepInheritance = true,
		},

		WeaponOptions =
		{
			--"TalosSprint"
			"TalosShieldThrow", "TalosShieldStraightThrowSelector", "TalosMagnet", "TalosSpin", "TalosSprint",
		},

		AIOptions =
		{
			"AggroAI",
		},
		AISetupDelay = 1.5,

		GeneratorData =
		{
			DifficultyRating = 500,
		},
	},
}

OverwriteTableKeys( EnemyData, UnitSetData.Talos )