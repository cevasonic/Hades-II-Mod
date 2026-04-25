OverwriteTableKeys( TraitData, {
	-- Circe
	BaseCirce =
	{
		InheritFrom = { "ForceCommonAppearanceTrait" },
		IsCirceBoon = true,
		DebugOnly = true,
		PackageName = "NPC_Circe_01",
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
	RandomArcanaTrait = 
	{
		InheritFrom = {"BaseCirce"},
		Icon = "Boon_Circe_06",
		
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
				Multiplier = 2
			},
			Heroic =
			{
				Multiplier = 3
			},
		},
		CustomNameWithRequirements = 
		{
			GameStateRequirements = 
			{
				{
					PathFromSource = true,
					Path = { "AcquireFunctionArgs", "Count" },
					Comparison = ">",
					Value = 1,
				}
			},
			Name = "RandomArcanaTrait_Plural"
		},
		AcquireFunctionName = "CirceRandomMetaUpgrade",
		AcquireFunctionArgs = 
		{
			Count = { BaseValue = 1 }, 
			ReportValues = { ReportedCount = "Count" }
		},
		
		ExtractValues =
		{
			{
				Key = "ReportedCount",
				ExtractAs = "Count",
			},
		}
	},
	RemoveShrineTrait = 
	{
		InheritFrom = {"BaseCirce"},
		Icon = "Boon_Circe_07",
		
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
				Multiplier = 2
			},
			Heroic =
			{
				Multiplier = 3
			},
		},
		CustomNameWithRequirements = 
		{
			GameStateRequirements = 
			{
				{
					PathFromSource = true,
					Path = { "AcquireFunctionArgs", "Count" },
					Comparison = ">",
					Value = 1,
				}
			},
			Name = "RemoveShrineTrait_Plural"
		},
		AcquireFunctionName = "CirceRemoveShrineUpgrades",
		AcquireFunctionArgs = 
		{
			Count = { BaseValue = 1 }, 
			ReportValues = { ReportedCount = "Count" }
		},
		
		ExtractValues =
		{
			{
				Key = "ReportedCount",
				ExtractAs = "Count",
			},
		}
	},
	DoubleFamiliarTrait = 
	{
		InheritFrom = {"BaseCirce"},
		Icon = "Boon_Circe_04",
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
				Multiplier = 2
			},
			Heroic =
			{
				Multiplier = 2
			},
		},
		HideStatLinesInCodex = true,
		AcquireFunctionName = "CircePetMultiplier",
		AcquireFunctionArgs = 
		{
			BonusMultiplier = { BaseValue = 1 }, 
			ReportValues = { ReportedBonus = "BonusMultiplier" }
		},
		StatLines = 
		{
			"FamiliarBoostStatLine",
		},
		TrayStatLines = 
		{
			"FamiliarBoostTrayStatLine",
		},
		MergeTooltipDataFromSession = 
		{
			Old = "OldFamiliarTrait",
			New = "NewFamiliarTrait",
		},
		ExtractValues =
		{
			{
				Key = "ReportedBonus",
				ExtractAs = "Bonus",
				Format = "Percent",
			},
			{
				IsExternal = true,
				Format = "TotalHeroTraitValue",
				Key = "FamiliarLastStandHealAmount",
				ExtractAs = "TooltipLastStandHealth",
			},
			{
				IsExternal = true,
				Format = "TotalHeroTraitValue",
				Key = "ReportedFamiliarLastStandAmount",
				ExtractAs = "TooltipLastStandAmount",
			}
		}
	},
	HealAmplifyTrait = 
	{
		InheritFrom = {"BaseCirce"},
		Icon = "Boon_Circe_05",
		CustomTrayText = "HealAmplifyTrait_Tray",

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
				Multiplier = 60/50,
			},
			Heroic =
			{
				Multiplier = 80/50,
			},
		},

		AcquireFunctionName = "CirceHeal",
		AcquireFunctionArgs = 
		{
			HealFraction = { BaseValue = 0.5 },
			ReportValues = { ReportedHeal = "HealFraction" }
		},
		CustomStatLinesWithShrineUpgrade = 
		{
			ShrineUpgradeName = "HealingReductionShrineUpgrade",
			StatLines = 
			{
				"HealingReductionNotice",
			},
		},
		TraitHealingBonus = 1.25,
		ExtractValues =
		{
			{
				Key = "TraitHealingBonus",
				ExtractAs = "Bonus",
				Format = "PercentDelta",
			},
			{
				Key = "ReportedHeal",
				ExtractAs = "Healing",
				Format = "PercentHeal",
			},
		}
	},
	ArcanaRarityTrait = 
	{
		InheritFrom = {"BaseCirce"},
		Icon = "Boon_Circe_01",
		
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
				Multiplier = 1.5
			},
			Heroic =
			{
				Multiplier = 2.5
			},
		},
		AcquireFunctionName = "CirceMetaUpgradeRarity",
		AcquireFunctionArgs = 
		{
			Count = { BaseValue = 2 }, 
			ReportValues = { ReportedCount = "Count" }
		},
		ExtractValues =
		{
			{
				Key = "ReportedCount",
				ExtractAs = "Count",
			},
		}
	},
	CirceEnlargeTrait = 
	{
		InheritFrom = {"BaseCirce"},
		Icon = "Boon_Circe_02",
		BaseChipmunkValue = -0.43,

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
				Multiplier = 1.20/1.15,
			},
			Heroic =
			{
				Multiplier = 1.30/1.15,
			},
		},

		SetupFunction = 
		{
			Name = "CirceEnlarge",
			Args = 
			{
				ScaleMultiplier = 1.25,
				InitialPresentationFunctionName = "CirceEnlargePresentation",
				ReportValues = 
				{
					ReportedScale = "Scale",
				},
				PortraitOverrides =
				{
					Scale = 1.2,
					OffsetX = -50,
					OffsetY = -40,
				},
			},
		},
		MaxHealthMultiplier = { BaseValue = 1.15 },
		AddOutgoingDamageModifiers = 
		{
			ValidWeapons = WeaponSets.HeroPrimarySecondaryWeapons,
			ValidWeaponMultiplier = { BaseValue = 1.15 },
			ReportValues = {ReportedMultiplier = "ValidWeaponMultiplier"}
		},
		
		ExtractValues =
		{
			{
				Key = "ReportedMultiplier",
				ExtractAs = "Bonus",
				Format = "PercentDelta",
			},
			{
				Key = "MaxHealthMultiplier",
				ExtractAs = "HealthBonus",
				Format = "PercentDelta",
			},
		}
	},
	CirceShrinkTrait = 
	{
		InheritFrom = {"BaseCirce"},
		Icon = "Boon_Circe_03",
		BaseChipmunkValue = 0.33,

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
				Multiplier = 15/10,
			},
			Heroic =
			{
				Multiplier = 20/10,
			},
		},

		SetupFunction = 
		{
			Name = "CirceShrink",
			Args = 
			{
				ScaleMultiplier = 0.75,
				InitialPresentationFunctionName = "CirceShrinkPresentation",
				ReportValues = 
				{
					ReportedScale = "Scale",
				},
				PortraitOverrides =
				{
					Scale = 0.75,
					OffsetX = -20,
					OffsetY = 105,
				},
			},
		},
		
		PropertyChanges =
		{
			{
				LifeProperty = "DodgeChance",
				BaseValue = 0.10,
				ChangeType = "Add",
				DataValue = false,
				ReportValues = { ReportedDodgeChance = "ChangeValue"},
			},
			{
				UnitProperty = "Speed",
				ChangeType = "Multiply",
				BaseValue = 1.10,
				SourceIsMultiplier = true,
				ReportValues = { ReportedBaseSpeed = "ChangeValue" },
			},
		},
		ExtractValues =
		{
			{
				Key = "ReportedBaseSpeed",
				ExtractAs = "Bonus",
				Format = "PercentDelta",
			},
			{
				Key = "ReportedDodgeChance",
				ExtractAs = "Dodge",
				Format = "Percent",
			},
		}
	},
	CirceSorceryDamageBoon = 
	{
		InheritFrom = {"BaseCirce"},
		Icon = "Boon_Circe_08",

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
				Multiplier = 1.4/1.3,
			},
			Heroic =
			{
				Multiplier = 1.6/1.3,
			},
		},

		AllyDataModifiers = 
		{			
			AddOutgoingDamageModifiers =
			{
				{
					NonPlayerMultiplier = { BaseValue = 1.3 },
				},
			},
		},
		AddOutgoingDamageModifiers = 
		{
			-- Match this to above ally data modifier too!
			ValidProjectiles = WeaponSets.SpellProjectileNames,
			ValidWeaponMultiplier = { BaseValue = 1.3 },
			ReportValues = { ReportedMultiplier = "ValidWeaponMultiplier"},
		},
		ExtractValues =
		{
			{
				Key = "ReportedMultiplier",
				ExtractAs = "Bonus",
				Format = "PercentDelta",
			},
		}
	},

	ExPolymorphBoon = 
	{
		InheritFrom = {"BaseCirce"},
		Icon = "Boon_Circe_09",
		ShowInHUD = true,

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
				Multiplier = 20/15,
			},
			Heroic =
			{
				Multiplier = 30/15,
			},
		},

		CodexGameStateRequirements =
		{
			{
				PathTrue = { "GameState", "TextLinesRecord", "CirceAboutScyllaQuestComplete01" },
			},
		},
		OnEnemyDamagedAction = 
		{
			ValidWeapons = WeaponSets.HeroAllWeapons,
			FunctionName = "CircePolymorph",
			Args = 
			{
				Chance = { BaseValue = 0.15 },
				Cooldown =
				{
					BaseValue = 10,
					CustomRarityMultiplier = 
					{
						Common = { Multiplier = 1 },
						Rare = { Multiplier = 1 },
						Epic = { Multiplier = 8/10 },
						Heroic = { Multiplier = 4/10 },
					},
				},
				ReportValues = 
				{ 
					ReportedChance = "Chance", 
					ReportedCooldown = "Cooldown",
				}
			},
		},
		ExtractValues =
		{
			{
				Key = "ReportedChance",
				ExtractAs = "Chance",
				Format = "Percent",
			},
			{
				Key = "ReportedCooldown",
				ExtractAs = "Cooldown",
			},
			{
				External = true,
				BaseType = "EffectData",
				BaseName = "PolymorphTag",
				BaseProperty = "Duration",
				ExtractAs = "PolymorphDuration",
				SkipAutoExtract = true,
			},
			{
				External = true,
				BaseType = "ProjectileBase",
				BaseName = "MorphDamageProjectile",
				BaseProperty = "Damage",
				ExtractAs = "PolymorphDamage",
				SkipAutoExtract = true,
			},
		},
		Using = { Effects = {"PolymorphTag", "PolymorphDamageTaken"}, },
		FlavorText = "ExPolymorphBoon_FlavorText",
	},
})