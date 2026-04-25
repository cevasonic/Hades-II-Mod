UnitSetData.NPC_Hermes =
{
	-- Hermes, Id = TKTK
	NPC_Hermes_01 =
	{
		InheritFrom = { "NPC_Neutral", "NPC_Giftable" },
		GenusName = "HermesUpgrade",
		UseText = "NPCUseTextTalk",
		Portrait = "Portrait_Hermes_InPerson_01",
		AnimOffsetZ = 0,
		Groups = { "NPCs" },
		SubtitleColor = Color.HermesVoice,
		EmoteOffsetY = -280,
		EmoteOffsetX = 50,

		SpeakerName = "Hermes",
		LoadPackages = { "Hermes", },
		Speaker = "NPC_Hermes_01",
		ThemeMusic = "/Music/ArtemisTheme_MC",
		InvincibubbleScale = 1.0,
		AlwaysShowInvulnerabubbleOnInvulnerableHit = true,
		TurnInPlaceAnimation = "Hermes_Turn",
		PreEventFunctionName = "AngleNPCToHero",

		BoxAnimation = "DialogueSpeechBubbleLight",
		BoxExitAnimation = "DialogueSpeechBubbleLightOut",
		NarrativeTextColor = Color.DialogueTextLight,
		NameplateSpeakerNameColor = Color.DialogueSpeakerNameOlympian,
		NameplateDescriptionColor = {145, 45, 90, 255},

		SetupEvents =
		{
			{
				FunctionName = "SilenceForDreamRun",
				Args =
				{
					BlockInteract = true,
				},
				GameStateRequirements =
				{
					{
						PathTrue = { "CurrentRun", "IsDreamRun" },
					},
					{
						PathFalse = { "CurrentRun", "Hero", "IsDead" },
					},
				},
			},
			{
				FunctionName = "OverwriteSelf",
				Args =
				{
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
					{
						PathFalse = { "CurrentRun", "Hero", "IsDead" },
					},
				},
			},
			{
				FunctionName = "GenericPresentation",
				Args =
				{
					SetModel = "HermesDream_Mesh",
					SetAnimation = "Hermes_Idle",
				},
				GameStateRequirements =
				{
					{
						PathTrue = { "CurrentRun", "IsDreamRun" },
					},
					{
						PathFalse = { "CurrentRun", "Hero", "IsDead" },
					},
				},
			},
		},

		ActivateRequirements =
		{
		},
		SpecialInteractFunctionName = "SpecialInteractSalute",
		SpecialInteractGameStateRequirements =
		{
			{
				-- PathTrue = { "GameState", "UseRecord", "HermesUpgrade" },
			},
		},
		SpecialInteractCooldown = 60,
		InteractVoiceLines =
		{
			{
				PreLineWait = 0.3,
				SuccessiveChanceToPlay = 0.2,
				-- RandomRemaining = true,
				UsePlayerSource = true,
				Cooldowns =
				{
					{ Name = "MelinoeSaluteSpeech", Time = 4 },
				},
				{ Cue = "/VO/Melinoe_1884", Text = "Lord Hermes, go unseen." },
			},
			{ GlobalVoiceLines = "SaluteVoiceLines" },
			{
				RandomRemaining = true,
				PreLineWait = 0.25,
				PreLineAnim = "Hermes_Greeting",
				ObjectType = "NPC_Hermes_01",

				{ Cue = "/VO/Hermes_0128", Text = "You too!",
					GameStateRequirements =
					{
						{
							Path = { "LastLinePlayed" },
							IsAny = { "/VO/Melinoe_1884" },
						},
					},
				},
				{ Cue = "/VO/Hermes_0129", Text = "Hey hey!",
					GameStateRequirements =
					{
						{
							Path = { "LastLinePlayed" },
							IsAny = { "/VO/Melinoe_1698_2" },
						},
					},
				},
				{ Cue = "/VO/Hermes_0130", Text = "Hey!",
					GameStateRequirements =
					{
						{
							Path = { "LastLinePlayed" },
							IsAny = { "/VO/Melinoe_1699_2" },
						},
					},
				},
				{ Cue = "/VO/Hermes_0131", Text = "Fierce!",
					GameStateRequirements =
					{
						{
							Path = { "LastLinePlayed" },
							IsAny = { "/VO/Melinoe_1700_2" },
						},
					},
				},
				{ Cue = "/VO/Hermes_0132", Text = "Cheers!",
					GameStateRequirements =
					{
						{
							Path = { "LastLinePlayed" },
							IsAny = { "/VO/Melinoe_1884" },
						},
					},
				},
				{ Cue = "/VO/Hermes_0133", Text = "Same!",
					GameStateRequirements =
					{
						{
							Path = { "LastLinePlayed" },
							IsAny = { "/VO/Melinoe_1701_2", "/VO/Melinoe_1703_2" },
						},
					},
				},
				{ Cue = "/VO/Hermes_0134", Text = "Yep!",
					GameStateRequirements =
					{
						{
							Path = { "LastLinePlayed" },
							IsAny = { "/VO/Melinoe_1703_2", "/VO/Melinoe_1709_2" },
						},
					},
				},
				{ Cue = "/VO/Hermes_0135", Text = "Sure!",
					GameStateRequirements =
					{
						{
							Path = { "LastLinePlayed" },
							IsAny = { "/VO/Melinoe_1705_2", "/VO/Melinoe_1709_2" },
						},
					},
				},
				{ Cue = "/VO/Hermes_0159", Text = "OK!" },
			},

		},

		RepulseOnMeleeInvulnerableHit = 150,
		OnHitVoiceLines =
		{
			RandomRemaining = true,
			BreakIfPlayed = true,
			PreLineWait = 0.25,
			ObjectType = "NPC_Hermes_01",
			-- SkipCooldownCheckIfNonePlayed = true,
			ChanceToPlay = 0.5,
			Cooldowns =
			{
				{ Name = "HermesSpokeRecently", Time = 4 },
			},

			{ Cue = "/VO/Hermes_0146", Text = "Anytime...!" },
			{ Cue = "/VO/Hermes_0147", Text = "Hey, {#Emph}erm...?", PlayFirst = true },
			{ Cue = "/VO/Hermes_0408", Text = "Too slow!" },
			{ Cue = "/VO/Hermes_0148", Text = "Hello?" },
			{ Cue = "/VO/Hermes_0149", Text = "Come on already, M..." },
			{ Cue = "/VO/Hermes_0144", Text = "Nope." },
			{ Cue = "/VO/Hermes_0409", Text = "Nope!" },
			{ Cue = "/VO/Hermes_0145", Text = "{#Emph}Mm-mm." },
		},

		InteractTextLineSets =
		{
			HermesFirstPickUp =
			{
				PlayOnce = true,
				UseableOffSource = true,
				UseRoomContextArt = true,
				GameStateRequirements =
				{
					{
						Path = { "CurrentRun", "CurrentRoom", "RoomSetName" },
						IsNone = { "Q" },
					},
				},

				{ Cue = "/VO/Hermes_0071",
					Portrait = "Portrait_Hermes_InPerson_01",
					Speaker = "HermesUpgrade",
					-- PreLineAnim = "Hermes_Greeting",
					-- PreLineAnim = "Hermes_Explaining",
					PreLineThreadedFunctionName = "PlayCharacterAnim",
					PreLineThreadedFunctionArgs = { Name = "Hermes_Greeting", WaitTime = 0.2, AngleNPCToHero = true },
					Text = "How's things, you good? I'm good. Mostly! And good to see your task is underway, but change of plan, though it's a lot to ask: Up for a visit to Olympus sometime soon?" },
				{ Cue = "/VO/MelinoeField_2003", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Hesitant_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "Lord Hermes, just a moment, what do you mean {#Emph}Olympus? {#Prev}My task is to stop Chronos in the Underworld. I can hardly breathe the surface air, much less get to a mountaintop!" },
				{ Cue = "/VO/Hermes_0072",
					Speaker = "HermesUpgrade",
					PreLineAnim = "Hermes_Explaining",
					Text = "Come on, M! You have your ways! Gramps is up to something bad, more than his usual attacks, so just give it some thought. I wouldn't ask if it was nothing, right? Now got to run, and so do you. I'll be in touch by Boon!" },
				EndVoiceLines =
				{
					{
						PreLineWait = 0.4,
						ObjectType = "NPC_Hermes_01",
						{ Cue = "/VO/Hermes_0073", Text = "So long for now!" },
					},
					{
						PreLineWait = 0.35,
						UsePlayerSource = true,
						{ Cue = "/VO/MelinoeField_2004", Text = "Goodbye!" },
					},
				},

				EndFunctionName = "RemoveHermesInPerson",
				EndFunctionArgs = {},
			},

			HermesFieldAboutTyphon01 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				GameStateRequirements =
				{
					{
						Path = { "CurrentRun", "CurrentRoom", "Name" },
						IsAny = { "Q_PreBoss01" },
					},
				},

				{ Cue = "/VO/Hermes_0175",
					Portrait = "Portrait_Hermes_InPerson_01",
					Speaker = "HermesUpgrade",
					--[[
					PreLineThreadedFunctionName = "PlayCharacterAnim",
					PreLineThreadedFunctionArgs = { Name = "Hermes_Greeting", WaitTime = 0.2, AngleNPCToHero = true },
					]]--

					PreLineThreadedFunctionName = "PlayEmoteAnimFromSource", PreLineThreadedFunctionArgs = { Emote = "None", Portrait = "Portrait_Hermes_InPerson_Serious_01", WaitTime = 1.4 },

					Text = "You made it all the way up here, that's great! Except what isn't great is Typhon, you've run into him already probably? A mountain-sized monstrosity and all his brood?" },
				{ Cue = "/VO/MelinoeField_2967", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Intense_01",
					PreLineAnim = "MelTalkBrooding01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "This storm, this... infestation. All of this is Typhon's doing, then? How did he get here? How do we stop him?" },
				{ Cue = "/VO/Hermes_0176",
					Portrait = "Portrait_Hermes_InPerson_Serious_01",
					Speaker = "HermesUpgrade",
					PreLineAnim = "Hermes_Explaining",
					Text = "No easy answers for you, M, except Gramps brought this on us, all part of his plan. The others can hold fast awhile in Pop's Palace but they need your help. I better report to Hec!" },
				EndVoiceLines =
				{
					{
						PreLineWait = 0.4,
						ObjectType = "NPC_Hermes_01",
						{ Cue = "/VO/Hermes_0177", Text = "Be safe!" },
					},
					{
						PreLineWait = 0.3,
						UsePlayerSource = true,
						{ Cue = "/VO/MelinoeField_2968", Text = "You, too..." },
					},
				},

				EndFunctionName = "RemoveHermesInPerson",
				EndFunctionArgs = { SkipBoonDrop = true, WaitTime = 0.6 },
			},

			HermesFieldAboutTyphon02 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				GameStateRequirements =
				{
					{
						Path = { "CurrentRun", "CurrentRoom", "Name" },
						IsAny = { "Q_PreBoss01" },
					},
					{
						PathTrue = { "GameState", "TextLinesRecord", "HermesFieldAboutTyphon01" },
					},
					{
						Path = { "GameState", "TextLinesRecord" },
						HasAny = { "HecateAboutFates01", "HecateBossAboutFates01" },
					},
				},

				{ Cue = "/VO/Hermes_0178",
					Portrait = "Portrait_Hermes_InPerson_Serious_01",
					Speaker = "HermesUpgrade",
					Text = "Can't shake the feeling that I failed you here, M. I was supposed to figure out what Gramps was up to, but I wasn't quick enough. So now you're fighting Typhon face to face!" },
				{ Cue = "/VO/MelinoeField_3174", UsePlayerSource = true,
					PreLineAnim = "MelTalkBrooding01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "Lord Hermes, we'll have to go through everything that could have turned out differently once all of this is over. But for now, our present matters seem more urgent than the past." },
				{ Cue = "/VO/Hermes_0179",
					Portrait = "Portrait_Hermes_InPerson_Serious_01",
					Speaker = "HermesUpgrade",
					PreLineAnim = "Hermes_Explaining",
					Text = "I know. You're right. It's just I'm starting to accept that all of this is what Gramps wanted to achieve: first capture the Three Fates so they can't mess with {#Emph}him{#Prev}, then wake up Typhon so he can mess with {#Emph}us...! {#Prev}Then take over everything." },
				{ Cue = "/VO/MelinoeField_3175", UsePlayerSource = true,
					PreLineAnim = "MelTalkBrooding01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "You didn't know all the details, but long since figured out Chronos was up to something big. Had you not acted swiftly then, I wouldn't be here now. We wouldn't have this chance." },
				{ Cue = "/VO/Hermes_0180",
					Portrait = "Portrait_Hermes_InPerson_01",
					Speaker = "HermesUpgrade",
					PreLineAnim = "Hermes_Greeting",
					Text = "I prefer guarantees to chances, M! But hey, you're right. We do the best we can with what we've got." },
				EndVoiceLines =
				{
					{
						PreLineWait = 0.4,
						ObjectType = "NPC_Hermes_01",
						{ Cue = "/VO/Hermes_0155", Text = "See you!" },
					},
					{
						PreLineWait = 0.3,
						UsePlayerSource = true,
						{ Cue = "/VO/MelinoeField_3032", Text = "See you." },
					},
				},

				EndFunctionName = "RemoveHermesInPerson",
				EndFunctionArgs = { SkipBoonDrop = true, WaitTime = 0.6 },
			},

			HermesFieldAboutTyphon03 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				GameStateRequirements =
				{
					{
						Path = { "CurrentRun", "CurrentRoom", "Name" },
						IsAny = { "Q_PreBoss01" },
					},
					{
						PathTrue = { "GameState", "TextLinesRecord", "ZeusPalaceMeeting02" },
					},
					{
						PathFalse = { "GameState", "TyphonDefeatedWithStormStop" },
					},
				},

				{ Cue = "/VO/Hermes_0258",
					Portrait = "Portrait_Hermes_InPerson_01",
					Speaker = "HermesUpgrade",
					PreLineThreadedFunctionName = "PlayCharacterAnim",
					PreLineThreadedFunctionArgs = { Name = "Hermes_Greeting", WaitTime = 0.2, AngleNPCToHero = true },
					Text = "You've knocked Typhon around a bit, but he's still plenty mad. Isn't there something you or Hec can do to make him maybe go away for good?" },
				{ Cue = "/VO/MelinoeField_4214", UsePlayerSource = true,
					PreLineAnim = "MelTalkBrooding01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "If by {#Emph}make him go away for good {#Prev}you mean have his whole existence flash before his many eyes before he's finally destroyed, then yes, that's in the works. But it may take some time." },
				{ Cue = "/VO/Hermes_0259",
					Portrait = "Portrait_Hermes_InPerson_01",
					Speaker = "HermesUpgrade",
					Text = "Oh great! Can't do things quick if they don't take some time. Well then don't let me keep you from your research, see you later, M!" },
				EndVoiceLines =
				{
					{
						PreLineWait = 0.3,
						UsePlayerSource = true,
						-- { Cue = "/VO/MelinoeField_4215", Text = "Take care..." },
						{ Cue = "/VO/MelinoeField_3031", Text = "Take care!" },
					},
				},

				EndFunctionName = "RemoveHermesInPerson",
				EndFunctionArgs = { SkipBoonDrop = true, WaitTime = 0.6 },
			},

			HermesFieldAboutTyphonDeath01 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				GameStateRequirements =
				{
					{
						Path = { "CurrentRun", "CurrentRoom", "Name" },
						IsAny = { "Q_PreBoss01" },
					},
					{
						PathTrue = { "GameState", "ReachedTrueEnding" },
					},
					{
						PathTrue = { "GameState", "TyphonDefeatedWithStormStop" },
					},
				},

				{ Cue = "/VO/Hermes_0265",
					Portrait = "Portrait_Hermes_InPerson_Serious_01",
					Speaker = "HermesUpgrade",
					PreLineThreadedFunctionName = "PlayCharacterAnim",
					PreLineThreadedFunctionArgs = { Name = "Hermes_Greeting", WaitTime = 0.2, AngleNPCToHero = true },
					Text = "Now {#Emph}wait{#Prev}, is Typhon gone, or isn't he? Because there's been no sign of him but now Gramps has these little time-pockets, and once we go in, it's like Typhon never left!" },
				{ Cue = "/VO/MelinoeField_4220", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Hesitant_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "That's more or less a way to understand it, but... how are you even {#Emph}here? {#Prev}I didn't realize Grandfather was sending others through. Do you even know how to get back?" },
				{ Cue = "/VO/Hermes_0266",
					Portrait = "Portrait_Hermes_InPerson_01",
					Speaker = "HermesUpgrade",
					Text = "I run fast enough, I can get back! Gramps also left the others with the means to get us out, and we're keeping a close eye on him. I better take a look around!" },
				EndVoiceLines =
				{
					{
						PreLineWait = 0.32,
						UsePlayerSource = true,
						{ Cue = "/VO/MelinoeField_4221", Text = "Careful out there!" },
					},
				},

				EndFunctionName = "RemoveHermesInPerson",
				EndFunctionArgs = { SkipBoonDrop = true, WaitTime = 0.6 },
			},

			HermesFieldAboutPalace01 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				GameStateRequirements =
				{
					{
						Path = { "CurrentRun", "CurrentRoom", "Name" },
						IsAny = { "Q_PreBoss01" },
					},
				},

				{ Cue = "/VO/Hermes_0186",
					Portrait = "Portrait_Hermes_InPerson_01",
					Speaker = "HermesUpgrade",
					PreLineThreadedFunctionName = "PlayCharacterAnim",
					PreLineThreadedFunctionArgs = { Name = "Hermes_Greeting", WaitTime = 0.2, AngleNPCToHero = true },
					Text = "Don't fret too much about Pop's Palace up there, M! Old Typhon's big and strong and all but he can't crush what he can't see! Well, not as easily as if he {#Emph}could {#Prev}see it." },
				{ Cue = "/VO/MelinoeField_3178", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Vulnerable_01",
					PreLineAnim = "MelTalkPensive01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "That's not entirely assuring. So Lord Uncle Zeus and the rest have concealed their seat of power, leaving Typhon to direct his fury at this fortress?" },
				{ Cue = "/VO/Hermes_0187",
					Portrait = "Portrait_Hermes_InPerson_01",
					Speaker = "HermesUpgrade",
					PreLineAnim = "Hermes_Explaining",
					Text = "Yep, more or less! They figure that if we have to take on Typhon, and we do, this is the perfect spot! After all, it's a long way down from the summit. A {#Emph}quick {#Prev}way down, mind!" },

				EndFunctionName = "RemoveHermesInPerson",
				EndFunctionArgs = { SkipBoonDrop = true, WaitTime = 0.6 },
			},
			HermesFieldAboutPalace02 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				GameStateRequirements =
				{
					{
						Path = { "CurrentRun", "CurrentRoom", "Name" },
						IsAny = { "Q_PreBoss01" },
					},
					{
						PathTrue = { "GameState", "RoomsEntered", "Q_Story01" },
					},
				},

				{ Cue = "/VO/Hermes_0260",
					Portrait = "Portrait_Hermes_InPerson_01",
					Speaker = "HermesUpgrade",
					PreLineThreadedFunctionName = "PlayCharacterAnim",
					PreLineThreadedFunctionArgs = { Name = "Hermes_Greeting", WaitTime = 0.2, AngleNPCToHero = true },
					Text = "So, what did you think of Pop's Palace? Finally got to see the glory with your own eyes, M! A serious accomplishment given you're not supposed to be up here at all." },
				{ Cue = "/VO/MelinoeField_4216", UsePlayerSource = true,
					PreLineAnim = "MelTalkPensive01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "The Palace of Zeus wasn't like any place I'd ever seen... it's very beautiful, but very bright. I don't know how you all could live up there. But you must feel the same about where I'm from." },
				{ Cue = "/VO/Hermes_0261",
					Portrait = "Portrait_Hermes_InPerson_01",
					Speaker = "HermesUpgrade",
					PreLineAnim = "Hermes_Explaining",
					Text = "Well I for one quite like it dark but I've spent more time in the Underworld than everybody else up here combined! As for the Palace, least it's kept us safe in all of this!" },
				EndVoiceLines =
				{
					{
						PreLineWait = 0.32,
						UsePlayerSource = true,
						{ Cue = "/VO/MelinoeField_4217", Text = "Let's keep it that way." },
					},
				},

				EndFunctionName = "RemoveHermesInPerson",
				EndFunctionArgs = { SkipBoonDrop = true, WaitTime = 0.6 },
			},
			HermesFieldAboutPalace03 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				GameStateRequirements =
				{
					{
						Path = { "CurrentRun", "CurrentRoom", "Name" },
						IsAny = { "Q_PreBoss01" },
					},
					{
						PathTrue = { "GameState", "TextLinesRecord", "ZeusPalacePostTrueEnding01" },
					},
					--[[
					{
						Path = { "GameState", "SpeechRecord" },
						HasAny = { "/VO/Storyteller_0484", "/VO/Storyteller_0487" }
					},
					]]--
				},

				{ Cue = "/VO/Hermes_0262",
					Portrait = "Portrait_Hermes_InPerson_01",
					Speaker = "HermesUpgrade",
					PreLineThreadedFunctionName = "PlayCharacterAnim",
					PreLineThreadedFunctionArgs = { Name = "Hermes_Greeting", WaitTime = 0.2, AngleNPCToHero = true },
					Text = "Too bad Pop's Palace is shut down for now, heightened security, something like that. You don't mind do you? No need to dally over there if you ask me." },

				{ Cue = "/VO/MelinoeField_4218", UsePlayerSource = true,
					PreLineWait = 0.35,
					Portrait = "Portrait_Mel_Casual_01",
					PreLineAnim = "MelTalkPensive01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "...No, between us, I don't really mind at all. I can still keep up with the King and Queen and all the rest by Boon, and this means I can get back a little sooner on a good night." },

				{ Cue = "/VO/Hermes_0263",
					Portrait = "Portrait_Hermes_InPerson_01",
					Speaker = "HermesUpgrade",
					PreLineAnim = "Hermes_Explaining",
					Text = "See, that's exactly how I look at it! The sooner you get past that massive monster likely lurking behind that huge gate back there, the sooner you can rest up for the {#Emph}next {#Prev}one!" },

				EndVoiceLines =
				{
					{
						PreLineWait = 0.32,
						UsePlayerSource = true,
						{ Cue = "/VO/MelinoeField_4219", Text = "Then let's go." },
					},
				},

				EndFunctionName = "RemoveHermesInPerson",
				EndFunctionArgs = { SkipBoonDrop = true, WaitTime = 0.6 },
			},

			HermesFieldAboutCharon01 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				GameStateRequirements =
				{
					{
						PathTrue = { "GameState", "ReachedTrueEnding" },
					},
					{
						Path = { "CurrentRun", "CurrentRoom", "Name" },
						IsAny = { "Q_PreBoss01" },
					},
					{
						Path = { "GameState", "TextLinesRecord" },
						HasAll = { "ZeusPalacePostTrueEnding01", "HadesWithPersephoneGift02", "CharonPostTrueEnding01" },
					},
					{
						SumPrevRuns = 5,
						Path = { "TextLinesRecord", "TrueEndingFinale01" },
						CountPathTrue = true,
						Comparison = "==",
						Value = 0,
					},
				},

				{ Cue = "/VO/MelinoeField_4224", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Proud_01",
					PreLineThreadedFunctionName = "PlayCharacterAnim",
					PreLineThreadedFunctionArgs = { Name = "MelTalkPensive01", WaitTime = 1, UsePlayerSource = true },
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "How's everything with you and Charon been, now that the Underworld is no longer under Titan governance?" },

				{ Cue = "/VO/Hermes_0291",
					Portrait = "Portrait_Hermes_InPerson_01",
					Speaker = "HermesUpgrade",
					PreLineThreadedFunctionName = "PlayCharacterAnim",
					PreLineThreadedFunctionArgs = { Name = "Hermes_Greeting", WaitTime = 0.2, AngleNPCToHero = true },
					Text = "Oh, it's been great! Which is to say it hasn't changed too much. He can't go back to ferrying Shades of the dead until the Underworld is up and running like it used to be." },

				{ Cue = "/VO/MelinoeField_4225", UsePlayerSource = true,
					PreLineWait = 0.35,
					-- Portrait = "Portrait_Mel_Hesitant_01",
					PreLineAnim = "MelTalkPensive01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "My impression is that may take a while. Father is meticulous about taking stock of everything that's changed, and doesn't want to rush into reopening till everything is prepared." },

				{ Cue = "/VO/Hermes_0292",
					Portrait = "Portrait_Hermes_InPerson_01",
					Speaker = "HermesUpgrade",
					PreLineAnim = "Hermes_Explaining",
					Text = "You lost me after {#Emph}doesn't want to rush{#Prev}, honestly, M. Long as your father knows he's got some helping hands available whenever he may need." },

				EndVoiceLines =
				{
					{
						PreLineWait = 0.32,
						UsePlayerSource = true,
						{ Cue = "/VO/MelinoeField_4226", Text = "I can remind him if need be!" },
					},
				},

				EndFunctionName = "RemoveHermesInPerson",
				EndFunctionArgs = { SkipBoonDrop = true, WaitTime = 0.6 },
			},

			HermesFieldAboutBusiness01 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				GameStateRequirements =
				{
					{
						PathFalse = { "GameState", "TyphonDefeatedWithStormStop" },
					},
					{
						Path = { "CurrentRun", "CurrentRoom", "Name" },
						IsAny = { "Q_PreBoss01" },
					},
					{
						Path = { "GameState", "LastBossHealthBarRecord", "TyphonHead" },
						Comparison = ">",
						Value = 0,
					},
				},

				{ Cue = "/VO/Hermes_0188",
					Portrait = "Portrait_Hermes_InPerson_Serious_01",
					Speaker = "HermesUpgrade",
					Text = "All right, M, I don't want to hold you up now that you're here, you've got important business after all. Just making sure you made it in one piece!" },
				{ Cue = "/VO/MelinoeField_3179", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Hesitant_01",
					PreLineAnim = "MelTalkPensive01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "Still in one piece, Lord Hermes, but we'll see how long {#Emph}that {#Prev}sticks. Though who knows? Perhaps Typhon will flatten me, instead of tearing me to shreds." },
				{ Cue = "/VO/Hermes_0189",
					Portrait = "Portrait_Hermes_InPerson_Serious_01",
					Speaker = "HermesUpgrade",
					PreLineAnim = "Hermes_Explaining",
					Text = "Oh that is grim. Although you know what else is? This {#Emph}entire {#Prev}situation we're in. I mean, {#Emph}look {#Prev}at this place! So how about we both get out of here?" },

				EndFunctionName = "RemoveHermesInPerson",
				EndFunctionArgs = { SkipBoonDrop = true, WaitTime = 0.6 },
			},

			HermesFieldAboutSurfaceShop01 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				GameStateRequirements =
				{
					{
						Path = { "CurrentRun", "CurrentRoom", "Name" },
						IsAny = { "Q_PreBoss01" },
					},
					{
						PathTrue = { "SessionMapState", "HasSurfaceShopDelivery" },
					},
				},

				{ Cue = "/VO/Hermes_0181",
					Portrait = "Portrait_Hermes_InPerson_01",
					Speaker = "HermesUpgrade",
					PreLineThreadedFunctionName = "PlayCharacterAnim",
					PreLineThreadedFunctionArgs = { Name = "Hermes_Greeting", WaitTime = 0.2, AngleNPCToHero = true },
					Text = "You should have everything you ordered from my special shrine, with faster shipping, free of charge! Now comes the hard part. Think you're ready for it, M?" },
				{ Cue = "/VO/MelinoeField_3176", UsePlayerSource = true,
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "I'd be less ready were it not for you. Thank you for meeting with me here. Does Olympus know you're doing this?" },
				{ Cue = "/VO/Hermes_0182",
					Portrait = "Portrait_Hermes_InPerson_01",
					Speaker = "HermesUpgrade",
					PreLineAnim = "Hermes_Explaining",
					Text = "They know I'm out delivering supplies! We're all on the same side anyway, right? No need to bore them with the details when they've got their hands completely full." },
				EndVoiceLines =
				{
					{
						PreLineWait = 0.4,
						ObjectType = "NPC_Hermes_01",
						{ Cue = "/VO/Hermes_0183", Text = "I'm off!" },
					},
					{
						PreLineWait = 0.3,
						UsePlayerSource = true,
						{ Cue = "/VO/MelinoeField_3030", Text = "Farewell!" },
					},
				},

				EndFunctionName = "RemoveHermesInPerson",
				EndFunctionArgs = { SkipBoonDrop = true, WaitTime = 0.6 },
			},

			HermesFieldAboutSupport01 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				GameStateRequirements =
				{
					{
						Path = { "CurrentRun", "CurrentRoom", "Name" },
						IsAny = { "Q_PreBoss01" },
					},
					{
						PathTrue = { "GameState", "ReachedTrueEnding" },
					},
					{
						PathTrue = { "GameState", "TextLinesRecord", "HermesGift06" }
					},
					{
						Path = { "GameState", "SurfaceShopPurchases", },
						Comparison = ">=",
						Value = 25,
					},
				},

				{ Cue = "/VO/Hermes_0253",
					Portrait = "Portrait_Hermes_InPerson_01",
					Speaker = "HermesUpgrade",
					PreLineThreadedFunctionName = "PlayCharacterAnim",
					PreLineThreadedFunctionArgs = { Name = "Hermes_Greeting", WaitTime = 0.2, AngleNPCToHero = true },
					Text = "Knew I could count on you here, M, not just with Typhon, but my special shrines! You've donated a lot of coin to a good cause, so {#Emph}cheers!" },

				{ Cue = "/VO/MelinoeField_4209", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Hesitant_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "What cause would that be, now that you mention it? Lord Charon's been working to destroy all the coins he can get his hands on... you're not racing to do the same, are you?" },

				{ Cue = "/VO/Hermes_0254",
					Portrait = "Portrait_Hermes_InPerson_01",
					Speaker = "HermesUpgrade",
					PreLineAnim = "Hermes_Explaining",

					-- heart unlock
					PostLineThreadedFunctionName = "RelationshipAdvancedPresentation",
					PostLineThreadedFunctionArgs = { Delay = 1.5 },

					Text = "Call it a bit of healthy competition between professional associates. He had a head start and has got the upper hand for now, but thanks to you, I have been catching up!" },

				EndVoiceLines =
				{
					{
						PreLineWait = 0.32,
						UsePlayerSource = true,
						{ Cue = "/VO/MelinoeField_4210", Text = "You can do it! But so can he." },
					},
				},

				EndFunctionName = "RemoveHermesInPerson",
				EndFunctionArgs = { SkipBoonDrop = true, WaitTime = 0.6 },
			},

			HermesFieldAboutGold01 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				GameStateRequirements =
				{
					{
						Path = { "CurrentRun", "CurrentRoom", "Name" },
						IsAny = { "Q_PreBoss01" },
					},
					{
						Path = { "GameState", "EnemyKills", "TyphonHead" },
						Comparison = ">=",
						Value = 2,
					},
					OrRequirements =
					{
						-- currently low on money
						{
							{
								Path = { "GameState", "Resources", "Money" },
								Comparison = "<=",
								Value = 200,
							},
						},
						-- Hermes already queued this conversation
						{
							{
								PathFromSource = true,
								Path = { "NextInteractLines", "Name" },
								IsAny = { "HermesFieldAboutGold01" },
							},
						},
					},
				},

				{ Cue = "/VO/Hermes_0267",
					Portrait = "Portrait_Hermes_InPerson_01",
					Speaker = "HermesUpgrade",
					PreLineThreadedFunctionName = "PlayCharacterAnim",
					PreLineThreadedFunctionArgs = { Name = "Hermes_Greeting", WaitTime = 0.2, AngleNPCToHero = true },
					Text = "Not too much coin you've got there, M. I'd spot you some, it's just that my professional associate, he's very strict about not passing it about unnecessarily and all." },

				{ Cue = "/VO/MelinoeField_4222", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Proud_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "Oh that's all right. I really ought be able to withstand the rage of Typhon with or without these very tempting wares." },

				{ Cue = "/VO/Hermes_0268",
					Portrait = "Portrait_Hermes_InPerson_01",
					Speaker = "HermesUpgrade",
					PreLineAnim = "Hermes_Explaining",

					Text = "Now {#Emph}that's {#Prev}an attitude! Might be just a little overconfident there, mind, but then again you've taken down some monsters once or twice!" },

				EndVoiceLines =
				{
					{
						PreLineWait = 0.32,
						UsePlayerSource = true,
						{ Cue = "/VO/MelinoeField_4223", Text = "And it's time for some more." },
					},
				},

				EndFunctionName = "RemoveHermesInPerson",
				EndFunctionArgs = { SkipBoonDrop = true, WaitTime = 0.6 },
			},

			HermesFieldAboutLittleToSay01 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				GameStateRequirements =
				{
					{
						PathTrue = { "GameState", "ReachedTrueEnding" },
					},
					{
						Path = { "CurrentRun", "CurrentRoom", "Name" },
						IsAny = { "Q_PreBoss01" },
					},
				},

				{ Cue = "/VO/Hermes_0387",
					Portrait = "Portrait_Hermes_InPerson_01",
					Speaker = "HermesUpgrade",
					PreLineThreadedFunctionName = "PlayCharacterAnim",
					PreLineThreadedFunctionArgs = { Name = "Hermes_Greeting", WaitTime = 0.2, AngleNPCToHero = true },
					Text = "It's getting busier for me again, M, so I'll likely need to keep these little conversations nice and quick." },

				{ Cue = "/VO/MelinoeField_4227", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Proud_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelinoeIdleWeaponless", PostLineAnimTarget = "Hero",
					Text = "Of course, Lord Hermes. I don't expect you to take time out of your schedule just for my sake. Do as you must." },

				{ Cue = "/VO/Hermes_0388",
					Portrait = "Portrait_Hermes_InPerson_01",
					Speaker = "HermesUpgrade",
					PreLineAnim = "Hermes_Explaining",
					Text = "I always do, but I did want to tell you cheers again, for coming all this way not just tonight but when I asked you in the first place, way back when. See you when you stop by, all right? Briefly, but still." },

				EndVoiceLines =
				{
					{
						PreLineWait = 0.32,
						UsePlayerSource = true,
						{ Cue = "/VO/MelinoeField_4228", Text = "See you!" },
					},
				},

				EndFunctionName = "RemoveHermesInPerson",
				EndFunctionArgs = { SkipBoonDrop = true, WaitTime = 0.6 },
			},

			-- partner conversations
			HermesWithHecate01 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				GiftableOffSource = true,
				Partner = "NPC_Hecate_01",
				UseText = "UseListenNPC",
				SkipPreEventFunction = true,
				AngleTowardTargetId = 556921,
				InteractDistance = 400,

				GameStateRequirements =
				{
					{
						PathTrue = { "GameState", "ReachedTrueEnding" },
					},
					{
						PathTrue = { "CurrentRun", "Hero", "IsDead" }
					},
					{
						Path = { "GameState", "TextLinesRecord" },
						HasAll =
						{
							"NyxWithHecate01",
							"NemesisWithHecate02",
						},
					},
					{
						PathFalse = { "CurrentRun", "TextLinesRecord", "FatesEpilogue01" }
					},
				},
				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = PresetEventArgs.HermesHubGreeting,
				OnQueuedThreadedFunctionName = "CenterInteractRange",

				{ Cue = "/VO/Hermes_0293",
					Text = "What can I say? It's been a real pleasure, Hec. Always has. Cheers for taking me into the fold and all, and I'll be keeping you informed. You've got my guarantee!" },

				{ Cue = "/VO/Hecate_0875", Source = "NPC_Hecate_01",
					PreLineAnim = "HecateHubGreet", PreLineAnimTarget = 556921,
					Portrait = "Portrait_Hec_Default_01", 
					Text = "And you've my gratitude, Hermes. If not for you, we would have been entirely caught out, and things would have gone worse. Shall you be visiting more frequently henceforth?" },

				{ Cue = "/VO/Hermes_0294",
					Text = "Don't think I can just yet, Pop doesn't want me running off so much, the family's got a lot of messages they want to send. But I'll keep well in touch with you and M, all right?" },

				EndVoiceLines =
				{
					PreLineWait = 0.4,
					ObjectType = "NPC_Hecate_01",
					{ Cue = "/VO/Hecate_0876", Text = "Of course. Then hurry back." },
				},

				EndFunctionName = "RemoveHermesInPerson",
				EndFunctionArgs = { SkipBoonDrop = true, WaitTime = 1.0 },
			},

		},
		-- @ remember to update 'special conversations' list above

		GiftTextLineSets =
		{
			HermesFieldGiftDecline01 =
			{
				PlayOnce = true,
				Cost =
				{
					SuperGiftPoints = 1,
				},
				SkipGiftPresentationPost = true,
				GameStateRequirements =
				{
					{
						Path = { "GameState", "RoomsEntered", "Q_PreBoss01" },
						Comparison = ">=",
						Value = 3,
					},
					{
						Path = { "GameState", "TextLinesRecord" },
						HasAll = { "HermesGift05" },
					},
					{
						Path = { "GameState", "TextLinesRecord" },
						HasNone = { "HermesGift08" },
					},
				},
				{ Cue = "/VO/MelinoeField_4211", UsePlayerSource = true,
					Portrait = "Portrait_Mel_Proud_01",
					PreLineAnim = "MelTalkExplaining01", PreLineAnimTarget = "Hero",
					PostLineAnim = "MelTalkExplaining01ReturnToIdle", PostLineAnimTarget = "Hero",
					Text = "Lord Hermes, I've a little gift for you while we're both here, if you don't mind! May this Ambrosia ensure you're always as light on your feet as can be!" },
					
				{ Cue = "/VO/Hermes_0255",
					PostLineThreadedFunctionName = "SuperGiftPointRefundPresentation",
					Text = "Really appreciate this, M, but can't accept. Wouldn't do if I showed up with a bunch of Ambrosia right now, no matter how much {#Emph}I {#Prev}or {#Emph}anyone {#Prev}might want a sip. Though, cheers!" },
			},
		},

	},
}

