UnitSetData.NPC_Hypnos =
{
	-- Hypnos, Id = 370024
	NPC_Hypnos_01 =
	{
		InheritFrom = { "NPC_Neutral", "NPC_Giftable" },
		UseText = "NPCUseTextTalkAlt",
		Portrait = "Portrait_Hypnos_Sleeping_01",
		SubtitleColor = Color.HypnosVoice,
		AnimOffsetZ = 50,
		AnimOffsetX = 20,
		EmoteOffsetX = 50,
		EmoteOffsetY = -370,

		Groups = { "NPCs" },
		SpeakerName = "Hypnos",
		LoadPackages = { "Hypnos" },

		ActivateRequirements =
		{
			{
				PathFalse = { "GameState", "TextLinesRecord", "HypnosFinalDreamMeeting01" },
			},
		},

		SpecialInteractFunctionName = "SpecialInteractSalute",
		SpecialInteractGameStateRequirements =
		{
			{
				Path = { "GameState", "UseRecord", "NPC_Hypnos_01" },
				Comparison = ">=",
				Value = 2,
			},
		},
		SpecialInteractCooldown = 60,
		InteractVoiceLines =
		{
			{
				PreLineWait = 0.3,
				RandomRemaining = true,
				UsePlayerSource = true,
				-- RandomRemaining = true,
				GameStateRequirements =
				{
					{
						PathTrue = { "SessionState", "InDreamSequence" }
					},
				},
				Cooldowns =
				{
					{ Name = "MelinoeSaluteSpeech", Time = 4 },
				},
				{ Cue = "/VO/Melinoe_3576", Text = "Not a care in the world." },
				{ Cue = "/VO/Melinoe_3577", Text = "You're safe here..." },
			},
			{
				PreLineWait = 0.3,
				RandomRemaining = true,
				UsePlayerSource = true,
				-- RandomRemaining = true,
				GameStateRequirements =
				{
					{
						PathFalse = { "SessionState", "InDreamSequence" }
					},
				},
				Cooldowns =
				{
					{ Name = "MelinoeSaluteSpeech", Time = 4 },
				},
				{ Cue = "/VO/Melinoe_1883", Text = "Rest easy, Son of Nyx.", PlayFirst = true },
				{ Cue = "/VO/Melinoe_3573", Text = "Sleep well." },
				{ Cue = "/VO/Melinoe_3574", Text = "Pleasant dreams." },
				{ Cue = "/VO/Melinoe_3575", Text = "You look comfortable." },
				{ Cue = "/VO/Melinoe_3576", Text = "Not a care in the world." },
				{ Cue = "/VO/Melinoe_3577", Text = "You're safe here..." },
				{ Cue = "/VO/Melinoe_3578", Text = "Moonlight guide you." },
			},
		},

		InteractTextLineSets =
		{
			HypnosFirstMeeting =
			{
				PlayOnce = true,
				UseableOffSource = true,
				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = PresetEventArgs.Sleeping,
				StatusAnimation = false,

				{ Cue = "/VO/Hypnos_0004",
					-- Emote = "PortraitEmoteDepressed",
					Text = "{#Emph}Zzzz, mm-hm, hmm..." },

				{ Cue = "/VO/Melinoe_0088", UsePlayerSource = true,
					-- PreLineAnim = "ZagreusTalkEmpathyStart", PreLineAnimTarget = "Hero",
					-- PostLineAnim = "ZagreusTalkEmpathy_Return", PostLineAnimTarget = "Hero",
					Text = "We'll find a way to wake you, O Sleep. I promise." },
			},

			HypnosAboutPoppies01 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				StatusAnimation = "StatusIconWantsToTalkImportant_Hypnos",
				GameStateRequirements =
				{
					{
						PathTrue = { "GameState", "TextLinesRecord", "HypnosGift02" }
					},
					{
						Path = { "GameState", "LifetimeResourcesGained", "PlantIPoppy" },
						Comparison = ">=",
						Value = 1,
					},
					{
						PathFalse = { "GameState", "WorldUpgrades", "WorldUpgradeWakeHypnos" }
					},
				},
				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = PresetEventArgs.Sleeping,

				{ Cue = "/VO/Hypnos_0008",
					Text = "{#Emph}Zzzz... hmm, zzzz..." },

				{ Cue = "/VO/Melinoe_3910", UsePlayerSource = true,
					PreLineAnim = "MelTalkPensive01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkPensive01ReturnToIdle", PostLineAnimTarget = "Hero",

					PreLineThreadedFunctionName = "PlayEmoteAnimFromSource", PreLineThreadedFunctionArgs = { Emote = "None", Portrait = "Portrait_Mel_Casual_01", WaitTime = 9.1 },

					Text = "Lord Hypnos, when I was in Tartarus, I found some seeds, which grew into Poppies... like the ones that line your bedding there. What if I used them with... {#Emph}<Gasp> {#Prev}I just had an idea...!" },

				EndFunctionName = "DisplayInfoToast",
				EndFunctionArgs = { Duration = 2, Title = "WorldUpgradeAdded", Text = "WorldUpgradeWakeHypnos" },
				EndVoiceLines =
				{
					{
						PreLineWait = 1.0,
						UsePlayerSource = true,
						{ Cue = "/VO/Melinoe_3911", Text = "...I promise to be careful." },
					}
				},
			},

			HypnosAboutUltimateProgress01 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				GameStateRequirements =
				{
					{
						PathFalse = { "GameState", "ReachedTrueEnding" }
					},
					{
						Path = { "CurrentRun", "TextLinesRecord" },
						HasAny = 
						{
							"ZagreusPastFirstMeeting",
							"ZagreusPastMeeting02",
							"ZagreusPastMeeting03",
							"ZagreusPastMeeting04",
							"ZagreusPastMeeting05",
						},
					},
				},
				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = PresetEventArgs.Sleeping,

				{ Cue = "/VO/Hypnos_0007_A",
					Text = "{#Emph}Zzzzz... zzz..." },

				{ Cue = "/VO/Melinoe_5679", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Empathetic_01",
					PreLineAnim = "MelTalkPensive01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkPensive01ReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "I mustn't speak of this, Lord Hypnos, but... I was able to descend to the abyss of the subconscious, and I found my brother there...! Thank you for sparking my fascination with dream. All that I've worked for... last night, it felt in reach!" },
			},
			HypnosAboutUltimateProgress02 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				GameStateRequirements =
				{
					{
						PathTrue = { "GameState", "TextLinesRecord", "ZagreusPastMeeting03" },
					},
				},
				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = PresetEventArgs.Sleeping,

				{ Cue = "/VO/Hypnos_0006_B",
					Text = "{#Emph}Zzz... zzzzz..." },

				{ Cue = "/VO/Melinoe_5680_B", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Empathetic_01",
					PreLineAnim = "MelTalkPensive01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkPensive01ReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "I never could delve into the abyss of the subconscious with {#Emph}you{#Prev}, O Sleep. With my brother, the path was so clear...! Well we shall find another way." },
			},

			HypnosPostTrueEnding01 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				GameStateRequirements =
				{
					{
						PathTrue = { "GameState", "ReachedTrueEnding" }
					},
				},
				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = PresetEventArgs.Sleeping,

				{ Cue = "/VO/Hypnos_0007_B",
					Text = "{#Emph}Zzzz... zzzz..." },

				{ Cue = "/VO/Melinoe_5682", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Empathetic_01",
					PreLineAnim = "MelTalkPensive01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkPensive01ReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "Your mother and the rest are safe, Lord Hypnos! They'll surely be expecting your return, and presumed you'd wake after all this, but... you're still sound asleep. Well don't worry... I made you a promise, and I intend to keep it." },
			},
			HypnosPostTrueEnding02 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				GameStateRequirements =
				{
					{
						PathTrue = { "GameState", "ReachedTrueEnding" }
					},
					{
						PathTrue = { "GameState", "TextLinesRecord", "AchillesTrueEnding01" }
					},
				},
				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = PresetEventArgs.Sleeping,

				{ Cue = "/VO/Hypnos_0007_C",
					Text = "{#Emph}Zzzz... zzz... zzzz..." },

				{ Cue = "/VO/Melinoe_5747", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Vulnerable_01",
					PreLineAnim = "MelTalkPensive01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkPensive01ReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "My memories of you from that potential past I experienced in the House of Hades... you were... so {#Emph}different{#Prev}, Lord Hypnos. Who {#Emph}are {#Prev}you, truly...? How can I finally get through to you...?" },
			},

			HypnosAboutStoryReset01 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				GameStateRequirements =
				{
					{
						Path = { "GameState", "StoryResetCount" },
						Comparison = ">=",
						Value = 1,
					},
					{
						SumPrevRuns = 4,
						Path = { "UsedStoryReset" },
						IgnoreCurrentRun = true,
						CountPathTrue = true,
						Comparison = ">=",
						Value = 1,
					},
					{
						PathTrue = { "GameState", "WorldUpgradesRevealed", "WorldUpgradeWakeHypnos" }
					},
					{
						-- has hypnos ever woken up?
						PathTrue = { "GameState", "AchievementsUnlocked", "AchHelpHypnos" },
					},
				},
				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = PresetEventArgs.Sleeping,

				{ Cue = "/VO/Hypnos_0006_B",
					Text = "{#Emph}Zzzzz, zzzzz{#Prev}..." },

				{ Cue = "/VO/Melinoe_5778", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Vulnerable_01",
					PreLineAnim = "MelTalkPensive01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkPensive01ReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "Lord Hypnos, for a moment, I thought... I almost forgot you were still here, as though... I dreamt you had already woken up...? {#Emph}Augh{#Prev}, it's nonsense. I must be weary." },
			},

			HypnosHideAndSeek01 =
			{
				PlayOnce = true,
				SkipNextTextLinesCheck = true,
				PreBlockSpecialInteract = true,
				PostBlockSpecialInteract = true,
				InitialGiftableOffSource = true,
				GiftableOffSource = true,
				StatusAnimation = false,
				GameStateRequirements =
				{
					{
						Path = { "CurrentHubRoom", "Name" },
						IsAny = { "Flashback_Hub_Main" },
					},
				},
				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = PresetEventArgs.Sleeping,
				EndFunctionName = "UpdateHubMainFlashback",
				EndFunctionArgs = { Hypnos = true },

				{ Cue = "/VO/Hypnos_0003",
					Text = "{#Emph}Zzz, zzzzz..." },
				EndVoiceLines =
				{
					{
						PreLineWait = 0.35,
						UsePlayerSource = true,
						{ Cue = "/VO/Melinoe_2272", Text = "I bid you farewell for now, Lord Hypnos!" },
						{ Cue = "/VO/Melinoe_2109", Text = "Where could she be...", PreLineWait = 3.1 },
					},
				},
			},

			-- partner conversations
			NemesisWithHypnos01 =
			{
				Partner = "NPC_Nemesis_01",
				PlayOnce = true,
				UseableOffSource = true,
				StatusAnimation = false,
				PostBlockSpecialInteract = true,
			},
			MorosWithHypnos01 =
			{
				Partner = "NPC_Moros_01",
				PlayOnce = true,
				UseableOffSource = true,
				StatusAnimation = false,
				PostBlockSpecialInteract = true,
			},

			-- Repeatable
			HypnosSleepingChat01 =
			{
				UseableOffSource = true,
				EndGlobalVoiceLines = "MiscEndVoiceLines_Hypnos",
				{ Cue = "/VO/Hypnos_0002",
					Text = "{#Emph}Zzzz, zzzz..." },
				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = PresetEventArgs.Sleeping,
				StatusAnimation = false,
			},
			HypnosSleepingChat02 =
			{
				UseableOffSource = true,
				EndGlobalVoiceLines = "MiscEndVoiceLines_Hypnos",
				{ Cue = "/VO/Hypnos_0003",
					Text = "{#Emph}Zzz, zzzzz..." },
				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = PresetEventArgs.Sleeping,
				StatusAnimation = false,
			},
			HypnosSleepingChat03 =
			{
				UseableOffSource = true,
				EndGlobalVoiceLines = "MiscEndVoiceLines_Hypnos",
				{ Cue = "/VO/Hypnos_0005",
					Text = "{#Emph}Zzzz... hm, hm, hm, hm, hm..." },
				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = PresetEventArgs.Sleeping,
				StatusAnimation = false,
			},
			HypnosSleepingChat04 =
			{
				UseableOffSource = true,
				EndGlobalVoiceLines = "MiscEndVoiceLines_Hypnos",
				{ Cue = "/VO/Hypnos_0008",
					Text = "{#Emph}Zzzz... hmm, zzzz..." },
				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = PresetEventArgs.Sleeping,
				StatusAnimation = false,
			},
			HypnosSleepingChat05 =
			{
				PlayFirst = true,
				UseableOffSource = true,
				EndGlobalVoiceLines = "MiscEndVoiceLines_Hypnos",
				{ Cue = "/VO/Hypnos_0009",
					Text = "{#Emph}Zzzz... hm, zzzz..." },
				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = PresetEventArgs.Sleeping,
				StatusAnimation = false,
			},
			HypnosSleepingChat06 =
			{
				UseableOffSource = true,
				EndGlobalVoiceLines = "MiscEndVoiceLines_Hypnos",
				{ Cue = "/VO/Hypnos_0010",
					Text = "{#Emph}Hm-hm, zzzz... hm, zzz, hmhmhm...." },
				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = PresetEventArgs.Sleeping,
				StatusAnimation = false,
			},
			HypnosSleepingChat07 =
			{
				UseableOffSource = true,
				EndGlobalVoiceLines = "MiscEndVoiceLines_Hypnos",
				GameStateRequirements =
				{
					{
						PathTrue = { "GameState", "ReachedTrueEnding" },
					},
				},
				{ Cue = "/VO/Hypnos_0007_B",
					Text = "{#Emph}Zzzz... zzzz..." },
				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = PresetEventArgs.Sleeping,
				StatusAnimation = false,
			},
			HypnosSleepingChat08 =
			{
				UseableOffSource = true,
				EndGlobalVoiceLines = "MiscEndVoiceLines_Hypnos",
				GameStateRequirements =
				{
					{
						PathTrue = { "GameState", "TextLinesRecord", "ZagreusPastFirstMeeting" },
					},
				},
				{ Cue = "/VO/Hypnos_0007_A",
					Text = "{#Emph}Zzzzz... zzz..." },
				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = PresetEventArgs.Sleeping,
				StatusAnimation = false,
			},
		},

		GiftTextLineSets =
		{
			HypnosWakeUp01 =
			{
				PlayOnce = true,
				OnGiftTrack = false,
				Cost =
				{
					HypnosPoints = 1,
				},
				GameStateRequirements =
				{
					{
						PathTrue = { "GameState", "WorldUpgrades", "WorldUpgradeWakeHypnos" }
					},
				},

				{ Cue = "/VO/Hypnos_0013",
					-- Emote = "PortraitEmoteDepressed",
					PreLineFunctionName = "PauseMusicianMusic",
					Text = "{#Emph}Zzz... mm, hmm... zzz... hmhm..." },

				{ Cue = "/VO/Melinoe_3681", UsePlayerSource = true,
					SkipContextArt = true,
					PostLineRemoveContextArt = true,
					PostLineFunctionName = "HypnosDream01StartPresentation",
					PortraitExitAnimation = "Portrait_Mel_Default_01_Exit",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkExplaining01ReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "{#Emph}Please work... {#Prev}Lord Hypnos, you have slumbered long enough! I know you're lost in dream, but I shall do my best to lead you back here to reality. Now breathe in deep!" },
				EndVoiceLines =
				{
					{
						PreLineWait = 1.65,
						UsePlayerSource = true,
						{ Cue = "/VO/Melinoe_3682", Text = "Is this...? Where am I?" },
					},
				},
				-- leads to HypnosDreamMeeting01
			},
			HypnosWakeUp02 =
			{
				PlayOnce = true,
				OnGiftTrack = false,
				Cost =
				{
					HypnosPoints = 1,
				},
				GameStateRequirements =
				{
					{
						PathTrue = { "GameState", "WorldUpgrades", "WorldUpgradeWakeHypnosT2" }
					},
				},

				{ Cue = "/VO/Hypnos_0019",
					-- Emote = "PortraitEmoteDepressed",
					PreLineFunctionName = "PauseMusicianMusic",
					Text = "{#Emph}Zzz... hmmm, hm-hm..." },

				{ Cue = "/VO/Melinoe_4638", UsePlayerSource = true,
					SkipContextArt = true,
					PostLineRemoveContextArt = true,
					PostLineFunctionName = "HypnosDream01StartPresentation",
					PortraitExitAnimation = "Portrait_Mel_Default_01_Exit",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkExplaining01ReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "All right, Lord Hypnos, let's give this a new attempt. We have to get you out of there, but first, breathe deep." },
				-- leads to HypnosDreamMeeting02, which leads to HypnosWakeUp02_B
			},

			-- @ ending
			HypnosWakeUp03 =
			{
				PlayOnce = true,
				OnGiftTrack = false,
				Cost =
				{
					HypnosPoints = 1,
				},
				GameStateRequirements =
				{
					{
						PathTrue = { "GameState", "WorldUpgrades", "WorldUpgradeWakeHypnosT3" }
					},
				},

				{ Cue = "/VO/Hypnos_0030",
					-- Emote = "PortraitEmoteDepressed",
					PreLineFunctionName = "PauseMusicianMusic",
					Text = "{#Emph}Hmmm... tsk, tsk, hm... zzz..." },

				{ Cue = "/VO/Melinoe_4707", UsePlayerSource = true,
					SkipContextArt = true,
					PostLineRemoveContextArt = true,
					PostLineFunctionName = "HypnosDream01StartPresentation",
					PortraitExitAnimation = "Portrait_Mel_Default_01_Exit",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkExplaining01ReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "You know how it goes, Lord Hypnos, and you had better comply because, I'll admit, I'm growing just a bit impatient here. Now breathe deep!" },
				-- leads to HypnosDreamMeeting03, which leads to HypnosWakeUp03_B
			},

			HypnosGift01 =
			{
				PlayOnce = true,
				OnGiftTrack = false,
				PostBlockSpecialInteract = true,
				Cost =
				{
					GiftPoints = 1,
				},
				GameStateRequirements =
				{
					{
						PathTrue = { "GameState", "UseRecord", "NPC_Hypnos_01" },
					},
				},
				{ Cue = "/VO/Melinoe_3385", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Empathetic_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkExplaining01ReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "May you have pleasant dreams for as long as you slumber. And if and when you finally wake... know that this Nectar shall be waiting for you." },
				{ Cue = "/VO/Hypnos_0011",
					Text = "{#Emph}Zzzzz, welcome... to the haah, hm, zzzz..." },
				EndVoiceLines =
				{
					{
						PreLineWait = 0.45,
						UsePlayerSource = true,
						{ Cue = "/VO/Melinoe_3482", Text = "Wait, welcome to the {#Emph}what...?" },
					},
				},
			},
			HypnosGift02 =
			{
				PlayOnce = true,
				OnGiftTrack = false,
				PostBlockSpecialInteract = true,
				Cost =
				{
					GiftPoints = 1,
				},
				GameStateRequirements =
				{
					{
						PathTrue = { "GameState", "UseRecord", "NPC_Hypnos_01" },
					},
				},
				{ Cue = "/VO/Melinoe_3386", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Empathetic_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkExplaining01ReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "So often has my sleep been wracked with nightmares... memories, perhaps, of when Headmistress took me in. If your dreams are troubled too, O Sleep... you show no sign of it, at least." },
				{ Cue = "/VO/Hypnos_0012",
					Text = "{#Emph}Zzz... have... zzz... you tried... zzzz..." },
				EndVoiceLines =
				{
					{
						PreLineWait = 0.45,
						UsePlayerSource = true,
						{ Cue = "/VO/Melinoe_3483", Text = "Did he just... have I tried what...?" },
					},
				},

			},

		},

	},

	-- Dream Hypnos 1
	NPC_Hypnos_02 =
	{
		InheritFrom = { "NPC_Neutral", "NPC_Giftable" },
		UseText = "NPCUseTextTalkAlt",
		Portrait = "Portrait_Hypnos_Sleeping_01",
		SubtitleColor = Color.HypnosVoice,
		AnimOffsetZ = 100,
		EmoteOffsetX = -20,
		EmoteOffsetY = -160,
		Groups = { "NPCs" },
		SpeakerName = "Hypnos",
		CodexName = "NPC_Hypnos_01",

		ActivateRequirements =
		{
		},

		SpecialInteractFunctionName = "SpecialInteractSalute",
		SpecialInteractGameStateRequirements =
		{
		},
		SpecialInteractCooldown = 60,
		InteractVoiceLines =
		{
			{ GlobalVoiceLines = "HypnosDreamSaluteVoiceLines" }
		},

		InteractTextLineSets =
		{
			HypnosDreamMeeting01 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				-- PreBlockSpecialInteract = true,
				-- PostBlockSpecialInteract = true,
				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = PresetEventArgs.Sleeping,
				StatusAnimation = false,
				GameStateRequirements =
				{
					{
						PathTrue = { "CurrentRun", "TextLinesRecord", "HypnosWakeUp01" },
					},
				},

				{ Cue = "/VO/Hypnos_0014",
					SkipContextArt = true,
					Text = "{#Emph}Zzzz... welcome to the how... zzz..." },

				{ Cue = "/VO/Melinoe_3684", UsePlayerSource = true,
					SkipContextArt = true,
					Emote = "PortraitEmoteSurprise",
					Portrait = "Portrait_Mel_Intense_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkExplaining01ReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "He said {#Emph}how? {#Prev}He's... trying to communicate! Lord Hypnos, I'm Melinoë, daughter of Hades, and I mean to find a way to rouse you from your slumber! Can you hear me?" },

				{ Cue = "/VO/Hypnos_0015",
					SkipContextArt = true,
					Text = "{#Emph}Zzzz... a wake I'm a wake I... haha hm, zzz..." },

				{ Cue = "/VO/Melinoe_3685", UsePlayerSource = true,
					SkipContextArt = true,
					PreLineAnim = "MelTalkBrooding01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkBrooding01ReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "How is it that you sleep, even in dream? What can I do to bring you back to us? Because we need you... your own sister tells me that your wisdom and knowledge are second to none!" },

				{ Cue = "/VO/Hypnos_0016",
					SkipContextArt = true,
					Text = "{#Emph}Zzzz... so you walked... zzz... straight into... zzz..." },

				{ Cue = "/VO/Melinoe_3686", UsePlayerSource = true,
					SkipContextArt = true,
					Portrait = "Portrait_Mel_Vulnerable_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkExplaining01ReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "I walked straight into {#Emph}what? {#Prev}Lord Hypnos, I don't understand. You have to snap out of this! My time here runs short, and if this doesn't work, I... don't know what else to do..." },

				{ Cue = "/VO/Hypnos_0017",
					SkipContextArt = true,
					PortraitExitAnimation = "Portrait_Hypnos_Sleeping_01_Exit",
					Text = "{#Emph}Zzz... dream... come... true... zzz... thanks... zzz... for stopping... by... zzz..." },

				{ Cue = "/VO/Hypnos_0018",
					PreLineFunctionName = "HypnosDream01EndPresentation",
					PreLineWait = 0.35,
					Text = "{#Emph}Zzzz... hmm, tsk-tsk, hm... zzz..." },

				{ Cue = "/VO/Melinoe_3688", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Vulnerable_01",
					PreLineAnim = "MelTalkPensive01ReturnToIdle",
					PreLineAnimTarget = "Hero",
					PostLineThreadedFunctionName = "InCombatTextEvent",
					PostLineThreadedFunctionArgs = GameData.PostDreamArgs,
					PostLineFunctionName = "ResumeMusicianMusic",
					Text = "No, his consciousness, it... slipped away from me. How am I... {#Emph}augh{#Prev}. I need to think..." },

				EndVoiceLines =
				{
					{
						PreLineWait = 0.46,
						UsePlayerSource = true,
						{ Cue = "/VO/Melinoe_3689", Text = "...Pleasant dreams, for now..." },
					},
				},
			},

			-- 2nd visit
			HypnosDreamMeeting02 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				-- PreBlockSpecialInteract = true,
				-- PostBlockSpecialInteract = true,
				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = PresetEventArgs.Sleeping,
				StatusAnimation = false,
				GameStateRequirements =
				{
					{
						PathTrue = { "CurrentRun", "TextLinesRecord", "HypnosWakeUp02" },
					},
				},

				{ Cue = "/VO/Hypnos_0023",
					SkipContextArt = true,
					Text = "{#Emph}Zzz... welcome to the... thanks... for dying..." },

				{ Cue = "/VO/Melinoe_4641", UsePlayerSource = true,
					SkipContextArt = true,
					PreLineAnim = "MelTalkPensive01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkPensive01ReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "I've something for you here, one moment please..." },
			},

			-- @ ending
			-- 3rd visit
			HypnosDreamMeeting03 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				-- PreBlockSpecialInteract = true,
				-- PostBlockSpecialInteract = true,
				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = PresetEventArgs.Sleeping,
				StatusAnimation = false,
				GameStateRequirements =
				{
					{
						PathTrue = { "CurrentRun", "TextLinesRecord", "HypnosWakeUp03" },
					},
				},

				{ Cue = "/VO/Melinoe_4710", UsePlayerSource = true,
					SkipContextArt = true,
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkExplaining01ReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "It is past time for you to wake." },
			},
		},

		GiftTextLineSets =
		{
			-- 2nd visit
			HypnosWakeUp02_B =
			{
				PlayOnce = true,
				OnGiftTrack = false,
				SkipContextArt = true,
				Cost =
				{
					HypnosPoints = 1,
				},
				GameStateRequirements =
				{
					{
						PathTrue = { "CurrentRun", "TextLinesRecord", "HypnosWakeUp02" }
					},
				},

				{ Cue = "/VO/Hypnos_0022",
					-- Emote = "PortraitEmoteDepressed",
					PreLineFunctionName = "PauseMusicianMusic",
					Text = "{#Emph}Zzz... died... again... hm..." },

				{ Cue = "/VO/Melinoe_4642", UsePlayerSource = true,
					SkipContextArt = true,
					PostLineRemoveContextArt = true,
					PostLineFunctionName = "HypnosDream02StartPresentation",
					PortraitExitAnimation = "Portrait_Mel_Default_01_Exit",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkExplaining01ReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "If you are dreaming even here, then I must ask if I could see into your psyche deeper still, Lord Hypnos. Whether you let me in is up to you, but once again... breathe deep." },
				-- leads to HypnosDreamMeeting02_B
			},

			-- @ ending
			-- 3rd visit
			HypnosWakeUp03_B =
			{
				PlayOnce = true,
				OnGiftTrack = false,
				SkipContextArt = true,
				Cost =
				{
					HypnosPoints = 1,
				},
				GameStateRequirements =
				{
					{
						PathTrue = { "CurrentRun", "TextLinesRecord", "HypnosWakeUp03" }
					},
				},

				{ Cue = "/VO/Hypnos_0033",
					SkipContextArt = true,
					Text = "{#Emph}Zzz... my list it... never..." },

				{ Cue = "/VO/Melinoe_4711", UsePlayerSource = true,
					SkipContextArt = true,
					PostLineRemoveContextArt = true,
					PostLineFunctionName = "HypnosDream02StartPresentation",
					PortraitExitAnimation = "Portrait_Mel_Default_01_Exit",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkExplaining01ReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "I must see deeper into your psyche once again, my lord, so forgive the intrusion, and... here we go." },
				EndVoiceLines =
				{
					{
						PreLineWait = 1.65,
						UsePlayerSource = true,
					},
				},
				-- leads to HypnosDreamMeeting03_C
			},

		},
	},

	-- Dream Hypnos 2
	NPC_Hypnos_03 =
	{
		InheritFrom = { "NPC_Neutral", "NPC_Giftable" },
		UseText = "NPCUseTextTalkAlt",
		Portrait = "Portrait_Hypnos_Sleeping_01",
		SubtitleColor = Color.HypnosVoice,
		AnimOffsetZ = 100,
		EmoteOffsetX = -20,
		EmoteOffsetY = -160,
		Groups = { "NPCs" },
		SpeakerName = "Hypnos",
		CodexName = "NPC_Hypnos_01",

		ActivateRequirements =
		{
		},

		SpecialInteractFunctionName = "SpecialInteractSalute",
		SpecialInteractGameStateRequirements =
		{
		},
		SpecialInteractCooldown = 60,
		InteractVoiceLines =
		{
			{ GlobalVoiceLines = "HypnosDreamSaluteVoiceLines" }
		},

		InteractTextLineSets =
		{
			HypnosDreamMeeting02_B =
			{
				PlayOnce = true,
				UseableOffSource = true,
				-- PreBlockSpecialInteract = true,
				-- PostBlockSpecialInteract = true,
				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = PresetEventArgs.Sleeping,
				StatusAnimation = false,
				GameStateRequirements =
				{
					{
						PathTrue = { "CurrentRun", "TextLinesRecord", "HypnosWakeUp02_B" },
					},
				},

				{ Cue = "/VO/Hypnos_0026",
					SkipContextArt = true,
					Text = "{#Emph}Zzz... there is... no esc... hhnnn..." },

				{ Cue = "/VO/Melinoe_4647", UsePlayerSource = true,
					SkipContextArt = true,
					Portrait = "Portrait_Mel_Vulnerable_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkExplaining01ReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "Lord Hypnos? Lord Hypnos! Can you hear me? Answer me! {#Emph}Anything? {#Prev}A twitch of the eye? Oh, come on, {#Emph}please!" },

				{ Cue = "/VO/Hypnos_0027",
					SkipContextArt = true,
					PreLineWait = 0.35,
					Text = "{#Emph}Zzz... won't catch... mmssllppnnhhh..." },

				{ Cue = "/VO/Melinoe_4648", UsePlayerSource = true,
					SkipContextArt = true,
					Portrait = "Portrait_Mel_Vulnerable_01",
					PreLineAnim = "MelTalkPensive01", PreLineAnimTarget = "Hero",
					Text = "He's dreaming about... sleeping? Or about {#Emph}dreaming? {#Prev}This is beyond me still. How far has he descended...?" },

				{ Cue = "/VO/Hypnos_0028",
					SkipContextArt = true,
					PreLineWait = 0.35,
					PortraitExitAnimation = "Portrait_Hypnos_Sleeping_01_Exit",
					Text = "{#Emph}Zzz... good old... thanuhtose... busy... allatime..." },

				{ Cue = "/VO/Hypnos_0029",
					PreLineFunctionName = "HypnosDream01EndPresentation",
					PreLineFunctionArgs = { WaitTime = 3.8 },
					PreLineWait = 0.35,
					Text = "{#Emph}Hnn...?! Hhnnnhh..." },

				{ Cue = "/VO/Melinoe_4650", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Vulnerable_01",
					PreLineAnim = "MelTalkPensive01ReturnToIdle",
					PreLineAnimTarget = "Hero",
					PostLineThreadedFunctionName = "InCombatTextEvent",
					PostLineThreadedFunctionArgs = GameData.PostDreamArgs,
					PostLineFunctionName = "ResumeMusicianMusic",
					Text = "{#Emph}Augh. {#Prev}Got farther that time, but... how many dreams are you {#Emph}having? {#Prev}But if you're dreaming of Death, perhaps... {#Emph}hm..." },

				EndVoiceLines =
				{
					{
						PreLineWait = 0.46,
						UsePlayerSource = true,
						{ Cue = "/VO/Melinoe_4651", Text = "Sleep well for now, my lord." },
					},
				},
			},

			HypnosDreamMeeting03_B =
			{
				PlayOnce = true,
				UseableOffSource = true,
				-- PreBlockSpecialInteract = true,
				-- PostBlockSpecialInteract = true,
				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = PresetEventArgs.Sleeping,
				StatusAnimation = false,
				GameStateRequirements =
				{
					{
						PathTrue = { "CurrentRun", "TextLinesRecord", "HypnosWakeUp03_B" },
					},
				},

				{ Cue = "/VO/Melinoe_4714", UsePlayerSource = true,
					SkipContextArt = true,
					PreLineAnim = "MelTalkBrooding01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkBrooding01ReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "You are very stubborn, my lord..." },

				EndVoiceLines =
				{
					{
						PreLineWait = 0.46,
						UsePlayerSource = true,
						-- { Cue = "/VO/Melinoe_3689", Text = "...Pleasant dreams, for now..." },
					},
				},
			},


		},

		GiftTextLineSets =
		{
			-- @ ending
			HypnosWakeUp03_C =
			{
				PlayOnce = true,
				OnGiftTrack = false,
				Cost =
				{
					HypnosPoints = 1,
				},
				GameStateRequirements =
				{
					{
						PathTrue = { "CurrentRun", "TextLinesRecord", "HypnosWakeUp03" }
					},
				},

				{ Cue = "/VO/Melinoe_4715", UsePlayerSource = true,
					SkipContextArt = true,
					PostLineRemoveContextArt = true,
					PostLineFunctionName = "HypnosDream03StartPresentation",
					PortraitExitAnimation = "Portrait_Mel_Default_01_Exit",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkExplaining01ReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "...All right, Lord Hypnos, one more time. You're still hiding something from me and from yourself. You must be awake somewhere in your consciousness, so let's go find you there. Breathe deep once more!" },
				EndVoiceLines =
				{
					{
						PreLineWait = 1.65,
						UsePlayerSource = true,
						{ Cue = "/VO/Melinoe_4716", Text = "No... no, he's.... {#Emph}ungh..." },
						{ Cue = "/VO/Melinoe_4717", Text = "There's nothing here...", PreLineWait = 1.35 },
					},
					{
						PreLineWait = 1.0,
						ObjectType = "NPC_Hypnos_04",

						{ Cue = "/VO/Hypnos_0039", Text = "{#Emph}Zzz... you keep... hm..." },
					}
				},
				-- leads to HypnosFinalDreamMeeting01
			},

		},
	},

	-- Dream Hypnos 3
	NPC_Hypnos_04 =
	{
		InheritFrom = { "NPC_Neutral", "NPC_Giftable" },
		UseText = "NPCUseTextTalkAlt",
		Portrait = "Portrait_Hypnos_Sleeping_01",
		SubtitleColor = Color.HypnosVoice,
		AnimOffsetZ = 100,
		EmoteOffsetX = 35,
		EmoteOffsetY = -340,
		Groups = { "NPCs" },
		SpeakerName = "Hypnos",
		CodexName = "NPC_Hypnos_01",

		ActivateRequirements =
		{
		},

		SpecialInteractFunctionName = "SpecialInteractSalute",
		SpecialInteractGameStateRequirements =
		{
		},
		SpecialInteractCooldown = 60,
		InteractVoiceLines =
		{
			{ GlobalVoiceLines = "HypnosDreamSaluteVoiceLines" }
		},

		InteractTextLineSets =
		{
			HypnosFinalDreamMeeting01 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				-- PreBlockSpecialInteract = true,
				-- PostBlockSpecialInteract = true,
				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = PresetEventArgs.Sleeping,
				StatusAnimation = false,
				GameStateRequirements =
				{
					{
						PathTrue = { "CurrentRun", "TextLinesRecord", "HypnosWakeUp03_C" },
					},
				},

				{ Cue = "/VO/Hypnos_0038",
					SkipContextArt = true,
					Text = "{#Emph}Zzz, hmhmhmhm... zzz, hmm, hmhmhm..." },

				{ Cue = "/VO/Melinoe_4718", UsePlayerSource = true,
					SkipContextArt = true,
					Portrait = "Portrait_Mel_Vulnerable_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkExplaining01ReturnToIdle", PostLineAnimTarget = "Hero",
					PreLineThreadedFunctionName = "PlayEmoteAnimFromSource", PreLineThreadedFunctionArgs = { Emote = "PortraitEmoteSurprise", Portrait = "Portrait_Mel_Hesitant_01", WaitTime = 7.9 },
					Text = "Blast it, Lord Hypnos, what is this going to take? Though... what is this, some sort of note, it says... in childlike scrawl, it says... {#Emph}Have you tried saying wake up? {#Prev}Wait, {#Emph}what?" },

				{ Cue = "/VO/Hypnos_0040",
					SkipContextArt = true,
					PreLineWait = 0.35,
					PortraitExitAnimation = "Portrait_Hypnos_Sleeping_01_Exit",
					Emote = "PortraitEmoteFiredUp",
					Text = "{#Emph}<Gasp> <Yawwwn>" },

				{ Cue = "/VO/Melinoe_4719", UsePlayerSource = true,
					PreLineFunctionName = "HypnosDream01EndPresentation",
					PreLineFunctionArgs = { WakeUp = true },
					Emote = "PortraitEmoteSurprise",
					Portrait = "Portrait_Mel_Vulnerable_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkExplaining01ReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "He yawned. Lord Hypnos... wake up. {#Emph}Wake up!" },

				{ Cue = "/VO/Hypnos_0042",
					Portrait = "Portrait_Hypnos_Waking_01",
					PreLineWait = 0.35,
					PreLineThreadedFunctionName = "PlayEmoteAnimFromSource", PreLineThreadedFunctionArgs = { Emote = "PortraitEmoteSurprise", WaitTime = 6.5 },
					Text = "{#Emph}<Yawn> {#Prev}Welcome to the House of Ha— I, {#Emph}uh... {#Prev}wait. Where am I? What {#Emph}is {#Prev}this? Who are {#Emph}you?" },

				{ Cue = "/VO/Melinoe_4720", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Casual_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkExplaining01ReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "Lord Hypnos, you're... you're {#Emph}here! {#Prev}These are the Crossroads between realms. I'm Melinoë, the daughter of Lord Hades and Persephone the Queen. Welcome!" },

				{ Cue = "/VO/Hypnos_0043",
					Portrait = "Portrait_Hypnos_Waking_01",
					Text = "{#Emph}<Yawn> {#Prev}Wait, wait, wait, what do you {#Emph}mean {#Prev}you're Master's daughter, you're {#Emph}huge{#Prev}, I mean you grew up {#Emph}fast{#Prev}, I mean, you were just {#Emph}born! {#Prev}Unless... unless, I, {#Emph}uh..." },

				{ Cue = "/VO/Melinoe_4721", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Empathetic_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkExplaining01ReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "You've been in a deep slumber for... quite some time, my lord. Ever since the Titan Chronos took my father's House as I understand. We've been busy with that matter since." },

				{ Cue = "/VO/Hypnos_0044",
					Portrait = "Portrait_Hypnos_Shocked_01",
					Emote = "PortraitEmoteSurprise",
					Text = "...oh no! {#Emph}Aah! AAAAAH! {#Prev}Oh no! Oh no, oh no, they'll... where'd all this Nectar come from? Oh, I'll never be the featured Houseservant again, oh {#Emph}no...!" },

				{ Cue = "/VO/Melinoe_4722", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Vulnerable_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkExplaining01ReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "Wait, Lord Hypnos, calm yourself, {#Emph}please! {#Prev}Everything's all right! Especially now that you're back with us. The House is well again! Or getting there." },

				{ Cue = "/VO/Hypnos_0045",
					Portrait = "Portrait_Hypnos_Shocked_01",
					Emote = "PortraitEmoteFiredUp",
					PostLineThreadedFunctionName = "InCombatTextEvent",
					PostLineThreadedFunctionArgs = GameData.PostDreamArgs,
					PostLineFunctionName = "ResumeMusicianMusic",

					Text = "No no no you don't understand... I am so late for work. I am {#Emph}so {#Prev}late for work! I have to go! I have to go, thanks for the wake-up call, if you see Zagreus tell him I'll be right there!" },

				EndVoiceLines =
				{
					{
						PreLineWait = 0.2,
						ObjectType = "NPC_Hypnos_01",

						{ Cue = "/VO/Hypnos_0047", Text = "I love you! So long!", PreLineThreadedFunctionName = "HypnosExitPresentation" },
					},
					{
						PreLineWait = 0.53,
						UsePlayerSource = true,
						{ Cue = "/VO/Melinoe_4723", Text = "...What in blazes happened, he... that's {#Emph}it?" },
					},
					{
						PreLineWait = 0.88,
						UsePlayerSource = true,
						{ Cue = "/VO/Melinoe_4724", Text = "...That's really it." },
					},
				},
			},

		},


	},

	-- Dream Run Hypnos
	NPC_Hypnos_DreamRun =
	{
		InheritFrom = { "NPC_Neutral", "NPC_Giftable" },
		Portrait = "Portrait_Hypnos_Lounging_01",
		SubtitleColor = Color.HypnosVoice,
		AnimOffsetZ = 50,
		EmoteOffsetX = 35,
		EmoteOffsetY = -340,
		Groups = { "NPCs" },
		SpeakerName = "Hypnos",
		CodexName = "NPC_Hypnos_01",
		LoadPackages = { "Hypnos" },
		LineHistoryNameKeepInDreamRun = true,

		TextLinesEndEvents =
		{
			{
				Threaded = true,
				FunctionName = "EnterNextDreamBiome",
				GameStateRequirements =
				{
					-- only teleport after Use, not Gift
					{
						PathTrue = { "CurrentRun", "CurrentRoom", "UseRecord", "NPC_Hypnos_DreamRun" },
					},
				},
			},
		},

		GiftGameStateRequirements =
		{
			{
				Path = { "CurrentRun", "CurrentRoom", "Name" },
				IsAny = { "Dream_Intro" },
			},
		},

		SpecialInteractFunctionName = "SpecialInteractSalute",
		SpecialInteractGameStateRequirements =
		{
			{
				Path = { "CurrentRun", "CurrentRoom", "Name" },
				IsAny = { "Dream_Intro" },
			},
			{
				PathTrue = { "GameState", "UseRecord", "NPC_Hypnos_DreamRun" },
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
				SuccessiveChanceToPlayAll = 0.33,
				Cooldowns =
				{
					{ Name = "MelinoeSaluteSpeech", Time = 4 },
				},
				{ Cue = "/VO/Melinoe_1883", Text = "Rest easy, Son of Nyx." },
				{ Cue = "/VO/MelinoeField_5271", Text = "Rest easy, Son of Nyx!" },
				{ Cue = "/VO/MelinoeField_5272", Text = "Be well, Lord Hypnos." },
			},
			{ GlobalVoiceLines = "SaluteVoiceLines" },
			{
				RandomRemaining = true,
				PreLineWait = 0.31,
				-- PreLineAnim = "Medea_Salute",
				ObjectType = "NPC_Hypnos_DreamRun",

				{ Cue = "/VO/Hypnos_0157", Text = "Hi!",
					GameStateRequirements =
					{
						{
							Path = { "LastLinePlayed" },
							IsAny = { "/VO/Melinoe_1698", "/VO/Melinoe_1699" },
						},
					},
				},
				{ Cue = "/VO/Hypnos_0158", Text = "Hello!",
					GameStateRequirements =
					{
						{
							Path = { "LastLinePlayed" },
							IsAny = { "/VO/Melinoe_1698", "/VO/Melinoe_1699" },
						},
					},
				},
				{ Cue = "/VO/Hypnos_0159", Text = "Death's my brother!",
					GameStateRequirements =
					{
						{
							Path = { "LastLinePlayed" },
							IsAny = { "/VO/Melinoe_1700" },
						},
					},
				},
				{ Cue = "/VO/Hypnos_0160", Text = "OK!",
					GameStateRequirements =
					{
						{
							Path = { "LastLinePlayed" },
							IsAny = { "/VO/Melinoe_1701" },
						},
					},
				},
				{ Cue = "/VO/Hypnos_0161", Text = "Thanks!",
					GameStateRequirements =
					{
						{
							Path = { "LastLinePlayed" },
							IsAny = { "/VO/Melinoe_1703" },
						},
					},
				},
				{ Cue = "/VO/Hypnos_0162", Text = "Where?",
					GameStateRequirements =
					{
						{
							Path = { "LastLinePlayed" },
							IsAny = { "/VO/Melinoe_1704" },
						},
					},
				},
				{ Cue = "/VO/Hypnos_0163", Text = "Even here?",
					GameStateRequirements =
					{
						{
							Path = { "LastLinePlayed" },
							IsAny = { "/VO/Melinoe_1705" },
						},
					},
				},
				{ Cue = "/VO/Hypnos_0164", Text = "Welcome to the House of Hades?",
					GameStateRequirements =
					{
						{
							Path = { "LastLinePlayed" },
							IsAny = { "/VO/Melinoe_1709" },
						},
					},
				},
				{ Cue = "/VO/Hypnos_0165", Text = "Who, {#Emph}me?",
					GameStateRequirements =
					{
						{
							Path = { "LastLinePlayed" },
							IsAny = { "/VO/Melinoe_1883", "/VO/MelinoeField_5271", "/VO/MelinoeField_5271" },
						},
					},
				},
				{ Cue = "/VO/Hypnos_0166", Text = "You, too!",
					GameStateRequirements =
					{
						{
							Path = { "LastLinePlayed" },
							IsAny = { "/VO/MelinoeField_5271", "/VO/MelinoeField_5272" },
						},
					},
				},
			},
		},

		InteractTextLineSets =
		{
			HypnosDreamRunStart01 =
			{
				PlayOnce = true,
				RoomUseableOffSource = true,
				GameStateRequirements =
				{
					{
						PathTrue = { "GameState", "ReachedTrueEnding" },
					},
				},

				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = PresetEventArgs.HypnosDreamGreeting,

				{ Cue = "/VO/Hypnos_0070",
					-- Portrait = "Portrait_Hypnos_Waking_01",
					-- Portrait = "Portrait_Hypnos_Displeased_01",
					Emote = "PortraitEmoteSurprise",
					Text = "{#Emph}Oh! {#Prev}Hi, {#Emph}um{#Prev}, I wanted to say thanks again, for waking me up and all? I have a {#Emph}lot {#Prev}of catching up to do at work, but if not for you, I'd have {#Emph}way more!" },

				{ Cue = "/VO/MelinoeField_5235", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Casual_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkExplaining01ReturnToIdle", PostLineAnimTarget = "Hero",

					PreLineThreadedFunctionName = "PlayEmoteAnimFromSource", PreLineThreadedFunctionArgs = { Emote = "None", Portrait = "Portrait_Mel_Hesitant_01", WaitTime = 5.5 },

					Text = "Lord Hypnos, you're most welcome! I'm certain everything is better at the House now that you've finally returned. Wait, am I asleep? But now you're the one contacting {#Emph}me?" },

				{ Cue = "/VO/Hypnos_0071",
					-- Portrait = "Portrait_Hypnos_Waking_01",
					PreLineAnim = "Hypnos_Explain_Start",
					PostLineAnim = "Hypnos_Explain_End",
					Text = "You bet! I kept on wondering, what can I do to pay Master's daughter back for what she did? Give her my gratitude? Already done! My affection? Worthless. And then I thought, I can make sure she gets a good night's rest!" },

				{ Cue = "/VO/MelinoeField_5236", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Hesitant_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkExplaining01ReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "That's... rather generous of you, as I suppose I could use one. So, a good night's rest involves my psyche being in this unusual place, and what else, exactly?" },

				{ Cue = "/VO/Hypnos_0072",
					Emote = "PortraitEmoteCheerful",
					PreLineAnim = "Hypnos_Explain_Start",
					PostLineAnim = "Hypnos_Explain_End",
					Text = "Well I sure am glad you asked, because you are about to find out: It's what I call {#Emph}Dream Dives! {#Prev}Have you tried conquering your worst worries? Well here, you {#Emph}can! {#Prev}Eventually. But first, here's a handy brochure that'll tell you {#Emph}all {#Prev}about it!" },

				EndFunctionName = "ShowDreamRunMessage",
				EndFunctionArgs = { AllowTalkOverTextLines = true },
			},

			HypnosDreamRunStart02 =
			{
				PlayOnce = true,
				RoomUseableOffSource = true,
				GameStateRequirements =
				{
					{
						PathTrue = { "GameState", "ReachedTrueEnding" },
					},
				},
				
				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = PresetEventArgs.HypnosDreamGreeting,

				{ Cue = "/VO/Hypnos_0073",
					-- Portrait = "Portrait_Hypnos_Waking_01",
					-- Portrait = "Portrait_Hypnos_Displeased_01",
					Text = "Your first Dream Dive must have worked out pretty well, because if not, you wouldn't have come back! A good night's rest deserves another, huh?" },

				{ Cue = "/VO/MelinoeField_5238", UsePlayerSource = true,
					-- Portrait = "Portrait_Mel_Vulnerable_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkExplaining01ReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "Hold a moment, Lord Hypnos. Last time we barely spoke before you whisked me off into some warped version of how my nights have gone. This is supposed to be restful?" },

				{ Cue = "/VO/Hypnos_0074",
					-- Portrait = "Portrait_Hypnos_Waking_01",
					Emote = "PortraitEmoteCheerful",
					PreLineAnim = "Hypnos_Explain_Start",
					PostLineAnim = "Hypnos_Explain_End",
					Text = "{#Emph}Sure is{#Prev}, once you get used to it! At least it is for {#Emph}me! {#Prev}Although I get to stay here while you do the kill-everything part. But I think that's the most {#Emph}exciting {#Prev}part, don't {#Emph}you?" },

				{ Cue = "/VO/MelinoeField_5408", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Vulnerable_01",
					PreLineAnim = "MelTalkBrooding01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkBrooding01ReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "I just... I can't believe these dreams of mine are so specific. Am I truly so caught up in my regular routine, that even my imagination and subconscious are obsessing over it?" },

				{ Cue = "/VO/Hypnos_0075",
					-- Emote = "PortraitEmoteCheerful",
					PreLineAnim = "Hypnos_Explain_Start",
					PostLineAnim = "Hypnos_Explain_End",
					Text = "It happens! Though don't feel bad, because if you keep doing Dream Dives, you will conquer your worst worries, and feel refreshed like {#Emph}never before! {#Prev}Now, go on and get in there!" },
			},

			HypnosDreamAboutDreamPoints01 =
			{
				PlayOnce = true,
				RoomUseableOffSource = true,
				GameStateRequirements =
				{
					{
						PathTrue = { "GameState", "ReachedTrueEnding" },
					},
					{
						Path = { "GameState", "LifetimeResourcesGained", "DreamPoints" },
						Comparison = ">=",
						Value = 30,
					},
				},
				
				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = PresetEventArgs.HypnosDreamGreeting,


				{ Cue = "/VO/MelinoeField_5240", UsePlayerSource = true,
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkExplaining01ReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "Wanted to ask, Lord Hypnos, what exactly are these Shiny Stars that I've procured from some of those strange stand-ins for the greatest threats I've had to overcome?" },

				{ Cue = "/VO/Hypnos_0076",
					-- Portrait = "Portrait_Hypnos_Waking_01",
					-- Portrait = "Portrait_Hypnos_Displeased_01",
					Emote = "PortraitEmoteCheerful",
					PreLineAnim = "Hypnos_Explain_Start",
					PostLineAnim = "Hypnos_Explain_End",
					Text = "Oh those are little signs you're doing a {#Emph}great {#Prev}job! Making progress toward conquering your worst worries and being able to experience pure, uninterrupted, {#Emph}deep sleep." },

				{ Cue = "/VO/MelinoeField_5241", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Hesitant_01",
					PreLineAnim = "MelTalkPensive01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkPensive01ReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "That certainly is an enticing goal. And how many Stars would you say it requires? Perhaps you could at least approximate." },

				{ Cue = "/VO/Hypnos_0077",
					Portrait = "Portrait_Hypnos_Displeased_01",
					PreLineThreadedFunctionName = "PlayEmoteAnimFromSource", PreLineThreadedFunctionArgs = { Emote = "PortraitEmoteCheerful", Portrait = "Portrait_Hypnos_Lounging_01", WaitTime = 6 },

					-- Portrait = "Portrait_Hypnos_Waking_01",
					Text = "Well normally it's thirty Shiny Stars, but looks like you already have that many, {#Emph}huh{#Prev}, which means... {#Emph}um{#Prev}, I will have to look that up and then get back to you!" },
			},
			HypnosDreamAboutDreamPoints02 =
			{
				PlayOnce = true,
				RoomUseableOffSource = true,
				GameStateRequirements =
				{
					{
						PathTrue = { "GameState", "ReachedTrueEnding" },
					},
					{
						PathTrue = { "GameState", "TextLinesRecord", "HypnosDreamAboutDreamPoints01" },
					},
				},
				
				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = PresetEventArgs.HypnosDreamGreeting,


				{ Cue = "/VO/MelinoeField_5242", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Hesitant_01",
					PreLineAnim = "MelTalkPensive01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkPensive01ReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "You mentioned something about needing thirty Shiny Stars, and then my worries would be cured. Am I supposed to feel any different in some way by now?" },

				{ Cue = "/VO/Hypnos_0078",
					-- Portrait = "Portrait_Hypnos_Waking_01",
					-- Portrait = "Portrait_Hypnos_Displeased_01",
					Emote = "PortraitEmoteCheerful",
					PreLineAnim = "Hypnos_Explain_Start",
					PostLineAnim = "Hypnos_Explain_End",
					Text = "For sure! You should experience a growing sense of accomplishment the more Shiny Stars you get. There's a one-to-one link! More Stars means more accomplishment, and that means better rest!" },

				{ Cue = "/VO/MelinoeField_5243", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Hesitant_01",
					PreLineAnim = "MelTalkBrooding01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkBrooding01ReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "I suppose I do feel more at ease than I did before all this, when you were fast asleep within the Crossroads still..." },

				{ Cue = "/VO/Hypnos_0079",
					Emote = "PortraitEmoteSparkly",
					PreLineAnim = "Hypnos_Explain_Start",
					PostLineAnim = "Hypnos_Explain_End",
					-- Portrait = "Portrait_Hypnos_Waking_01",
					Text = "See? {#Emph}It's working! {#Prev}And it can work {#Emph}even better {#Prev}if you get more you-know-whats. Now dive away!" },
			},

			HypnosDreamAboutWorries01 =
			{
				PlayOnce = true,
				RoomUseableOffSource = true,
				GameStateRequirements =
				{
					{
						PathTrue = { "GameState", "ReachedTrueEnding" },
					},
					{
						PathTrue = { "GameState", "TextLinesRecord", "HypnosDreamAboutDreamPoints02" },
					},
				},
				
				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = PresetEventArgs.HypnosDreamGreeting,

				{ Cue = "/VO/MelinoeField_5244", UsePlayerSource = true,
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkExplaining01ReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "Lord Hypnos, I was wondering... quite a few things, really. But, if I conquered my worst worries at this point, how come I keep facing versions of my strongest adversaries here?" },

				{ Cue = "/VO/Hypnos_0080",
					-- Portrait = "Portrait_Hypnos_Waking_01",
					-- Portrait = "Portrait_Hypnos_Displeased_01",
					Emote = "PortraitEmoteSparkly",
					PreLineAnim = "Hypnos_Explain_Start",
					PostLineAnim = "Hypnos_Explain_End",
					Text = "Well that's easy: Because you're worrying your worries {#Emph}aren't gone! {#Prev}I mean, they {#Emph}aren't {#Prev}gone since they're still {#Emph}here! {#Prev}Maybe you {#Emph}like {#Prev}having worries! Just not the worst kind." },

				{ Cue = "/VO/MelinoeField_5245", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Vulnerable_01",
					PreLineAnim = "MelTalkBrooding01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkBrooding01ReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "...I did fear that, once my task was complete and the House of Hades was restored, I might lack a sense of purpose anymore. You're suggesting I've manifested this?" },

				{ Cue = "/VO/Hypnos_0081",
					-- Portrait = "Portrait_Hypnos_Waking_01",
					PreLineAnim = "Hypnos_Explain_Start",
					PostLineAnim = "Hypnos_Explain_End",
					Text = "Sure! I like suggesting things! Anyway, just because your {#Emph}worst {#Prev}worries are conquered already, doesn't mean you can't have {#Emph}more! {#Prev}And do more Dream Dives to get rid of them!" },
			},
			HypnosDreamAboutWorries02 =
			{
				PlayOnce = true,
				RoomUseableOffSource = true,
				GameStateRequirements =
				{
					{
						PathTrue = { "GameState", "ReachedTrueEnding" },
					},
					{
						PathTrue = { "GameState", "TextLinesRecord", "HypnosDreamAboutWorries01" },
					},
				},
				
				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = PresetEventArgs.HypnosDreamGreeting,


				{ Cue = "/VO/MelinoeField_5411", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Vulnerable_01",					
					PreLineAnim = "MelTalkPensive01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkPensive01ReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "Lord Hypnos, I know I'm not supposed to worry here, but... shall I ever dream again of anything other than the reality I've grown accustomed to? This can't be it..." },

				{ Cue = "/VO/Hypnos_0218",
					-- Portrait = "Portrait_Hypnos_Waking_01",
					Portrait = "Portrait_Hypnos_Displeased_01",
					Emote = "PortraitEmoteDepressed",
					Text = "Aw, I thought you said you {#Emph}liked {#Prev}Dream Dives! You know you can stop doing these whenever you want, right?" },

				{ Cue = "/VO/MelinoeField_5412", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Empathetic_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkExplaining01ReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "I do, it's just... dreams have no limits...! I want to explore them as fully as I can! Imagine the impossible, visit places I have never seen...!" },

				{ Cue = "/VO/Hypnos_0219",
					Portrait = "Portrait_Hypnos_Displeased_01",
					Emote = "PortraitEmoteFiredUp",
					PreLineAnim = "Hypnos_Explain_Start",
					PostLineAnim = "Hypnos_Explain_End",
					Text = "Whoa now, look, you'll probably have other dreams at some point, but you won't be needing me for those, just {#Emph}these! {#Prev}And I'm doing my best, OK? I'm just {#Emph}one guy! {#Prev}Now come on." },
			},

			HypnosDreamAboutSecrecy01 =
			{
				PlayOnce = true,
				RoomUseableOffSource = true,
				GameStateRequirements =
				{
					{
						PathTrue = { "GameState", "ReachedTrueEnding" },
					},
				},
				
				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = PresetEventArgs.HypnosDreamGreeting,

				{ Cue = "/VO/Hypnos_0082",
					-- Portrait = "Portrait_Hypnos_Waking_01",
					Portrait = "Portrait_Hypnos_Displeased_01",
					Text = "Hey, {#Emph}uh{#Prev}, you haven't told anybody we've been doing Dream Dives here, have you? Because dreams can be {#Emph}very, very personal. {#Prev}And also I'm supposed to be at work." },

				{ Cue = "/VO/MelinoeField_5246", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Vulnerable_01",
					PreLineAnim = "MelTalkBrooding01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkBrooding01ReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "Lord Hypnos, you mean to say you're shirking your responsibilities to my father's House, if not the realm, just to administer these Dream Dives for me? I don't want that!" },

				{ Cue = "/VO/Hypnos_0083",
					-- Portrait = "Portrait_Hypnos_Waking_01",
					Emote = "PortraitEmoteSurprise",
					PreLineAnim = "Hypnos_Explain_Start",
					PostLineAnim = "Hypnos_Explain_End",
					Text = "No no no no no, {#Emph}of course {#Prev}you don't! {#Emph}Who would? {#Prev}The work comes first, it's just... I really like getting to do these, too. So, forget you saw me here?" },
			},

			HypnosDreamAboutTalking01 =
			{
				PlayOnce = true,
				RoomUseableOffSource = true,
				GameStateRequirements =
				{
					{
						PathTrue = { "GameState", "ReachedTrueEnding" },
					},
					{
						Path = { "GameState", "ClearedDreamRunsCache" },
						Comparison = ">=",
						Value = 1,
					},
				},
				
				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = PresetEventArgs.HypnosDreamGreeting,

				{ Cue = "/VO/Hypnos_0220",
					-- Portrait = "Portrait_Hypnos_Waking_01",
					-- Portrait = "Portrait_Hypnos_Displeased_01",
					Text = "Oh I forgot to mention, whatever you do, if you happen to see someone you recognize during a Dream Dive, do {#Emph}not {#Prev}talk to them... OK?" },

				{ Cue = "/VO/MelinoeField_5413", UsePlayerSource = true,
					Emote = "PortraitEmoteSurprise",
					Portrait = "Portrait_Mel_Vulnerable_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkExplaining01ReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "What? I've encountered realistic visages of both my closest comrades and my greatest foes, and we've already exchanged words. What have I done...?" },

				{ Cue = "/VO/Hypnos_0221",
					-- Portrait = "Portrait_Hypnos_Waking_01",
					Emote = "PortraitEmoteSparkly",
					PreLineAnim = "Hypnos_Explain_Start",
					PostLineAnim = "Hypnos_Explain_End",
					Text = "{#Emph}Um, probably {#Prev}nothing, it's just... there's not supposed to be much talking during Dream Dives. But, if you already started and you haven't lost your mind, I'm sure it's {#Emph}fine!" },
			},

			HypnosDreamAboutFates01 =
			{
				PlayOnce = true,
				RoomUseableOffSource = true,
				GameStateRequirements =
				{
					{
						PathTrue = { "GameState", "ReachedTrueEnding" },
					},
					NamedRequirementsFalse = { "ReachedEpilogue" },
				},
				
				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = PresetEventArgs.HypnosDreamGreeting,

				{ Cue = "/VO/Hypnos_0085",
					-- Portrait = "Portrait_Hypnos_Waking_01",
					-- Portrait = "Portrait_Hypnos_Displeased_01",
					PreLineAnim = "Hypnos_Explain_Start",
					PostLineAnim = "Hypnos_Explain_End",
					Text = "Hey, I know Dream Dives are exciting, and they're healthy for you, too, but... I just thought you'd like to know, some of the others in the House of Hades, they are getting {#Emph}pretty worried {#Prev}that the Fates haven't turned up!" },

				{ Cue = "/VO/MelinoeField_5249", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Vulnerable_01",
					PreLineAnim = "MelTalkPensive01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkPensive01ReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "Yes, well... I suppose it's not too likely that we'll find them in what seems to be my recurring dream here. I appreciate the gentle reminder." },

				{ Cue = "/VO/Hypnos_0086",
					-- Portrait = "Portrait_Hypnos_Waking_01",
					Emote = "PortraitEmoteCheerful",
					Text = "Sure! These Dream Dives can always wait until after you've put more important matters to bed. But for now...? Let's do another one!" },
			},
			HypnosDreamAboutFates02 =
			{
				PlayOnce = true,
				RoomUseableOffSource = true,
				GameStateRequirements =
				{
					OrRequirements =
					{
						-- higher priority in this case
						{
							{
								PathTrue = { "HypnosDreamAboutFates01" },
							},
						},
						-- lower priority in this case
						{
							{
								Path = { "GameState", "TextLinesRecord" },
								HasAll = { "HypnosDreamAboutSecrecy01", "HypnosDreamAboutMemories01" }
							},
						},
					},
					NamedRequirements = { "ReachedEpilogue" },
				},
				
				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = PresetEventArgs.HypnosDreamGreeting,

				{ Cue = "/VO/Hypnos_0087",
					Emote = "PortraitEmoteCheerful",
					-- Portrait = "Portrait_Hypnos_Waking_01",
					-- Portrait = "Portrait_Hypnos_Displeased_01",
					PreLineAnim = "Hypnos_Explain_Start",
					PostLineAnim = "Hypnos_Explain_End",
					Text = "Hey, I heard the good news! {#Emph}The Fates are back! {#Prev}Wherever they are. Personally, I never see them, seeing as I don't get out too much. Unless you count {#Emph}this!" },

				{ Cue = "/VO/MelinoeField_5250", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Proud_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkExplaining01ReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "I'm just relieved your sisters are safe and sound. So there's talk about them at the House! What's the mood like over there? Is everybody still in good spirits?" },

				{ Cue = "/VO/Hypnos_0088",
					-- Portrait = "Portrait_Hypnos_Waking_01",
					Emote = "PortraitEmoteCheerful",
					Text = "Oh {#Emph}absolutely! {#Prev}But also they're still busy cleaning up after everything that happened, you know, while I was out. So, still {#Emph}plenty {#Prev}to worry about, which is why we're {#Emph}both {#Prev}here!" },
			},

			HypnosDreamAboutSiblings01 =
			{
				PlayOnce = true,
				RoomUseableOffSource = true,
				GameStateRequirements =
				{
					{
						PathTrue = { "GameState", "ReachedTrueEnding" },
					},
				},
				
				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = PresetEventArgs.HypnosDreamGreeting,

				{ Cue = "/VO/MelinoeField_5409", UsePlayerSource = true,
					-- Portrait = "Portrait_Mel_Proud_01",
					PreLineAnim = "MelTalkPensive01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkPensive01ReturnToIdle", PostLineAnimTarget = "Hero",
					Portrait = "Portrait_Mel_Proud_01",
					Text = "If only you didn't have to leave so soon, my lord. Several of your siblings reside with me at the Crossroads, or come visit us at least... Nemesis, Charon, Moros... even Eris. They would have liked to see you off, I'm sure." },

				{ Cue = "/VO/Hypnos_0216",
					Emote = "PortraitEmoteSurprise",
					-- Portrait = "Portrait_Hypnos_Waking_01",
					-- Portrait = "Portrait_Hypnos_Displeased_01",
					PreLineAnim = "Hypnos_Explain_Start",
					PostLineAnim = "Hypnos_Explain_End",
					Text = "Oh, {#Emph}them! {#Prev}Yeah, I remember them, Charon at least. I don't know Nemesis that well, and Moros, I don't think we've met? Or maybe that was Eris. Sorry I missed them!" },

				{ Cue = "/VO/MelinoeField_5410", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Empathetic_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkExplaining01ReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "I keep having to remind myself you children of Nyx tend not to be that close. I suppose that's just the way it is with large families! I only met most of the Olympians not too long ago." },

				{ Cue = "/VO/Hypnos_0217",
					-- Portrait = "Portrait_Hypnos_Waking_01",
					Emote = "PortraitEmoteCheerful",
					Text = "I'm close with Thanatos! I know I've got other brothers and sisters, too, but he's probably my favorite. You must have favorites of your own! Mom had so many kids. Oh, Mom...!" },
			},

			HypnosDreamAboutStoryReset01 =
			{
				PlayOnce = true,
				RoomUseableOffSource = true,
				GameStateRequirements =
				{
					{
						PathFalse = { "GameState", "TextLinesRecord", "HypnosFinalDreamMeeting01" },
					},
				},
				
				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = PresetEventArgs.HypnosDreamGreeting,

				{ Cue = "/VO/MelinoeField_5251", UsePlayerSource = true,
					Emote = "PortraitEmoteSurprise",
					Portrait = "Portrait_Mel_Vulnerable_01",
					PreLineAnim = "MelTalkPensive01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkPensive01ReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "Lord Hypnos, you're... wait, you're awake...! But, you were fast asleep within the Crossroads still, I... {#Emph}oh. {#Prev}This is a dream. My dream, not yours." },

				{ Cue = "/VO/Hypnos_0089",
					-- Portrait = "Portrait_Hypnos_Waking_01",
					-- Portrait = "Portrait_Hypnos_Displeased_01",
					PreLineAnim = "Hypnos_Explain_Start",
					PostLineAnim = "Hypnos_Explain_End",
					Text = "See, the thing about dreams is, {#Emph}sometimes{#Prev}, they just don't make {#Emph}any {#Prev}sense. Well, you can always make {#Emph}some {#Prev}sense out of them if you {#Emph}think {#Prev}about it long enough, but... {#Emph}I {#Prev}wouldn't do that if I were you." },

				{ Cue = "/VO/MelinoeField_5252", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Hesitant_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkExplaining01ReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "I suppose I'm just imagining what you might say to me. Although, I imagined you'd be quite different than this. Well, I look forward to meeting you for real, soon enough." },

				{ Cue = "/VO/Hypnos_0090",
					-- Portrait = "Portrait_Hypnos_Waking_01",
					Emote = "PortraitEmoteCheerful",
					PreLineAnim = "Hypnos_Explain_Start",
					PostLineAnim = "Hypnos_Explain_End",
					Text = "Me, too! Now how about we {#Emph}never {#Prev}speak of this again, because it's {#Emph}so {#Prev}confusing that it makes me feel funny, and I don't like that! But I {#Emph}do {#Prev}like sending you on Dream Dives!" },
			},

			HypnosDreamAboutThanatosAspect01 =
			{
				PlayOnce = true,
				RoomUseableOffSource = true,
				GameStateRequirements =
				{
					{
						PathTrue = { "GameState", "ReachedTrueEnding" },
					},
					{
						PathTrue = { "CurrentRun", "Hero", "TraitDictionary", "AxePerfectCriticalAspect" },
					},
				},
				
				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = PresetEventArgs.HypnosDreamGreeting,

				{ Cue = "/VO/Hypnos_0091",
					Emote = "PortraitEmoteSurprise",
					Portrait = "Portrait_Hypnos_Displeased_01",
					Text = "{#Emph}Hey{#Prev}, my brother Thanatos, {#Emph}he {#Prev}has a scythe like that! Wait, maybe this is {#Emph}my {#Prev}dream after all? But then how come {#Emph}you're {#Prev}here rather than {#Emph}him?" },

				{ Cue = "/VO/MelinoeField_5253", UsePlayerSource = true,
					-- Portrait = "Portrait_Mel_Vulnerable_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkExplaining01ReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "Wait, you're not certain if this even {#Emph}is {#Prev}my dream? I did wonder why the intervening spaces here remind me so much of when I was in {#Emph}your {#Prev}dreams trying to wake you up." },

				{ Cue = "/VO/Hypnos_0092",
					Portrait = "Portrait_Hypnos_Displeased_01",

					PreLineThreadedFunctionName = "PlayEmoteAnimFromSource", PreLineThreadedFunctionArgs = { Emote = "PortraitEmoteCheerful", Portrait = "Portrait_Hypnos_Lounging_01", WaitTime = 10 },

					PreLineAnim = "Hypnos_Explain_Start",
					PostLineAnim = "Hypnos_Explain_End",

					Text = "{#Emph}Hm{#Prev}, come to think, Thanatos {#Emph}did {#Prev}mention someone borrowing his old scythe for a while. Though dreams {#Emph}can {#Prev}reflect our innermost desires, so seeing that thing kind of threw me off! But I am here to throw {#Emph}you {#Prev}off instead!" },
			},

			HypnosDreamAboutFamiliarCostumes01 =
			{
				PlayOnce = true,
				RoomUseableOffSource = true,
				GameStateRequirements =
				{
					{
						PathTrue = { "GameState", "ReachedTrueEnding" },
					},
					OrRequirements =
					{
						{
							{
								Path = { "GameState", "EquippedFamiliar" },
								IsAny = { "FrogFamiliar" },
							},
							{
								Path = { "GameState", "FamiliarCostumes", "FrogFamiliar" },
								IsAny = { "FamiliarCostume_FrogHell" },
							},
						},
						{
							{
								Path = { "GameState", "EquippedFamiliar" },
								IsAny = { "RavenFamiliar" },
							},
							{
								Path = { "GameState", "FamiliarCostumes", "RavenFamiliar" },
								IsAny = { "FamiliarCostume_RavenHell" },
							},
						},
						{
							{
								Path = { "GameState", "EquippedFamiliar" },
								IsAny = { "CatFamiliar" },
							},
							{
								Path = { "GameState", "FamiliarCostumes", "CatFamiliar" },
								IsAny = { "FamiliarCostume_CatChaos" },
							},
						},
						{
							{
								Path = { "GameState", "EquippedFamiliar" },
								IsAny = { "HoundFamiliar" },
							},
							{
								Path = { "GameState", "FamiliarCostumes", "HoundFamiliar" },
								IsAny = { "FamiliarCostume_HoundCute" },
							},
						},
						{
							{
								Path = { "GameState", "EquippedFamiliar" },
								IsAny = { "PolecatFamiliar" },
							},
							{
								Path = { "GameState", "FamiliarCostumes", "PolecatFamiliar" },
								IsAny = { "FamiliarCostume_PolecatMoon" },
							},
						},
					}
				},
				
				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = PresetEventArgs.HypnosDreamGreeting,

				{ Cue = "/VO/Hypnos_0101",
					Emote = "PortraitEmoteSurprise",
					Text = "{#Emph}Whoa{#Prev}, I {#Emph}like {#Prev}what you've done with your {#Emph}pet! {#Prev}Those Shiny Stars that you've been racking up do come with certain {#Emph}perks! {#Prev}Though they're mostly for show." },

				{ Cue = "/VO/MelinoeField_5261", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Proud_01",
					PreLineAnim = "MelTalkPensive01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkPensive01ReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "They do look beautiful. You know, it's quite amazing that you can connect with not just me through dream, but my Familiars as well! I've still so much to learn about all this." },

				{ Cue = "/VO/Hypnos_0102",

					PreLineAnim = "Hypnos_Explain_Start",
					PostLineAnim = "Hypnos_Explain_End",

					Text = "Oh, yeah. Learning all this took me practically {#Emph}forever! {#Prev}But {#Emph}every {#Prev}living thing has dreams... and {#Emph}dead {#Prev}things, {#Emph}too! {#Prev}Now, go get yourselves more Shiny Stars, OK?" },
			},

			HypnosDreamAboutHypnosStatue01 =
			{
				PlayOnce = true,
				RoomUseableOffSource = true,
				GameStateRequirements =
				{
					{
						PathTrue = { "GameState", "ReachedTrueEnding" },
					},
					{
						PathTrue = { "GameState", "WorldUpgrades", "Cosmetic_HypnosStatue" },
					},
				},
				
				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = PresetEventArgs.HypnosDreamGreeting,

				{ Cue = "/VO/MelinoeField_5414", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Proud_01",
					PreLineAnim = "MelTalkPensive01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkPensive01ReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "Lord Hypnos, we've a beautiful sculpture in your honor now, right in our training grounds. It's like you're watching over me there during these Dream Drives." },

				{ Cue = "/VO/Hypnos_0222",
					Emote = "PortraitEmoteSurprise",

					PreLineAnim = "Hypnos_Explain_Start",
					PostLineAnim = "Hypnos_Explain_End",

					Text = "Oh, {#Emph}that {#Prev}old thing! Glad you found a place for it. We never could, here in the House I mean. They were going to throw it out, until I said, why not send it to {#Emph}you?" },

				{ Cue = "/VO/MelinoeField_5415", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Vulnerable_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkExplaining01ReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "But, that can't be...! Such a glorious depiction of Sleep Incarnate himself might have been simply cast aside! How utterly disrespectful..." },

				{ Cue = "/VO/Hypnos_0223",

					PreLineAnim = "Hypnos_Explain_Start",
					PostLineAnim = "Hypnos_Explain_End",

					Text = "That's what {#Emph}I {#Prev}said! Well, what I said was {#Emph}aw come on{#Prev}, but what you said is what I meant! I guess this means you saved both the {#Emph}real me {#Prev}and the {#Emph}statue version, {#Prev}too! Thanks!" },
			},

			HypnosDreamAboutCosmetics01 =
			{
				PlayOnce = true,
				RoomUseableOffSource = true,
				GameStateRequirements =
				{
					{
						PathTrue = { "GameState", "ReachedTrueEnding" },
					},
					{
						Path = { "GameState", "WorldUpgradesAdded" },
						HasAll =
						{
							"Cosmetic_SkellyFloor01c",
							"Cosmetic_TrainingDummy01c",
							"Cosmetic_DoraBench02",
							"Cosmetic_ThanCutout",
							"Cosmetic_AsteriusPlush",
							"Cosmetic_DreamRug",
							"Cosmetic_Poppies",
							"Cosmetic_StarJar",
							"Cosmetic_CollectableHypnos",
							"Cosmetic_HypnosStatue",

							"FamiliarCostume_FrogHell",
							"FamiliarCostume_RavenHell",
							"FamiliarCostume_CatChaos",
							"FamiliarCostume_HoundCute",
							"FamiliarCostume_PolecatMoon",
						},
					},
				},
				
				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = PresetEventArgs.HypnosDreamGreeting,

				{ Cue = "/VO/Hypnos_0224",
					PreLineAnim = "Hypnos_Explain_Start",
					PostLineAnim = "Hypnos_Explain_End",
					Text = "I really thought you'd have your fill of Shiny Stars by now. I mean, you're out of stuff to trade for them, right? But you keep earning {#Emph}more{#Prev}, and {#Emph}more{#Prev}, and {#Emph}more!" },

				{ Cue = "/VO/MelinoeField_5416", UsePlayerSource = true,
					PreLineAnim = "MelTalkPensive01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkPensive01ReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "Is that a problem, Lord Hypnos? I thought the Stars were mainly meant to indicate how accomplished I've become at these Dream Dives. Should I be holding back?" },

				{ Cue = "/VO/Hypnos_0225",
					Emote = "PortraitEmoteSparkly",
					PreLineAnim = "Hypnos_Explain_Start",
					PostLineAnim = "Hypnos_Explain_End",

					PreLineAnim = "Hypnos_Explain_Start",
					PostLineAnim = "Hypnos_Explain_End",

					Text = "{#Emph}Oh{#Prev}, no, keep going if you want. Besides, we won't be running out of Shiny Stars anytime soon, no matter how many you get. So if you still want more... be my guest!" },
			},

			HypnosDreamAboutTimePassing01 =
			{
				PlayOnce = true,
				RoomUseableOffSource = true,
				GameStateRequirements =
				{
					{
						PathTrue = { "GameState", "ReachedTrueEnding" },
					},
					{
						SumPrevRuns = 5,
						IgnoreCurrentRun = true,
						Path = { "IsDreamRun" },
						CountPathTrue = true,
						Comparison = "<=",
						Value = 0,
					},
				},
				
				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = PresetEventArgs.HypnosDreamGreeting,

				{ Cue = "/VO/Hypnos_0103",
					Portrait = "Portrait_Hypnos_Displeased_01",

					PreLineAnim = "Hypnos_Explain_Start",
					PostLineAnim = "Hypnos_Explain_End",

					Text = "Well look who finally showed up! I was beginning to think you didn't want to see this place again. Or {#Emph}me!" },

				{ Cue = "/VO/MelinoeField_5262", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Empathetic_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkExplaining01ReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "{#Emph}Oh{#Prev}, Lord Hypnos, no it isn't that. I just have other responsibilities, the same as you. Perhaps you could visit the Crossroads again, and we could see each other there!" },

				{ Cue = "/VO/Hypnos_0104",
					Text = "Oh, maybe sometime, sure. But I was gone for long enough that I used up all of my vacation days-or-nights into the distant future, so... I'll probably just see you here. As long as you come back!" },
			},

			HypnosDreamAboutWeaponsQuest01 =
			{
				PlayOnce = true,
				RoomUseableOffSource = true,
				GameStateRequirements =
				{
					{
						PathTrue = { "GameState", "ReachedTrueEnding" },
					},
					{
						Path = { "GameState", "DreamRunClearedWithWeapons" },
						HasAll = 
						{
							"WeaponStaffSwing",
							"WeaponDagger",
							"WeaponTorch",
							"WeaponAxe",
							"WeaponLob",
							"WeaponSuit",
						},
					},					
				},
				
				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = PresetEventArgs.HypnosDreamGreeting,

				{ Cue = "/VO/Hypnos_0099",
					Emote = "PortraitEmoteSurprise",

					PreLineAnim = "Hypnos_Explain_Start",
					PostLineAnim = "Hypnos_Explain_End",

					Text = "{#Emph}Whoa{#Prev}, according to my list, you've already completed Dream Dives using {#Emph}every {#Prev}one of those secret weapons that my mom made that I'm not even supposed to know about. Good job!" },

				{ Cue = "/VO/MelinoeField_5260", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Proud_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkExplaining01ReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "You honor me, Lord Hypnos. The Arms of Night have served me well throughout my task, so I'm not surprised that they've been equally effective in my dreams." },

				{ Cue = "/VO/Hypnos_0100",
					Text = "Yeah! Though personally I {#Emph}am {#Prev}a bit surprised. This is a dream, so if {#Emph}I {#Prev}were you, I would have dreamed up weapons {#Emph}way {#Prev}stronger than {#Emph}those! {#Prev}I would have just killed everything at once! But hey, whatever works for you." },
			},

			HypnosDreamAboutMemories01 =
			{
				PlayOnce = true,
				RoomUseableOffSource = true,
				GameStateRequirements =
				{
					{
						PathTrue = { "GameState", "ReachedTrueEnding" },
					},
				},
				
				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = PresetEventArgs.HypnosDreamGreeting,

				{ Cue = "/VO/MelinoeField_5254", UsePlayerSource = true,
					-- Portrait = "Portrait_Mel_Vulnerable_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkExplaining01ReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "Lord Hypnos, I wanted to ask... how much do you recall? About what happened to the House, and all of us." },

				{ Cue = "/VO/Hypnos_0093",
					Emote = "PortraitEmoteSurprise",

					PreLineAnim = "Hypnos_Explain_Start",
					PostLineAnim = "Hypnos_Explain_End",

					Text = "Oh, {#Emph}haha{#Prev}, you mean the whole dream-memories thing that none of us are supposed to talk about! Don't worry, I'm all caught up." },

				{ Cue = "/VO/MelinoeField_5255", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Empathetic_01",
					PreLineAnim = "MelTalkPensive01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkPensive01ReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "So then, you must remember me. That's all I truly wanted to confirm, because... well, I just wasn't certain either way." },

				{ Cue = "/VO/Hypnos_0094",

					PreLineAnim = "Hypnos_Explain_Start",
					PostLineAnim = "Hypnos_Explain_End",

					Text = "That is perfectly normal, {#Emph}especially {#Prev}since we're talking in {#Emph}a dream! {#Prev}You can never be too sure, and that's where worries come from! And that's where Dream Dives come in! Ready?" },
			},

			HypnosDreamAboutRelationship01 =
			{
				PlayOnce = true,
				RoomUseableOffSource = true,
				GameStateRequirements =
				{
					{
						PathTrue = { "GameState", "ReachedTrueEnding" },
					},
					{
						Path = { "GameState", "ClearedDreamRunsCache" },
						Comparison = ">=",
						Value = 2,
					},
					{
						PathTrue = { "GameState", "TextLinesRecord", "HypnosDreamGift01" },
					},
				},
				
				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = PresetEventArgs.HypnosDreamGreeting,

				{ Cue = "/VO/MelinoeField_5256", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Empathetic_01",
					PreLineAnim = "MelTalkPensive01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkPensive01ReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "I must admit, Lord Hypnos... growing up in the Crossroads, with you there, peacefully asleep all the while... I wondered so often about you. And grew determined to see you wake." },

				{ Cue = "/VO/Hypnos_0095",
					Emote = "PortraitEmoteSparkly",
					Text = "{#Emph}Aw{#Prev}, thanks. I don't remember any of that stuff, myself. Just bits and pieces of a lot of scattered dreams! Most of them about my job, or my brother, or {#Emph}your {#Prev}brother, sometimes Dusa, Megaera once in a while... what was your question?" },

				{ Cue = "/VO/MelinoeField_5257", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Empathetic_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkExplaining01ReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "Oh, I didn't have a question, I was just... reflecting on how grateful I am to have finally met, after all this time. And that you've been willing to visit me in my own job-related dreams." },

				{ Cue = "/VO/Hypnos_0096",
					Emote = "PortraitEmoteCheerful",

					PreLineAnim = "Hypnos_Explain_Start",
					PostLineAnim = "Hypnos_Explain_End",

					Text = "You bet! I {#Emph}like {#Prev}dreams! Having them, making them, you name it! But I don't get to talk about them much back at the House. When I'm awake — I'm technically still there." },

				{ Cue = "/VO/MelinoeField_5258", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Proud_01",
					PreLineAnim = "MelTalkPensive01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkPensive01ReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "So then this works out well enough for both of us. You really don't mind if we keep on meeting like this then? I don't wish to pull you away from your responsibilities." },

				{ Cue = "/VO/Hypnos_0097",
					Text = "Well, I... don't have {#Emph}too {#Prev}many responsibilities right now, seeing as the House is {#Emph}closed{#Prev}, so... I think this is {#Emph}great! {#Prev}But I can't stay {#Emph}forever {#Prev}so it's Dream Dive time, OK?" },
			},

			HypnosDreamAboutLove01 =
			{
				PlayOnce = true,
				RoomUseableOffSource = true,
				GameStateRequirements =
				{
					{
						PathTrue = { "GameState", "ReachedTrueEnding" },
					},
					{
						PathTrue = { "GameState", "SpeechRecord", "/VO/Hypnos_0047" },
					},
					{
						PathTrue = { "GameState", "TextLinesRecord", "HypnosDreamGift01" },
					},
				},
				
				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = PresetEventArgs.HypnosDreamGreeting,

				{ Cue = "/VO/MelinoeField_5417", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Empathetic_01",
					PreLineAnim = "MelTalkPensive01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkPensive01ReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "Lord Hypnos, I don't mean to make you feel uncomfortable but I was wondering, when you departed from the Crossroads, I remember that you said... {#Emph}I love you. So long. {#Prev}What did you mean by that...?" },

				{ Cue = "/VO/Hypnos_0226",
					Emote = "PortraitEmoteSurprise",
					PreLineAnim = "Hypnos_Explain_Start",
					PostLineAnim = "Hypnos_Explain_End",
					Text = "Oh, {#Emph}haha{#Prev}, come on, what do you {#Emph}think {#Prev}I meant? {#Emph}I love you! {#Prev}I think that's pretty clear, right? It's only {#Emph}three words! {#Prev}And I wouldn't have said them if I didn't mean them." },

				{ Cue = "/VO/MelinoeField_5418", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Vulnerable_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkExplaining01ReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "But, how could you possibly love me? Even now it seems we're only starting to get to know each other. Love takes hold gradually, if at all... isn't that so?" },

				{ Cue = "/VO/Hypnos_0227",
					Portrait = "Portrait_Hypnos_Displeased_01",
					PreLineAnim = "Hypnos_Explain_Start",
					PostLineAnim = "Hypnos_Explain_End",

					PreLineThreadedFunctionName = "PlayEmoteAnimFromSource", PreLineThreadedFunctionArgs = { Emote = "None", Portrait = "Portrait_Hypnos_Lounging_01", WaitTime = 5.8 },

					Text = "Really? Look, you might know more about it than me, but... if not for you I wouldn't {#Emph}be here {#Prev}now! And not just {#Emph}anyone {#Prev}would do something like that!" },
			},
			HypnosDreamAboutLove02 =
			{
				PlayOnce = true,
				RoomUseableOffSource = true,
				GameStateRequirements =
				{
					{
						PathTrue = { "GameState", "ReachedTrueEnding" },
					},
					{
						PathTrue = { "GameState", "TextLinesRecord", "HypnosDreamAboutLove01" },
					},
				},
				
				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = PresetEventArgs.HypnosDreamGreeting,

				{ Cue = "/VO/Hypnos_0229",
					Portrait = "Portrait_Hypnos_Displeased_01",
					Text = "Hey {#Emph}um {#Prev}you don't mind the whole {#Emph}I-love-you {#Prev}thing, do you? Because you were acting {#Emph}pretty funny {#Prev}about it last time!" },

				{ Cue = "/VO/MelinoeField_5419", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Empathetic_01",
					PreLineAnim = "MelTalkPensive01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkPensive01ReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "Oh, well... I may be putting too much stock in the idea. Love isn't an uncommon feeling, more a range of feelings, really. But, it can be quite intense. Though, I'm grateful that you love me, and... I think I love you, too, Lord Hypnos! In a way." },

				{ Cue = "/VO/Hypnos_0230",
					Emote = "PortraitEmoteSparkly",
					PreLineAnim = "Hypnos_Explain_Start",
					PostLineAnim = "Hypnos_Explain_End",
					Text = "Aw, thanks! I don't remember the last time anybody told me that! Though I figured as much, I mean, why else would you have gone to so much trouble just for {#Emph}me? And {#Prev}kept doing {#Emph}Dream Dives!" },
			},
			HypnosDreamAboutLove03 =
			{
				PlayOnce = true,
				RoomUseableOffSource = true,
				GameStateRequirements =
				{
					{
						PathTrue = { "GameState", "ReachedTrueEnding" },
					},
					{
						PathTrue = { "GameState", "TextLinesRecord", "HypnosDreamAboutLove02" },
					},
				},
				
				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = PresetEventArgs.HypnosDreamGreeting,

				{ Cue = "/VO/MelinoeField_5420", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Hesitant_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkExplaining01ReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "{#Emph}Erm{#Prev}, Lord Hypnos, now that we've determined that we love one another... what do we do now?" },

				{ Cue = "/VO/Hypnos_0231",
					Emote = "PortraitEmoteFiredUp",
					Portrait = "Portrait_Hypnos_Displeased_01",
					PreLineAnim = "Hypnos_Explain_Start",
					PostLineAnim = "Hypnos_Explain_End",
					Text = "More Dream Dives, I don't know! What are we {#Emph}supposed {#Prev}to do about it? Look, can't somebody say {#Emph}I love you {#Prev}without making things {#Emph}weird?" },

				{ Cue = "/VO/MelinoeField_5421", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Vulnerable_01",
					PreLineAnim = "MelTalkPensive01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkPensive01ReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "I... I'm not certain either way, but... so you're saying this is love? There needn't be anything more to it than what we already have?" },

				{ Cue = "/VO/Hypnos_0232",
					Emote = "PortraitEmoteSparkly",
					PreLineAnim = "Hypnos_Explain_Start",
					PostLineAnim = "Hypnos_Explain_End",
					Text = "Oh we have something {#Emph}very {#Prev}special here, if you ask me, I mean, I don't do Dream Dives for just {#Emph}anyone! {#Prev}Now, let's not talk about this anymore, OK? It's making me feel funny!" },
			},

			HypnosDreamAboutJob01 =
			{
				PlayOnce = true,
				RoomUseableOffSource = true,
				GameStateRequirements =
				{
					{
						PathTrue = { "GameState", "ReachedTrueEnding" },
					},
					{
						PathTrue = { "GameState", "TextLinesRecord", "HypnosDreamAboutRelationship01" },
					},
				},
				
				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = PresetEventArgs.HypnosDreamGreeting,

				{ Cue = "/VO/MelinoeField_5259", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Vulnerable_01",
					PreLineAnim = "MelTalkPensive01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkPensive01ReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "You mentioned you don't have many responsibilities right now. Have you been holding up all right? For me, when I don't have as many things to do, I start to worry, I suppose." },

				{ Cue = "/VO/Hypnos_0098",
					Emote = "PortraitEmoteCheerful",
					Text = "Well I am glad you worry because {#Emph}that {#Prev}is why you end up {#Emph}here. {#Prev}And then so do I! And {#Emph}that's {#Prev}why I've been holding up {#Emph}just fine. {#Prev}Though... thanks for asking. So, {#Emph}um... {#Prev}bye!" },
			},

			HypnosDreamAboutSayingLittle01 =
			{
				PlayOnce = true,
				RoomUseableOffSource = true,
				GameStateRequirements =
				{
					{
						PathTrue = { "GameState", "ReachedTrueEnding" },
					},
					{
						Path = { "GameState", "TextLinesRecord" },
						HasAll = 
						{
							"HypnosDreamAboutDreamPoints02",
							"HypnosDreamAboutWeaponsQuest01",
							"HypnosDreamAboutRelationship01",
						},
					},					
				},
				
				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = PresetEventArgs.HypnosDreamGreeting,

				{ Cue = "/VO/Hypnos_0105",
					Portrait = "Portrait_Hypnos_Displeased_01",
					Text = "Hey, {#Emph}um{#Prev}, things are starting to pick up a little at the House lately, which is a {#Emph}good {#Prev}thing, {#Emph}but... {#Prev}it kind of means I may not be around quite as much. Work comes first, {#Emph}haha!" },

				{ Cue = "/VO/MelinoeField_5263", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Empathetic_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkExplaining01ReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "I understand completely, Lord Hypnos. Does this mean I should forego these Dream Dives moving forward, or what do you suggest?" },

				{ Cue = "/VO/Hypnos_0106",
					Emote = "PortraitEmoteCheerful",

					PreLineAnim = "Hypnos_Explain_Start",
					PostLineAnim = "Hypnos_Explain_End",

					Text = "Oh, I suggest a {#Emph}lot {#Prev}of things! But no, you can keep doing Dream Dives just as much as ever if you want, it's just I can't keep {#Emph}chatting {#Prev}with you like this for so long! Though I'll be seeing you around, OK? Thanks! Bye!" },
			},

			-- repeatable
			HypnosDreamRunStartChat01 =
			{
				RoomUseableOffSource = true,

				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = PresetEventArgs.HypnosDreamGreeting,

				{ Cue = "/VO/Hypnos_0048",
					Emote = "PortraitEmoteCheerful",

					PreLineAnim = "Hypnos_Explain_Start",
					PostLineAnim = "Hypnos_Explain_End",

					Text = "Got some lingering worries or nightmares getting you down? Well, {#Emph}not for long!" },
			},
			HypnosDreamRunStartChat02 =
			{
				RoomUseableOffSource = true,

				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = PresetEventArgs.HypnosDreamGreeting,

				{ Cue = "/VO/Hypnos_0049",
					Text = "Here comes your next Dive. Try not to die on this one, OK?" },
			},
			HypnosDreamRunStartChat03 =
			{
				PlayFirst = true,
				RoomUseableOffSource = true,
				GameStateRequirements =
				{
					{
						PathFalse = { "GameState", "LastDreamRunCleared" },
					},
				},

				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = PresetEventArgs.HypnosDreamGreeting,

				{ Cue = "/VO/Hypnos_0050",
					Emote = "PortraitEmoteCheerful",

					PreLineAnim = "Hypnos_Explain_Start",
					PostLineAnim = "Hypnos_Explain_End",

					Text = "I want to see you make it {#Emph}all {#Prev}the way to the end this time! Or die along the way!" },
			},
			HypnosDreamRunStartChat04 =
			{
				PlayFirst = true,
				RoomUseableOffSource = true,
				GameStateRequirements =
				{
					{
						PathTrue = { "GameState", "LastDreamRunCleared" },
					},
				},

				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = PresetEventArgs.HypnosDreamGreeting,

				{ Cue = "/VO/Hypnos_0051",

					PreLineAnim = "Hypnos_Explain_Start",
					PostLineAnim = "Hypnos_Explain_End",

					Text = "No way {#Emph}this {#Prev}Dream Dive goes as well as your last one, if you ask me!" },
			},
			HypnosDreamRunStartChat05 =
			{
				PlayFirst = true,
				RoomUseableOffSource = true,
				GameStateRequirements =
				{
					{
						PathTrue = { "GameState", "LastDreamRunCleared" },
					},
				},

				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = PresetEventArgs.HypnosDreamGreeting,

				{ Cue = "/VO/Hypnos_0052",

					PreLineAnim = "Hypnos_Explain_Start",
					PostLineAnim = "Hypnos_Explain_End",

					Text = "Let's see you get an {#Emph}even better {#Prev}night's rest than last time, OK?" },
			},
			HypnosDreamRunStartChat06 =
			{
				RoomUseableOffSource = true,

				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = PresetEventArgs.HypnosDreamGreeting,

				{ Cue = "/VO/Hypnos_0053",

					PreLineAnim = "Hypnos_Explain_Start",
					PostLineAnim = "Hypnos_Explain_End",

					Text = "Up for another Dream Dive, huh? Well that's why I'm here! Why we're {#Emph}both {#Prev}here!" },
			},
			HypnosDreamRunStartChat07 =
			{
				RoomUseableOffSource = true,

				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = PresetEventArgs.HypnosDreamGreeting,

				{ Cue = "/VO/Hypnos_0054",
					Emote = "PortraitEmoteCheerful",

					PreLineAnim = "Hypnos_Explain_Start",
					PostLineAnim = "Hypnos_Explain_End",

					Text = "A good night's rest awaits! You just have to fight with everything you've got!" },
			},
			HypnosDreamRunStartChat08 =
			{
				RoomUseableOffSource = true,

				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = PresetEventArgs.HypnosDreamGreeting,

				{ Cue = "/VO/Hypnos_0055",

					PreLineAnim = "Hypnos_Explain_Start",
					PostLineAnim = "Hypnos_Explain_End",

					Text = "Where will this Dream Dive start you off? Let's go find out!" },
			},
			-- chat 09 removed
			HypnosDreamRunStartChat10 =
			{
				PlayFirst = true,
				RoomUseableOffSource = true,

				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = PresetEventArgs.HypnosDreamGreeting,

				{ Cue = "/VO/Hypnos_0057",
					PreLineWait = 0.35,
					Portrait = "Portrait_Hypnos_Displeased_01",

					PreLineThreadedFunctionName = "PlayEmoteAnimFromSource", PreLineThreadedFunctionArgs = { Emote = "PortraitEmoteCheerful", Portrait = "Portrait_Hypnos_Lounging_01", WaitTime = 2.8 },

					Text = "...I better not be sleeping on the job right now. Anyway! Off you go!" },
			},
			HypnosDreamRunStartChat11 =
			{
				RoomUseableOffSource = true,

				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = PresetEventArgs.HypnosDreamGreeting,

				{ Cue = "/VO/Hypnos_0058",
					Emote = "PortraitEmoteCheerful",

					PreLineAnim = "Hypnos_Explain_Start",
					PostLineAnim = "Hypnos_Explain_End",

					Text = "A Dream Dive can take you anyplace! Or... maybe just eight places, I don't know!" },
			},
			HypnosDreamRunStartChat12 =
			{
				RoomUseableOffSource = true,

				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = PresetEventArgs.HypnosDreamGreeting,

				{ Cue = "/VO/Hypnos_0059",
					Emote = "PortraitEmoteCheerful",

					PreLineAnim = "Hypnos_Explain_Start",
					PostLineAnim = "Hypnos_Explain_End",

					Text = "Looks like {#Emph}you {#Prev}are ready for another Dive! And I know {#Emph}I {#Prev}am!" },
			},
			HypnosDreamRunStartChat13 =
			{
				RoomUseableOffSource = true,

				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = PresetEventArgs.HypnosDreamGreeting,

				{ Cue = "/VO/Hypnos_0060",
					Emote = "PortraitEmoteCheerful",

					PreLineAnim = "Hypnos_Explain_Start",
					PostLineAnim = "Hypnos_Explain_End",

					Text = "You want a good night's rest, you've come to the right place! Which is {#Emph}here!" },
			},
			HypnosDreamRunStartChat14 =
			{
				RoomUseableOffSource = true,

				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = PresetEventArgs.HypnosDreamGreeting,

				{ Cue = "/VO/Hypnos_0061",

					PreLineAnim = "Hypnos_Explain_Start",
					PostLineAnim = "Hypnos_Explain_End",

					Text = "I'm glad you spend so much time asleep! Because {#Emph}I {#Prev}do, too!" },
			},
			HypnosDreamRunStartChat15 =
			{
				RoomUseableOffSource = true,

				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = PresetEventArgs.HypnosDreamGreeting,

				{ Cue = "/VO/Hypnos_0062",
					Text = "Your brother's my best friend, and he says {#Emph}hi! {#Prev}I say it too sometimes..." },
			},
			HypnosDreamRunStartChat16 =
			{
				PlayFirst = true,
				RoomUseableOffSource = true,
				GameStateRequirements =
				{
					{
						PathTrue = { "CurrentRun", "Hero", "TraitDictionary", "AxePerfectCriticalAspect" },
					},
				},

				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = PresetEventArgs.HypnosDreamGreeting,

				{ Cue = "/VO/Hypnos_0063",
					Emote = "PortraitEmoteSurprise",
					Portrait = "Portrait_Hypnos_Displeased_01",

					PreLineAnim = "Hypnos_Explain_Start",
					PostLineAnim = "Hypnos_Explain_End",

					Text = "Hey, you still have my brother's scythe! He never lets {#Emph}me {#Prev}borrow it!" },
			},
			HypnosDreamRunStartChat17 =
			{
				PlayFirst = true,
				RoomUseableOffSource = true,
				GameStateRequirements =
				{
					{
						Path = { "GameState", "SpentShrinePointsCache" },
						Comparison = ">=",
						Value = 24,
					},
				},

				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = PresetEventArgs.HypnosDreamGreeting,

				{ Cue = "/VO/Hypnos_0064",
					Text = "{#Emph}Ooh{#Prev}, I can just tell that this one's going to be a {#Emph}scary {#Prev}dream...!" },
			},
			HypnosDreamRunStartChat18 =
			{
				RoomUseableOffSource = true,

				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = PresetEventArgs.HypnosDreamGreeting,

				{ Cue = "/VO/Hypnos_0065",

					PreLineAnim = "Hypnos_Explain_Start",
					PostLineAnim = "Hypnos_Explain_End",

					Text = "Back for more, huh? Well {#Emph}I {#Prev}can never get enough sleep either!" },
			},
			HypnosDreamRunStartChat19=
			{
				RoomUseableOffSource = true,

				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = PresetEventArgs.HypnosDreamGreeting,

				{ Cue = "/VO/Hypnos_0066",
					Text = "Don't even worry, I dream about the same stuff all the time!" },
			},
			HypnosDreamRunStartChat20 =
			{
				RoomUseableOffSource = true,

				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = PresetEventArgs.HypnosDreamGreeting,

				{ Cue = "/VO/Hypnos_0067",
					Text = "Oh good, you're back. Let's get you on your way! Ready?" },
			},
			HypnosDreamRunStartChat21 =
			{
				RoomUseableOffSource = true,

				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = PresetEventArgs.HypnosDreamGreeting,

				{ Cue = "/VO/Hypnos_0068",

					PreLineAnim = "Hypnos_Explain_Start",
					PostLineAnim = "Hypnos_Explain_End",

					Text = "You must really like this dream since you keep having it!" },
			},
			HypnosDreamRunStartChat22 =
			{
				RoomUseableOffSource = true,

				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = PresetEventArgs.HypnosDreamGreeting,

				{ Cue = "/VO/Hypnos_0069",
					Emote = "PortraitEmoteCheerful",

					PreLineAnim = "Hypnos_Explain_Start",
					PostLineAnim = "Hypnos_Explain_End",

					Text = "Our dreams can take us {#Emph}anywhere! {#Prev}Or places that we've been!" },
			},
		},

		GiftTextLineSets =
		{
			HypnosDreamGift01 =
			{
				PlayOnce = true,
				OnGiftTrack = false,
				Cost =
				{
					GiftPoints = 1,
				},
				GameStateRequirements =
				{
					{
						PathTrue = { "GameState", "TextLinesRecord", "HypnosDreamRunStart01" }
					},
				},

				{ Cue = "/VO/MelinoeField_5247", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Proud_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkExplaining01ReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "Might I offer you this Nectar, as a symbol of our newfound connection and my gratitude for meeting with me thus? I hear you don't have much back at the House!" },

				{ Cue = "/VO/Hypnos_0084",
					Portrait = "Portrait_Hypnos_Displeased_01",
					PostLineThreadedFunctionName = "GiftPointRefundPresentation",

					PreLineAnim = "Hypnos_Explain_Start",
					PostLineAnim = "Hypnos_Explain_End",

					Text = "Um, this is a {#Emph}dream? {#Prev}So even if you gave me something really good, it wouldn't be there after I wake up. And either I'd feel bad about that or forget the whole thing! So no thanks." },
				EndVoiceLines =
				{
					{
						PreLineWait = 0.5,
						UsePlayerSource = true,
						{ Cue = "/VO/MelinoeField_5248", Text = "...Well, we tried." },
					},
				},
			},
		},

		DeathTauntVoiceLines =
		{
			{
				PlayOnce = true,
				BreakIfPlayed = true,
				PreLineWait = 1.25,
				NoTarget = true,
				Source = { LineHistoryName = "NPC_Hypnos_DreamRun", LineHistoryNameKeepInDreamRun = true, SubtitleColor = Color.HypnosVoice },
				GameStateRequirements =
				{
					{
						Path = { "GameState", "LifetimeResourcesGained", "DreamPoints" },
						Comparison = ">=",
						Value = 30,
					},
					{
						PathTrue = { "GameState", "TextLinesRecord", "HypnosDreamAboutDreamPoints01" },
					},
					{
						PathTrue = { "CurrentRun", "IsDreamRun" },
					},
				},

				{ Cue = "/VO/Hypnos_0189", Text = "Why, you did it, you got all the stars! {#Emph}Congratulations!!" },
			},
			{
				RandomRemaining = true,
				BreakIfPlayed = true,
				PreLineWait = 1.25,
				NoTarget = true,
				Source = { LineHistoryName = "NPC_Hypnos_DreamRun", LineHistoryNameKeepInDreamRun = true, SubtitleColor = Color.HypnosVoice },
				GameStateRequirements =
				{
					{
						PathTrue = { "CurrentRun", "IsDreamRun" },
					},
					{
						PathTrue = { "CurrentRun", "DreamCleared" },
					},
				},

				{ Cue = "/VO/Hypnos_0167", Text = "You'll have a good night's rest for sure after all that!", PlayFirst = true },
				{ Cue = "/VO/Hypnos_0168", Text = "And {#Emph}that {#Prev}is what it takes to get a good night's rest!" },
				{ Cue = "/VO/Hypnos_0169", Text = "Well that's our time, so good night, and good job!" },
				{ Cue = "/VO/Hypnos_0170", Text = "{#Emph}Whew{#Prev}, you will wake up good as new after that one!" },
				{ Cue = "/VO/Hypnos_0171", Text = "{#Emph}Way to go! {#Prev}You'll be all rested up in no time now!" },
				{ Cue = "/VO/Hypnos_0172", Text = "I {#Emph}knew {#Prev}you could do it! At least I thought maybe you could!" },
				{ Cue = "/VO/Hypnos_0173", Text = "Why, you just earned yourself a good night's sleep!" },
				{ Cue = "/VO/Hypnos_0174", Text = "{#Emph}Congratulations! {#Prev}You killed everything in your dream!" },
				{ Cue = "/VO/Hypnos_0176", Text = "Hey, nice! Your worst worries are conquered for now!" },
				{ Cue = "/VO/Hypnos_0177", Text = "You did it! Thanks for not giving up on your dream!" },
				{ Cue = "/VO/Hypnos_0178", Text = "Sure enough, that was another dream fulfilled!" },
				{ Cue = "/VO/Hypnos_0179", Text = "Another Dream Dive done and added to my list!" },
				{ Cue = "/VO/Hypnos_0180", Text = "Great job, you {#Emph}earned {#Prev}those Shiny Stars tonight!" },
				{ Cue = "/VO/Hypnos_0181", Text = "You really know your way around dreams, huh?" },
				{ Cue = "/VO/Hypnos_0182", Text = "Keep this up and you won't have a single worry left!" },
				{ Cue = "/VO/Hypnos_0185", Text = "Now feel the rest and relaxation washing over you..." },
				{ Cue = "/VO/Hypnos_0186", Text = "That's it, now just keep breathing in, and breathing out..." },
				{ Cue = "/VO/Hypnos_0187", Text = "There you go! Now feel {#Emph}all {#Prev}your worries {#Emph}melt away..." },
				{ Cue = "/VO/Hypnos_0188", Text = "Now let yourself just drift away, like little butterflies..." },
				{ Cue = "/VO/Hypnos_0190", Text = "What an accomplishment, I would be {#Emph}very proud {#Prev}if I were you!" },
				{ Cue = "/VO/Hypnos_0184", Text = "Hey you did great, and {#Emph}much {#Prev}better than last time!",
					PlayFirst = true,
					GameStateRequirements =
					{
						{
							PathFalse = { "GameState", "LastDreamRunCleared" },
						},
					},
				},
				{ Cue = "/VO/Hypnos_0183", Text = "I was sure you'd mess this up again but you didn't!",
					PlayFirst = true,
					GameStateRequirements =
					{
						{
							PathFalse = { "GameState", "LastDreamRunCleared" },
						},
						{
							PathTrue = { "GameState", "SpeechRecord", "/VO/Hypnos_0184" }
						},
					},
				},
				{ Cue = "/VO/Hypnos_0191", Text = "You are {#Emph}so {#Prev}good at this I'm running out of Shiny Stars! But I'll get more.",
					PlayFirst = true,
					GameStateRequirements =
					{
						{
							Path = { "GameState", "LifetimeResourcesGained", "DreamPoints" },
							Comparison = ">=",
							Value = 100,
						},
					},
				},
				{ Cue = "/VO/Hypnos_0175", Text = "Wow, you really made it all this way! {#Emph}Again!",
					PlayFirst = true,
					GameStateRequirements =
					{
						{
							PathTrue = { "GameState", "LastDreamRunCleared" },
						},
						{
							Path = { "GameState", "LifetimeResourcesGained", "DreamPoints" },
							Comparison = ">=",
							Value = 50,
						},
					},
				},
			},
			{
				RandomRemaining = true,
				BreakIfPlayed = true,
				PreLineWait = 1.25,
				NoTarget = true,
				Source = { LineHistoryName = "NPC_Hypnos_DreamRun", LineHistoryNameKeepInDreamRun = true, SubtitleColor = Color.HypnosVoice },
				GameStateRequirements =
				{
					{
						PathTrue = { "CurrentRun", "IsDreamRun" },
					},
					{
						PathFalse = { "CurrentRun", "DreamCleared" },
					},
				},

				{ Cue = "/VO/Hypnos_0192", Text = "It's hard to get a good night's rest sometimes, huh?", OverlayAnim = "HypnosOverlay_Disappointed" },
				{ Cue = "/VO/Hypnos_0193", Text = "OK, that's enough tossing and turning for one night...!", OverlayAnim = "HypnosOverlay_Disappointed" },
				{ Cue = "/VO/Hypnos_0195", Text = "{#Emph}Aw{#Prev}, this one was a real toughie, huh...?", OverlayAnim = "HypnosOverlay_Disappointed" },
				{ Cue = "/VO/Hypnos_0196", Text = "Some nights just make you want to die, huh?", OverlayAnim = "HypnosOverlay_Disappointed" },
				{ Cue = "/VO/Hypnos_0197", Text = "Well that looked pretty painful, but nice try?" },
				{ Cue = "/VO/Hypnos_0203", Text = "Don't be sad, dreams don't usually come true!" },
				{ Cue = "/VO/Hypnos_0194", Text = "You can't get a good night's rest without a fight!",
					GameStateRequirements =
					{
						{
							PathNotEmpty = { "RequiredKillEnemies" },
						},
					},
				},
				{ Cue = "/VO/Hypnos_0198", Text = "I really thought you had this one. What was I {#Emph}thinking?!",
					PlayFirst = true,
					OverlayAnim = "HypnosOverlay_Disappointed",
					GameStateRequirements =
					{
						{
							Path = { "GameState", "ClearedDreamRunsCache" },
							Comparison = ">=",
							Value = 2,
						},
						{
							Path = { "CurrentRun", "EnteredBiomes" },
							Comparison = ">=",
							Value = 3,
						},
					},
				},
				{ Cue = "/VO/Hypnos_0202", Text = "Instead of letting them hit you like that, you should move out of the way!",
					OverlayAnim = "HypnosOverlay_Disappointed",
					GameStateRequirements =
					{
						{
							PathNotEmpty = { "RequiredKillEnemies" },
						},
					},
				},
				{ Cue = "/VO/Hypnos_0199", Text = "Come on, I know you can dream better than {#Emph}that!",
					PlayFirst = true,
					OverlayAnim = "HypnosOverlay_Disappointed",
					GameStateRequirements =
					{
						{
							Path = { "CurrentRun", "EnteredBiomes" },
							Comparison = "<=",
							Value = 2,
						},
					},
				},
				{ Cue = "/VO/Hypnos_0200", Text = "Not the {#Emph}deepest {#Prev}Dream Dive I have seen, but hey!",
					PlayFirst = true,
					GameStateRequirements =
					{
						{
							Path = { "CurrentRun", "EnteredBiomes" },
							Comparison = "<=",
							Value = 3,
						},
					},
				},
				{ Cue = "/VO/Hypnos_0201", Text = "You sure you even want a good night's rest?",
					PlayFirst = true,
					OverlayAnim = "HypnosOverlay_Disappointed",
					GameStateRequirements =
					{
						{
							Path = { "CurrentRun", "EnteredBiomes" },
							Comparison = "<=",
							Value = 2,
						},
					},
				},
				{ Cue = "/VO/Hypnos_0204", Text = "Don't feel bad! Your brother used to die to witches, too!",
					PlayFirst = true,
					GameStateRequirements =
					{
						{
							Path = { "CurrentRun", "CurrentRoom", "Name" },
							IsAny = { "F_Boss01", "F_Boss02" },
						},
					},
				},
				{ Cue = "/VO/Hypnos_0205", Text = "Beaten by a {#Emph}band?! {#Prev}Dreams sure are strange sometimes!",
					PlayFirst = true,
					GameStateRequirements =
					{
						{
							Path = { "CurrentRun", "CurrentRoom", "Name" },
							IsAny = { "G_Boss01", "G_Boss02" },
						},
					},
				},
				{ Cue = "/VO/Hypnos_0206", Text = "Cause of death, Charybdis... if I had an Obol for every time I saw {#Emph}that {#Prev}one.",
					PlayFirst = true,
					OverlayAnim = "HypnosOverlay_Disappointed",
					GameStateRequirements =
					{
						{
							Path = { "CurrentRun", "CurrentRoom", "Name" },
							IsAny = { "O_MiniBoss01", "G_Boss02" },
						},
					},
				},
				{ Cue = "/VO/Hypnos_0207", Text = "If I were you I'd dream of playing fetch with Cerberus instead of {#Emph}that!",
					PlayFirst = true,
					OverlayAnim = "HypnosOverlay_Disappointed",
					GameStateRequirements =
					{
						{
							Path = { "CurrentRun", "CurrentRoom", "Name" },
							IsAny = { "H_Boss01", "H_Boss02" },
						},
					},
				},
				{ Cue = "/VO/Hypnos_0208", Text = "{#Emph}Whoa{#Prev}, when I dream of the House of Hades, it's not like {#Emph}that!",
					PlayFirst = true,
					GameStateRequirements =
					{
						{
							Path = { "CurrentRun", "CurrentRoom", "Name" },
							IsAny = { "I_Boss01" },
						},
					},
				},
				{ Cue = "/VO/Hypnos_0209", Text = "{#Emph}Ow{#Prev}, that Cyclops {#Emph}really {#Prev}stomped you didn't he?",
					PlayFirst = true,
					GameStateRequirements =
					{
						{
							Path = { "CurrentRun", "CurrentRoom", "Name" },
							IsAny = { "N_Boss01", "N_Boss02" },
						},
					},
				},
				{ Cue = "/VO/Hypnos_0210", Text = "Someone or something shot you dead there, {#Emph}huh? {#Prev}Oh well!",
					PlayFirst = true,
					GameStateRequirements =
					{
						{
							Path = { "CurrentRun", "CurrentRoom", "Name" },
							IsAny = { "O_Boss01", "O_Boss02" },
						},
					},
				},
				{ Cue = "/VO/Hypnos_0211", Text = "Fire hurts even in dreams so my advice is {#Emph}not {#Prev}to stand in it!",
					PlayFirst = true,
					GameStateRequirements =
					{
						OrRequirements =
						{
							{
								{
									Path = { "CurrentRun", "CurrentRoom", "Name" },
									IsAny = { "P_Boss01", "H_Boss02" },
								},
							},
							{
								{
									Path = { "CurrentRun", "CurrentRoom", "RoomSetName" },
									IsAny = { "B" },
								},
							},
						}
					},
				},
				{ Cue = "/VO/Hypnos_0212", Text = "{#Emph}Whoa{#Prev}, it looked pretty cold out there to me! And painful, too!",
					PlayFirst = true,
					GameStateRequirements =
					{
						{
							Path = { "CurrentRun", "CurrentRoom", "RoomSetName" },
							IsAny = { "P" },
						},
						{
							Path = { "CurrentRun", "CurrentRoom", "Name" },
							IsNone = { "P_Boss01" },
						},
					},
				},
				{ Cue = "/VO/Hypnos_0213", Text = "{#Emph}Huh{#Prev}, don't know what you're supposed to do about {#Emph}that {#Prev}guy...",
					PlayFirst = true,
					OverlayAnim = "HypnosOverlay_Disappointed",
					GameStateRequirements =
					{
						{
							Path = { "CurrentRun", "CurrentRoom", "Name" },
							IsAny = { "Q_Boss01", "Q_Boss02" },
						},
					},
				},
				{ Cue = "/VO/Hypnos_0214", Text = "{#Emph}Hey{#Prev}, looked kind of like my best friend killed you there!",
					PlayFirst = true,
					GameStateRequirements =
					{
						{
							Path = { "CurrentRun", "CurrentRoom", "Name" },
							IsAny = { "C_Boss01" },
						},
					},
				},
				{ Cue = "/VO/Hypnos_0215", Text = "You really shouldn't let a Cyclops step on you like that!",
					PlayFirst = true,
					OverlayAnim = "HypnosOverlay_Disappointed",
					GameStateRequirements =
					{
						{
							Path = { "CurrentRun", "CurrentRoom", "Name" },
							IsAny = { "N_Boss01", "N_Boss02" },
						},
					},
				},
			},
		},
	},
}

GlobalVoiceLines.DreamRunStartLines =
{
	Queue = "Interrupt",
	{
		RandomRemaining = true,
		PreLineWait = 0.35,
		-- SuccessiveChanceToPlayAll = 0.5,
		ObjectTypes = { "NPC_Hypnos_DreamRun" },
		PreLineAnim = "Hypnos_SendOff",
		GameStateRequirements =
		{
			{
				Path = { "CurrentRun", "CurrentRoom", "Name" },
				IsAny = { "Dream_Intro" },
			},
		},

		{ Cue = "/VO/Hypnos_0126", Text = "Bye-bye!", PlayFirst = true },
		{ Cue = "/VO/Hypnos_0123", Text = "Sweet dreams!" },
		{ Cue = "/VO/Hypnos_0124", Text = "Keep on dreaming!" },
		{ Cue = "/VO/Hypnos_0125", Text = "Dream on!" },
		{ Cue = "/VO/Hypnos_0127", Text = "Bye now!" },
		{ Cue = "/VO/Hypnos_0128", Text = "Goodbye!" },
		{ Cue = "/VO/Hypnos_0129", Text = "Good night!" },
		{ Cue = "/VO/Hypnos_0130", Text = "Sleep tight!" },
		{ Cue = "/VO/Hypnos_0131", Text = "See you soon!" },
		{ Cue = "/VO/Hypnos_0132", Text = "See you!" },
		{ Cue = "/VO/Hypnos_0133", Text = "So long!" },
		{ Cue = "/VO/Hypnos_0134", Text = "You can do it!" },
		{ Cue = "/VO/Hypnos_0135", Text = "Off you go!" },
		{ Cue = "/VO/Hypnos_0136", Text = "Take care!" },
		{ Cue = "/VO/Hypnos_0137", Text = "Take it easy!" },
		{ Cue = "/VO/Hypnos_0138", Text = "Thanks for stopping by!" },
		{ Cue = "/VO/Hypnos_0228", Text = "I love you! So long!",
			PlayFirst = true,
			GameStateRequirements =
			{
				{
					PathTrue = { "GameState", "TextLinesRecord", "HypnosDreamAboutLove01" }
				},
			},
		},
	},
	{
		BreakIfPlayed = true,
		RandomRemaining = true,
		-- PlayOnce = true,
		-- PlayOnceContext = "DreamRunStartingVO",
		UsePlayerSource = true,
		SuccessiveChanceToPlay = 0.75,
		SuccessiveChanceToPlayAll = 0.25,
		GameStateRequirements =
		{
			{
				Path = { "CurrentRun", "CurrentRoom", "Name" },
				IsAny = { "Dream_Intro" },
			},
		},

		{ Cue = "/VO/MelinoeField_5268", Text = "{#Emph}Augh!", PlayFirst = true },
		{ Cue = "/VO/MelinoeField_5269", Text = "See you, my lord!" },
		{ Cue = "/VO/MelinoeField_5270", Text = "Bye now!" },
	},
}

GlobalVoiceLines.DreamRunInfoReactionLines =
{
	{
		PlayOnce = true,
		UsePlayerSource = true,
		PreLineWait = 0.8,

		{ Cue = "/VO/MelinoeField_5237", Text = "...{#Emph}All About... Dream Dives...?" },
	},
	{
		PlayOnceFromTableThisRun = true,
		RandomRemaining = true,
		BreakIfPlayed = true,
		PreLineWait = 1.6,
		SuccessiveChanceToPlayAll = 0.5,
		ObjectTypes = { "NPC_Hypnos_DreamRun" },

		{ Cue = "/VO/Hypnos_0153", Text = "Same old brochure!" },
		{ Cue = "/VO/Hypnos_0154", Text = "Need a reminder?" },
		{ Cue = "/VO/Hypnos_0155", Text = "Take your time!" },
		{ Cue = "/VO/Hypnos_0156", Text = "Nice brochure, {#Emph}huh?", PlayFirst = true },
	},
}

GlobalVoiceLines.HypnosStandeeSpottedVoiceLines =
{
	PlayOnce = true,
	PlayOnceContext = "HypnosStandeeSpottedVO",
	UsePlayerSource = true,
	Cooldowns =
	{
		{ Name = "MelinoeAnyQuipSpeech", Time = 4 },
	},
	SkipCooldownCheckIfNonePlayed = true,

	{ Cue = "/VO/MelinoeField_5447", Text = "That looks like Hypnos...", PlayFirst = true },
	{ Cue = "/VO/MelinoeField_5449", Text = "Is that you, Lord Hypnos...?" },
	{ Cue = "/VO/MelinoeField_5448", Text = "It's Hypnos, in a way...",
		GameStateRequirements =
		{
			{
				Path = { "CurrentRun", "EnteredBiomes" },
				Comparison = "==",
				Value = 2,
			},
			{
				PathTrue = { "GameState", "SpeechRecord", "/VO/MelinoeField_5447" },
			},
		},
	},
	{ Cue = "/VO/MelinoeField_5450", Text = "Another Hypnos there...",
		GameStateRequirements =
		{
			{
				Path = { "CurrentRun", "EnteredBiomes" },
				Comparison = "==",
				Value = 3,
			},
			{
				PathTrue = { "GameState", "SpeechRecord", "/VO/MelinoeField_5447" },
			},
		},
	},
	{ Cue = "/VO/MelinoeField_5441", Text = "Odd sort of cauldron...",
		GameStateRequirements =
		{
			{
				Path = { "CurrentRun", "EnteredBiomes" },
				Comparison = "==",
				Value = 3,
			},
			{
				PathTrue = { "GameState", "SpeechRecord", "/VO/MelinoeField_5450" },
			},
		},
	},
}

GlobalVoiceLines.HypnosStandeeOnHitVoiceLines =
{
	RandomRemaining = true,
	BreakIfPlayed = true,
	PreLineWait = 0.25,
	Source = { LineHistoryName = "NPC_Hypnos_DreamRun_Alt", LineHistoryNameKeepInDreamRun = true, SubtitleColor = Color.HypnosVoice },
	GameStateRequirements =
	{
		{
			PathFromArgs = true,
			Path = { "SourceProjectile", },
			IsNone = { "FrogFamiliarLand", "CatFamiliarPounce", "ShadeMercSpiritball" },
		},
		ChanceToPlay = 0.15,
	},
	SkipCooldownCheckIfNonePlayed = true,
	Cooldowns =
	{
		{ Name = "HypnosSpokeRecently", Time = 10 },
	},

	{ Cue = "/VO/Hypnos_0147", Text = "{#Emph}Hey...!", PlayFirst = true },
	{ Cue = "/VO/Hypnos_0148", Text = "Hey come on!" },
	{ Cue = "/VO/Hypnos_0149", Text = "What did I {#Emph}do?" },
	{ Cue = "/VO/Hypnos_0150", Text = "Just take it easy!" },
	{ Cue = "/VO/Hypnos_0151", Text = "Whoa {#Emph}relax!" },
	{ Cue = "/VO/Hypnos_0152", Text = "{#Emph}<Yawn>" },
}

GlobalVoiceLines.HypnosPostBossVoiceLines =
{
	RandomRemaining = true,
	PreLineWait = 1.25,
	NoTarget = true,
	Source = { LineHistoryName = "NPC_Hypnos_DreamRun", LineHistoryNameKeepInDreamRun = true, SubtitleColor = Color.HypnosVoice },
	SuccessiveChanceToPlayAll = 0.75,
	GameStateRequirements =
	{
		OrRequirements =
		{
			{
				{
					Path = { "GameState", "RoomsEntered", "Dream_PostBoss01" },
					Comparison = ">=",
					Value = 2,
				},
			},
			{
				{
					Path = { "GameState", "RoomsEntered", "Dream_PostBoss02" },
					Comparison = ">=",
					Value = 1,
				},
			},
		},
		ChanceToPlay = 0.5,
	},

	TriggerCooldowns = { "MelinoeAnyQuipSpeech", "DreamPostBossEntranceVO" },
	TriggerCooldownsImmediately = true,

	{ Cue = "/VO/Intercom_8243", Text = "Way to go, I think you're doing {#Emph}great!" },
	{ Cue = "/VO/Intercom_8244", Text = "Good job so far but you've got more places to go!" },
	{ Cue = "/VO/Intercom_8245", Text = "You're getting somewhere all right! {#Emph}Keep going!" },
	{ Cue = "/VO/Intercom_8246", Text = "Whatever you do, don't stay in there too long!" },
	{ Cue = "/VO/Intercom_8247", Text = "I know you can do this! I think you can at least!" },
	{ Cue = "/VO/Intercom_8250", Text = "Let's see you keep this up! Or die trying!" },
	{ Cue = "/VO/Intercom_8251", Text = "You got {#Emph}this {#Prev}far, but can you make it all the way?" },
	{ Cue = "/VO/Intercom_8252", Text = "Yeah, keep fighting with everything you've got!" },
	{ Cue = "/VO/Intercom_8253", Text = "I know where you're going next but I'm not going to tell!" },
	{ Cue = "/VO/Intercom_8254", Text = "Wait'll you see where this Dream Dive takes you next!" },
	{ Cue = "/VO/Intercom_8271", Text = "Dreams take you to the strangest places huh?" },
	{ Cue = "/VO/Intercom_8262", Text = "You're doing great, but don't let up {#Emph}or else!",
		GameStateRequirements =
		{
			{
				FunctionName = "RequiredHealthFraction",
				FunctionArgs = { Comparison = ">=", Value = 0.8, },
			},
		},
	},
	{ Cue = "/VO/Intercom_8248", Text = "{#Emph}Ow{#Prev}, they really got you good back there, huh?",
		OverlayAnim = "HypnosOverlay_Disappointed",
		GameStateRequirements =
		{
			{
				FunctionName = "RequiredHealthFraction",
				FunctionArgs = { Comparison = "<=", Value = 0.33, },
			},
		},
	},
	{ Cue = "/VO/Intercom_8249", Text = "Now {#Emph}that {#Prev}was a close call back there!",
		GameStateRequirements =
		{
			{
				FunctionName = "RequiredHealthFraction",
				FunctionArgs = { Comparison = "<=", Value = 0.33, },
			},
		},
	},
	{ Cue = "/VO/Intercom_8255", Text = "Hey, you survived the {#Emph}easy stage!",
		GameStateRequirements =
		{
			{
				Path = { "CurrentRun", "EnteredBiomes" },
				Comparison = "==",
				Value = 1,
			},
		},
	},
	{ Cue = "/VO/Intercom_8256", Text = "Now {#Emph}that {#Prev}wasn't so tough, was it?",
		GameStateRequirements =
		{
			{
				Path = { "CurrentRun", "EnteredBiomes" },
				Comparison = "==",
				Value = 1,
			},
		},
	},
	{ Cue = "/VO/Intercom_8257", Text = "Still a {#Emph}long {#Prev}way to go... but good job!",
		GameStateRequirements =
		{
			{
				Path = { "CurrentRun", "EnteredBiomes" },
				Comparison = "==",
				Value = 1,
			},
		},
	},
	{ Cue = "/VO/Intercom_8258", Text = "Welcome to the House of Hades! Move along!",
		GameStateRequirements =
		{
			{
				Path = { "CurrentRun", "EnteredBiomes" },
				Comparison = "==",
				Value = 1,
			},
		},
	},
	{ Cue = "/VO/Intercom_8259", Text = "It only gets tougher from here!",
		GameStateRequirements =
		{
			{
				Path = { "CurrentRun", "EnteredBiomes" },
				Comparison = "==",
				Value = 1,
			},
		},
	},
	{ Cue = "/VO/Intercom_8260", Text = "Take a breather if you want but I think you'll be {#Emph}fine!",
		GameStateRequirements =
		{
			{
				Path = { "CurrentRun", "EnteredBiomes" },
				Comparison = "==",
				Value = 2,
			},
		},
	},
	{ Cue = "/VO/Intercom_8261", Text = "Don't get {#Emph}too {#Prev}comfortable, you're not there {#Emph}yet!",
		GameStateRequirements =
		{
			{
				Path = { "CurrentRun", "EnteredBiomes" },
				Comparison = "==",
				Value = 2,
			},
		},
	},
	{ Cue = "/VO/Intercom_8263", Text = "{#Emph}Um {#Prev}don't go snooping here OK?",
		OverlayAnim = "HypnosOverlay_Disappointed",
		GameStateRequirements =
		{
			{
				Path = { "CurrentRun", "EnteredBiomes" },
				Comparison = "==",
				Value = 2,
			},
		},
	},
	{ Cue = "/VO/Intercom_8264", Text = "I don't know whose stuff this is, do {#Emph}you?",
		OverlayAnim = "HypnosOverlay_Disappointed",
		GameStateRequirements =
		{
			{
				Path = { "CurrentRun", "EnteredBiomes" },
				Comparison = "==",
				Value = 2,
			},
		},
	},
	{ Cue = "/VO/Intercom_8265", Text = "Keep going, you are {#Emph}almost there!",
		GameStateRequirements =
		{
			{
				Path = { "CurrentRun", "EnteredBiomes" },
				Comparison = "==",
				Value = 3,
			},
		},
	},
	{ Cue = "/VO/Intercom_8266", Text = "I think you're going to make it {#Emph}all the way!",
		GameStateRequirements =
		{
			{
				Path = { "CurrentRun", "EnteredBiomes" },
				Comparison = "==",
				Value = 3,
			},
			{
				FunctionName = "RequiredHealthFraction",
				FunctionArgs = { Comparison = ">=", Value = 0.7, },
			},
		},
	},
	{ Cue = "/VO/Intercom_8267", Text = "You've come this far, and that's three quarters of the way!",
		GameStateRequirements =
		{
			{
				Path = { "CurrentRun", "EnteredBiomes" },
				Comparison = "==",
				Value = 3,
			},
		},
	},
	{ Cue = "/VO/Intercom_8268", Text = "Just think of those four Shiny Stars you can still get!",
		GameStateRequirements =
		{
			{
				Path = { "CurrentRun", "EnteredBiomes" },
				Comparison = "==",
				Value = 3,
			},
		},
	},
	{ Cue = "/VO/Intercom_8269", Text = "Keep this up, and you'll earn four more Shiny Stars!",
		GameStateRequirements =
		{
			{
				Path = { "CurrentRun", "EnteredBiomes" },
				Comparison = "==",
				Value = 3,
			},
		},
	},
	{ Cue = "/VO/Intercom_8270", Text = "Now {#Emph}this {#Prev}is a deep Dive you're on!",
		GameStateRequirements =
		{
			{
				Path = { "CurrentRun", "EnteredBiomes" },
				Comparison = "==",
				Value = 3,
			},
		},
	},
	{ Cue = "/VO/Intercom_8272", Text = "One last stop and then this Dive is done!",
		GameStateRequirements =
		{
			{
				Path = { "CurrentRun", "EnteredBiomes" },
				Comparison = "==",
				Value = 3,
			},
		},
	},
	{ Cue = "/VO/Intercom_8273", Text = "You made it this far, {#Emph}keep it up! {#Prev}Or don't.",
		GameStateRequirements =
		{
			{
				Path = { "CurrentRun", "EnteredBiomes" },
				Comparison = "==",
				Value = 3,
			},
		},
	},
	{ Cue = "/VO/Intercom_8274", Text = "{#Emph}Hah {#Prev}that old lady didn't stand a {#Emph}chance!",
		PlayFirst = true,
		GameStateRequirements =
		{
			{
				FunctionName = "RequiredHealthFraction",
				FunctionArgs = { Comparison = ">=", Value = 0.75, },
			},
			{
				Path = { "CurrentRun", "PrevDreamBiome" },
				IsAny = { "F" },
			},
		},
	},
	{ Cue = "/VO/Intercom_8275", Text = "If I was that old lady I'd keep summoning more witches the whole time!",
		PlayFirst = true,
		GameStateRequirements =
		{
			{
				Path = { "CurrentRun", "PrevDreamBiome" },
				IsAny = { "F" },
			},
		},
	},
	{ Cue = "/VO/Intercom_8276", Text = "Good job killing that music band back there!",
		PlayFirst = true,
		GameStateRequirements =
		{
			{
				Path = { "CurrentRun", "PrevDreamBiome" },
				IsAny = { "G" },
			},
		},
	},
	{ Cue = "/VO/Intercom_8277", Text = "That was a pretty good performance back there! I mean the band!",
		PlayFirst = true,
		GameStateRequirements =
		{
			{
				Path = { "CurrentRun", "PrevDreamBiome" },
				IsAny = { "G" },
			},
		},
	},
	{ Cue = "/VO/Intercom_8278", Text = "Oh wow, you beat Master's dog!",
		PlayFirst = true,
		GameStateRequirements =
		{
			{
				Path = { "CurrentRun", "PrevDreamBiome" },
				IsAny = { "H" },
			},
		},
	},
	{ Cue = "/VO/Intercom_8279", Text = "And here I thought all Cerberus could do was sit around!",
		PlayFirst = true,
		GameStateRequirements =
		{
			{
				Path = { "CurrentRun", "PrevDreamBiome" },
				IsAny = { "H" },
			},
		},
	},
	{ Cue = "/VO/Intercom_8280", Text = "That was a pretty tough old man you beat back there!",
		PlayFirst = true,
		GameStateRequirements =
		{
			{
				Path = { "CurrentRun", "PrevDreamBiome" },
				IsAny = { "I" },
			},
		},
	},
	{ Cue = "/VO/Intercom_8281", Text = "Time doesn't {#Emph}stop {#Prev}in Dream Dives, it {#Emph}flies right by!",
		PlayFirst = true,
		GameStateRequirements =
		{
			{
				Path = { "CurrentRun", "PrevDreamBiome" },
				IsAny = { "I" },
			},
		},
	},
	{ Cue = "/VO/Intercom_8282", Text = "I wouldn't dream of hitting a blind Cyclops but that's just me!",
		PlayFirst = true,
		OverlayAnim = "HypnosOverlay_Disappointed",
		GameStateRequirements =
		{
			{
				Path = { "CurrentRun", "PrevDreamBiome" },
				IsAny = { "N" },
			},
		},
	},
	{ Cue = "/VO/Intercom_8283", Text = "I like to cover my eyes {#Emph}just {#Prev}like that {#Emph}Cyclops {#Prev}back there. But {#Emph}I {#Prev}have {#Emph}two!",
		PlayFirst = true,
		GameStateRequirements =
		{
			{
				Path = { "CurrentRun", "PrevDreamBiome" },
				IsAny = { "N" },
			},
		},
	},
	{ Cue = "/VO/Intercom_8284", Text = "If I had wings like that one lady I'd have flown out of the way!",
		PlayFirst = true,
		GameStateRequirements =
		{
			{
				Path = { "CurrentRun", "PrevDreamBiome" },
				IsAny = { "O" },
			},
		},
	},
	{ Cue = "/VO/Intercom_8285", Text = "{#Emph}Whoa {#Prev}wasn't that one of my sisters you just killed?!",
		PlayFirst = true,
		OverlayAnim = "HypnosOverlay_Disappointed",
		GameStateRequirements =
		{
			{
				Path = { "CurrentRun", "PrevDreamBiome" },
				IsAny = { "O" },
			},
			{
				PathTrue = { "GameState", "SpeechRecord", "/VO/Intercom_8284" },
			},
		},
	},
	{ Cue = "/VO/Intercom_8286", Text = "That guy you fought knows {#Emph}everything{#Prev}, including {#Emph}how to lose!",
		PlayFirst = true,
		GameStateRequirements =
		{
			{
				Path = { "CurrentRun", "PrevDreamBiome" },
				IsAny = { "P" },
			},
		},
	},
	{ Cue = "/VO/Intercom_8287", Text = "You beat that unarmed, bleeding, Eagle-guy again, {#Emph}good job!",
		PlayFirst = true,
		GameStateRequirements =
		{
			{
				Path = { "CurrentRun", "PrevDreamBiome" },
				IsAny = { "P" },
			},
			{
				PathTrue = { "GameState", "SpeechRecord", "/VO/Intercom_8286" },
			},
		},
	},
	{ Cue = "/VO/Intercom_8288", Text = "{#Emph}Whoaaa {#Prev}you took on both those guys and {#Emph}won?",
		PlayFirst = true,
		GameStateRequirements =
		{
			{
				Path = { "CurrentRun", "PrevDreamBiome" },
				IsAny = { "P" },
			},
			{
				PathTrue = { "CurrentRun", "EnemyKills", "Heracles" },
			},
		},
	},
	{ Cue = "/VO/Intercom_8289", Text = "That couldn't have been Heracles back there?!",
		PlayFirst = true,
		OverlayAnim = "HypnosOverlay_Disappointed",
		GameStateRequirements =
		{
			{
				Path = { "CurrentRun", "PrevDreamBiome" },
				IsAny = { "P" },
			},
			{
				PathTrue = { "CurrentRun", "EnemyKills", "Heracles" },
			},
			{
				PathTrue = { "GameState", "SpeechRecord", "/VO/Intercom_8288" },
			},
		},
	},
	{ Cue = "/VO/Intercom_8291", Text = "What even {#Emph}was {#Prev}that thing you killed, it's {#Emph}huge!",
		PlayFirst = true,
		OverlayAnim = "HypnosOverlay_Disappointed",
		GameStateRequirements =
		{
			{
				Path = { "CurrentRun", "PrevDreamBiome" },
				IsAny = { "Q" },
			},
		},
	},
	{ Cue = "/VO/Intercom_8290", Text = "You're even scarier than that monster you just beat!",
		PlayFirst = true,
		GameStateRequirements =
		{
			{
				Path = { "CurrentRun", "PrevDreamBiome" },
				IsAny = { "Q" },
			},
			{
				PathTrue = { "GameState", "SpeechRecord", "/VO/Intercom_8291" },
			},
		},
	},
	{ Cue = "/VO/Intercom_8292", Text = "I can't believe you slept through all of that!",
		PlayFirst = true,
		OverlayAnim = "HypnosOverlay_Disappointed",
		GameStateRequirements =
		{
			{
				Path = { "CurrentRun", "PrevDreamBiome" },
				IsAny = { "Q" },
			},
			{
				PathTrue = { "CurrentRun", "RoomsEntered", "Q_Boss02" },
			},
		},
	},
	{ Cue = "/VO/Intercom_8293", Text = "I thought for {#Emph}sure {#Prev}you'd die back there, {#Emph}well done!",
		PlayFirst = true,
		GameStateRequirements =
		{
			{
				Path = { "CurrentRun", "PrevDreamBiome" },
				IsAny = { "Q" },
			},
			{
				PathTrue = { "CurrentRun", "RoomsEntered", "Q_Boss02" },
			},
		},
	},
}

OverwriteTableKeys( EnemyData, UnitSetData.NPC_Hypnos )