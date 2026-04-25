OverwriteTableKeys( TraitData, {
	-- Medea
	BaseCurse = 
	{
		InheritFrom = { "ForceCommonAppearanceTrait" },
		IsCurse = true,
		DebugOnly = true,
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1
			},
			Rare =
			{
				Multiplier = 1
			},
			Epic =
			{
				Multiplier = 1
			},
			Heroic =
			{
				Multiplier = 1
			},
		},
	},
	HealingOnDeathCurse = 
	{
		InheritFrom = {"BaseCurse"},
		Icon = "Boon_Medea_03",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1
			},
			Rare =
			{
				Multiplier = 1.5
			},
			Epic =
			{
				Multiplier = 2
			},
			Heroic =
			{
				Multiplier = 3
			},
		},
		DropOnKill = {
			Chance = 0.2,
			DropCap = 1,
			Name = "HealDropMinor",
			Overrides =
			{
				HealFixed = { BaseValue = 10 },
				ReportValues = 
				{ 
					ReportedHeal = "HealFixed",
				},
			},
			ReportValues = 
			{ 
				ReportedDropRate = "Chance",
				ReportedCap = "DropCap",
			},
		},
		StatLines = {},
		CustomStatLinesWithShrineUpgrade = 
		{
			ShrineUpgradeName = "HealingReductionShrineUpgrade",
			StatLines = 
			{
				"HealingReductionNotice",
			},
		},
		ExtractValues =
		{
			{
				Key = "ReportedDropRate",
				ExtractAs = "TooltipDropChance",
				Format = "LuckModifiedPercent"
			},
			{
				Key = "ReportedCap",
				ExtractAs = "TooltipDropCap",
				SkipAutoExtract = true,
			},
			{
				Key = "ReportedHeal",
				Format = "FlatHeal",
				ExtractAs = "Heal",
				SkipAutoExtract = true,
			}
		}
	},
	MoneyOnDeathCurse = 
	{
		InheritFrom = {"BaseCurse"},
		Icon = "Boon_Medea_05",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1
			},
			Rare =
			{
				Multiplier = 1.5
			},
			Epic =
			{
				Multiplier = 2
			},
			Heroic =
			{
				Multiplier = 3
			},
		},
		DropOnKill = {
			Chance = 0.1,
			DropCap = 2,
			Name = "MedeaMoneyTinyDrop",
			Overrides =
			{
				DropMoney = { BaseValue = 20 },
				ReportValues = 
				{ 
					ReportedMoney = "DropMoney",
				},
			},
			ReportValues = 
			{ 
				ReportedDropRate = "Chance",
				ReportedDropCount = "DropCap",
			},
		},
		ExtractValues =
		{
			{
				Key = "ReportedDropRate",
				ExtractAs = "TooltipDropChance",
				Format = "LuckModifiedPercent"
			},
			{
				Key = "ReportedDropCount",
				ExtractAs = "TooltipDropCount",
				SkipAutoExtract = true,
			},
			{
				Key = "ReportedMoney",
				ExtractAs = "Money",
				SkipAutoExtract = true,
			}
		}
	},
	ManaOverTimeCurse = 
	{
		InheritFrom = {"BaseCurse"},
		Icon = "Boon_Medea_04",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1
			},
			Rare =
			{
				Multiplier = 7/5
			},
			Epic =
			{
				Multiplier = 10/5
			},
			Heroic =
			{
				Multiplier = 20/5
			},
		},
		
		RoomsPerUpgrade = 
		{ 
			Amount = 1,
			MaxMana = { BaseValue = 5 },
			ReportValues = 
			{ 
				ReportedGrowth = "MaxMana", 
			},

		},
		CurrentRoom = 0,
		ExtractValues = 
		{
			{
				Key = "ReportedGrowth",
				ExtractAs = "GrowthValue",
				IncludeSigns = true,
			},
		},
	},
	SpawnDamageCurse = 
	{
		InheritFrom = {"BaseCurse"},
		Icon = "Boon_Medea_07",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1
			},
			Rare =
			{
				Multiplier = 1499/999
			},
			Epic =
			{
				Multiplier = 1999/999
			},
			Heroic =
			{
				Multiplier = 2999/999
			},
		},
		OnEnemySpawnFunction =
		{
			FunctionName = "CheckSpawnCurseDamage",
			Args = 
			{
				Vfx = "ThanatosDeathsHead_Small",
				SkipOnDamagedPowers = true,
				DamageArgs =
				{
					-- Rolls chances from top down
					{
						Chance = 0.04,
						MinDamage = { BaseValue = 999 },
						MaxDamage = { BaseValue = 999 },
						ReportValues = 
						{ 
							ReportedMax = "MaxDamage", 
						}
					},
					{
						Chance = 0.08,
						MinDamage = { BaseValue = 100 },
						MaxDamage = { BaseValue = 998 },
					},
					{
						MinDamage = 1,
						MaxDamage = { BaseValue = 99 },
						ReportValues = 
						{ 
							ReportedMin = "MinDamage", 
						}
					}
				}
			}
		},
		ExtractValues = 
		{
			{
				Key = "ReportedMin",
				ExtractAs = "Min",
			},
			{
				Key = "ReportedMax",
				ExtractAs = "Max",
			},
		}
	},
	ArmorPenaltyCurse = 
	{
		InheritFrom = {"BaseCurse"},
		Icon = "Boon_Medea_01",

		RarityLevels =
		{
			Common =
			{
				Multiplier = 1
			},
			Rare =
			{
				Multiplier = 60/50,
			},
			Epic =
			{
				Multiplier = 70/50,
			},
			Heroic =
			{
				Multiplier = 90/50,
			},
		},
		
		OnEnemySpawnFunction =
		{
			FunctionName = "CheckSpawnArmorDamage",
			Args = 
			{
				Vfx = "ThanatosDeathsHead_Small",
				SkipOnDamagedPowers = true,
				Multiplier = { BaseValue = 0.5, },
				ReportValues = 
				{ 
					ReportedMultiplier = "Multiplier",
				}
			}
		},
		ExtractValues = 
		{
			{
				Key = "ReportedMultiplier",
				ExtractAs = "Multiplier",
				Format = "Percent"
			},
		}
	},
	SlowProjectileCurse =
	{
		InheritFrom = {"BaseCurse"},
		Icon = "Boon_Medea_06",

		RarityLevels =
		{
			Common =
			{
				Multiplier = 1
			},
			Rare =
			{
				Multiplier = 55/60,
			},
			Epic =
			{
				Multiplier = 50/60,
			},
			Heroic =
			{
				Multiplier = 40/60,
			},
		},

		EnemyProjectileSpeedMultiplier = { BaseValue = 0.60, },
		ExtractValues = 
		{
			{
				Key = "EnemyProjectileSpeedMultiplier",
				ExtractAs = "Multiplier",
				Format = "NegativePercentDelta"
			},
		}
	},
	DeathDefianceRetaliateCurse =
	{
		InheritFrom = {"BaseCurse"},
		Icon = "Boon_Medea_02",

		RarityLevels =
		{
			Common =
			{
				Multiplier = 1
			},
			Rare =
			{
				Multiplier = 18/15,
			},
			Epic =
			{
				Multiplier = 20/15,
			},
			Heroic =
			{
				Multiplier = 25/15,
			},
		},

		OnLastStandFunction = 
		{
			Name = "CurseRetaliate",
			FunctionArgs = 
			{
				HealthDamageMultiplier = { BaseValue = 0.15 },
				Vfx = "ThanatosDeathsHead_Small",
				ReportValues = { ReportedMultiplier = "HealthDamageMultiplier"},
			}
		},
		ExtractValues = 
		{
			{
				Key = "ReportedMultiplier",
				ExtractAs = "HealthThreshold",
				Format = "Percent"
			},
			{
				External = true,
				BaseType = "HeroData",
				BaseName = "LastStandData",
				BaseProperty = "Heal",
				Format = "Percent",
				ExtractAs = "LastStandHeal",
				SkipAutoExtract = true,
			},
			{
				External = true,
				BaseType = "HeroData",
				BaseName = "LastStandData",
				BaseProperty = "Duration",
				ExtractAs = "LastStandDuration",
				SkipAutoExtract = true,
			},
		}
	},
	NewStatusDamage = 
	{
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1
			},
			Rare =
			{
				Multiplier = 90/50
			},
			Epic =
			{
				Multiplier = 130/50
			},
			Heroic =
			{
				Multiplier = 210/50
			},
		},
		InheritFrom = { "BaseCurse"},
		Icon = "Boon_Medea_08",
		ShowInHUD = true,
		CodexGameStateRequirements =
		{
			{
				PathTrue = { "GameState", "TextLinesRecord", "MedeaAboutConcoctionQuestComplete01" },
			},
		},

		OnEffectApplyFunction = 
		{
			FunctionName = "CheckNewStatusDamage",
			FunctionArgs = 
			{
				ProjectileName = "MedeaStatusStrike",
				Cooldown = 1,
				DamageMultiplier = { BaseValue = 1 },
				ReportValues = 
				{ 
					ReportedInterval = "Cooldown", 
					ReportedMultiplier = "DamageMultiplier", 
				}
			},
		},
		
		ExtractValues = 
		{
			{
				Key = "ReportedInterval",
				ExtractAs = "Interval",
				SkipAutoExtract = true,
			},
			{
				Key = "ReportedMultiplier",
				ExtractAs = "Damage",
				Format = "MultiplyByBase",
				BaseType = "Projectile",
				BaseName = "MedeaStatusStrike",
				BaseProperty = "Damage",
			},
		},
		FlavorText = "NewStatusDamage_FlavorText",
	}
})