-- Global Hermes Lines
GlobalVoiceLines.HermesFirstSpawnVoiceLines =
{
	Queue = "Interrupt",
	{
		GameStateRequirements =
		{
			{
				Path = { "CurrentRun", "CurrentRoom", "RoomSetName" },
				IsNone = { "H", "Q" },
			},
			{
				Path = { "CurrentRun", "CurrentRoom", "Name" },
				IsNone = { "F_PreBoss01" },
			},
		},
		{
			PreLineWait = 0.5,
			ObjectType = "NPC_Hermes_01",

			{ Cue = "/VO/Hermes_0070", Text = "{#Emph}Whew! {#Prev}Hey M! I'm back!" },
		},
		{
			UsePlayerSource = true,

			{ Cue = "/VO/MelinoeField_2000", Text = "You are!" },
		},
	},
	-- special conversations in Q_PreBoss01
	{
		GameStateRequirements =
		{
			{
				Path = { "CurrentRun", "CurrentRoom", "Name" },
				IsAny = { "Q_PreBoss01" },
			},
			{
				FunctionName = "RequiredQueuedTextLine",
				FunctionArgs =
				{
					IsAny =
					{
						"HermesFieldAboutTyphon01",
						"HermesFieldAboutTyphon02",
						"HermesFieldAboutTyphon03",
						"HermesFieldAboutTyphonDeath01",
						"HermesFieldAboutPalace01",
						"HermesFieldAboutPalace02",
						"HermesFieldAboutPalace03",
						"HermesFieldAboutSurfaceShop01",
						"HermesFieldAboutCharon01",
						"HermesFieldAboutBusiness01",
						"HermesFieldAboutSupport01",
						"HermesFieldAboutGold01",
						"HermesFieldAboutLittleToSay01",
					},
				},
			},
		},
		{
			RandomRemaining = true,
			PreLineWait = 0.4,
			-- SuccessiveChanceToPlayAll = 0.65,
			AllowTalkOverTextLines = true,
			ObjectType = "NPC_Hermes_01",
			Cooldowns =
			{
				{ Name = "HermesSpokeRecently", Time = 4 },
			},

			{ Cue = "/VO/Hermes_0127", Text = "Hey hey!", PlayFirst = true },
			{ Cue = "/VO/Hermes_0129", Text = "Hey hey!", PlayFirst = true },
			{ Cue = "/VO/Hermes_0130", Text = "Hey!", PlayFirst = true },
			{ Cue = "/VO/Hermes_0156", Text = "Hey M!" },
			{ Cue = "/VO/Hermes_0234", Text = "Here's what's in stock." },
			{ Cue = "/VO/Hermes_0233", Text = "See anything you like?" },
			{ Cue = "/VO/Hermes_0232", Text = "How about a resupply?" },
			{ Cue = "/VO/Hermes_0229", Text = "What'll it be?" },
			{ Cue = "/VO/Hermes_0230", Text = "Something you need?" },
			{ Cue = "/VO/Hermes_0231", Text = "May I take your order?" },
		},
		{
			RandomRemaining = true,
			PreLineWait = 0.25,
			UsePlayerSource = true,
			SuccessiveChanceToPlay = 0.75,
			SuccessiveChanceToPlayAll = 0.15,
			TriggerCooldowns = { "HermesSpokeRecently" },

			{ Cue = "/VO/MelinoeField_2966", Text = "Hermes, you're here!", PlayFirst = true, PlayOnce = true },
			{ Cue = "/VO/MelinoeField_3027", Text = "Lord Hermes!" },
			{ Cue = "/VO/MelinoeField_3028", Text = "Lord Hermes." },
			{ Cue = "/VO/MelinoeField_3029", Text = "Hermes!" },
			{ Cue = "/VO/MelinoeField_2001", Text = "Lord Hermes...!",
				GameStateRequirements =
				{
					{
						Path = { "GameState", "EnemyKills", "TyphonHead" },
						Comparison = ">=",
						Value = 3,
					},
				},
			},
		},
	},
	-- general appearances in Q_PreBoss01
	{
		RandomRemaining = true,
		BreakIfPlayed = true,
		PreLineWait = 0.35,
		SuccessiveChanceToPlayAll = 0.5,
		ObjectType = "NPC_Hermes_01",
		GameStateRequirements =
		{
			{
				Path = { "CurrentRun", "CurrentRoom", "Name" },
				IsAny = { "Q_PreBoss01" },
			},
		},
		Cooldowns =
		{
			{ Name = "HermesSpokeRecently", Time = 4 },
		},
		AllowTalkOverTextLines = true,
		PreLineFunctionName = "GenericPresentation",
		PreLineFunctionArgs = { AddInteractBlock = "HermesQuickAppear" },
		PostLineFunctionName = "RemoveHermesInPerson",
		PostLineFunctionArgs = { SkipBoonDrop = true },

		{ Cue = "/VO/Hermes_0190", Text = "Here's everything! I'll leave you to it, M." },
		{ Cue = "/VO/Hermes_0191", Text = "Last supply drop, hope it helps you, M!" },
		{ Cue = "/VO/Hermes_0192", Text = "Here's what I got for you this time!" },
		{ Cue = "/VO/Hermes_0193", Text = "Can't stay and chat but good to see you, M!" },
		{ Cue = "/VO/Hermes_0194", Text = "Ought to be {#Emph}something {#Prev}you can use in here!" },
		{ Cue = "/VO/Hermes_0195", Text = "Sock Typhon in the eye for me, all right?" },
		{ Cue = "/VO/Hermes_0196", Text = "That's all I've got, may moonlight guide you, M!" },
		{ Cue = "/VO/Hermes_0197", Text = "We're low on stock but got some goods to spare!" },
		{ Cue = "/VO/Hermes_0198", Text = "Go remind Typhon not to mess with gods!" },
		{ Cue = "/VO/Hermes_0199", Text = "Don't keep old Typhon waiting, get him, M!" },
		{ Cue = "/VO/Hermes_0200", Text = "Hey make short work of the big guy up there!" },
		{ Cue = "/VO/Hermes_0329", Text = "All right I better go!" },
		{ Cue = "/VO/Hermes_0333", Text = "Good running into you!" },
		{ Cue = "/VO/Hermes_0334", Text = "Best get back to it!" },
		{ Cue = "/VO/Hermes_0201", Text = "Hey good, you're keeping time, I'll get out of your way!",
			PlayFirst = true,
			GameStateRequirements =
			{
				{
					PathTrue = { "ConfigOptionCache", "ShowGameplayTimer" }
				},
			},
		},
		{ Cue = "/VO/Hermes_0202", Text = "Hurry, M, can't beat your fastest time if you slow down!",
			PlayFirst = true,
			GameStateRequirements =
			{
				{
					PathTrue = { "ConfigOptionCache", "ShowGameplayTimer" }
				},
				{
					PathTrue = { "GameState", "SpeechRecord", "/VO/Hermes_0201" }
				},
			},
		},
		{ Cue = "/VO/Hermes_0299", Text = "Hey, look at you, you're rich!",
			GameStateRequirements =
			{
				{
					Path = { "GameState", "Resources", "Money" },
					Comparison = ">=",
					Value = 1400,
				},
			},
		},
		{ Cue = "/VO/Hermes_0300", Text = "Hey look at all that Gold you've got!",
			GameStateRequirements =
			{
				{
					Path = { "GameState", "Resources", "Money" },
					Comparison = ">=",
					Value = 1400,
				},
			},
		},
		{ Cue = "/VO/Hermes_0301", Text = "Don't need all that Gold weighing you down!",
			GameStateRequirements =
			{
				{
					Path = { "GameState", "Resources", "Money" },
					Comparison = ">=",
					Value = 1400,
				},
			},
		},
		{ Cue = "/VO/Hermes_0302", Text = "You won't be needing all that Gold!",
			GameStateRequirements =
			{
				{
					Path = { "GameState", "Resources", "Money" },
					Comparison = ">=",
					Value = 1200,
				},
			},
		},
		{ Cue = "/VO/Hermes_0303", Text = "Did Dionysus really pay you back...?",
			PlayFirst = true,
			GameStateRequirements =
			{
				{
					Path = { "GameState", "Resources", "Money" },
					Comparison = ">=",
					Value = 1400,
				},
				{
					PathTrue = { "CurrentRun", "Hero", "TraitDictionary", "BankBoon" },
				},
			},
		},
		{ Cue = "/VO/Hermes_0304", Text = "Looks like Paid Dues didn't leave you much to spare!",
			PlayFirst = true,
			GameStateRequirements =
			{
				{
					Path = { "GameState", "Resources", "Money" },
					Comparison = "<=",
					Value = 400,
				},
				{
					PathTrue = { "CurrentRun", "Hero", "TraitDictionary", "TimeStopLastStandBoon" },
				},
			},
		},
		{ Cue = "/VO/Hermes_0305", Text = "Should be able to get whatever you need!",
			GameStateRequirements =
			{
				{
					Path = { "GameState", "Resources", "Money" },
					Comparison = ">=",
					Value = 1200,
				},
			},
		},
		{ Cue = "/VO/Hermes_0306", Text = "How about a little shopping prior to the fight?",
			GameStateRequirements =
			{
				{
					Path = { "GameState", "Resources", "Money" },
					Comparison = ">=",
					Value = 500,
				},
			},
		},
		{ Cue = "/VO/Hermes_0307", Text = "A little low on coin there aren't you M?",
			GameStateRequirements =
			{
				{
					Path = { "GameState", "Resources", "Money" },
					Comparison = "<=",
					Value = 200,
				},
			},
		},
		{ Cue = "/VO/Hermes_0308", Text = "Spent all your hard-earned coin already, M?",
			GameStateRequirements =
			{
				{
					Path = { "GameState", "Resources", "Money" },
					Comparison = "<=",
					Value = 200,
				},
			},
		},
		{ Cue = "/VO/Hermes_0309", Text = "This must be one of those time pockets Gramps set up!",
			GameStateRequirements =
			{
				{
					PathTrue = { "GameState", "ReachedTrueEnding" },
				},
			},
		},
		{ Cue = "/VO/Hermes_0310", Text = "All proceeds go to my professional associate!" },
		{ Cue = "/VO/Hermes_0311", Text = "Here's the latest haul, just take your pick!",
			GameStateRequirements =
			{
				{
					Path = { "GameState", "Resources", "Money" },
					Comparison = ">=",
					Value = 500,
				},
			},
		},
		{ Cue = "/VO/Hermes_0312", Text = "Let's see if we can get you back in fighting shape!",
			GameStateRequirements =
			{
				{
					Path = { "CurrentRun", "Hero", "LastStands" },
					UseLength = true,
					Comparison = "<=",
					Value = 1,
				},
				{
					FunctionName = "RequiredHealthFraction",
					FunctionArgs = { Comparison = "<=", Value = 0.3, },
				},
			},
		},
		{ Cue = "/VO/Hermes_0313", Text = "Typhon's past due for a little payback isn't he?",
			GameStateRequirements =
			{
				{
					Path = { "GameState", "LastBossHealthBarRecord", "TyphonHead" },
					Comparison = ">",
					Value = 0,
				},
			},
		},
		{ Cue = "/VO/Hermes_0314", Text = "Just take your time here, M, or breeze on through!" },
		{ Cue = "/VO/Hermes_0315", Text = "Can't stay for long here, M, though take your pick!" },
		{ Cue = "/VO/Hermes_0316", Text = "You probably could take that Typhon down again!",
			GameStateRequirements =
			{
				{
					Path = { "GameState", "LastBossHealthBarRecord", "TyphonHead" },
					Comparison = "<=",
					Value = 0,
				},
			},
		},
		{ Cue = "/VO/Hermes_0317", Text = "Stock up on everything you can then go on through!",
			GameStateRequirements =
			{
				{
					Path = { "GameState", "Resources", "Money" },
					Comparison = ">=",
					Value = 800,
				},
			},
		},
		{ Cue = "/VO/Hermes_0318", Text = "Not your first Typhon! Just make sure he's not your last." },
	},
	{
		RandomRemaining = true,
		BreakIfPlayed = true,
		PreLineWait = 0.35,
		ObjectType = "NPC_Hermes_01",
		GameStateRequirements =
		{
			{
				Path = { "CurrentRun", "CurrentRoom", "Name" },
				IsAny = { "Q_PreBoss01" },
			},
		},
		Cooldowns =
		{
			{ Name = "HermesSpokeRecently", Time = 4 },
		},
		AllowTalkOverTextLines = true,
		PreLineFunctionName = "GenericPresentation",
		PreLineFunctionArgs = { AddInteractBlock = "HermesQuickAppear" },
		PostLineFunctionName = "RemoveHermesInPerson",
		PostLineFunctionArgs = { SkipBoonDrop = true },

		{ Cue = "/VO/Hermes_0118", Text = "Coming through!" },
		{ Cue = "/VO/Hermes_0119", Text = "Here you go!" },
		{ Cue = "/VO/Hermes_0120", Text = "Hi M! Bye M!" },
		{ Cue = "/VO/Hermes_0150", Text = "Be seeing you around!" },
		{ Cue = "/VO/Hermes_0151", Text = "So long for now!" },
		{ Cue = "/VO/Hermes_0152", Text = "You got this!" },
		{ Cue = "/VO/Hermes_0153", Text = "Bye now!" },
		{ Cue = "/VO/Hermes_0154", Text = "Be safe out there!" },
		{ Cue = "/VO/Hermes_0155", Text = "See you!" },
		{ Cue = "/VO/Hermes_0203", Text = "Take care!" },
		{ Cue = "/VO/Hermes_0204", Text = "Shine on!" },
		{ Cue = "/VO/Hermes_0205", Text = "Fight on!" },
		{ Cue = "/VO/Hermes_0206", Text = "Go get 'em!" },
		{ Cue = "/VO/Hermes_0152", Text = "You got this!" },
		{ Cue = "/VO/Hermes_0183", Text = "I'm off!" },
		{ Cue = "/VO/Hermes_0353", Text = "Right I'm off!" },
		{ Cue = "/VO/Hermes_0354", Text = "See you M!" },
		{ Cue = "/VO/Hermes_0355", Text = "Taking off!" },
		{ Cue = "/VO/Hermes_0356", Text = "Later M!" },
		{ Cue = "/VO/Hermes_0357", Text = "Got to go!" },
	},
	{
		RandomRemaining = true,
		BreakIfPlayed = true,
		PreLineWait = 0.35,
		ObjectType = "NPC_Hermes_01",
		GameStateRequirements =
		{
			{
				Path = { "CurrentRun", "CurrentRoom", "Name" },
				IsAny = { "Q_PreBoss01" },
			},
		},
		Cooldowns =
		{
			{ Name = "HermesSpokeRecently", Time = 4 },
		},
		AllowTalkOverTextLines = true,
		PreLineFunctionName = "GenericPresentation",
		PreLineFunctionArgs = { AddInteractBlock = "HermesQuickAppear" },
		PostLineFunctionName = "RemoveHermesInPerson",
		PostLineFunctionArgs = { SkipBoonDrop = true },

		{ Cue = "/VO/Hermes_0118", Text = "Coming through!" },
		{ Cue = "/VO/Hermes_0119", Text = "Here you go!" },
		{ Cue = "/VO/Hermes_0120", Text = "Hi M! Bye M!" },
		{ Cue = "/VO/Hermes_0150", Text = "Be seeing you around!" },
		{ Cue = "/VO/Hermes_0151", Text = "So long for now!" },
		{ Cue = "/VO/Hermes_0152", Text = "You got this!" },
		{ Cue = "/VO/Hermes_0153", Text = "Bye now!" },
		{ Cue = "/VO/Hermes_0154", Text = "Be safe out there!" },
		{ Cue = "/VO/Hermes_0155", Text = "See you!" },
		{ Cue = "/VO/Hermes_0203", Text = "Take care!" },
		{ Cue = "/VO/Hermes_0205", Text = "Fight on!" },
		{ Cue = "/VO/Hermes_0206", Text = "Go get 'em!" },
		{ Cue = "/VO/Hermes_0152", Text = "You got this!" },
		{ Cue = "/VO/Hermes_0183", Text = "I'm off!" },
	},


}

