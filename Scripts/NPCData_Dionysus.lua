UnitSetData.NPC_Dionysus =
{
	-- Dionysus, Id = TKTK
	NPC_Dionysus_01 =
	{
		InheritFrom = { "NPC_Neutral", "NPC_Giftable" },
		
		OnUsedFunctionName = "UseLoot",
		OnUsedFunctionArgs =
		{
			SkipInteractAnim = true,
			SkipSound = true,
			SkipBoonInteractPresentation = true,
			ResetUseText = true,
			PackageName = "NPC_Dionysus_01",
			PreserveContextArt = true,
		},

		RecheckConversationOnLootPickup = true,
		Portrait = "Portrait_Dionysus_Default_01",
		AnimOffsetZ = 50,
		Groups = { "NPCs" },
		SpeakerName = "Dionysus",
		LoadPackages = { "NPC_Dionysus_01", "Dionysus" },
		SubtitleColor = Color.DionysusVoice,
		EmoteOffsetY = -320,
		EmoteOffsetX = -30,
		TreatAsGodLootByShops = true,
		RequiredRoomInteraction = true,
		PreEventFunctionName = "AngleNPCToHero",

		ActivateRequirements =
		{
			-- None
		},
		InvincibubbleScale = 1.5,
		AlwaysShowInvulnerabubbleOnInvulnerableHit = true,
		RepulseOnMeleeInvulnerableHit = 150,
		TurnInPlaceAnimation = "Dionysus_Turn",

		UpgradeAcquiredAnimation = "MelinoeSalute",
		UpgradeAcquiredAnimationDelay = 1.2,

		BoxAnimation = "DialogueSpeechBubbleLight",
		BoxExitAnimation = "DialogueSpeechBubbleLightOut",
		NarrativeTextColor = Color.DialogueTextLight,
		NameplateSpeakerNameColor = Color.DialogueSpeakerNameOlympian,
		NameplateDescriptionColor = {145, 45, 90, 255},
		NarrativeContextArtFlippable = false,

		MenuTitle = "UpgradeChoiceMenu_Dionysus",
		UpgradeScreenOpenFunctionName = "DionysusChoiceScreenPresentation",
		UpgradeScreenOpenSound = "/SFX/DionysusBoonWineLaugh",
		UpgradeSelectedSound = "/SFX/DionysusBoonChoice",
		Icon = "BoonSymbolDionysus",
		LootColor = {200, 0, 255, 255},
		LightingColor = {200, 0, 255, 255},

		SetupEvents =
		{
			{
				FunctionName = "SilenceForDreamRun",
				GameStateRequirements =
				{
					{
						PathTrue = { "CurrentRun", "IsDreamRun" },
					},
				},
			},
			{
				Threaded = true,
				FunctionName = "AmbientChatting",
				Args = PresetEventArgs.DionysusFeasting,
				GameStateRequirements =
				{
					{
						PathTrue = { "CurrentRun", "IsDreamRun" },
					},
				},
			},
			{
				FunctionName = "OverwriteSelf",
				Args =
				{
					GrannyTexture = "GR2/DionysusDream_Color",
					AddOutlineImmediately = true,
					Outline =
					{
						R = 25,
						G = 200,
						B = 160,
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

		Traits = 
		{
			"CastLobBoon",
			"HiddenMaxHealthBoon",
			"FirstHangoverBoon",
			"CombatEncounterHealBoon",
			"PowerDrinkBoon",
			"FogDamageBonusBoon",
			"BankBoon",

			-- Legendary
			"RandomBaseDamageBoon",
		},
		FlavorTextIds =
		{
			"DionysusUpgrade_FlavorText01",
			"DionysusUpgrade_FlavorText02",
			"DionysusUpgrade_FlavorText03",
		},

		UpgradeMenuOpenVoiceLines =
		{
			{
				PlayOnce = true,
				PlayOnceContext = "DreamRunDionysusIntroVO",
				BreakIfPlayed = true,
				PreLineWait = 0.9,
				UsePlayerSource = true,
				AllowTalkOverTextLines = true,
				GameStateRequirements =
				{
					{
						PathTrue = { "CurrentRun", "IsDreamRun", },
					},
				},

				{ Cue = "/VO/MelinoeField_5655", Text = "If only I could learn to let go as you have, Dionysus..." },
			},
			{
				RandomRemaining = true,
				BreakIfPlayed = true,
				PreLineWait = 0.85,
				UsePlayerSource = true,
				SkipAnim = true,
				AllowTalkOverTextLines = true,

				{ Cue = "/VO/MelinoeField_2392", Text = "I already have plans this evening, sorry...",
					GameStateRequirements =
					{
						{
							PathTrue = { "CurrentRun", "TextLinesRecord", "DionysusAboutFeast03" },
						},
					},
				},
				{ Cue = "/VO/MelinoeField_2400", Text = "He's great, I'm sure...",
					GameStateRequirements =
					{
						{
							PathTrue = { "CurrentRun", "TextLinesRecord", "DionysusAboutZagreus02" },
						},
					},
				},
				{ Cue = "/VO/MelinoeField_2897", Text = "...I'm going to have to pass.",
					GameStateRequirements =
					{
						{
							PathTrue = { "CurrentRun", "TextLinesRecord", "DionysusLowHealth01" },
						},
					},
				},
				{ Cue = "/VO/MelinoeField_2900", Text = "...Yeah.",
					PreLineWait = 0.9,
					GameStateRequirements =
					{
						{
							PathTrue = { "CurrentRun", "TextLinesRecord", "DionysusAboutAutomatons01" },
						},
					},
				},
				{ Cue = "/VO/Melinoe_0601", Text = "No, I... {#Emph}ugh.",
					GameStateRequirements =
					{
						{
							Path = { "CurrentRun", "TextLinesRecord" },
							HasAny = { "DionysusAboutPrometheus01", "DionysusAboutPrometheus01_B" },
						},
					},
				},
				{ Cue = "/VO/Melinoe_1308", Text = "We'll see.",
					GameStateRequirements =
					{
						{
							PathTrue = { "CurrentRun", "TextLinesRecord", "DionysusAboutPrometheus02" },
						},
					},
				},
				{ Cue = "/VO/MelinoeField_3684", Text = "...I never should have said anything.",
					GameStateRequirements =
					{
						{
							PathTrue = { "CurrentRun", "TextLinesRecord", "DionysusAboutHeracles01" },
						},
					},
				},
				{ Cue = "/VO/MelinoeField_4476", Text = "If I ever encounter him, sure.",
					GameStateRequirements =
					{
						{
							PathTrue = { "CurrentRun", "TextLinesRecord", "DionysusAboutPanAspect01" },
						},
					},
				},
			},
			{
				BreakIfPlayed = true,
				RandomRemaining = true,
				SuccessiveChanceToPlay = 0.25,
				PreLineWait = 1.0,
				SkipAnim = true,
				Source = { LineHistoryName = "NPC_Dionysus_01", SubtitleColor = Color.DionysusVoice },
				AllowTalkOverTextLines = true,
				GameStateRequirements =
				{
					--
				},
				Cooldowns =
				{
					{ Name = "DionysusOfferSpeech", Time = 8 },
				},
				
				{ Cue = "/VO/Dionysus_0084", Text = "Get a load of these.", PlayFirst = true },
				{ Cue = "/VO/Dionysus_0075", Text = "Let's see here..." },
				{ Cue = "/VO/Dionysus_0076", Text = "What have we got..." },
				{ Cue = "/VO/Dionysus_0077", Text = "Got just the thing..." },
				{ Cue = "/VO/Dionysus_0078", Text = "Got what you need..." },
				{ Cue = "/VO/Dionysus_0079", Text = "Any of these?" },
				{ Cue = "/VO/Dionysus_0080", Text = "How 'bout one of these?" },
				{ Cue = "/VO/Dionysus_0081", Text = "Our specials this eve." },
				{ Cue = "/VO/Dionysus_0082", Text = "What do you feel like?" },
				{ Cue = "/VO/Dionysus_0083", Text = "One of these?" },
			},
			{ GlobalVoiceLines = "FoundRareBoonVoiceLines" },
		},

		SpecialInteractFunctionName = "SpecialInteractSalute",
		SpecialInteractGameStateRequirements =
		{
			{
				PathTrue = { "GameState", "UseRecord", "NPC_Dionysus_01" },
			},
		},
		SpecialInteractCooldown = 60,
		InteractVoiceLines =
		{
			{
				PreLineWait = 0.3,
				UsePlayerSource = true,
				RandomRemaining = true,
				PlayOnceThisRun = true,
				SuccessiveChanceToPlayAll = 0.25,
				Cooldowns =
				{
					{ Name = "MelinoeSaluteSpeech", Time = 4 },
				},

				{ Cue = "/VO/MelinoeField_2576_B", Text = "You're a most-gracious host." },
				{ Cue = "/VO/MelinoeField_2577", Text = "Happy feasting, my lord." },
			},
			{ GlobalVoiceLines = "SaluteVoiceLines" },
			{
				RandomRemaining = true,
				PreLineWait = 0.29,
				ObjectType = "NPC_Dionysus_01",
				PreLineAnim = "Dionysus_Blessing",
				-- PreLineAnim = "Dionysus_Shrug",
				-- PreLineAnim = "Dionysus_Greeting",

				{ Cue = "/VO/Dionysus_0123", Text = "{#Emph}Heeey.",
					GameStateRequirements =
					{
						{
							Path = { "LastLinePlayed" },
							IsAny = { "/VO/Melinoe_1698", "/VO/Melinoe_1699" },
						},
					},
				},
				{ Cue = "/VO/Dionysus_0124", Text = "{#Emph}Heeey!",
					GameStateRequirements =
					{
						{
							Path = { "LastLinePlayed" },
							IsAny = { "/VO/Melinoe_1698", "/VO/Melinoe_1699" },
						},
					},
				},
				{ Cue = "/VO/Dionysus_0125", Text = "What is up?",
					GameStateRequirements =
					{
						{
							Path = { "LastLinePlayed" },
							IsAny = { "/VO/Melinoe_1698", "/VO/Melinoe_1699" },
						},
					},
				},
				{ Cue = "/VO/Dionysus_0126", Text = "Cheers!",
					GameStateRequirements =
					{
						{
							Path = { "LastLinePlayed" },
							IsAny = { "/VO/Melinoe_1701", "/VO/Melinoe_1703", "/VO/MelinoeField_2576", "/VO/MelinoeField_2577", },
						},
					},
				},
				{ Cue = "/VO/Dionysus_0127", Text = "Oh I'm not going anywhere.",
					PreLineAnim = "Dionysus_Shrug",
					GameStateRequirements =
					{
						{
							Path = { "LastLinePlayed" },
							IsAny = { "/VO/Melinoe_1701", "/VO/Melinoe_1703" },
						},
					},
				},
				{ Cue = "/VO/Dionysus_0128", Text = "Absolutely.",
					GameStateRequirements =
					{
						{
							Path = { "LastLinePlayed" },
							IsAny = { "/VO/Melinoe_1704", "/VO/Melinoe_1705", "/VO/MelinoeField_2576" },
						},
					},
				},
				{ Cue = "/VO/Dionysus_0129", Text = "You are something else.",
					PreLineAnim = "Dionysus_Shrug",
					GameStateRequirements =
					{
						{
							Path = { "LastLinePlayed" },
							IsAny = { "/VO/Melinoe_1700" },
						},
					},
				},
				{ Cue = "/VO/Dionysus_0132", Text = "...What was that?", PreLineAnim = "Dionysus_Idle" },
				{ Cue = "/VO/Dionysus_0130", Text = "You're pretty cool." },
				{ Cue = "/VO/Dionysus_0131", Text = "Yeah!!" },
			}
		},

		InteractTextLineSets =
		{
			-- alt below
			DionysusFirstMeeting =
			{
				PlayOnce = true,
				UseableOffSource = true,
				InitialGiftableOffSource = true,
				GiftableOffSource = true,
				GameStateRequirements =
				{
					{
						PathFalse = { "GameState", "ReachedTrueEnding" },
					},
					{
						PathFalse = { "GameState", "TextLinesRecord", "DionysusFirstMeeting_B" }
					},
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = PresetEventArgs.DionysusFeasting,

				{ Cue = "/VO/Dionysus_0002",
					-- PreLineAnim = "Dionysus_Greeting",
					-- PreLineAnim = "Dionysus_Eager",
					-- PreLineAnim = "Dionysus_Shrug",
					-- PreLineAnim = "Dionysus_Blessing",
					-- PreLineAnim = "Dionysus_Laugh",
					-- PreLineAnim = "Dionysus_Surprise",
					Emote = "PortraitEmoteCheerful",
					PreLineThreadedFunctionName = "PlayCharacterAnim",
					PreLineThreadedFunctionArgs = { Name = "Dionysus_Eager", WaitTime = 0.5, AngleNPCToHero = true, },
					Text = "Now who is {#Emph}this{#Prev}, what sort of Nymph do we have here? Not from the waters nor the woods, but wait wait {#Emph}wait! {#Prev}Those {#Emph}eyes! {#Prev}Zag, man, is that {#Emph}you?! {#Prev}You've {#Emph}changed! {#Prev}I like it!" },
				{ Cue = "/VO/MelinoeField_2386", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Vulnerable_01",
					PreLineAnim = "MelTalkBrooding01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "Lord Dionysus, I presume? I'm Melinoë, sister to Zagreus. I've come to the mountain's aid at the family's behest! But, what is the meaning of this festivity? Aren't you at war?" },
				{ Cue = "/VO/Dionysus_0003",
					PreLineAnim = "Dionysus_Shrug",
					Text = "{#Emph}Ohhh, Mel{#Prev}, right, the others mentioned you. {#Emph}Erm{#Prev}, listen baby, I'm into {#Emph}lots {#Prev}of different things, but war just isn't one of them. What's the use, we gods can't die! But we can {#Emph}live!" },
				{ Cue = "/VO/MelinoeField_2387", UsePlayerSource = true,
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "Your mountain is under siege. Chronos took my side of the family, and soon he may take yours!" },
				{ Cue = "/VO/Dionysus_0004",
					Text = "All the more reason to raise a cup while we still can, yeah? {#Emph}Heh. {#Prev}Though I get it! Not your thing. But why not have a little pick-me-up for the road ahead?" },
			},
			DionysusFirstMeeting_B =
			{
				PlayOnce = true,
				UseableOffSource = true,
				InitialGiftableOffSource = true,
				GiftableOffSource = true,
				GameStateRequirements =
				{
					{
						PathTrue = { "GameState", "ReachedTrueEnding" },
					},
					{
						PathFalse = { "GameState", "TextLinesRecord", "DionysusFirstMeeting" }
					},
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = PresetEventArgs.DionysusFeasting,

				{ Cue = "/VO/Dionysus_0002",
					-- PreLineAnim = "Dionysus_Greeting",
					-- PreLineAnim = "Dionysus_Eager",
					-- PreLineAnim = "Dionysus_Shrug",
					-- PreLineAnim = "Dionysus_Blessing",
					-- PreLineAnim = "Dionysus_Laugh",
					-- PreLineAnim = "Dionysus_Surprise",
					Emote = "PortraitEmoteCheerful",
					PreLineThreadedFunctionName = "PlayCharacterAnim",
					PreLineThreadedFunctionArgs = { Name = "Dionysus_Eager", WaitTime = 0.5, AngleNPCToHero = true, },
					Text = "Now who is {#Emph}this{#Prev}, what sort of Nymph do we have here? Not from the waters nor the woods, but wait wait {#Emph}wait! {#Prev}Those {#Emph}eyes! {#Prev}Zag, man, is that {#Emph}you?! {#Prev}You've {#Emph}changed! {#Prev}I like it!" },
				{ Cue = "/VO/MelinoeField_4329", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Casual_01",
					PreLineAnim = "MelTalkBrooding01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "Lord Dionysus, I presume? I'm Melinoë, sister to Zagreus. I've been coming to the mountain's aid at the family's behest. Why all the festivity? The end of the war?" },
				{ Cue = "/VO/Dionysus_0003",
					PreLineAnim = "Dionysus_Shrug",
					Text = "{#Emph}Ohhh, Mel{#Prev}, right, the others mentioned you. {#Emph}Erm{#Prev}, listen baby, I'm into {#Emph}lots {#Prev}of different things, but war just isn't one of them. What's the use, we gods can't die! But we can {#Emph}live!" },
				{ Cue = "/VO/MelinoeField_4330", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Vulnerable_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "I said the {#Emph}end {#Prev}of the war. Though I suppose your mountain technically still is under siege." },
				{ Cue = "/VO/Dionysus_0004",
					Text = "All the more reason to raise a cup while we still can, yeah? {#Emph}Heh. {#Prev}Though I get it! Not your thing. But why not have a little pick-me-up for the road ahead?" },
			},

			DionysusAboutFeast01 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				InitialGiftableOffSource = true,
				GameStateRequirements =
				{
					{
					},
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = PresetEventArgs.DionysusFeasting,

				{ Cue = "/VO/Dionysus_0143",
					Emote = "PortraitEmoteCheerful",
					PreLineThreadedFunctionArgs = { Name = "Dionysus_Eager", WaitTime = 0.5, AngleNPCToHero = true, },
					Text = "{#Emph}Heeey{#Prev}, look who decided to reconsider coming to our little gathering! Welcome back, Mel baby, now go on, you grab yourself a cup and mingle with the crowd!" },
				{ Cue = "/VO/MelinoeField_2388", UsePlayerSource = true,
					PreLineAnim = "MelTalkBrooding01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "As tempting as that sounds, Lord Dionysus, unfortunately I don't think I can. There are various perils beyond, and your fellow Olympians can only do so much to hold them off." },
				{ Cue = "/VO/Dionysus_0144",
					PreLineAnim = "Dionysus_Shrug",
					Text = "And I feel bad for them, really! Almighty gods with limitless power having to fend for themselves. Good thing I can drown my sorrows here, and guess what? So can you!" },
			},

			DionysusAboutFeast02 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				GameStateRequirements =
				{
					{
						PathFalse = { "GameState", "ReachedTrueEnding" },
					},
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = PresetEventArgs.DionysusFeasting,

				{ Cue = "/VO/Dionysus_0145",
					PreLineThreadedFunctionArgs = { Name = "Dionysus_Shrug", WaitTime = 0.5, AngleNPCToHero = true, },
					Text = "You really are just passing through? Look at all these temptations in every form! The liquid kind, the sumptuous kind, {#Emph}mm! {#Prev}But you're unmoved and undeterred?" },
				{ Cue = "/VO/MelinoeField_2389", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Vulnerable_01",
					PreLineAnim = "MelTalkBrooding01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "Look, I would truly love to stay. Enjoy a beverage and a bite... speak with all these doubtless-interesting guests... but I can't. Don't you understand? Your mountain is burning!" },
				{ Cue = "/VO/Dionysus_0146",
					PreLineAnim = "Dionysus_Laugh",
					Text = "Well if it's burning, baby, let it burn, I say! But I don't want to argue anymore, I mean, it's just another form of fighting, yeah? So you go do your thing, and I'll do mine!" },
			},
			DionysusAboutFeast03 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				GameStateRequirements =
				{
					{
					},
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = PresetEventArgs.DionysusFeasting,

				{ Cue = "/VO/MelinoeField_2391", UsePlayerSource = true,
					PreLineAnim = "MelTalkPensive01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "Lord Dionysus, just how long have you been feasting, anyhow? Here in this spot, I mean. Night after night, you're going at it like there's no tomorrow." },
				{ Cue = "/VO/Dionysus_0149",
					PreLineAnim = "Dionysus_Shrug",
					Text = "Mel baby, just call me Dionysus if you please, the Lord thing doesn't suit me, yeah? As for how long we've carried on like this, I've no idea! A while probably. Might be a new record! {#Emph}Heh. {#Prev}Sure you don't want to join?" },
			},
			DionysusAboutFeast04 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				GameStateRequirements =
				{
					{
						PathFalse = { "GameState", "ReachedTrueEnding" },
					},
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = PresetEventArgs.DionysusFeasting,

				{ Cue = "/VO/MelinoeField_2393", UsePlayerSource = true,
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "What if you couldn't feast any longer? Imagine something so dire that it forced you to put a stop to this way of life. Brought ruin to everything you hold dear!" },
				{ Cue = "/VO/Dionysus_0150",
					PreLineAnim = "Dionysus_Shrug",
					Text = "I know what you're trying to do, baby, and it isn't going to work. I've tuned out {#Emph}every {#Prev}bit of negativity, including yours! And since I'm a good host, I'm {#Emph}still {#Prev}going to give you {#Emph}this." },
			},
			DionysusAboutFeast05 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				GameStateRequirements =
				{
					{
						SumPrevRuns = 8,
						Path = { "TextLinesRecord", "TrueEndingFinale01" },
						CountPathTrue = true,
						Comparison = "==",
						Value = 0,
					},
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = PresetEventArgs.DionysusFeasting,

				{ Cue = "/VO/MelinoeField_2394", UsePlayerSource = true,
					PreLineAnim = "MelTalkPensive01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "What's the occasion for the feasting, anyway? I fail to see what cause there is to celebrate right now." },
				{ Cue = "/VO/Dionysus_0151",
					PreLineAnim = "Dionysus_Eager",
					Text = "Don't you get it, baby? Every moment that we live and breathe is more than cause enough! Maybe you're into feeling bad, I don't know, but me? I'm into feeling {#Emph}good!" },
			},
			DionysusAboutFeast06 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				GameStateRequirements =
				{
					{
					},
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = PresetEventArgs.DionysusFeasting,

				{ Cue = "/VO/Dionysus_0183",
					PreLineThreadedFunctionArgs = { Name = "Dionysus_Shrug", WaitTime = 0.5, AngleNPCToHero = true, },
					Text = "Hey glad you could make it! I know there's a lot going on, but what's it all for if you can't kick back once in a while, yeah? So {#Emph}ease up {#Prev}a bit, you're {#Emph}here!" },
				{ Cue = "/VO/MelinoeField_2972", UsePlayerSource = true,
					PreLineAnim = "MelTalkPensive01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "I'm just passing through. Though, I truly appreciate your hospitality. Perhaps if and when all this is finally resolved, I can kick back, as you say." },
				{ Cue = "/VO/Dionysus_0184",
					PreLineAnim = "Dionysus_Eager",
					Text = "Oh I'll hold you to that, if I can remember you said it! For now though cheers to your success and all, and may your warring wrap up peaceably and soon!" },
			},

			DionysusAboutRelationships01 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				GameStateRequirements =
				{
					{
						PathTrue = { "GameState", "TextLinesRecord", "DionysusGift07" }
					},
					{
						Path = { "GameState", "TextLinesRecord" },
						CountOf =
						{
							"MorosBecomingCloser01",
							"MorosBecomingCloser01_B",
							"NemesisPostCombatBecomingCloser01",
							"IcarusBecomingCloser01",
							"ErisBecomingCloser01",
						},
						Comparison = ">=",
						Value = 1,
					},
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = PresetEventArgs.DionysusFeasting,

				{ Cue = "/VO/Dionysus_0300",
					PreLineThreadedFunctionArgs = { Name = "Dionysus_Eager", WaitTime = 0.5, AngleNPCToHero = true, },
					Text = "Got anybody special in your life or what Mel baby, 'cause if you just let me know, I'll get 'em in! Can easily spare one or two more invitations here!" },

				{ Cue = "/VO/MelinoeField_4759", UsePlayerSource = true,
					PreLineAnim = "MelTalkPensive01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "I appreciate the offer, thanks. I'm not bound in the way Lord Uncle Zeus and Queen Hera are if that's what you mean, but have most of my needs fulfilled." },

				{ Cue = "/VO/Dionysus_0301",
					PreLineAnim = "Dionysus_Eager",
					Text = "Well that's a way to put it. I like having all {#Emph}my {#Prev}needs met too! Long as you're also getting your {#Emph}desires {#Prev}met, but anyway, your mate or mates are welcome to stop by!" },
			},

			DionysusLowHealth01 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				-- PreEventFunctionName = "AngleNPCToHero",
				GameStateRequirements =
				{
					{
						Path = { "CurrentRun", "Hero", "LastStands", },
						UseLength = true,
						Comparison = "<=",
						Value = 1,
					},
					{
						FunctionName = "RequiredHealthFraction",
						FunctionArgs = { Comparison = "<=", Value = 0.33, },
					},
					{
						PathTrue = { "GameState", "TextLinesRecord", "DionysusGift01" }
					},
					{
						Path = { "GameState", "RoomsEntered", "P_Story01" },
						Comparison = ">=",
						Value = 4,
					},
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = PresetEventArgs.DionysusFeasting,

				{ Cue = "/VO/Dionysus_0157",
					Emote = "PortraitEmoteDepressed",
					PreLineThreadedFunctionName = "PlayCharacterAnim",
					PreLineThreadedFunctionArgs = { Name = "Dionysus_Shrug", WaitTime = 0.5, AngleNPCToHero = true, },
					Text = "Mel baby, you look like hell if you don't mind me saying, I mean what did you fall down the mountainside on your way here? Care to wash up?" },
				{ Cue = "/VO/MelinoeField_2896", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Vulnerable_01",
					PreLineAnim = "MelTalkBrooding01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "Please pardon my disheveled state. I had to cross a doomed city of the risen dead, infiltrate an enemy armada, and climb halfway to the Palace of Zeus to get here." },
				{ Cue = "/VO/Dionysus_0158",
					Text = "No excuses! Now either get out of that positively ripe dress you've got on and make like all my other guests, or move along! We enforce a strict code of attire." },
			},

			DionysusAboutKeepsake01 =
			{
				PlayOnce = true,
				GameStateRequirements =
				{
					{
						PathTrue = { "CurrentRun", "Hero", "TraitDictionary", "SkipEncounterKeepsake" },
					},
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = PresetEventArgs.DionysusFeasting,

				{ Cue = "/VO/Dionysus_0170",
					Emote = "PortraitEmoteDepressed",
					Text = "That Fig Leaf that you're carrying... it's from my {#Emph}private wardrobe! {#Prev}So how come you have it and not me? What, did I just hand it over as a gift?" },
				{ Cue = "/VO/MelinoeField_2901", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Hesitant_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "You did exactly that, yes. I offered you a bottle of Nectar, and you gave me this Leaf in exchange. Don't you recall?" },
				{ Cue = "/VO/Dionysus_0171",
					PreLineAnim = "Dionysus_Shrug",
					Text = "Don't I recall... {#Emph}erm{#Prev}, sometimes! But not always, not so much of late! Well if past-me thought he should give you such a thing, he must have had a real good feeling for you, yeah?" },
			},
			DionysusAboutFrogFamiliar01 =
			{
				PlayOnce = true,
				GameStateRequirements =
				{
					{
						Path = { "GameState", "EquippedFamiliar" },
						IsAny = { "FrogFamiliar" },
					},
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = PresetEventArgs.DionysusFeasting,

				{ Cue = "/VO/Dionysus_0172",
					Emote = "PortraitEmoteSurprise",
					PreLineThreadedFunctionArgs = { Name = "Dionysus_Surprise", WaitTime = 0.5, AngleNPCToHero = true, },
					Text = "What's that with you, some sort of {#Emph}frog? {#Prev}Well sure, since frogs and me, we go way back! The only rule is there's no swimming in the spring or guests might get a little {#Emph}eugh!" },
				{ Cue = "/VO/MelinoeField_2911", UsePlayerSource = true,
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "That's Frinos, and don't worry, not that you ever do. He won't disturb the peace, and avoids most others anyway. Thank you for permitting him here... and me, for that matter." },
				{ Cue = "/VO/Dionysus_0173",
					Emote = "PortraitEmoteCheerful",
					PreLineAnim = "Dionysus_Shrug",
					Text = "Oh absolutely, it's the sort of feast where if you can get in at all, it means you're probably all right! Your frog there too, long as he doesn't sing! He doesn't sing, does he...?" },
			},
			DionysusAboutCatFamiliar01 =
			{
				PlayOnce = true,
				GameStateRequirements =
				{
					{
						Path = { "GameState", "EquippedFamiliar" },
						IsAny = { "CatFamiliar" },
					},
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = PresetEventArgs.DionysusFeasting,

				{ Cue = "/VO/Dionysus_0185",
					Emote = "PortraitEmoteSparkly",
					PreLineThreadedFunctionArgs = { Name = "Dionysus_Eager", WaitTime = 0.5, AngleNPCToHero = true, },
					Text = "{#Emph}Hey, {#Prev}little kitten, {#Emph}meooow, hahaha! {#Prev}And hey to {#Emph}you{#Prev}, Mel baby! So how about an introduction to your feline companion, yeah?" },
				{ Cue = "/VO/MelinoeField_2973", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Hesitant_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "Oh, {#Emph}erm{#Prev}, this is Toula, and we keep each other safe. And fear not, for I'll be watching her closely, lest she help herself to all the nourishment about." },
				{ Cue = "/VO/Dionysus_0186",
					PreLineAnim = "Dionysus_Shrug",
					Text = "No need for that, we've plenty here to go around, even with {#Emph}lots {#Prev}of different appetites! We're all just a bunch of animals here so {#Emph}yours {#Prev}are {#Emph}more {#Prev}than welcome to join the pack!" },
			},
			DionysusAboutRavenFamiliar01 =
			{
				PlayOnce = true,
				GameStateRequirements =
				{
					{
						Path = { "GameState", "EquippedFamiliar" },
						IsAny = { "RavenFamiliar" },
					},
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = PresetEventArgs.DionysusFeasting,

				{ Cue = "/VO/Dionysus_0187",
					Emote = "PortraitEmoteSurprise",
					PreLineThreadedFunctionArgs = { Name = "Dionysus_Surprise", WaitTime = 0.5, AngleNPCToHero = true, },
					Text = "{#Emph}Whoa {#Prev}who's the {#Emph}bird{#Prev}, and I don't mean {#Emph}you{#Prev}, Mel baby! That raven flew in here, all skittish-looking, like it's seen a ghost! Do ravens drink? Might take the edge off just a bit." },
				{ Cue = "/VO/MelinoeField_2974", UsePlayerSource = true,
					PreLineAnim = "MelTalkPensive01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "My raven Raki can become a little nervous around strangers... or just about anything, really. I don't think he cares for wine, although this atmosphere may do him good." },
				{ Cue = "/VO/Dionysus_0188",
					PreLineAnim = "Dionysus_Eager",
					Text = "Might do {#Emph}you {#Prev}some good too, you know. Your pets are welcome here, since we're all animals deep down, know what I mean?" },
			},
			DionysusAboutHoundFamiliar01 =
			{
				PlayOnce = true,
				GameStateRequirements =
				{
					{
						Path = { "GameState", "EquippedFamiliar" },
						IsAny = { "HoundFamiliar" },
					},
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = PresetEventArgs.DionysusFeasting,

				{ Cue = "/VO/Dionysus_0189",
					PreLineThreadedFunctionArgs = { Name = "Dionysus_Eager", WaitTime = 0.5, AngleNPCToHero = true, },
					Text = "Mel, baby, I {#Emph}insist {#Prev}you introduce me to your dog there {#Emph}right {#Prev}away! I've not seen such a {#Emph}gorgeous {#Prev}breed since last I traveled west! I used to travel all around, you know." },
				{ Cue = "/VO/MelinoeField_2975", UsePlayerSource = true,
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "Dionysus, please meet Hecuba, who's in my care for now, and always on her best behavior as you'll see. Your journeys must have been amazing... seeing the world..." },
				{ Cue = "/VO/Dionysus_0190",
					PreLineAnim = "Dionysus_Shrug",
					Text = "Oh that they were but now I'm here where it's amazing too! Things never stay the same for very long, got to enjoy them while they last. Nothing lasts forever! Except us!" },
			},
			DionysusAboutPolecatFamiliar01 =
			{
				PlayOnce = true,
				GameStateRequirements =
				{
					{
						Path = { "GameState", "EquippedFamiliar" },
						IsAny = { "PolecatFamiliar" },
					},
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = PresetEventArgs.DionysusFeasting,

				{ Cue = "/VO/Dionysus_0227",
					PreLineThreadedFunctionArgs = { Name = "Dionysus_Eager", WaitTime = 0.5, AngleNPCToHero = true, },
					Text = "Hey, it's that polecat, she's with you? Seen her pawing on the mountain here and there, just lying low, the same as me and everybody here! She got a name?" },

				{ Cue = "/VO/MelinoeField_4753", UsePlayerSource = true,
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Portrait = "Portrait_Mel_Proud_01",
					Text = "Oh yes, I'd like to introduce you to Gale, who is a rather independent sort and has been helping scout ahead a bit. I'm impressed you knew her for a polecat right away!" },

				{ Cue = "/VO/Dionysus_0228",
					PreLineAnim = "Dionysus_Shrug",
					Text = "Oh I know animals, Mel baby! Why, I'm an animal myself, all of us are! Though we'll try not to act like it with Gale. And don't worry about Maena here either, she doesn't bite! Hard." },
			},

			DionysusAboutLeopard01 =
			{
				PlayOnce = true,
				GameStateRequirements =
				{
					{
						PathTrue = { "GameState", "TextLinesRecord", "DionysusGift07" }
					},
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = PresetEventArgs.DionysusFeasting,

				{ Cue = "/VO/MelinoeField_4754", UsePlayerSource = true,
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "Quite an impressive cat beside you there. How did you manage to domesticate her? I thought such creatures tended to roam free." },
				{ Cue = "/VO/Dionysus_0231",
					Emote = "PortraitEmoteSurprise",
					PreLineAnim = "Dionysus_Surprise",
					Text = "{#Emph}Domesticate {#Prev}her, Mel baby, you ought to know that Maena here, she is as {#Emph}wild {#Prev}as they come! And believe me I have known a {#Emph}lot {#Prev}of leopards in my time!" },
			},

			DionysusAboutPanAspect01 =
			{
				PlayOnce = true,
				GameStateRequirements =
				{
					{
						PathTrue = { "CurrentRun", "Hero", "TraitDictionary", "DaggerHomingThrowAspect" },
					},
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = PresetEventArgs.DionysusFeasting,

				{ Cue = "/VO/Dionysus_0229",
					PreLineThreadedFunctionArgs = { Name = "Dionysus_Surprise", WaitTime = 0.5, AngleNPCToHero = true, },
					Text = "{#Emph}Whoa{#Prev}, watch with those knives, Mel baby, wouldn't want you accidentally sticking it to someone here! Though, {#Emph}wait wait wait{#Prev}, I've seen those two before..." },

				{ Cue = "/VO/MelinoeField_4475", UsePlayerSource = true,
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "Perhaps you know these blades from when they belonged to the nature god called Pan. Though I didn't steal them or anything! And I'll be careful." },

				{ Cue = "/VO/Dionysus_0230",
					PreLineAnim = "Dionysus_Eager",
					Emote = "PortraitEmoteSurprise",
					Text = "Oh, yeah, {#Emph}Paaan! {#Prev}I love Pan, he is {#Emph}wild{#Prev}, and he really gets {#Emph}around! {#Prev}Even once helped Dad out with his Typhon problem way back when. You tell him I said hey! Pan, not Dad." },
			},

			DionysusAboutAutomatons01 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				GameStateRequirements =
				{
					{
						PathTrue = { "GameState", "TextLinesRecord", "DionysusGift01" }
					},
					{
						PathTrue = { "CurrentRun", "RoomsEntered", "P_MiniBoss01" },
					},
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = PresetEventArgs.DionysusFeasting,

				{ Cue = "/VO/MelinoeField_2898", UsePlayerSource = true,
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "Have you run into any trouble with all the Automatons supposedly defending your domain? They attack me indiscriminately from your foes." },
				{ Cue = "/VO/Dionysus_0193",
					PreLineAnim = "Dionysus_Shrug",
					Text = "Maybe they think you're too uptight! Come on Mel baby, you don't need to worry about us! I've got my special ways, which not even the works of Lord Hephaestus can resist." },
				{ Cue = "/VO/MelinoeField_2899", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Intense_01",
					PreLineAnim = "MelTalkPensive01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "Your special ways... so then you know a means to bypass their threat detection. Can you show me how?" },
				{ Cue = "/VO/Dionysus_0194",
					PreLineAnim = "Dionysus_Laugh",
					Text = "Oh I can show you {#Emph}lots {#Prev}of things. Those clankers you're still on about, they're just like family! Sure, they fight sometimes, but they mean well. Just stay out of their way, yeah?" },
			},

			DionysusAboutSprings01 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				GameStateRequirements =
				{
					{
						PathTrue = { "GameState", "WorldUpgradesAdded", "WorldUpgradeBathHouse" }
					},
					{
						Path = { "GameState", "TextLinesRecord" },
						HasAny = { "DoraBathHouse01", "HecateBathHouse01", "OdysseusBathHouse01", "MorosBathHouse01", "NemesisBathHouse01", "ErisBathHouse01" }
					},
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = PresetEventArgs.DionysusFeasting,

				{ Cue = "/VO/Dionysus_0159",
					Emote = "PortraitEmoteCheerful",
					Text = "Sure you don't want to join us for a soak in the spring? It's cold out, yeah, but not in there! Forge of Hephaestus pumping in {#Emph}just {#Prev}the right amount of heat!" },
				{ Cue = "/VO/MelinoeField_2907", UsePlayerSource = true,
					PreLineAnim = "MelTalkPensive01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "We have a spring like this where I reside! It's very comfortable... except, I really shouldn't bathe right now. For a variety of reasons." },
				{ Cue = "/VO/Dionysus_0160",
					PreLineAnim = "Dionysus_Eager",
					Emote = "PortraitEmoteSparkly",
					Text = "And yet you keep on showing up! Come {#Emph}on {#Prev}Mel baby, you want in, no need to be shy, we're friends here, {#Emph}all {#Prev}of us! Some {#Emph}more {#Prev}than friends even! {#Emph}Heh! {#Prev}All in due time I guess?" },
			},

			DionysusAboutTravels01 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				GameStateRequirements =
				{
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = PresetEventArgs.DionysusFeasting,

				{ Cue = "/VO/MelinoeField_2908", UsePlayerSource = true,
					PreLineAnim = "MelTalkPensive01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "My headmistress was a wanderer like you. She taught me something of your journeys and travails. You've crossed the world... met many different beings! Yet you'd rather be here, like this?" },
				{ Cue = "/VO/Dionysus_0161",
					PreLineAnim = "Dionysus_Laugh",
					Emote = "PortraitEmoteCheerful",
					Text = "{#Emph}Haha, oh {#Prev}absolutely, {#Emph}yes! {#Prev}I mean just look around you, {#Emph}everybody's {#Prev}beautiful, the weather's perfect, and we're fully stocked! What, you think I'd rather be out for a stroll?" },
				{ Cue = "/VO/MelinoeField_2909", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Hesitant_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "No, I... merely thought a life of travel might have made your disposition somewhat different! I don't know... more introspective? More solitary, perhaps." },
				{ Cue = "/VO/Dionysus_0162",
					Emote = "PortraitEmoteSparkly",
					PreLineAnim = "Dionysus_Shrug",
					Text = "You're still young, baby! If you'd seen all I'd seen then you'd appreciate the finer things the same as me. No forcing it! You'll get there, maybe once all of this is over with!" },
			},

			DionysusAboutSatyrs01 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				GameStateRequirements =
				{
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = PresetEventArgs.DionysusFeasting,

				{ Cue = "/VO/MelinoeField_2910", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Hesitant_01",

					PreLineThreadedFunctionName = "PlayCharacterAnim",
					PreLineThreadedFunctionArgs = { Name = "MelTalkExplaining01", WaitTime = 1, UsePlayerSource = true },
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "I must admit I'm unaccustomed to seeing Satyrs that make no attempt to skewer me on sight. Old friends of yours?" },
				{ Cue = "/VO/Dionysus_0163",
					PreLineAnim = "Dionysus_Shrug",
					Emote = "PortraitEmoteSparkly",
					Text = "Oh yeah, all these old goats and I, we go {#Emph}way {#Prev}back! Proper Satyrs that love a proper good time. As for everything else, they just don't pay it any mind. And neither do I!" },
			},

			DionysusAboutMortals01 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				GameStateRequirements =
				{
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = PresetEventArgs.DionysusFeasting,

				{ Cue = "/VO/Dionysus_0174",
					PreLineThreadedFunctionArgs = { Name = "Dionysus_Shrug", WaitTime = 0.5, AngleNPCToHero = true, },
					Text = "You're not from around here, so how fare the mortals as of late? You've surely seen a few of them along your path. It's been a little while since I heard from them!" },
				{ Cue = "/VO/MelinoeField_2912", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Vulnerable_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "They've been better! Most probably are praying to our family for peace, since Chronos flung open the Underworld's gates, leaving the dead to roam the land." },
				{ Cue = "/VO/Dionysus_0175",
					PreLineAnim = "Dionysus_Laugh",
					Emote = "PortraitEmoteSparkly",
					Text = "Which means that mortals get to spend more time with long-lost relatives of theirs! Come on, stay {#Emph}positive{#Prev}, Mel baby! That's how mortals get by! It'll be all right!" },
			},

			DionysusAboutOlympians01 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				GameStateRequirements =
				{
					-- borderline
					{
						-- PathFalse = { "GameState", "ReachedTrueEnding" },
					},
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = PresetEventArgs.DionysusFeasting,

				{ Cue = "/VO/Dionysus_0147",
					PreLineThreadedFunctionArgs = { Name = "Dionysus_Shrug", WaitTime = 0.5, AngleNPCToHero = true, },
					Text = "Not told my Dad about this little gathering of ours, have you? Because we wouldn't want to have to pack it up and find some other secret spot. It's perfect here!" },
				{ Cue = "/VO/MelinoeField_2390", UsePlayerSource = true,
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "I think Lord Zeus has far more urgent matters to consider than your never-ending feast, which I daresay would be even better if the legions of Chronos weren't about. The rest of the Olympians don't even know that this is going on?" },
				{ Cue = "/VO/Dionysus_0148",
					PreLineAnim = "Dionysus_Laugh",
					Text = "Right you are, baby! For this is an {#Emph}exclusive {#Prev}gathering only for guests I {#Emph}know {#Prev}are going to be cool. Which can't explain how {#Emph}you {#Prev}keep stumbling upon it, but hey! Details, right?" },
			},

			DionysusAboutZagreus01 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				GameStateRequirements =
				{
					{
						PathFalse = { "GameState", "ReachedTrueEnding" },
					},
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = PresetEventArgs.DionysusFeasting,

				{ Cue = "/VO/Dionysus_0154",
					PreLineThreadedFunctionArgs = { Name = "Dionysus_Blessing", WaitTime = 0.5, AngleNPCToHero = true, },
					Text = "What did you say happened to Zag, everything good with him still, yeah? You ought to bring him next you come this way, oh he'd be {#Emph}into {#Prev}it!" },
				{ Cue = "/VO/MelinoeField_2398", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Vulnerable_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "I previously mentioned Chronos, our Titan grandfather who's relentlessly attacking this mountain, holds the members of my immediate family captive; Zagreus included. So he can't make it to the feast right now." },
				{ Cue = "/VO/Dionysus_0155",
					PreLineAnim = "Dionysus_Shrug",
					Text = "{#Emph}Ah {#Prev}that's too bad, though maybe later, yeah? I've always felt a bond with him, a real connection, so if you see the Zag man, let him know he's welcome to my feast here {#Emph}anytime!" },
			},
			DionysusAboutZagreus02 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				GameStateRequirements =
				{
					{
						PathFalse = { "GameState", "ReachedTrueEnding" },
					},
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = PresetEventArgs.DionysusFeasting,

				{ Cue = "/VO/MelinoeField_2399", UsePlayerSource = true,
					PreLineAnim = "MelTalkPensive01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "Sounds as though you and my brother Zagreus were fairly close. What was he like? Seeing as I have no real memory of him, since Chronos took him back when I was very small." },
				{ Cue = "/VO/Dionysus_0156",
					PreLineAnim = "Dionysus_Shrug",
					Text = "You know I haven't heard from him in quite a while, yeah? {#Emph}Erm{#Prev}, come to think of it, we never really talked too much, although I sent him lots of Boons! How is he anyway?" },
			},
			DionysusAboutZagreus03 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				GameStateRequirements =
				{
					{
						PathTrue = { "GameState", "ReachedTrueEnding" },
					},
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = PresetEventArgs.DionysusFeasting,

				{ Cue = "/VO/Dionysus_0262",
					PreLineAnim = "Dionysus_Shrug",
					Text = "How is the Zag man lately anyway, is everything all right with him? Stopped sending him my Boons a while back..." },
				{ Cue = "/VO/MelinoeField_4492", UsePlayerSource = true,
					PreLineAnim = "MelTalkPensive01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "Well now that Zagreus is freed from temporal imprisonment, along with my mother, father, and the House of Hades staff, I think he's doing very well! I'm certain he'd be pleased to hear from you." },
				{ Cue = "/VO/Dionysus_0263",
					PreLineAnim = "Dionysus_Greeting",
					Text = "Well that is a relief as I thought maybe I offended in some way! He could have gone and cut me off, but he did not." },
			},
			-- alt below
			DionysusAboutCirce01 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				GameStateRequirements =
				{
					{
						PathFalse = { "GameState", "TextLinesRecord", "DionysusAboutCirce01_B" }
					},
					{
						PathTrue = { "CurrentRun", "Hero", "TraitDictionary", "CirceEnlargeTrait" },
					},
					{
						Path = { "GameState", "UseRecord", "NPC_Dionysus_01" },
						Comparison = ">=",
						Value = 3,
					},
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = PresetEventArgs.DionysusFeasting,

				{ Cue = "/VO/Dionysus_0180",
					Emote = "PortraitEmoteSurprise",
					PreLineThreadedFunctionArgs = { Name = "Dionysus_Surprise", WaitTime = 0.5, AngleNPCToHero = true, },
					Text = "Hey you look, {#Emph}ah{#Prev}, I mean, {#Emph}wow. {#Prev}Did you grow bigger, and I mean that purely as a compliment... or did I grow smaller, or... {#Emph}eugh{#Prev}, my head..." },
				{ Cue = "/VO/MelinoeField_2971", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Hesitant_01",
					PreLineAnim = "MelTalkPensive01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "Oh, you mean... my unusually greater height! It's due to a fleeting bit of magick from my companion, the enchantress called Circe. So the effect is rather noticeable, then?" },
				{ Cue = "/VO/Dionysus_0181",
					PreLineAnim = "Dionysus_Eager",
					Text = "I mean, {#Emph}yeah! {#Prev}Circe, huh, I know that name! Sounds like she knows a trick or two! Maybe she'll get an invite to the next one of {#Emph}these!" },
			},
			DionysusAboutCirce01_B =
			{
				PlayOnce = true,
				UseableOffSource = true,
				GameStateRequirements =
				{
					{
						PathFalse = { "GameState", "TextLinesRecord", "DionysusAboutCirce01" }
					},
					{
						PathTrue = { "CurrentRun", "Hero", "TraitDictionary", "CirceShrinkTrait" },
					},
					{
						Path = { "GameState", "UseRecord", "NPC_Dionysus_01" },
						Comparison = ">=",
						Value = 3,
					},
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = PresetEventArgs.DionysusFeasting,

				{ Cue = "/VO/Dionysus_0182",
					Emote = "PortraitEmoteSurprise",
					PreLineThreadedFunctionArgs = { Name = "Dionysus_Surprise", WaitTime = 0.5, AngleNPCToHero = true, },
					Text = "Hey you look, {#Emph}erm... {#Prev}did you shrink down or something, or... did I grow bigger all of a sudden, or... {#Emph}oh{#Prev}, my head..." },
				{ Cue = "/VO/MelinoeField_3074", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Hesitant_01",
					PreLineAnim = "MelTalkPensive01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "Oh, right... a reminder about my temporarily reduced stature. It's due to a bit of magick from my companion, the enchantress Circe. So the effect is rather noticeable, then?" },
				{ Cue = "/VO/Dionysus_0181",
					PreLineAnim = "Dionysus_Eager",
					Text = "I mean, {#Emph}yeah! {#Prev}Circe, huh, I know that name! Sounds like she knows a trick or two! Maybe she'll get an invite to the next one of {#Emph}these!" },
			},

			DionysusAboutCirce02 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				GameStateRequirements =
				{
					{
						PathTrue = { "CurrentRun", "Hero", "TraitDictionary", "CirceEnlargeTrait" },
					},
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = PresetEventArgs.DionysusFeasting,

				{ Cue = "/VO/Dionysus_0246",
					Emote = "PortraitEmoteSurprise",
					PreLineThreadedFunctionArgs = { Name = "Dionysus_Surprise", WaitTime = 0.5, AngleNPCToHero = true, },
					Text = "Hey look at you, Mel baby, you are {#Emph}huge! {#Prev}I {#Emph}like {#Prev}it! Once knew some Amazons about your size, they were a {#Emph}real {#Prev}handful, if you know what I mean!" },
				{ Cue = "/VO/MelinoeField_4755", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Hesitant_01",
					PreLineAnim = "MelTalkBrooding01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "I think I do know, yes, now that you've helpfully reminded me how I have temporarily increased in size. It offers me a tactical advantage for the night." },
				{ Cue = "/VO/Dionysus_0247",
					PreLineAnim = "Dionysus_Eager",
					Text = "Oh I am positively sure it does! And if my Amazonian companions were here they would wholeheartedly agree. And probably demand you wrestle them." },
			},
			DionysusAboutCirce03 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				GameStateRequirements =
				{
					{
						PathTrue = { "CurrentRun", "Hero", "TraitDictionary", "CirceShrinkTrait" },
					},
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = PresetEventArgs.DionysusFeasting,

				{ Cue = "/VO/Dionysus_0248",
					Emote = "PortraitEmoteSurprise",
					PreLineThreadedFunctionArgs = { Name = "Dionysus_Surprise", WaitTime = 0.5, AngleNPCToHero = true, },
					Text = "{#Emph}Aw{#Prev}, look how {#Emph}little {#Prev}you are, baby! {#Emph}Ahem {#Prev}that's sounding a bit rude, when I say {#Emph}baby {#Prev}you know I don't mean it like {#Emph}that!" },
				{ Cue = "/VO/MelinoeField_4756", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Hesitant_01",
					PreLineAnim = "MelTalkPensive01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "That's quite all right. I know my reduced stature may be off-putting. All part of the advantage it affords." },
				{ Cue = "/VO/Dionysus_0249",
					PreLineAnim = "Dionysus_Eager",
					Text = "Well I like 'em in every shape and size, it isn't all the same, it's all {#Emph}different! {#Prev}Small? Cool. Bigger? {#Emph}Great! {#Prev}I'm all about variety!" },
			},

			DionysusAboutPrometheus01 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				GameStateRequirements =
				{
					{
						PathFalse = { "GameState", "ReachedTrueEnding" },
					},
					{
						PathFalse = { "GameState", "TextLinesRecord", "DionysusAboutPrometheus01_B" },
					},
					{
						SumPrevRuns = 3,
						-- IgnoreCurrentRun = true,
						Path = { "RoomsEntered", "P_Boss01" },
						Comparison = ">=",
						Value = 1,
					},
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = PresetEventArgs.DionysusFeasting,

				{ Cue = "/VO/MelinoeField_2902", UsePlayerSource = true,
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "Have you had any run-ins with Prometheus? Since Chronos wouldn't dare show his face on this mountain, he must have sent this lackey of his to keep all of Olympus occupied." },
				{ Cue = "/VO/Dionysus_0164",
					PreLineWait = 0.1,
					Emote = "PortraitEmoteSurprise",
					PreLineAnim = "Dionysus_Surprise",
					Text = "{#Emph}Prometheus{#Prev}, he's {#Emph}back?! {#Prev}I must be out of the loop. Thought he was still strapped to some mountainside, getting his innards gnawed at by an Eagle, something nasty of the sort!" },
				{ Cue = "/VO/MelinoeField_2903", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Hesitant_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "That did supposedly occur. But he is definitely back, personally leading the vanguard trying to tear Olympus apart. If he prevails... no more feasting." },
				{ Cue = "/VO/Dionysus_0165",
					PreLineAnim = "Dionysus_Laugh",
					Emote = "PortraitEmoteCheerful",
					Text = "{#Emph}Hahahaha{#Prev}, come on, baby, it can't be {#Emph}all {#Prev}that bad! What's he going to do, cook our food with the flame he took from Dad? Tell you what, next time you see him, tell him to stop by!" },
			},
			DionysusAboutPrometheus01_B =
			{
				PlayOnce = true,
				UseableOffSource = true,
				GameStateRequirements =
				{
					{
						PathTrue = { "GameState", "ReachedTrueEnding" },
					},
					{
						PathFalse = { "GameState", "TextLinesRecord", "DionysusAboutPrometheus01" },
					},
					{
						SumPrevRuns = 3,
						-- IgnoreCurrentRun = true,
						Path = { "RoomsEntered", "P_Boss01" },
						Comparison = ">=",
						Value = 1,
					},
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = PresetEventArgs.DionysusFeasting,

				{ Cue = "/VO/MelinoeField_5278", UsePlayerSource = true,
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "Have you had any run-ins with the Titan Prometheus? Chronos was in league with him. He's been causing quite a commotion, all told." },
				{ Cue = "/VO/Dionysus_0164",
					PreLineWait = 0.1,
					Emote = "PortraitEmoteSurprise",
					PreLineAnim = "Dionysus_Surprise",
					Text = "{#Emph}Prometheus{#Prev}, he's {#Emph}back?! {#Prev}I must be out of the loop. Thought he was still strapped to some mountainside, getting his innards gnawed at by an Eagle, something nasty of the sort!" },
				{ Cue = "/VO/MelinoeField_5279", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Hesitant_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "That did supposedly occur, but he is definitely back, personally leading the vanguard that was trying to tear Olympus apart. And he's still out there, sowing dissent." },
				{ Cue = "/VO/Dionysus_0165",
					PreLineAnim = "Dionysus_Laugh",
					Emote = "PortraitEmoteCheerful",
					Text = "{#Emph}Hahahaha{#Prev}, come on, baby, it can't be {#Emph}all {#Prev}that bad! What's he going to do, cook our food with the flame he took from Dad? Tell you what, next time you see him, tell him to stop by!" },
			},

			DionysusAboutPrometheus02 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				GameStateRequirements =
				{
					{
						Path = { "GameState", "TextLinesRecord" },
						HasAny = { "DionysusAboutPrometheus01", "DionysusAboutPrometheus01_B" }
					},
					{
						Path = { "GameState", "TextLinesRecord" },
						HasAll = { "DionysusGift03" }
					},
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = PresetEventArgs.DionysusFeasting,

				{ Cue = "/VO/Dionysus_0166",
					Text = "So did you have a chat with old Prometheus on my behalf or what? I'd go on over and invite him here myself, but I'm the host, {#Emph}heh! {#Prev}It wouldn't do for me to slip away, would it?" },
				{ Cue = "/VO/MelinoeField_2904", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Vulnerable_01",
					PreLineAnim = "MelTalkBrooding01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "Of all the things for you to vividly recall. You truly wanted me to direct one of our most bitter foes {#Emph}here{#Prev}, to a feast not even your closest family members know about?" },
				{ Cue = "/VO/Dionysus_0167",
					PreLineAnim = "Dionysus_Shrug",
					Text = "I mean... {#Emph}yeah, heh! {#Prev}We gods can be so stubborn and stuck up, waving our weapons at each other when we ought to wave an olive branch instead! Now you go tell that hothead that we're saving him a spot!" },
			},
			DionysusAboutPrometheus03 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				GameStateRequirements =
				{
					{
						PathTrue = { "GameState", "TextLinesRecord", "PrometheusAboutDionysus01" }
					},
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = PresetEventArgs.DionysusFeasting,

				{ Cue = "/VO/MelinoeField_2905", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Vulnerable_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "I felt quite foolish, but did ask Prometheus on your behalf if he'd attend this feast. He already knew what I was going to say, being the Titan of Foresight and all. He sensed no ill motive... and took it for a fiendish trap for that very reason." },
				{ Cue = "/VO/Dionysus_0168",
					Text = "And he's supposed to be one of the wiser ones? What made you all so {#Emph}cynical{#Prev}, baby? You don't trust anyone or any{#Emph}thing! {#Prev}No wonder everything is all screwed up out there!" },
				{ Cue = "/VO/MelinoeField_2906", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Intense_01",
					PreLineAnim = "MelTalkFlustered01", PreLineAnimTarget = "Hero",
					Text = "So you {#Emph}do {#Prev}know things are dire! I thought you weren't paying any attention, burying your head in the sand and tuning out whatever you've no wish to hear." },
				{ Cue = "/VO/Dionysus_0169",
					PreLineAnim = "Dionysus_Shrug",
					Text = "You got it half right. See, I don't like to worry about the things I can't control! {#Emph}Wine{#Prev}, I can control. The quality of this feast, I {#Emph}can {#Prev}control! But all the in-fighting? {#Emph}Heh. {#Prev}Plenty of other gods who specialize in {#Emph}that." },
			},

			DionysusAboutHeracles01 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				GameStateRequirements =
				{
					{
						PathTrue = { "GameState", "ReachedTrueEnding" },
					},
					{
						Path = { "GameState", "TextLinesRecord" },
						HasAll = { "DionysusGift05", "HeraclesGift05" },
					},
					{
						Path = { "GameState", "EncountersOccurredCache" },
						HasAny = { "HeraclesCombatP", "HeraclesCombatP2" },
					},
					{
						SumPrevRuns = 3,
						Path = { "EncountersOccurredCache" },
						TableValuesToCount = { "HeraclesCombatIntro", "HeraclesCombatN", "HeraclesCombatN2", "HeraclesCombatO", "HeraclesCombatO2", "HeraclesCombatP", "HeraclesCombatP2" },
						Comparison = ">=",
						Value = 1,
					},
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = PresetEventArgs.DionysusFeasting,

				{ Cue = "/VO/MelinoeField_3682", UsePlayerSource = true,
					PreLineAnim = "MelTalkPensive01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "Does mighty Heracles ever stop by? He seems to do much of the heavy lifting out on the front lines and probably could use the break... though might bring down the mood." },

				{ Cue = "/VO/Dionysus_0191",
					PreLineAnim = "Dionysus_Greeting",
					Text = "Oh believe me I have invited him don't know {#Emph}how {#Prev}many times but he won't {#Emph}budge{#Prev}, big man like that, I mean it figures, yeah? He's all obsessed with {#Emph}laboring away{#Prev}, won't cut loose even for a bit! Though maybe he'll listen to you..." },

				{ Cue = "/VO/MelinoeField_3683", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Hesitant_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "What, to join you for a drink and a splash in the hot springs? Why would Heracles possibly listen to {#Emph}me {#Prev}if your own powers of persuasion haven't been sufficient?" },

				{ Cue = "/VO/Dionysus_0192",
					PreLineAnim = "Dionysus_Eager",
					Emote = "PortraitEmoteCheerful",
					Text = "Cause you're a {#Emph}girl{#Prev}, baby! You've got the voice, and the thing you do with your hair, the whole {#Emph}I'm-so-innocent {#Prev}act, it's enough to drive somebody wild! So {#Emph}ask {#Prev}him, yeah?" },
			},
			DionysusAboutHeracles02 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				GameStateRequirements =
				{
					{
						FunctionName = "RequiredAlive",
						FunctionArgs = { Units = { "NPC_Heracles_01", }, Alive = true },
					},
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = PresetEventArgs.DionysusFeasting,

				{ Cue = "/VO/Dionysus_0254",
					PreLineAnim = "Dionysus_Eager",
					Text = "Old Heracles decided to stop by, you see him there?! He's like a big old ox! Hop in the bath with him, go on, I want to see you try! Unless you did already and I missed it, {#Emph}eugh..." },
			},

			DionysusAboutTyphon01 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				GameStateRequirements =
				{
					{
						PathTrue = { "GameState", "RoomsEntered", "Q_Boss01" }
					},
					{
						PathFalse = { "GameState", "TyphonDefeatedWithStormStop" },
					},
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = PresetEventArgs.DionysusFeasting,

				{ Cue = "/VO/MelinoeField_2976", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Hesitant_01",
					PreLineAnim = "MelTalkPensive01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "Have you any idea why this mountain has been shaking ceaselessly, doubtless to the occasional dismay of your honored guests?" },
				{ Cue = "/VO/Dionysus_0178",
					PreLineAnim = "Dionysus_Eager",
					Text = "Yes I do! Sometimes the feasting gets a little rowdy, if you know what I mean, with all the dancing and whatnot! Uncle Poseidon's not the {#Emph}only {#Prev}Earth-Shaker on Olympus!" },
				{ Cue = "/VO/MelinoeField_2977", UsePlayerSource = true,
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "No. {#Emph}Typhon {#Prev}has awakened! The Father of All Monsters now threatens your own father's palace. You can ignore Chronos somehow, fine. Prometheus, perhaps. But not this." },
				{ Cue = "/VO/Dionysus_0179",
					Emote = "PortraitEmoteSurprise",
					PreLineAnim = "Dionysus_Surprise",
					Text = "{#Emph}Oh no! Typhon's out there, come to ruin everything! Whatever will we do?! Hahaha{#Prev}, see that, baby? Nobody {#Emph}cares! {#Prev}Whatever happens, happens! And we're gonna feast until it does, no matter what! Nice try with that one, though." },
			},

			DionysusAboutApollo01 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				GameStateRequirements =
				{
					{
						Path = { "CurrentRun", "UseRecord", "ApolloUpgrade" },
						Comparison = ">=",
						Value = 2,
					},
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = PresetEventArgs.DionysusFeasting,

				{ Cue = "/VO/Dionysus_0250",
					Text = "Hey you didn't tell Apollo anything about what's going on in here, did you? Because I, {#Emph}erm{#Prev}, I have not sent him an invite yet. I know he's busy wanting to be left alone!" },
				{ Cue = "/VO/MelinoeField_4757", UsePlayerSource = true,
					PreLineAnim = "MelTalkPensive01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "Lord Apollo has been gracious to support me with his Boons, but no, I've not informed him or any of your relatives about your feasting. That's your business not mine." },
				{ Cue = "/VO/Dionysus_0251",
					PreLineAnim = "Dionysus_Eager",
					Text = "{#Emph}Whew{#Prev}, cheers! He likes to keep things squeaky clean, you know, but I prefer it any other way! Something about you made me think of him but probably I'm just out of my mind!" },
			},

			DionysusAboutTimePassing01 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				GameStateRequirements =
				{
					{
						SumPrevRuns = 6,
						IgnoreCurrentRun = true,
						Path = { "RoomsEntered", "P_Story01" },
						Comparison = "<=",
						Value = 0,
					},
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = PresetEventArgs.DionysusFeasting,

				{ Cue = "/VO/Dionysus_0252",
					PreLineThreadedFunctionName = "PlayEmoteAnimFromSource", PreLineThreadedFunctionArgs = { Emote = "PortraitEmoteSurprise", DoShake = true, WaitTime = 2.5 },
					Text = "Now then what sort of nymph are {#Emph}you? {#Prev}Oh wait wait wait, Mel baby, I know {#Emph}you{#Prev}, just how long has it been?!" },
				{ Cue = "/VO/MelinoeField_4758", UsePlayerSource = true,
					PreLineAnim = "MelTalkPensive01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "Certainly it's been some nights, to have induced a lapse of memory. How have you fared, along with all your guests?" },
				{ Cue = "/VO/Dionysus_0253",
					PreLineAnim = "Dionysus_Shrug",
					Text = "Oh we've been good as grapes here, yeah? Each night's a journey through the {#Emph}mind! {#Prev}Here, think on one of {#Emph}these!" },
			},

			DionysusAboutAmbrosia01 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				GameStateRequirements =
				{
					{
						PathTrue = { "GameState", "TextLinesRecord", "DionysusGift06" }
					},
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = PresetEventArgs.DionysusFeasting,

				{ Cue = "/VO/Dionysus_0237",
					PreLineThreadedFunctionArgs = { Name = "Dionysus_Eager", WaitTime = 0.5, AngleNPCToHero = true, },

					Text = "Say, any leads on finding us a box of good bottles of Ambrosia yet or what? We're down to our {#Emph}emergency ration {#Prev}here, making it {#Emph}last. {#Prev}I'm trying to keep everybody {#Emph}calm!" },
				{ Cue = "/VO/MelinoeField_4480", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Hesitant_01",
					PreLineAnim = "MelTalkPensive01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "I've not encountered such a box, and am uncertain how to best distinguish a good bottle from another. I'd no idea that Ambrosia could go bad..." },
				{ Cue = "/VO/Dionysus_0238",
					PreLineAnim = "Dionysus_Surprise",
					Text = "Well then, I'll let you in on a little secret, baby...! Just as soon as I remember what it was... {#Emph}haha{#Prev}, all this shaking lately, I can't even {#Emph}think! Erm{#Prev}, you want one of {#Emph}these?" },
			},
			DionysusAboutAmbrosia02 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				GameStateRequirements =
				{
					{
						Path = { "GameState", "LastBossHealthBarRecord", "TyphonHead" },
						Comparison = "<=",
						Value = 0,
					},
					{
						PathTrue = { "GameState", "TextLinesRecord", "DionysusAboutAmbrosia01" },
					},
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = PresetEventArgs.DionysusFeasting,

				{ Cue = "/VO/Dionysus_0239",
					PreLineThreadedFunctionArgs = { Name = "Dionysus_Eager", WaitTime = 0.5, AngleNPCToHero = true, },

					Text = "Oh hey! The mountain finally stopped shaking for a bit and I remembered what I wanted you to know! A {#Emph}box of bottles of Ambrosia{#Prev}, that's just four of them at once. Technical term!" },

				{ Cue = "/VO/MelinoeField_4481", UsePlayerSource = true,
					PreLineWait = 0.35,
					Portrait = "Portrait_Mel_Hesitant_01",
					PreLineAnim = "MelTalkPensive01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "So you don't just want {#Emph}one {#Prev}bottle of Ambrosia but {#Emph}four{#Prev}, and you don't want me to, say, give one bottle at a time..." },

				{ Cue = "/VO/Dionysus_0240",
					PreLineAnim = "Dionysus_Greeting",

					-- heart unlock
					PostLineThreadedFunctionName = "RelationshipAdvancedPresentation",
					PostLineThreadedFunctionArgs = { Delay = 0.25 },

					Text = "Come on look, how many {#Emph}guests {#Prev}I have... no single bottle's going to do! But now you know what we need to survive. I'll be counting on you, Mel baby!" },
			},
			DionysusAboutAmbrosia03 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				GameStateRequirements =
				{
					{
						PathTrue = { "GameState", "TextLinesRecord", "DionysusGift07" }
					},
					{
						SumPrevRuns = 8,
						Path = { "TextLinesRecord", "DionysusGift07" },
						CountPathTrue = true,
						Comparison = ">=",
						Value = 1,
					},
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = PresetEventArgs.DionysusFeasting,

				{ Cue = "/VO/Dionysus_0244",
					PreLineThreadedFunctionArgs = { Name = "Dionysus_Laugh", WaitTime = 0.5, AngleNPCToHero = true, },
					PreLineFunctionName = "OverwriteSelf",
					PreLineFunctionArgs = { BoonRaritiesOverride = { Epic = 1 } },

					Text = "Oh you should have seen it, baby, the Ambrosia that you brought, it kicked things up like you would not {#Emph}believe!" },

				{ Cue = "/VO/MelinoeField_4485", UsePlayerSource = true,
					PreLineWait = 0.35,
					Portrait = "Portrait_Mel_Hesitant_01",
					PreLineAnim = "MelTalkPensive01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "I can imagine! Though things don't seem that different than before. Have you depleted the entire box already?" },

				{ Cue = "/VO/Dionysus_0245",
					Emote = "PortraitEmoteSurprise",
					PreLineAnim = "Dionysus_Surprise",
					Text = "{#Emph}No! {#Prev}I mean... not really! I mean, maybe. But I have got a lead on a reserve so vast that we won't need donations anymore. And for {#Emph}you{#Prev}, I've got a little something extra {#Emph}here." },
			},

			DionysusPostTrueEnding01 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				GameStateRequirements =
				{
					{
						PathTrue = { "GameState", "ReachedTrueEnding" },
					},
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = PresetEventArgs.DionysusFeasting,

				{ Cue = "/VO/MelinoeField_4486", UsePlayerSource = true,
					PreLineAnim = "MelTalkPensive01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Portrait = "Portrait_Mel_Proud_01",
					Text = "I think you should be able to come out now, as the greatest threats facing your mountain are gone for the most part. Well, granted there are vicious Satyrs out there still." },

				{ Cue = "/VO/Dionysus_0255",
					Emote = "PortraitEmoteSurprise",
					PreLineAnim = "Dionysus_Surprise",
					Text = "Hey, easy with the Satyr talk, it really isn't cool! You think my Satyr friends here ever talk that way about us gods? And what do you mean, {#Emph}greatest threats?" },

				{ Cue = "/VO/MelinoeField_4487", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Vulnerable_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "Typhon, the Father of All Monsters; Chronos, the Titan of Time; the former utterly destroyed, the latter pacified. The war is {#Emph}over! {#Prev}Olympus is secure!" },

				{ Cue = "/VO/Dionysus_0256",
					PreLineAnim = "Dionysus_Eager",
					Emote = "PortraitEmoteSurprise",

					PreLineThreadedFunctionName = "PlayEmoteAnimFromSource", PreLineThreadedFunctionArgs = { Emote = "PortraitEmoteFiredUp", DoShake = true, WaitTime = 9.45 },

					Text = "The war is {#Emph}over?! {#Prev}Hear that everybody, the war is {#Emph}over! {#Prev}If that's not cause for celebration, I don't know what is, so grab a {#Emph}drink{#Prev}, take a {#Emph}dip{#Prev}, shake your {#Emph}hips{#Prev}, you know it, {#Emph}yeah!" },

				EndVoiceLines =
				{
					{
						PreLineWait = 0.62,
						UsePlayerSource = true,
						{ Cue = "/VO/MelinoeField_4488", Text = "You won't be leaving here will you." },
					},
					{
						PreLineWait = 0.35,
						ObjectType = "NPC_Dionysus_01",
						PreLineAnim = "Dionysus_Greeting",
						{ Cue = "/VO/Dionysus_0257", Text = "No way, baby!" },
					},
				},
			},
			DionysusPostTrueEnding02 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				GameStateRequirements =
				{
					{
						PathTrue = { "GameState", "ReachedTrueEnding" },
					},
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = PresetEventArgs.DionysusFeasting,

				{ Cue = "/VO/MelinoeField_4489", UsePlayerSource = true,
					PreLineAnim = "MelTalkPensive01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Portrait = "Portrait_Mel_Vulnerable_01",
					Text = "Dionysus, won't you at least notify your family members that you're well? Some of them must be concerned for you." },

				{ Cue = "/VO/Dionysus_0258",
					PreLineAnim = "Dionysus_Eager",
					Text = "I'm sure I'll get around to it one of these nights, baby, but we're still celebrating your success, {#Emph}you won the war!" },

				{ Cue = "/VO/MelinoeField_4490", UsePlayerSource = true,
					PreLineAnim = "MelTalkBrooding01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "I did not personally win the war. We stood together as a family and prevailed. I merely did my part." },

				{ Cue = "/VO/Dionysus_0259",
					PreLineAnim = "Dionysus_Laugh",

					PreLineThreadedFunctionName = "PlayEmoteAnimFromSource", PreLineThreadedFunctionArgs = { Emote = "PortraitEmoteCheerful", WaitTime = 7 },

					Text = "And I am doing {#Emph}my {#Prev}part right now! The others know I'm going to be fine, I just need a little space what with all the excitement... a little space with all these {#Emph}fabulous guests!" },
			},

			DionysusPostTrueEnding03 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				GameStateRequirements =
				{
					{
						PathTrue = { "GameState", "ReachedTrueEnding" },
					},
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = PresetEventArgs.DionysusFeasting,

				{ Cue = "/VO/Dionysus_0260",
					PreLineAnim = "Dionysus_Surprise",
					Emote = "PortraitEmoteSurprise",
					Text = "Hey, wait wait wait, hold on, if you're not jesting that whatever war was on is over, then how come you keep showing up to get these battle-ready Boons from me?" },

				{ Cue = "/VO/MelinoeField_4491", UsePlayerSource = true,
					PreLineWait = 0.35,
					Portrait = "Portrait_Mel_Hesitant_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "...Suffice it to say there are still battles to be won. But I'll spare you the details, for the sake of your sanity and mine." },

				{ Cue = "/VO/Dionysus_0261",
					Emote = "PortraitEmoteCheerful",
					PreLineAnim = "Dionysus_Shrug",
					Text = "Well cheers I've not much sanity to spare! Sounds like you'll be around, you've got the special pass, so stop by anytime!" },
			},

			DionysusPostEpilogue01 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				GameStateRequirements =
				{
					{
						PathTrue = { "GameState", "ReachedTrueEnding" },
					},
					{
						FunctionName = "RequireRunsSinceTextLines",
						FunctionArgs = { TextLines = { "FatesEpilogue01" }, Min = 2 },
					},
					NamedRequirements = { "ReachedEpilogue" },
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = PresetEventArgs.DionysusFeasting,

				{ Cue = "/VO/Dionysus_0264",
					PreLineAnim = "Dionysus_Surprise",
					Text = "Been hearing wild tales from outside, can you back any of it up, baby? Something about the {#Emph}dawning of another age?" },

				{ Cue = "/VO/MelinoeField_4493", UsePlayerSource = true,
					PreLineAnim = "MelTalkPensive01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "A recent prophecy from the Three Fates. They have foreseen a distant time when mortals won't be as beholden to the gods... perhaps that shall be cause for a real feast." },

				{ Cue = "/VO/Dionysus_0265",
					PreLineAnim = "Dionysus_Laugh",
					Emote = "PortraitEmoteSurprise",
					Text = "{#Emph}You're {#Prev}thinking maybe all the other gods will end up feasting {#Emph}here! {#Prev}Then we'll have better things to do than pushing mortalkind around. And it'll be a {#Emph}prophecy fulfilled!" },
			},

			DionysusAboutSayingLittle01 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				GameStateRequirements =
				{
					{
						PathTrue = { "GameState", "ReachedTrueEnding" },
					},
					{
						PathTrue = { "GameState", "TextLinesRecord", "DionysusGift07" }
					},
					NamedRequirements = { "ReachedEpilogue" },
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = PresetEventArgs.DionysusFeasting,

				{ Cue = "/VO/Dionysus_0266",
					Text = "Mel baby, we're past the small-talk stage of our relationship, so we should take the next big step: {#Emph}smaller talk!" },

				{ Cue = "/VO/MelinoeField_4494", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Hesitant_01",
					PreLineAnim = "MelTalkPensive01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "And what exactly is the difference between small and smaller talk? Do we lower our voices?" },

				{ Cue = "/VO/Dionysus_0267",
					PreLineAnim = "Dionysus_Eager",
					Text = "Even better, we will hardly talk at all! The bond we share speaks volumes anyway! It's {#Emph}great{#Prev}, just try it, ready? {#Emph}Go!" },
			},

			-- Repeatable
			DionysusChat01 =
			{
				UseableOffSource = true,
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = PresetEventArgs.DionysusFeasting,

				{ Cue = "/VO/Dionysus_0006",
					PreLineThreadedFunctionArgs = { Name = "Dionysus_Eager", WaitTime = 0.5, AngleNPCToHero = true, },
					Text = "Things are happening all over but this is the only happening place on {#Emph}this {#Prev}mountain, baby." },
			},
			DionysusChat02 =
			{
				UseableOffSource = true,
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = PresetEventArgs.DionysusFeasting,

				{ Cue = "/VO/Dionysus_0007",
					PreLineThreadedFunctionArgs = { Name = "Dionysus_Eager", WaitTime = 0.5, AngleNPCToHero = true, },
					Text = "Just one drink isn't going to hurt! It's going to do the {#Emph}opposite{#Prev}, you'll see!" },
			},
			DionysusChat03 =
			{
				UseableOffSource = true,
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = PresetEventArgs.DionysusFeasting,

				{ Cue = "/VO/Dionysus_0008",
					PreLineThreadedFunctionArgs = { Name = "Dionysus_Shrug", WaitTime = 0.5, AngleNPCToHero = true, },
					Text = "Can't stay and hang out, you got places to go, people to see, I get it, baby!" },
			},
			DionysusChat04 =
			{
				UseableOffSource = true,
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = PresetEventArgs.DionysusFeasting,

				{ Cue = "/VO/Dionysus_0009",
					Emote = "PortraitEmoteCheerful",
					PreLineThreadedFunctionArgs = { Name = "Dionysus_Laugh", WaitTime = 0.5, AngleNPCToHero = true, },
					Text = "You look like you're having a night! And wouldn't you know it, so am {#Emph}I!" },
			},
			DionysusChat05 =
			{
				UseableOffSource = true,
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = PresetEventArgs.DionysusFeasting,

				{ Cue = "/VO/Dionysus_0010",
					PreLineThreadedFunctionArgs = { Name = "Dionysus_Laugh", WaitTime = 0.5, AngleNPCToHero = true, },
					Text = "Been going for a while here, baby, and we plan to {#Emph}keep {#Prev}going till all this is over!" },
			},
			DionysusChat06 =
			{
				UseableOffSource = true,
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = PresetEventArgs.DionysusFeasting,

				{ Cue = "/VO/Dionysus_0011",
					Emote = "PortraitEmoteCheerful",
					PreLineThreadedFunctionArgs = { Name = "Dionysus_Eager", WaitTime = 0.5, AngleNPCToHero = true, },
					Text = "Come on now, relax and have a drink, {#Emph}mingle {#Prev}a bit, this is a {#Emph}feast{#Prev}, you know!" },
			},
			DionysusChat07 =
			{
				UseableOffSource = true,
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = PresetEventArgs.DionysusFeasting,

				{ Cue = "/VO/Dionysus_0012",
					Text = "Remember, don't go telling Dad about this little gathering of ours, all right?" },
			},
			DionysusChat08 =
			{
				UseableOffSource = true,
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = PresetEventArgs.DionysusFeasting,

				{ Cue = "/VO/Dionysus_0013",
					Emote = "PortraitEmoteCheerful",
					PreLineThreadedFunctionArgs = { Name = "Dionysus_Shrug", WaitTime = 0.5, AngleNPCToHero = true, },
					Text = "You're always welcome here but not your worries, baby, you leave those behind!" },
			},
			DionysusChat09 =
			{
				UseableOffSource = true,
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = PresetEventArgs.DionysusFeasting,

				{ Cue = "/VO/Dionysus_0014",
					Emote = "PortraitEmoteCheerful",
					PreLineThreadedFunctionArgs = { Name = "Dionysus_Eager", WaitTime = 0.5, AngleNPCToHero = true, },
					Text = "Hey, pull yourself together, baby, we're just getting started!" },
			},
			DionysusChat10 =
			{
				UseableOffSource = true,
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = PresetEventArgs.DionysusFeasting,

				{ Cue = "/VO/Dionysus_0015",
					Emote = "PortraitEmoteCheerful",
					PreLineThreadedFunctionArgs = { Name = "Dionysus_Eager", WaitTime = 0.5, AngleNPCToHero = true, },
					Text = "Sure you don't want to take a quick dip in the spring? It'll warm you right up!" },
			},
			DionysusChat11 =
			{
				UseableOffSource = true,
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = PresetEventArgs.DionysusFeasting,

				{ Cue = "/VO/Dionysus_0016",
					PreLineThreadedFunctionArgs = { Name = "Dionysus_Shrug", WaitTime = 0.5, AngleNPCToHero = true, },
					Text = "This mountain isn't going anywhere, and neither are we!" },
			},
			DionysusChat12 =
			{
				UseableOffSource = true,
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = PresetEventArgs.DionysusFeasting,

				{ Cue = "/VO/Dionysus_0017",
					PreLineThreadedFunctionArgs = { Name = "Dionysus_Shrug", WaitTime = 0.5, AngleNPCToHero = true, },
					Text = "Come all this way and can't even hang out, that's just not right, baby!" },
			},
			DionysusChat13 =
			{
				UseableOffSource = true,
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = PresetEventArgs.DionysusFeasting,

				{ Cue = "/VO/Dionysus_0018",
					PreLineThreadedFunctionArgs = { Name = "Dionysus_Laugh", WaitTime = 0.5, AngleNPCToHero = true, },
					Text = "If you're sick of all the fighting, I've got {#Emph}just {#Prev}the thing for you!" },
			},
			DionysusChat14 =
			{
				UseableOffSource = true,
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = PresetEventArgs.DionysusFeasting,

				{ Cue = "/VO/Dionysus_0019",
					PreLineThreadedFunctionArgs = { Name = "Dionysus_Shrug", WaitTime = 0.5, AngleNPCToHero = true, },
					Text = "The water's nice and warm, but if you don't want to take a dip, it's cool!" },
			},
			DionysusChat15 =
			{
				UseableOffSource = true,
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = PresetEventArgs.DionysusFeasting,

				{ Cue = "/VO/Dionysus_0020",
					PreLineThreadedFunctionArgs = { Name = "Dionysus_Shrug", WaitTime = 0.5, AngleNPCToHero = true, },
					Text = "I'd ask you tell the fam I told them cheers but that might get a little awkward, yeah?" },
			},
			DionysusChat16 =
			{
				UseableOffSource = true,
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = PresetEventArgs.DionysusFeasting,

				{ Cue = "/VO/Dionysus_0021",
					Emote = "PortraitEmoteCheerful",
					PreLineThreadedFunctionArgs = { Name = "Dionysus_Eager", WaitTime = 0.5, AngleNPCToHero = true, },
					Text = "Leave your worries at the gate and have yourself a cup of something, {#Emph}here!" },
			},
			DionysusChat17 =
			{
				UseableOffSource = true,
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = PresetEventArgs.DionysusFeasting,

				{ Cue = "/VO/Dionysus_0022",
					PreLineThreadedFunctionArgs = { Name = "Dionysus_Eager", WaitTime = 0.5, AngleNPCToHero = true, },
					Text = "Know that all of us are with you {#Emph}all {#Prev}the way, so cheers to your success!" },
			},
			DionysusChat18 =
			{
				UseableOffSource = true,
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = PresetEventArgs.DionysusFeasting,

				{ Cue = "/VO/Dionysus_0023",
					PreLineThreadedFunctionArgs = { Name = "Dionysus_Eager", WaitTime = 0.5, AngleNPCToHero = true, },
					Text = "Take it from me, there is {#Emph}never {#Prev}a bad time for a good feast!" },
			},
			DionysusChat19 =
			{
				UseableOffSource = true,
				GameStateRequirements =
				{
					{
						PathTrue = { "PrevRun", "RoomsEntered", "P_Story01" },
					},
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = PresetEventArgs.DionysusFeasting,

				{ Cue = "/VO/Dionysus_0024",
					Emote = "PortraitEmoteSurprise",
					PreLineThreadedFunctionArgs = { Name = "Dionysus_Surprise", WaitTime = 0.5, AngleNPCToHero = true, },
					Text = "Wait wait wait weren't you just here? It's all a blur for me!" },
			},
			DionysusChat20 =
			{
				UseableOffSource = true,
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = PresetEventArgs.DionysusFeasting,

				{ Cue = "/VO/Dionysus_0025",
					PreLineThreadedFunctionArgs = { Name = "Dionysus_Shrug", WaitTime = 0.5, AngleNPCToHero = true, },
					Text = "No use fighting the inevitable when you're thirsty, yeah?" },
			},
			DionysusChat21 =
			{
				UseableOffSource = true,
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = PresetEventArgs.DionysusFeasting,

				{ Cue = "/VO/Dionysus_0026",
					PreLineThreadedFunctionArgs = { Name = "Dionysus_Eager", WaitTime = 0.5, AngleNPCToHero = true, },
					Text = "Take a load off, relax, have a drink and all that! The night's still young!" },
			},
			DionysusChat22 =
			{
				UseableOffSource = true,
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = PresetEventArgs.DionysusFeasting,

				{ Cue = "/VO/Dionysus_0027",
					PreLineThreadedFunctionArgs = { Name = "Dionysus_Eager", WaitTime = 0.5, AngleNPCToHero = true, },
					Text = "Well don't just stand there, eat! Drink! Whatever you fancy!" },
			},
			DionysusChat23 =
			{
				UseableOffSource = true,
				GameStateRequirements =
				{
					{
						Path = { "GameState", "GamePhase" },
						Comparison = "~=",
						Value = 5,
					},
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = PresetEventArgs.DionysusFeasting,

				{ Cue = "/VO/Dionysus_0028",
					PreLineThreadedFunctionArgs = { Name = "Dionysus_Laugh", WaitTime = 0.5, AngleNPCToHero = true, },
					Text = "The moon is shining, the water's warm, the Nectar's flowing, what is not to like?" },
			},
			DionysusChat24 =
			{
				UseableOffSource = true,
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = PresetEventArgs.DionysusFeasting,

				{ Cue = "/VO/Dionysus_0029",
					PreLineThreadedFunctionArgs = { Name = "Dionysus_Shrug", WaitTime = 0.5, AngleNPCToHero = true, },
					Text = "You keep on showing up but never stick around, quit {#Emph}teasing {#Prev}us, baby!" },
			},
			DionysusChat25 =
			{
				UseableOffSource = true,
				GameStateRequirements =
				{
					{
						FunctionName = "RequiredHealthFraction",
						FunctionArgs = { Comparison = "<", Value = 0.6, },
					},
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = PresetEventArgs.DionysusFeasting,

				{ Cue = "/VO/Dionysus_0030",
					PreLineThreadedFunctionArgs = { Name = "Dionysus_Shrug", WaitTime = 0.5, AngleNPCToHero = true, },
					Text = "Hey Mel baby, you're bringing down the mood a bit looking like that, you get me, yeah?" },
			},
			DionysusChat26 =
			{
				UseableOffSource = true,
				GameStateRequirements =
				{
					{
						PathFalse = { "PrevRun", "RoomsEntered", "P_Story01" },
					},
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = PresetEventArgs.DionysusFeasting,

				{ Cue = "/VO/Dionysus_0031",
					PreLineThreadedFunctionArgs = { Name = "Dionysus_Eager", WaitTime = 0.5, AngleNPCToHero = true, },
					Text = "Oh you missed a {#Emph}real {#Prev}good time last night... or might have been the night before..." },
			},
			DionysusChat27 =
			{
				UseableOffSource = true,
				GameStateRequirements =
				{
					{
						PathTrue = { "GameState", "ReachedTrueEnding" },
					},
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = PresetEventArgs.DionysusFeasting,

				{ Cue = "/VO/Dionysus_0278",
					PreLineThreadedFunctionArgs = { Name = "Dionysus_Eager", WaitTime = 0.5, AngleNPCToHero = true, },
					Text = "Everybody! It's the Zag man's sister, let's all give her a warm welcome, yeah?" },
			},
			DionysusChat28 =
			{
				UseableOffSource = true,
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = PresetEventArgs.DionysusFeasting,

				{ Cue = "/VO/Dionysus_0279",
					Text = "Oh you missed such a good time, baby, but more good times are always to be had!" },
			},
			DionysusChat29 =
			{
				UseableOffSource = true,
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = PresetEventArgs.DionysusFeasting,

				{ Cue = "/VO/Dionysus_0280",
					Text = "Just be cool, Mel baby, everybody's doing their thing so let's do ours here, yeah?" },
			},
			DionysusChat30 =
			{
				UseableOffSource = true,
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = PresetEventArgs.DionysusFeasting,

				{ Cue = "/VO/Dionysus_0281",
					Text = "Think I've got one of your favorites somewhere, is it maybe one of these?" },
			},
			DionysusChat31 =
			{
				UseableOffSource = true,
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = PresetEventArgs.DionysusFeasting,

				{ Cue = "/VO/Dionysus_0282",
					Text = "You want to be your best out there, so take a breather and recharge a bit, you know?" },
			},
			DionysusChat32 =
			{
				UseableOffSource = true,
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = PresetEventArgs.DionysusFeasting,

				{ Cue = "/VO/Dionysus_0283",
					Text = "Sure I can get you Boons and all but let me know if I can get you a massage!" },
			},
			DionysusChat33 =
			{
				PlayFirst = true,
				UseableOffSource = true,
				GameStateRequirements =
				{
					{
						PathTrue = { "PrevRun", "RoomsEntered", "P_Story01" },
					},
				},

				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = PresetEventArgs.DionysusFeasting,

				{ Cue = "/VO/Dionysus_0284",
					Text = "Weren't you just here, baby, or have we been feasting all night long?" },
			},
			DionysusChat34 =
			{
				UseableOffSource = true,
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = PresetEventArgs.DionysusFeasting,

				{ Cue = "/VO/Dionysus_0285",
					Text = "Remember, don't let on to anybody that we're here, they'll never understand!" },
			},
			DionysusChat35 =
			{
				UseableOffSource = true,
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = PresetEventArgs.DionysusFeasting,

				{ Cue = "/VO/Dionysus_0286",
					Text = "Do let me know if I can get you anything besides the usual stuff, yeah?" },
			},
			DionysusChat36 =
			{
				UseableOffSource = true,
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = PresetEventArgs.DionysusFeasting,

				{ Cue = "/VO/Dionysus_0287",
					Text = "Whatever you're craving, we probably have it somewhere around here!" },
			},
			DionysusChat37 =
			{
				UseableOffSource = true,
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = PresetEventArgs.DionysusFeasting,

				{ Cue = "/VO/Dionysus_0288",
					Text = "Don't look now but one of the Satyrs there, I think he fancies you!" },
			},
			DionysusChat38 =
			{
				UseableOffSource = true,
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = PresetEventArgs.DionysusFeasting,

				{ Cue = "/VO/Dionysus_0289",
					Text = "So cool of you stop by our exclusive get-together here, always a treat, baby!" },
			},
			DionysusChat39 =
			{
				UseableOffSource = true,
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = PresetEventArgs.DionysusFeasting,

				{ Cue = "/VO/Dionysus_0290",
					Text = "See all the Nymphs and Satyrs there? Hey I could make an introduction if you like!" },
			},
			DionysusChat40 =
			{
				UseableOffSource = true,
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = PresetEventArgs.DionysusFeasting,

				{ Cue = "/VO/Dionysus_0291",
					PreLineThreadedFunctionArgs = { Name = "Dionysus_Eager", WaitTime = 0.5, AngleNPCToHero = true, },
					Emote = "PortraitEmoteCheerful",
					Text = "{#Emph}Whoa-hoho{#Prev}, either I had a few too many there... or I just haven't had enough!" },
			},

		},

		GiftTextLineSets =
		{
			DionysusGift01 =
			{
				PlayOnce = true,
				OnGiftTrack = true,
				UnfilledIcon = "EmptyHeartWithGiftIcon",
				FilledIcon = "FilledHeartWithGiftIcon",
				HintId = "Codex_DionysusGiftHint01",
				Cost =
				{
					GiftPoints = 1,
				},
				GameStateRequirements =
				{
					{
						PathTrue = { "GameState", "UseRecord", "NPC_Dionysus_01" },
					},
				},
				{ Cue = "/VO/MelinoeField_2395", UsePlayerSource = true,
					PreLineWait = 0.3,
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "I... don't wish to be just some ungrateful guest. I know you have your customs here, and I have studied them. So, please! For all your cheer and generosity!" },
				{ Cue = "/VO/Dionysus_0152",
					Emote = "PortraitEmoteSparkly",
					PreLineAnim = "Dionysus_Surprise",
					Text = "Whoa, this is Nectar, it's the real thing, we could use every drop that we can get! Then here is something for my most distinguished guests, of which I have decided {#Emph}you are one!" },
			},
			DionysusGift02 =
			{
				PlayOnce = true,
				OnGiftTrack = true,
				HintId = "Codex_DionysusGiftHint01",
				UnfilledIcon = "EmptyHeartWithProphecyIcon",
				FilledIcon = "FilledHeartWithProphecyIcon",
				Cost =
				{
					GiftPoints = 1,
				},
				GameStateRequirements =
				{
					{
						-- not needed due to NarrativeData priorities
						-- PathTrue = { "GameState", "TextLinesRecord", "DionysusGift01" },
					},
				},
				{ Cue = "/VO/Dionysus_0153",
					Emote = "PortraitEmoteSparkly",
					PreLineThreadedFunctionArgs = { Name = "Dionysus_Laugh", WaitTime = 0.5, AngleNPCToHero = true, },
					Text = "Hey, {#Emph}nice{#Prev}, more Nectar always good to have around in case the wine runs out, not that it ever does or ever will! Now, what exactly do we toast to next?" },
				{ Cue = "/VO/MelinoeField_2397", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Vulnerable_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "To emerging from peril unscathed? Or whatever you decide. I know maintaining high morale is paramount, especially with the mountain under siege." },
				EndVoiceLines =
				{
					{
						PreLineWait = 0.4,
						ObjectType = "NPC_Dionysus_01",
						PreLineAnim = "Dionysus_Greeting",
						{ Cue = "/VO/Dionysus_0085", Text = "Cheers!" },
					},
					{
						PreLineWait = 0.4,
						UsePlayerSource = true,
						{ Cue = "/VO/MelinoeField_0067", Text = "Cheers." },
					}
				},

			},
			DionysusGift03 =
			{
				PlayOnce = true,
				OnGiftTrack = true,
				HintId = "Codex_DionysusGiftHint01",
				Cost =
				{
					GiftPoints = 1,
				},
				GameStateRequirements =
				{
					{
						-- PathTrue = { "GameState", "TextLinesRecord", "DionysusGift02" },
					},
				},
				{ Cue = "/VO/Dionysus_0176",
					Emote = "PortraitEmoteSparkly",
					PreLineThreadedFunctionArgs = { Name = "Dionysus_Eager", WaitTime = 0.5, AngleNPCToHero = true, },
					Text = "Hey, sure, I'll take that Nectar off your hands! As this here's {#Emph}just {#Prev}the place to put it to its proper use. But don't you get all sad and sappy with me, you're at a {#Emph}feast{#Prev}, not at a wake!" },
				{ Cue = "/VO/MelinoeField_2913", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Vulnerable_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "I must admit, I'm unable to cast aside my fears and worries quite like you, Dionysus. It's little wonder mortals make so many offerings in your name... as now do I." },
			},
			DionysusGift04 =
			{
				PlayOnce = true,
				OnGiftTrack = true,
				HintId = "Codex_DionysusGiftHint01",
				Cost =
				{
					GiftPoints = 1,
				},
				GameStateRequirements =
				{
					{
						-- PathTrue = { "GameState", "TextLinesRecord", "DionysusGift03" },
					},
				},
				{ Cue = "/VO/Dionysus_0177",
					Emote = "PortraitEmoteSparkly",
					Text = "Now that's the spirit, giving back to the community, I {#Emph}like {#Prev}it, yeah? After all, you know I can't make cheer and revelry for everyone all by myself, don't you? Though between us, I still can make an {#Emph}awful {#Prev}lot." },
				{ Cue = "/VO/MelinoeField_2914", UsePlayerSource = true,
					PreLineAnim = "MelTalkPensive01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "Such cheer and revelry that you've created, seemingly out of thin air... and during such a time. Well, if this truly is to be a never-ending feast, then you'll need plenty of supplies!" },
			},
			DionysusGift05 =
			{
				PlayOnce = true,
				OnGiftTrack = true,
				HintId = "Codex_DionysusGiftHint01",
				Cost =
				{
					GiftPoints = 1,
				},
				GameStateRequirements =
				{
					{
						-- PathTrue = { "GameState", "TextLinesRecord", "DionysusGift03" },
					},
				},
				{ Cue = "/VO/Dionysus_0232",
					Emote = "PortraitEmoteCheerful",
					Text = "Hey this is {#Emph}great{#Prev}, there's not an entrance fee or anything, but tips are always welcome as our Nectar's running {#Emph}dangerously low. {#Prev}Got any more to spare?" },
				{ Cue = "/VO/MelinoeField_4477", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Hesitant_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "Oh, {#Emph}erm{#Prev}, looks to me as if you've all had quite enough for now. But if I happen on a surplus... I'll bring more." },
				EndVoiceLines =
				{
					{
						PreLineWait = 0.36,
						ObjectType = "NPC_Dionysus_01",
						PreLineAnim = "Dionysus_Greeting",
						{ Cue = "/VO/Dionysus_0233", Text = "You better, {#Emph}hahahaha!" },
					},
				},
			},
			DionysusGift06 =
			{
				PlayOnce = true,
				OnGiftTrack = true,
				HintId = "Codex_DionysusGiftHint01",
				Cost =
				{
					GiftPoints = 1,
				},
				GameStateRequirements =
				{
					{
						-- PathTrue = { "GameState", "TextLinesRecord", "DionysusGift03" },
					},
				},
				{ Cue = "/VO/Dionysus_0234",
					Emote = "PortraitEmoteSparkly",
					Text = "All right, now that's exactly what we need, and ought to last till, what, tomorrow night at least? You've got my thanks and more, Mel baby! Who's your supplier, might I ask?" },
				{ Cue = "/VO/MelinoeField_4478", UsePlayerSource = true,
					PreLineAnim = "MelTalkPensive01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "I've no single Nectar source I rely on; I know a Broker who tends to have some, and at other times I find a bottle here and there. Has it truly been that difficult to find?" },
				{ Cue = "/VO/Dionysus_0235",
					Text = "Oh this stuff's not impossible to get most of the time, we just go through a lot is all! And now my guests are pining for Ambrosia more and more. Happen to have a box of that?" },
				EndVoiceLines =
				{
					{
						PreLineWait = 0.4,
						UsePlayerSource = true,
						{ Cue = "/VO/MelinoeField_4479", Text = "A box? You mean a bottle." },
					},
					{
						PreLineWait = 0.38,
						ObjectType = "NPC_Dionysus_01",
						PreLineAnim = "Dionysus_Greeting",
						{ Cue = "/VO/Dionysus_0236", Text = "A {#Emph}box {#Prev}of bottles! {#Emph}Good {#Prev}ones!" },
					},
				},
			},
			-- bond forged
			DionysusGift07 =
			{
				PlayOnce = true,
				OnGiftTrack = true,
				LockedHintId = "Codex_DionysusUnlockHint01",
				UnfilledIcon = "EmptyHeartWithAmbrosiaIcon",
				FilledIcon = "FilledHeartWithAmbrosiaIcon",
				HintId = "Codex_DionysusGiftHint02",
				CompletedHintId = "Codex_BondForgedDionysus",
				Cost =
				{
					SuperGiftPoints = 4,
				},
				GameStateRequirements =
				{
					{
						Path = { "GameState", "TextLinesRecord" },
						HasAll = { "DionysusGift06", "DionysusAboutAmbrosia02" },
					},
				},
				{ Cue = "/VO/MelinoeField_4482", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Pleased_01",

					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",

					PreLineThreadedFunctionName = "PlayEmoteAnimFromSource", PreLineThreadedFunctionArgs = { Emote = "None", Portrait = "Portrait_Mel_Hesitant_01", WaitTime = 7.2 },

					Text = "Here you are, then, Dionysus! One box of good bottles of Ambrosia. May this help keep things festive for your guests for quite some time... at least till next I happen to stop in..." },

				{ Cue = "/VO/Dionysus_0241",
					Emote = "PortraitEmoteSurprise",
					PreLineAnim = "Dionysus_Eager",
					Text = "Mel, {#Emph}baby{#Prev}, I could {#Emph}kiss {#Prev}you, did you really bring all this for {#Emph}us?! {#Prev}This is exactly what we needed, I mean... how'd you even {#Emph}know? {#Prev}Can you read minds?" },

				{ Cue = "/VO/MelinoeField_4483", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Hesitant_01",
					PreLineAnim = "MelTalkBrooding01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "...You previously asked if I had access to Ambrosia, but... I cannot yet read minds most of the time. That is a very advanced skill." },

				{ Cue = "/VO/Dionysus_0242",

					PostLineThreadedFunctionName = "MaxedRelationshipPresentation",
					PostLineThreadedFunctionArgs = { Text = "NPC_Dionysus_01", Icon = "Keepsake_Dionysus" },

					PreLineAnim = "Dionysus_Laugh",
					Emote = "PortraitEmoteCheerful",

					Text = "Oh come {#Emph}on {#Prev}you can probably read everything that's going on in {#Emph}mine! {#Prev}And mostly you'll be reading gratitude. I thought you were a little stiff at first but you're all right!" },

				EndVoiceLines =
				{
					{
						PreLineWait = 0.4,
						UsePlayerSource = true,
						{ Cue = "/VO/MelinoeField_4484", Text = "That means a lot coming from you." },
					},
					{
						PreLineWait = 0.72,
						ObjectType = "NPC_Dionysus_01",
						{ Cue = "/VO/Dionysus_0243", Text = "...Say what?" },
					},
				},
			},

		},

		GiftGivenVoiceLines =
		{
			BreakIfPlayed = true,
			PreLineWait = 1.0,
			PlayFromTarget = true,

			{ Cue = "/VO/MelinoeField_2396", Text = "I'm most grateful... and wish I could stay for the festivities." },
		},

		RarityUpgradeVoiceLines =
		{
			{ GlobalVoiceLines = "ZagreusRarifyVoiceLines" },
		},

		OnHitVoiceLines =
		{
			RandomRemaining = true,
			BreakIfPlayed = true,
			PreLineWait = 0.25,
			ObjectType = "NPC_Dionysus_01",
			ChanceToPlay = 0.5,
			PreLineAnim = "Dionysus_Surprise",
			GameStateRequirements =
			{
				{
					PathFromArgs = true,
					Path = { "SourceProjectile", },
					IsNone = { "FrogFamiliarLand", "CatFamiliarPounce", "RavenFamiliarMelee" },
				},
			},
			Cooldowns =
			{
				{ Name = "DionysusGotHitRecently", Time = 6 },
			},
			TriggerCooldowns = { Name = "DionysusSpokeRecently" },

			{ Cue = "/VO/Dionysus_0061", Text = "Come on!" },
			{ Cue = "/VO/Dionysus_0062", Text = "Oh come off it." },
			{ Cue = "/VO/Dionysus_0063", Text = "I almost spilled this!" },
			{ Cue = "/VO/Dionysus_0064", Text = "Hey now." },
			{ Cue = "/VO/Dionysus_0065", Text = "Take it {#Emph}easy!" },
			{ Cue = "/VO/Dionysus_0066", Text = "Easy does it." },
			{ Cue = "/VO/Dionysus_0067", Text = "{#Emph}Yeah{#Prev}, let loose!" },
			{ Cue = "/VO/Dionysus_0068", Text = "Just relax." },
			{ Cue = "/VO/Dionysus_0069", Text = "No you don't!" },
			{ Cue = "/VO/Dionysus_0070", Text = "Whoa, baby.", PlayFirst = true },
			{ Cue = "/VO/Dionysus_0072", Text = "Ease up a bit?" },
			{ Cue = "/VO/Dionysus_0073", Text = "Do we have to escort you out?" },
			{ Cue = "/VO/Dionysus_0074", Text = "That isn't cool." },
		},
		Using = { Animation = "DionysusLobProjectileSmoke", },
	},
}

-- Global Dionysus Lines
GlobalVoiceLines.DionysusGreetingLines =
{
	Queue = "Interrupt",
	{
		{
			RandomRemaining = true,
			ObjectType = "NPC_Dionysus_01",
			PreLineAnim = "Dionysus_Greeting",
			Cooldowns =
			{
				{ Name = "DionysusSpokeRecently", Time = 9 },
			},

			{ Cue = "/VO/Dionysus_0044", Text = "Whoa...!", PreLineAnim = "Dionysus_Surprise" },
			{ Cue = "/VO/Dionysus_0045", Text = "{#Emph}Wha-hoh...!", PreLineAnim = "Dionysus_Surprise" },
			{ Cue = "/VO/Dionysus_0046", Text = "Why {#Emph}hello.", PlayFirst = true },
			{ Cue = "/VO/Dionysus_0047", Text = "Why {#Emph}hello!" },
			{ Cue = "/VO/Dionysus_0048", Text = "Welcome!" },
			{ Cue = "/VO/Dionysus_0049", Text = "{#Emph}Heeey!" },
			{ Cue = "/VO/Dionysus_0050", Text = "{#Emph}Heeey." },
			{ Cue = "/VO/Dionysus_0051", Text = "Oh, Mel, hey!" },
			{ Cue = "/VO/Dionysus_0052", Text = "Huh?", PreLineAnim = "Dionysus_Surprise" },
			{ Cue = "/VO/Dionysus_0053", Text = "Wha? {#Emph}Oh!", PreLineAnim = "Dionysus_Surprise" },
			{ Cue = "/VO/Dionysus_0054", Text = "Look everyone!" },
			{ Cue = "/VO/Dionysus_0055", Text = "You made it!" },
			{ Cue = "/VO/Dionysus_0056", Text = "Hey help yourself!" },
			{ Cue = "/VO/Dionysus_0057", Text = "Back for more!" },
			{ Cue = "/VO/Dionysus_0058", Text = "Hey good-looking." },
			{ Cue = "/VO/Dionysus_0059", Text = "Look who's here!" },
			{ Cue = "/VO/Dionysus_0060", Text = "What is up?" },
		},
		{
			RandomRemaining = true,
			UsePlayerSource = true,
			SuccessiveChanceToPlay = 0.2,
			Cooldowns =
			{
				{ Name = "MelinoeAnyQuipSpeech" },
			},

			-- { Cue = "/VO/MelinoeField_1887", Text = "{#Emph}Erm{#Prev}, pardon...!", PlayFirst = true },
		},
	},
}

GlobalVoiceLines.DionysusFeastingLines =
{
	{
		PreLineWait = 0.5,
		RandomRemaining = true,
		ObjectType = "NPC_Dionysus_01",
		-- SubtitleMinDistance = 1200,
		SuccessiveChanceToPlayAll = 0.85,
		PreLineAnim = "Dionysus_Laugh",
		GameStateRequirements = 
		{
			{
				PathFalse = { "CurrentRun", "TriggerRecord", "DionysusInterrupt" },
			},
		},

		{ Cue = "/VO/Dionysus_0032", TextLimit = 300, Text = "{#Emph}Hahaha, yeah! {#Prev}Come, everybody, let's have another round!" },
		{ Cue = "/VO/Dionysus_0033", TextLimit = 300, Text = "...So I would like to propose {#Emph}another {#Prev}toast. To all of you! {#Emph}Cheers!!" },
		{ Cue = "/VO/Dionysus_0034", TextLimit = 300, Text = "...So I would like to propose {#Emph}another {#Prev}toast? To feasting! {#Emph}Cheers!!",
			GameStateRequirements =
			{
				{
					PathTrue = { "GameState", "SpeechRecord", "/VO/Dionysus_0033" }
				},
			},
		},
		{ Cue = "/VO/Dionysus_0035", TextLimit = 300, Text = "Now come, my friends, drink up, like there's no tomorrow!" },
		{ Cue = "/VO/Dionysus_0036", TextLimit = 300, Text = "...another round, you say? Well I don't see why not! {#Emph}Ah, haha!" },
		{ Cue = "/VO/Dionysus_0037", TextLimit = 300, Text = "Don't anybody worry about a thing, we've got it all under control!" },
		{ Cue = "/VO/Dionysus_0038", TextLimit = 300, Text = "Enjoying that one, yeah? Well we've got plenty more, just let me know!" },
		{ Cue = "/VO/Dionysus_0039", TextLimit = 300, Text = "Looking good, mate! Yeah, the water's fine! How's the drink, you need another yet, or what?" },
		{ Cue = "/VO/Dionysus_0040", TextLimit = 300, Text = "Oh don't you know it, mate! This here is where the {#Emph}real {#Prev}action on the mountain is!" },
		{ Cue = "/VO/Dionysus_0041", TextLimit = 300, Text = "Drink! Drink! Drink! Drink! Drink! Drink! Drink! {#Emph}Hehe, yeah!" },
		{ Cue = "/VO/Dionysus_0042", TextLimit = 300, Text = "So you know what I say? I say, Dad... {#Emph}hah. {#Prev}I say Dad, what if I just don't want to? And he says, {#Emph}Then get out of my sight! {#Prev}So I say, {#Emph}Outta sight? All right! Hahahaha!" },
		{ Cue = "/VO/Dionysus_0043", PlayFirst = true, TextLimit = 300, Text = "So I say, can't we just, you know, invite him over to a feast and hash things out over a cup of wine, yeah? And {#Emph}they {#Prev}all look at {#Emph}me {#Prev}like I'm completely daft, {#Emph}hahaha, hahahaha." },
		{ Cue = "/VO/Dionysus_0213", TextLimit = 300, Text = "Hey look man let's {#Emph}not {#Prev}talk about that sort of thing in here, let's just {#Emph}relax! {#Prev}No need to get all down about that stuff!" },
		{ Cue = "/VO/Dionysus_0214", TextLimit = 300, Text = "I ever tell you lot about the time I traveled east, across the seas? There's quite an island over there, good people too. You ever been to other parts or what?" },
		{ Cue = "/VO/Dionysus_0215", TextLimit = 300, Text = "How many times do I have to say it, let's not talk about our mothers, this is polite company we're keeping! That's a {#Emph}naughty {#Prev}subject for a different sort of feast, you know?" },
		{ Cue = "/VO/Dionysus_0216", TextLimit = 300, Text = "I mean {#Emph}really{#Prev}, what's to fear from Titans, are they gonna rip me up limb from limb? Well I can't die man, I'll just put myself together... and then have another drink!" },
		{ Cue = "/VO/Dionysus_0217", TextLimit = 300, Text = "{#Emph}Hahahahaha, naughty{#Prev}, now be quiet everyone, I think that's her again, be on your best behavior yeah?" },
		{ Cue = "/VO/Dionysus_0292", TextLimit = 300, Text = "{#Emph}Huh{#Prev}, what you on about, man, she did {#Emph}what? {#Prev}You're pulling my leg, I don't believe a word of it, {#Emph}hahaha!" },
		{ Cue = "/VO/Dionysus_0293", TextLimit = 300, Text = "All right, come on now, I don't even {#Emph}want {#Prev}to know what's happening out there. What's really {#Emph}happening {#Prev}is here!" },
		{ Cue = "/VO/Dionysus_0294", TextLimit = 300, Text = "Come on you've got to keep your hooves inside the pool, yeah? Or I'll have no choice but to go in and drag you out!" },
		{ Cue = "/VO/Dionysus_0295", TextLimit = 300, Text = "Hey now, come on, that isn't cool! Although you want to know what {#Emph}is? Haha{#Prev}, I think you do, {#Emph}hahaha!" },
		{ Cue = "/VO/Dionysus_0296", TextLimit = 300, Text = "{#Emph}Whew{#Prev}, it's getting kind of hot in here! Or maybe it's you Nymphs there in the corner, yeah? Oh I {#Emph}see {#Prev}you!" },
		{ Cue = "/VO/Dionysus_0297", TextLimit = 300, Text = "Hey wait I think I heard someone come in. Hey {#Emph}erm, hello?" },
		{ Cue = "/VO/Dionysus_0298", TextLimit = 300, Text = "Whoa {#Emph}easy {#Prev}there, no biting, Maena, I keep telling you that is a {#Emph}Satyr! Not {#Prev}a goat!" },
		{ Cue = "/VO/Dionysus_0299", TextLimit = 300, Text = "...The temperature all right for everyone, got everything you need? How about another drink, we're good on food...?" },
		{ Cue = "/VO/Dionysus_0218", TextLimit = 300, Text = "So I say, can't we just, wait... have I not already told this one before? You'll tell me if I did? Or if you don't remember, that's cool! Neither do I, {#Emph}haha. {#Prev}What were we on about?",
			GameStateRequirements =
			{
				{
					Path = { "GameState", "RoomsEntered", "P_Story01" },
					Comparison = ">=",
					Value = 6,
				},
			}
		},
	},
}

GlobalVoiceLines.DionysusGuestHitReactionVoiceLines =
{
	RandomRemaining = true,
	BreakIfPlayed = true,
	PreLineWait = 0.45,
	SuccessiveChanceToPlay = 0.5,
	ObjectType = "NPC_Dionysus_01",
	Cooldowns =
	{
		{ Name = "DionysusSpokeRecently", Time = 8 },
	},
	GameStateRequirements = 
	{
		ChanceToPlay = 0.5,
	},

	{ Cue = "/VO/Dionysus_0061", Text = "Come on!" },
	{ Cue = "/VO/Dionysus_0062", Text = "Oh come off it." },
	{ Cue = "/VO/Dionysus_0064", Text = "Hey now." },
	{ Cue = "/VO/Dionysus_0065", Text = "Take it {#Emph}easy!" },
	{ Cue = "/VO/Dionysus_0068", Text = "Just relax." },
	{ Cue = "/VO/Dionysus_0070", Text = "Whoa, baby." },
	{ Cue = "/VO/Dionysus_0072", Text = "Ease up a bit?" },
	{ Cue = "/VO/Dionysus_0073", Text = "Do we have to escort you out?" },
	{ Cue = "/VO/Dionysus_0074", Text = "That isn't cool.", PlayFirst = true },
	{ Cue = "/VO/Dionysus_0071", Text = "What's with {#Emph}her?" },
}

GlobalVoiceLines.DionysusGatherReactionVoiceLines =
{
	RandomRemaining = true,
	BreakIfPlayed = true,
	PreLineWait = 0.65,
	SuccessiveChanceToPlay = 0.5,
	ObjectType = "NPC_Dionysus_01",
	Cooldowns =
	{
		{ Name = "DionysusSpokeRecently", Time = 4 },
	},

	{ Cue = "/VO/Dionysus_0133", Text = "What's that you got?" },
	{ Cue = "/VO/Dionysus_0136", Text = "Keep it, it's all yours!" },
	{ Cue = "/VO/Dionysus_0137", Text = "{#Emph}Everybody {#Prev}gets a gift!" },
	{ Cue = "/VO/Dionysus_0138", Text = "Hang onto that!" },
	{ Cue = "/VO/Dionysus_0139", Text = "Nice!" },
	{ Cue = "/VO/Dionysus_0140", Text = "Hey good for you!" },
	{ Cue = "/VO/Dionysus_0141", Text = "Right {#Emph}on!" },
	{ Cue = "/VO/Dionysus_0142", Text = "Dig it!" },
}
GlobalVoiceLines.DionysusExorcismReactionVoiceLines =
{
	RandomRemaining = true,
	BreakIfPlayed = true,
	PreLineWait = 0.65,
	SuccessiveChanceToPlay = 0.5,
	SuccessiveChanceToPlayAll = 0.25,
	ObjectType = "NPC_Dionysus_01",
	Cooldowns =
	{
		{ Name = "DionysusSpokeRecently", Time = 4 },
	},

	{ Cue = "/VO/Dionysus_0207", Text = "Don't think that one had an official invite anyhow..." },
	{ Cue = "/VO/Dionysus_0208", Text = "Hey that was {#Emph}my {#Prev}groupie!", PlayFirst = true },
	{ Cue = "/VO/Dionysus_0209", Text = "Go get your own devoted following!" },
	{ Cue = "/VO/Dionysus_0211", Text = "{#Emph}Eugh{#Prev}, that one was a bit dour anyway..." },
	{ Cue = "/VO/Dionysus_0212", Text = "No hassling my guests, all right?" },
	{ Cue = "/VO/Dionysus_0139", Text = "Nice!" },
	{ Cue = "/VO/Dionysus_0140", Text = "Hey good for you!" },
	{ Cue = "/VO/Dionysus_0141", Text = "Right {#Emph}on!" },
	{ Cue = "/VO/Dionysus_0142", Text = "Dig it!" },
}

GlobalVoiceLines.MiscEndVoiceLines_Dionysus =
{
	{
		RandomRemaining = true,
		PreLineWait = 0.45,
		ObjectType = "NPC_Dionysus_01",
		AllowTalkOverTextLines = true,

		--
	},
	{
		BreakIfPlayed = true,
		RandomRemaining = true,
		PreLineWait = 0.65,
		UsePlayerSource = true,
		SuccessiveChanceToPlay = 0.25,
		AllowTalkOverTextLines = true,

		--
	},
	{ GlobalVoiceLines = "ThankingCharacterVoiceLines" },
}

GlobalVoiceLines.DionysusReRollReactionVoiceLines =
{
	BreakIfPlayed = true,
	RandomRemaining = true,
	PreLineWait = 0.65,
	ObjectType = "NPC_Dionysus_01",
	GameStateRequirements =
	{
		{
			Path = { "CurrentLootData", "Name" },
			IsAny = { "NPC_Dionysus_01" },
		},
		{
			Path = { "CurrentRun", "SpeechRecord" },
			HasNone = {
				"/VO/Dionysus_0075",
				"/VO/Dionysus_0076",
				"/VO/Dionysus_0079",
				"/VO/Dionysus_0080",
				"/VO/Dionysus_0082",
				"/VO/Dionysus_0083"
			},
		},
	},
	Cooldowns =
	{
		{ Name = "DionysusOfferSpeech", Time = 30 },
	},
	
	{ Cue = "/VO/Dionysus_0075", Text = "Let's see here...",
		GameStateRequirements =
		{
			{
				Path = { "CurrentRun", "SpeechRecord" },
				HasNone = {
					"/VO/Dionysus_0075",
				},
			},
		},
	},
	{ Cue = "/VO/Dionysus_0076", Text = "What have we got...",
		GameStateRequirements =
		{
			{
				Path = { "CurrentRun", "SpeechRecord" },
				HasNone = {
					"/VO/Dionysus_0076",
				},
			},
		},
	},
	{ Cue = "/VO/Dionysus_0079", Text = "Any of these?",
		GameStateRequirements =
		{
			{
				Path = { "CurrentRun", "SpeechRecord" },
				HasNone = {
					"/VO/Dionysus_0079",
				},
			},
		},
	},
	{ Cue = "/VO/Dionysus_0080", Text = "How 'bout one of these?",
		GameStateRequirements =
		{
			{
				Path = { "CurrentRun", "SpeechRecord" },
				HasNone = {
					"/VO/Dionysus_0080",
				},
			},
		},
	},
	{ Cue = "/VO/Dionysus_0082", Text = "What do you feel like?",
		GameStateRequirements =
		{
			{
				Path = { "CurrentRun", "SpeechRecord" },
				HasNone = {
					"/VO/Dionysus_0082",
				},
			},
		},
	},
	{ Cue = "/VO/Dionysus_0083", Text = "One of these?",
		GameStateRequirements =
		{
			{
				Path = { "CurrentRun", "SpeechRecord" },
				HasNone = {
					"/VO/Dionysus_0083"
				},
			},
		},
	},
}

OverwriteTableKeys( EnemyData, UnitSetData.NPC_Dionysus )