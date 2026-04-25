OverwriteTableKeys( TraitData, {
	-- Narcissus
	NarcissusA =
	{
		InheritFrom = { "ForceCommonAppearanceTrait" },
	
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
				Multiplier = 4
			},
		},
		BlockStacking = true,
		BlockInRunRarify = true,
		Icon = "Boon_Narcissus_01",
		AcquireFunctionName = "GiveRandomConsumables",
		AcquireFunctionArgs =
		{ 
			Delay = 0.5,
			NotRequiredPickup = true,
			ForceToValidLocation = false,
			RunProgressUpgradeEligible = true,
			DestinationId = 591878,
			Range = 0,
			Force = 280,
			UpwardForce = 600,
			Angle = 170,
			AngleIncrement =
			{ 
				CustomRarityMultiplier = 
				{
					Common = { Multiplier = 1 },
					Rare = { Multiplier = 1 },
					Epic = { Multiplier = 2/3 },
					Heroic = { Multiplier = 2/5 },
				},
				BaseValue = 40,
			},
			DropFunctionName = "NarcissusDropPresentation",
			LootOptions =
			{
				{
					Name = "PlantFMolyDrop",
					Overrides =
					{
						AddResources =
						{
							PlantFMoly = 2,
						},
					},
				},
				{
					Name = "PlantFNightshadeDrop",
					Overrides =
					{
						AddResources =
						{
							PlantFNightshade = 3,
						},
					},
				},
				{
					Name = "StoreRewardRandomStack",
					Amount = { BaseValue = 1 },
					ReportValues = 
					{ 
						ReportedPoms = "Amount",
					}
				},
			}
		},
		ExtractValues =
		{
			{
				Key = "PlantFMoly",
				Format = "ResourceAmount",
				ExtractAs = "TotalMoly",
			},
			{
				Key = "PlantFNightshade",
				Format = "ResourceAmount",
				ExtractAs = "TotalNightshade",
			},
			{
				Key = "ReportedPoms",
				ExtractAs = "TooltipAmount",
				SkipAutoExtract = true
			},
		},
	},
	NarcissusB =
	{
	
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
				Multiplier = 4
			},
		},
		InheritFrom = { "NarcissusA", },
		Icon = "Boon_Narcissus_02",
		AcquireFunctionArgs =
		{ 
			Delay = 0.5,
			NotRequiredPickup = true,
			ForceToValidLocation = false,
			RunProgressUpgradeEligible = true,
			DestinationId = 591878,
			Range = 0,
			Force = 280,
			UpwardForce = 600,
			Angle = 180,
			AngleIncrement =
			{ 
				CustomRarityMultiplier = 
				{
					Common = { Multiplier = 1 },
					Rare = { Multiplier = 1 },
					Epic = { Multiplier = 1/2 },
					Heroic = { Multiplier = 1/4 },
				},
				BaseValue = 60,
			},
			DropFunctionName = "NarcissusDropPresentation",
			LootOptions =
			{
				{
					Name = "MetaCardPointsCommonDrop",
					Overrides =
					{
						AddResources =
						{
							MetaCardPointsCommon = 10,
						},
					},	

				},
				{
					Name = "HealDropMajor",
					Amount = { BaseValue = 1 },
					ReportValues = 
					{ 
						ReportedAmount = "Amount",
					}
				},
			}
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
				External = true,
				BaseType = "ConsumableData",
				BaseName = "HealDropMajor",
				Format = "FlatHeal",
				BaseProperty = "HealFixed",
				ExtractAs = "HealDropAmountSingle",
				AsInt = true,
			},
			{
				Key = "MetaCardPointsCommon",
				Format = "ResourceAmount",
				ExtractAs = "TotalMetaCardPointsCommon",
			},
			{
				Key = "ReportedAmount",
				Multiplier = "HealDropAmountSingle",
				ExtractAs = "HealDropAmount",
				SkipAutoExtract = true
			},
		},
	},
	NarcissusC =
	{
		InheritFrom = { "NarcissusA", },
	
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
		Icon = "Boon_Narcissus_03",
		AcquireFunctionArgs =
		{ 
			Delay = 0.5,
			NotRequiredPickup = true,
			ForceToValidLocation = false,
			RunProgressUpgradeEligible = true,
			DestinationId = 591878,
			Range = 0,
			Force = 280,
			UpwardForce = 600,
			Angle = 200,
			MultiplyMoney = true,
			DropFunctionName = "NarcissusDropPresentation",
			LootOptions =
			{
				{
					Name = "OreFSilverDrop",
					Overrides =
					{
						AddResources =
						{
							OreFSilver = 6,
						},
					},
				},
				{
					Name = "Currency",
					Amount = { BaseValue = 100 },
					ReportValues = 
					{ 
						ReportedAmount = "Amount",
					}
				},
			}
		},
		ExtractValues =
		{
			{
				Key = "OreFSilver",
				Format = "ResourceAmount",
				ExtractAs = "TotalSilver",
			},
			{
				Key = "ReportedAmount",
				ExtractAs = "TooltipCurrency"
			}
		},
	},
	NarcissusD =
	{
		InheritFrom = { "NarcissusA", },
		Icon = "Boon_Narcissus_04",
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
		AcquireFunctionArgs =
		{ 
			Delay = 0.5,
			NotRequiredPickup = true,
			ForceToValidLocation = false,
			RunProgressUpgradeEligible = true,
			DestinationId = 591878,
			Range = 0,
			Force = 280,
			UpwardForce = 600,
			Angle = 180,
			AngleIncrement =
			{ 
				CustomRarityMultiplier = 
				{
					Common = { Multiplier = 1 },
					Rare = { Multiplier = 1 },
					Epic = { Multiplier = 1/2 },
					Heroic = { Multiplier = 1/3 },
				},
				BaseValue = 60,
			},
			DropFunctionName = "NarcissusDropPresentation",
			LootOptions =
			{
				{
					Name = "MemPointsCommonDrop",
					Overrides =
					{
						AddResources =
						{
							MemPointsCommon = 20,
						},
					},
				},
				{
					Name = "MaxManaDrop",
					Amount = { BaseValue = 1 },
					ReportValues = 
					{ 
						ReportedAmount = "Amount",
					}
				},
			}
		},
		ExtractValues =
		{
			{
				Key = "MemPointsCommon",
				Format = "ResourceAmount",
				ExtractAs = "TotalMemPointsCommon",
			},
			{
				External = true,
				BaseType = "ConsumableData",
				BaseName = "MaxManaDrop",
				Format = "MaxMana",
				BaseProperty = "AddMaxMana",
				ExtractAs = "MaxManaSingle",
				AsInt = true,
			},
			{
				Key = "ReportedAmount",
				Multiplier = "MaxManaSingle",
				ExtractAs = "MaxManaAmount",
				SkipAutoExtract = true
			},
		},
	},
	NarcissusE =
	{
		InheritFrom = { "NarcissusA", },
		Icon = "Boon_Narcissus_05",
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
		AcquireFunctionArgs =
		{ 
			Delay = 0.5,
			NotRequiredPickup = true,
			ForceToValidLocation = false,
			RunProgressUpgradeEligible = true,
			DestinationId = 591878,
			Range = 0,
			Force = 280,
			UpwardForce = 600,
			Angle = 180,
			AngleIncrement =
			{ 
				CustomRarityMultiplier = 
				{
					Common = { Multiplier = 1 },
					Rare = { Multiplier = 1 },
					Epic = { Multiplier = 1/2 },
					Heroic = { Multiplier = 1/3 },
				},
				BaseValue = 60,
			},
			DropFunctionName = "NarcissusDropPresentation",
			LootOptions =
			{
				{
					Name = "MetaCurrencyDrop",
					Overrides =
					{
						AddResources =
						{
							MetaCurrency = 50,
						},
					},
				},
				{
					Name = "MaxHealthDrop",
					Amount = { BaseValue = 1 },
					ReportValues = 
					{ 
						ReportedAmount = "Amount",
					}
				},
			}
		},
		ExtractValues =
		{
			{
				Key = "MetaCurrency",
				Format = "ResourceAmount",
				ExtractAs = "TotalMetaCurrency",
			},
			{
				External = true,
				BaseType = "ConsumableData",
				BaseName = "MaxHealthDrop",
				Format = "MaxHealth",
				BaseProperty = "AddMaxHealth",
				ExtractAs = "MaxHealthSingle",
				AsInt = true,
			},
			{
				Key = "ReportedAmount",
				Multiplier = "MaxHealthSingle",
				ExtractAs = "MaxHealthAmount",
				SkipAutoExtract = true
			},
		},
	},
	NarcissusF =
	{
		InheritFrom = { "NarcissusA", },
		Icon = "Boon_Narcissus_06",
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
		AcquireFunctionArgs =
		{
			Delay = 0.5,
			NotRequiredPickup = true,
			ForceToValidLocation = false,
			RunProgressUpgradeEligible = true,
			DestinationId = 591878,
			Range = 0,
			Force = 280,
			UpwardForce = 600,
			Angle = 180,
			AngleIncrement = 60,
			DropFunctionName = "NarcissusDropPresentation",
			LootOptions =
			{
				{
					Name = "MetaFabricDrop",
					Overrides =
					{
						AddResources =
						{
							MetaFabric = 2,
						},
					},
				},
				{
					Name = "RerollDrop",
					Overrides =
					{
						AddRerolls = { BaseValue = 2 },
						ReportValues = 
						{ 
							ReportedAmount = "AddRerolls",
						}
					},
				},
			}
		},
		ExtractValues =
		{
			{
				Key = "MetaFabric",
				Format = "ResourceAmount",
				ExtractAs = "TotalMetaFabric",
			},
			{
				Key = "ReportedAmount",
				ExtractAs = "Amount",
				SkipAutoExtract = true
			},
		},
	},
	NarcissusG =
	{
		InheritFrom = { "NarcissusA", },
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
				Multiplier = 2
			},
		},
		Icon = "Boon_Narcissus_07",
		GameStateRequirements =
		{
			-- see NarcissusBenefitChoices =
		},
		CodexGameStateRequirements =
		{
			{
				PathTrue = { "GameState", "TextLinesRecord", "NarcissusGrantsReward01" },
			},
		},
		AcquireFunctionArgs =
		{
			Delay = 0.5,
			NotRequiredPickup = true,
			ForceToValidLocation = false,
			RunProgressUpgradeEligible = true,
			DestinationId = 591878,
			Range = 0,
			Force = 280,
			UpwardForce = 600,
			Angle = 170,
			AngleIncrement =
			{ 
				CustomRarityMultiplier = 
				{
					Common = { Multiplier = 1 },
					Rare = { Multiplier = 1 },
					Epic = { Multiplier = 2/3 },
					Heroic = { Multiplier = 2/5 },
				},
				BaseValue = 40,
			},
			DropFunctionName = "NarcissusDropPresentation",
			LootOptions =
			{
				{
					Name = "Mixer5CommonDrop",
				},
				{
					Name = "ElementalBoost",
					Amount = { BaseValue = 2 },
					ReportValues = 
					{ 
						ReportedAmount = "Amount",
					}
				},
			}
		},
		FlavorText = "NarcissusG_FlavorText",
		ExtractValues =
		{
			{
				Key = "Mixer5Common",
				Format = "ResourceAmount",
				ExtractAs = "TotalMixer5Common",
			},
			{
				Key = "ReportedAmount",
				ExtractAs = "Amount",
				SkipAutoExtract = true
			},
		},
	},
	NarcissusH =
	{
		InheritFrom = { "NarcissusA", },
		Icon = "Boon_Narcissus_08",
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
		AcquireFunctionArgs =
		{
			Delay = 0.5,
			NotRequiredPickup = true,
			ForceToValidLocation = false,
			RunProgressUpgradeEligible = true,
			DestinationId = 591878,
			Range = 0,
			Force = 280,
			UpwardForce = 600,
			Angle = 180,
			AngleIncrement =
			{ 
				CustomRarityMultiplier = 
				{
					Common = { Multiplier = 1 },
					Rare = { Multiplier = 1 },
					Epic = { Multiplier = 1/2 },
					Heroic = { Multiplier = 1/3 },
				},
				BaseValue = 60,
			},
			DropFunctionName = "NarcissusDropPresentation",
			LootOptions =
			{
				{
					Name = "LastStandDrop",
					Amount = { BaseValue = 1 },
					ReportValues = 
					{ 
						ReportedAmount = "Amount",
					},
					Overrides = 
					{
						CanDuplicate = false,
					}
				},
				{
					Name = "PlantGLotusDrop",
					Overrides =
					{
						AddResources =
						{
							PlantGLotus = 2,
						},
					},
				},
			}
		},
		ExtractValues =
		{
			{
				Key = "PlantGLotus",
				Format = "ResourceAmount",
				ExtractAs = "TotalLotus",
			},
			{
				Key = "ReportedAmount",
				ExtractAs = "Amount",
				SkipAutoExtract = true
			},
		},
	},
	NarcissusI =
	{
		InheritFrom = { "NarcissusA", },
		Icon = "Boon_Narcissus_09",
		AcquireFunctionArgs =
		{
			Delay = 0.5,
			NotRequiredPickup = true,
			ForceToValidLocation = false,
			RunProgressUpgradeEligible = true,
			DestinationId = 591878,
			Range = 0,
			Force = 280,
			UpwardForce = 600,
			Angle = 180,
			AngleIncrement = 60,
			DropFunctionName = "NarcissusDropPresentation",
			LootOptions =
			{
				{
					Name = "BlindBoxLoot",
					Overrides =
					{
						BlockBoughtTextLines = true,
					},
				},
				{
					Name = "SeedMysteryDrop",
					Overrides =
					{
						AddResources =
						{
							SeedMystery = 1,
						},
					},
				},
			}
		},
		ExtractValues =
		{
			{
				Key = "SeedMystery",
				Format = "ResourceAmount",
				ExtractAs = "TotalSeedMystery",
			},
		},
	},
})