GlobalVoiceLines.SpecialDeliveryVoiceLines =
{
	{
		RandomRemaining = true,
		PreLineWait = 0.42,
		Source = { LineHistoryName = "NPC_Hermes_01", SubtitleColor = Color.HermesVoice },
		Cooldowns =
		{
			{ Name = "HermesSpokeRecently", Time = 2 },
			{ Name = "HermesSpecialDeliveredRecently", Time = 10 },
		},

		{ Cue = "/VO/Hermes_0116", Text = "Special delivery!", PlayFirst = true, },
		{ Cue = "/VO/Hermes_0117", Text = "Special delivery...!" },
		{ Cue = "/VO/Hermes_0118", Text = "Coming through!" },
		{ Cue = "/VO/Hermes_0119", Text = "Here you go!" },
		{ Cue = "/VO/Hermes_0120", Text = "Hi M! Bye M!" },
		{ Cue = "/VO/Hermes_0121", Text = "Cheers M!" },
		{ Cue = "/VO/Hermes_0122", Text = "Package for you!" },
		{ Cue = "/VO/Hermes_0123", Text = "Got you {#Emph}this!" },
		{ Cue = "/VO/Hermes_0124", Text = "You called?" },
		{ Cue = "/VO/Hermes_0125", Text = "Package here!" },
		{ Cue = "/VO/Hermes_0126", Text = "Hermes, at your service!" },
		{ Cue = "/VO/Hermes_0136", Text = "Cheers, M!" },
		{ Cue = "/VO/Hermes_0138", Text = "Enjoy!" },
		{ Cue = "/VO/Hermes_0141", Text = "Here you go!" },
		{ Cue = "/VO/Hermes_0339", Text = "Got your order!" },
		{ Cue = "/VO/Hermes_0340", Text = "Got the goods!" },
		{ Cue = "/VO/Hermes_0341", Text = "We deliver!" },
		{ Cue = "/VO/Hermes_0344", Text = "Dropping off!" },
		{ Cue = "/VO/Hermes_0345", Text = "For you!" },
		{ Cue = "/VO/Hermes_0346", Text = "Package, M!" },
		{ Cue = "/VO/Hermes_0342", Text = "Hey, look who!" },
	},
}
GlobalVoiceLines.HermesHarvestReactionVoiceLines =
{
	RandomRemaining = true,
	BreakIfPlayed = true,
	PreLineWait = 0.4,
	SuccessiveChanceToPlay = 0.33,
	SuccessiveChanceToPlayAll = 0.2,
	ObjectType = "NPC_Hermes_01",
	GameStateRequirements =
	{
		{
			Path = { "CurrentRun", "CurrentRoom", "Name" },
			IsAny = { "Q_PreBoss01" },
		},
		{
			PathFalse = { "CurrentRun", "UseRecord", "NPC_Hermes_01" }
		},
	},
	Cooldowns =
	{
		{ Name = "HermesSpokeRecently", Time = 8 },
	},

	{ Cue = "/VO/Hermes_0245", Text = "Get something good?" },
	{ Cue = "/VO/Hermes_0246", Text = "No need to help clean up!" },
	{ Cue = "/VO/Hermes_0247", Text = "Find anything?" },
	{ Cue = "/VO/Hermes_0248", Text = "That's on the house!" },
	{ Cue = "/VO/Hermes_0359", Text = "Finder's fee?" },
	{ Cue = "/VO/Hermes_0360", Text = "Sure, why not!" },
	{ Cue = "/VO/Hermes_0361", Text = "What is that stuff?" },
	{ Cue = "/VO/Hermes_0362", Text = "Have at it!" },
}
GlobalVoiceLines.HermesExorcismReactionVoiceLines =
{
	RandomRemaining = true,
	BreakIfPlayed = true,
	PreLineWait = 0.65,
	SuccessiveChanceToPlayAll = 0.5,
	ObjectType = "NPC_Hermes_01",
	Cooldowns =
	{
		{ Name = "HermesSpokeRecently", Time = 4 },
	},

	{ Cue = "/VO/Hermes_0381", Text = "I used to do that.", PlayFirst = true },
	{ Cue = "/VO/Hermes_0382", Text = "That's {#Emph}my {#Prev}job!" },
	{ Cue = "/VO/Hermes_0383", Text = "One for the cause." },
	{ Cue = "/VO/Hermes_0384", Text = "Well done." },
	{ Cue = "/VO/Hermes_0385", Text = "I'll keep an eye on 'em." },
	{ Cue = "/VO/Hermes_0386", Text = "Safe travels!" },
}
GlobalVoiceLines.HermesPurchaseReactionVoiceLines =
{
	RandomRemaining = true,
	BreakIfPlayed = true,
	PreLineWait = 0.65,
	SuccessiveChanceToPlay = 0.33,
	SuccessiveChanceToPlayAll = 0.2,
	ObjectType = "NPC_Hermes_01",
	GameStateRequirements =
	{
		{
			Path = { "CurrentRun", "CurrentRoom", "Name" },
			IsAny = { "Q_PreBoss01" },
		},
		{
			PathFalse = { "CurrentRun", "UseRecord", "NPC_Hermes_01" }
		},
	},
	Cooldowns =
	{
		{ Name = "HermesSpokeRecently", Time = 8 },
	},

	{ Cue = "/VO/Hermes_0235", Text = "Cheers!" },
	{ Cue = "/VO/Hermes_0237", Text = "All yours!" },
	{ Cue = "/VO/Hermes_0238", Text = "Sure!" },
	{ Cue = "/VO/Hermes_0239", Text = "Deal!" },
	{ Cue = "/VO/Hermes_0240", Text = "More Gold!" },
	{ Cue = "/VO/Hermes_0137", Text = "Pleasure doing business!" },
	{ Cue = "/VO/Hermes_0319", Text = "Sold!" },
	{ Cue = "/VO/Hermes_0320", Text = "It's a deal!" },
	{ Cue = "/VO/Hermes_0321", Text = "Deal." },
	{ Cue = "/VO/Hermes_0322", Text = "{#Emph}Cha-ching!" },
	{ Cue = "/VO/Hermes_0323", Text = "It'll be worth it!" },
	{ Cue = "/VO/Hermes_0324", Text = "Service charge." },
	{ Cue = "/VO/Hermes_0236", Text = "Anything else?",
		PlayFirst = true,
		GameStateRequirements =
		{
			{
				Path = { "CurrentRun", "CurrentRoom", "StoreItemsPurchased" },
				Comparison = "<=",
				Value = 3,
			},
		},
	},
}
GlobalVoiceLines.HermesNoMoneyReactionVoiceLines =
{
	RandomRemaining = true,
	BreakIfPlayed = true,
	PreLineWait = 0.65,
	SuccessiveChanceToPlay = 0.33,
	SuccessiveChanceToPlayAll = 0.2,
	ObjectType = "NPC_Hermes_01",
	GameStateRequirements =
	{
		{
			Path = { "CurrentRun", "CurrentRoom", "Name" },
			IsAny = { "Q_PreBoss01" },
		},
		{
			PathFalse = { "CurrentRun", "UseRecord", "NPC_Hermes_01" }
		},
	},
	Cooldowns =
	{
		{ Name = "HermesSpokeRecently", Time = 8 },
	},

	{ Cue = "/VO/Hermes_0241", Text = "Sorry M." },
	{ Cue = "/VO/Hermes_0242", Text = "Who makes these rules?" },
	{ Cue = "/VO/Hermes_0243", Text = "Blame my professional associate not me!", PlayFirst = true },
	{ Cue = "/VO/Hermes_0244", Text = "Don't have the Gold?" },
	{ Cue = "/VO/Hermes_0142", Text = "Can't do that, M." },
	{ Cue = "/VO/Hermes_0325", Text = "Oh no...!" },
	{ Cue = "/VO/Hermes_0326", Text = "I'd spot you if I could..." },
	{ Cue = "/VO/Hermes_0327", Text = "No Gold?" },
	{ Cue = "/VO/Hermes_0328", Text = "{#Emph}Tsk, ah." },
}

OverwriteTableKeys( EnemyData, UnitSetData.NPC_Hermes )