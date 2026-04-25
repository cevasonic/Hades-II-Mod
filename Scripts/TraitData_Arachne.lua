OverwriteTableKeys( TraitData, {
	-- Arachne	
	AgilityCostume = 
	{
		InheritFrom = { "CostumeTrait", "ForceCommonAppearanceTrait" },
		Icon = "Boon_Arachne_01",
		Costume = "Models/Melinoe/Melinoe_ArachneArmorC",
		
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 0.45/0.4,
			},
			Epic =
			{
				Multiplier = 0.50/0.4,
			},
			Heroic =
			{
				Multiplier = 0.60/0.4,
			},
		},
		WeaponSpeedMultiplier =
		{
			WeaponNames = WeaponSets.HeroAllWeaponsAndSprint,
			Value = { BaseValue = 0.6, SourceIsMultiplier = true },
			ReportValues = { ReportedWeaponMultiplier = "Value" }
		},
		PropertyChanges = 
		{
			{
				WeaponNames = { "WeaponCastArm", "WeaponStaffSwing5", "WeaponDagger5", "WeaponAxeSpecialSwing" },
				BaseValue = 0.6,
				SourceIsMultiplier = true,
				SpeedPropertyChanges = true,
				ExcludeLinked = true,
			}
		},
		SetupFunction =
		{
			Name = "CostumeArmor",
			Args =
			{
				Source = "Robe",
				Delay = 0.75,
				BaseAmount = 30,
				ReportValues = 
				{ 
					ReportedArmor = "BaseAmount",
				}
			},
		},
		ExtractValues =
		{
			{
				Key = "ReportedArmor",
				ExtractAs = "TooltipAmount",
			},
			{
				Key = "ReportedWeaponMultiplier",
				ExtractAs = "TooltipSpeed",
				Format = "NegativePercentDelta"
			},
		}
	},
	CastDamageCostume = 
	{
		InheritFrom = { "CostumeTrait", "ForceCommonAppearanceTrait" },
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 2.25/2,
			},
			Epic =
			{
				Multiplier = 2.50/2,
			},
			Heroic =
			{
				Multiplier = 3.00/2,
			},
		},
		Icon = "Boon_Arachne_07",
		Costume = "Models/Melinoe/Melinoe_ArachneArmorD",
		AddOutgoingDamageModifiers = 
		{
			ValidWeapons = WeaponSets.HeroRangedWeapons,
			ValidProjectiles = WeaponSets.CastProjectileNames,
			WeaponOrProjectileRequirement = true,
			ValidWeaponMultiplier = { BaseValue = 2 },
			ReportValues = 
			{ 
				ReportedDamageBonus = "ValidWeaponMultiplier",
			}
		},
		SetupFunction =
		{
			Name = "CostumeArmor",
			Args =
			{
				Source = "Robe",
				BaseAmount = 20,
				Delay = 0.75,
				ReportValues = 
				{ 
					ReportedArmor = "BaseAmount",
				}
			},
		},
		ExtractValues =
		{
			{
				Key = "ReportedArmor",
				ExtractAs = "TooltipAmount",
			},
			{
				Key = "ReportedDamageBonus",
				ExtractAs = "TooltipDamage",
				Format = "PercentDelta",
			},
		}
	},
	ManaCostume = 
	{
		InheritFrom = { "CostumeTrait", "ForceCommonAppearanceTrait" },
		ManaOverTimeSource = true,
		Icon = "Boon_Arachne_02",
		Costume = "Models/Melinoe/Melinoe_ArachneArmorB",

		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 10/5,
			},
			Epic =
			{
				Multiplier = 15/5,
			},
			Heroic =
			{
				Multiplier = 25/5,
			},
		},

		SetupFunctions =
		{
			{
				Name = "ManaRegenSetup",
				Args =
				{
					Name = "ManaCostume",
					ManaRegenPerSecond = { BaseValue = 5 },
					ReportValues = { ReportedManaRecovery = "ManaRegenPerSecond" }
				},
				RunOnce = true
			},
			{
				Name = "CostumeArmor",
				Args =
				{
					Source = "Robe",
					Delay = 0.75,
					BaseAmount = 40,
					ReportValues = 
					{ 
						ReportedArmor = "BaseAmount",
					}
				},
			},
		},
		ExtractValues =
		{
			{
				Key = "ReportedArmor",
				ExtractAs = "TooltipAmount",
			},
			{
				Key = "ReportedManaRecovery",
				ExtractAs = "TooltipManaRecovery",
				DecimalPlaces = 1,
			},
		}
	},
	VitalityCostume = 
	{
		InheritFrom = { "CostumeTrait", "ForceCommonAppearanceTrait" },
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 4/2,
			},
			Epic =
			{
				Multiplier = 6/2,
			},
			Heroic =
			{
				Multiplier = 10/2,
			},
		},
		Icon = "Boon_Arachne_03",
		Costume = "Models/Melinoe/Melinoe_ArachneArmorA",
		DoorHealFixed = { BaseValue = 2 },
		SetupFunction =
		{
			Name = "CostumeArmor",
			Args =
			{
				Source = "Robe",
				Delay = 0.75,
				BaseAmount = 50,
				ReportValues = 
				{ 
					ReportedArmor = "BaseAmount",
				}
			},
		},
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
				Key = "ReportedArmor",
				ExtractAs = "TooltipAmount",
			},
			{
				Key = "DoorHealFixed",
				ExtractAs = "TooltipHeal",
				Format = "FlatHeal",
			},
		}
	},
	HighArmorCostume = 
	{
		InheritFrom = { "CostumeTrait", "ForceCommonAppearanceTrait" },
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 80/60,
			},
			Epic =
			{
				Multiplier = 100/60,
			},
			Heroic =
			{
				Multiplier = 140/60,
			},
		},
		Icon = "Boon_Arachne_06",
		Costume = "Models/Melinoe/Melinoe_ArachneArmorF",
		AcquireFunctionName = "GiveRandomConsumables",
		AcquireFunctionArgs =
		{ 
			Delay = 1.6,
			NotRequiredPickup = true,
			ForceToValidLocation = true,
			LootOptions =
			{
				{
					Name = "MetaFabricDrop",
					Amount = 1,
					Interval = 0.35,
					ReportValues = { ReportedResource = "Amount"},
				},
			}
		},
		SetupFunction =
		{
			Name = "CostumeArmor",
			Args =
			{
				Source = "Robe",
				Delay = 0.75,
				BaseAmount = { BaseValue = 60 },
				ReportValues = 
				{ 
					ReportedArmor = "BaseAmount",
				}
			},
		},
		ExtractValues =
		{
			{
				Key = "ReportedArmor",
				ExtractAs = "TooltipAmount",
			},
			{
				Key = "ReportedResource",
				ExtractAs = "ResourceCount",
			},
		}
	},
	IncomeCostume = 
	{
		InheritFrom = { "CostumeTrait", "ForceCommonAppearanceTrait" },
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 10/5,
			},
			Epic =
			{
				Multiplier = 15/5,
			},
			Heroic =
			{
				Multiplier = 25/5,
			},
		},
		Icon = "Boon_Arachne_08",
		Costume = "Models/Melinoe/Melinoe_ArachneArmorE",
		DoorCash = { BaseValue = 5 },
		SetupFunction =
		{
			Name = "CostumeArmor",
			Args =
			{
				Source = "Robe",
				Delay = 0.75,
				BaseAmount = 10,
				ReportValues = 
				{ 
					ReportedArmor = "BaseAmount",
				}
			},
		},
		ExtractValues =
		{
			{
				Key = "ReportedArmor",
				ExtractAs = "TooltipAmount",
			},
			{
				Key = "DoorCash",
				ExtractAs = "TooltipCash",
			},
		}
	},

	SpellCostume =
	{
		InheritFrom = { "CostumeTrait", "ForceCommonAppearanceTrait" },
		Icon = "Boon_Arachne_05",
		Costume = "Models/Melinoe/Melinoe_ArachneArmorG",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 0.6/0.7,
			},
			Epic =
			{
				Multiplier = 0.5/0.7,
			},
			Heroic =
			{
				Multiplier = 0.3/0.7,
			},
		},
		SetupFunction =
		{
			Name = "CostumeArmor",
			Args =
			{
				Source = "Robe",
				Delay = 0.75,
				BaseAmount = 55,
				ReportValues = 
				{ 
					ReportedArmor = "BaseAmount",
				}
			},
		},
		ManaSpendCostModifiers =
		{
			Multiplier = { BaseValue = 0.70, },
			ReportValues = 
			{
				ReportedMultiplier = "Multiplier"
			}
		},
		ExtractValues =
		{
			{
				Key = "ReportedArmor",
				ExtractAs = "TooltipAmount",
			},
			{
				Key = "ReportedMultiplier",
				ExtractAs = "Multiplier",
				Format = "PercentDelta",
			},
		}
	},
	-- Legendary
	EscalatingCostume = 
	{
		InheritFrom = { "CostumeTrait", "ForceCommonAppearanceTrait" },
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 4/3,
			},
			Epic =
			{
				Multiplier = 6/3,
			},
			Heroic =
			{
				Multiplier = 12/3,
			},
		},
		Icon = "Boon_Arachne_04",
		Costume = "Models/Melinoe/Melinoe_ArachneArmorH",
		TrayStatLines = 
		{
			"EscalatingCostumeStatDisplay1",
		},
		CodexGameStateRequirements =
		{
			{
				PathTrue = { "GameState", "TextLinesRecord", "ArachneGrantsReward01" },
			},
		},
		SetupFunction =
		{
			Name = "CostumeArmor",
			Args =
			{
				Source = "Robe",
				Delay = 0.75,
				BaseAmount = 5,
				ReportValues = 
				{ 
					ReportedArmor = "BaseAmount",
				}
			},
		},
		AddOutgoingDamageModifiers =
		{
			UseTraitValue = "EscalatingCostumeValue",
			IsMultiplier = true,
		},
		EscalatingCostumeValueGrowthPerRoom = 
		{
			BaseValue = 0.03
		},
		EscalatingCostumeValue = 1.0,
		ExtractValues =
		{
			{
				Key = "ReportedArmor",
				ExtractAs = "TooltipAmount",
				SkipAutoExtract = true
			},
			{
				Key = "EscalatingCostumeValueGrowthPerRoom",
				ExtractAs = "IncreasePerRoom",
				Format = "Percent",
				DecimalPlaces = 1,
				SkipAutoExtract = true
			},
			{
				Key = "EscalatingCostumeValue",
				ExtractAs = "CurrentBonus",
				Format = "PercentDelta",
				DecimalPlaces = 1,
			},
		},
		FlavorText = "EscalatingCostume_FlavorText",
	},
})