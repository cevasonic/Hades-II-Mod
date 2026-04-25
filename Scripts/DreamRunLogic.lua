function SelectNextDreamBiome( source, args )
	args = args or {}
	local nextRoomSet = nil
	if IsEmpty( CurrentRun.DreamBiomePool ) then

		CurrentRun.DreamBiomePool = { "G", "H", "I", "O", "P", "Q" }

		-- special handling for the first biome on the first dream run
		if args.ForceHBiomeRequirements ~= nil and IsGameStateEligible( source, args.ForceHBiomeRequirements ) then
			nextRoomSet = RemoveValue( CurrentRun.DreamBiomePool, "H" )
		else
			nextRoomSet = RemoveRandomValue( CurrentRun.DreamBiomePool )
		end

		-- reroll if we got the previous Dream Run's first biome
		if nextRoomSet == GameState.LastDreamStartingBiome then
			nextRoomSet = RemoveRandomValue( CurrentRun.DreamBiomePool )
			table.insert( CurrentRun.DreamBiomePool, GameState.LastDreamStartingBiome )
		end
		GameState.LastDreamStartingBiome = nextRoomSet

		-- can't start in F or N, but they're eligible afterwards!
		table.insert( CurrentRun.DreamBiomePool, "F" )
		table.insert( CurrentRun.DreamBiomePool, "N" )

	else

		nextRoomSet = RemoveRandomValue( CurrentRun.DreamBiomePool )

		-- reroll if we got the naturally connected biome as the next biome
		local currentRoomSet = CurrentRun.BiomeVisitOrder[CurrentRun.EnteredBiomes]
		if nextRoomSet == NextRoomSets[currentRoomSet] then
			local ineligibleRoomSet = nextRoomSet
			nextRoomSet = RemoveRandomValue( CurrentRun.DreamBiomePool )
			table.insert( CurrentRun.DreamBiomePool, ineligibleRoomSet )
		end

	end

	CurrentRun.CurrentRoom.NextRoomSet = { nextRoomSet }
end

function EnterNextDreamBiome( source, args )
	args = args or {}

	AddInputBlock({ Name = "EnterNextDreamBiome" })

	local chooseRoomArgs =
	{
		StartingBiome = CurrentRun.CurrentRoom.NextRoomSet[1],
		SkipChooseReward = args.SkipChooseReward,
		RoomOverrides =
		{
			ForcedEntranceFunctionName = "RoomEntranceDreamBiomeStart",
		},
	}
	local nextRoom = ChooseStartingRoom( CurrentRun, chooseRoomArgs )
	LeaveRoom( CurrentRun, { Room = nextRoom } )

	RemoveInputBlock({ Name = "EnterNextDreamBiome" })
end

function CheckDreamBiomeCompletion()
	if not CurrentRun.CurrentRoom.UseRecord.DreamPointsDrop then
		return false
	end

	TraitTrayScreenClose( ActiveScreens.TraitTrayScreen )
	CloseBoonInfoScreen( ActiveScreens.BoonInfo )
	CloseCodexScreen( ActiveScreens.Codex )
	CloseInventoryScreen( ActiveScreens.InventoryScreen )

	if CurrentRun.EnteredBiomes == GameData.FullRunBiomeCount then
		thread( EndDreamRunPresentation )
	else
		CurrentRun.PrevDreamBiome = CurrentRun.BiomeVisitOrder[CurrentRun.EnteredBiomes]
		CurrentRun.CurrentRoom.ExitFunctionName = "DreamRunRoomExitPresentation"
		local nextRoomName = RoomSets.Dream[CurrentRun.EnteredBiomes + 1]
		local nextRoom = CreateRoom( RoomData[nextRoomName] )
		LeaveRoom( CurrentRun, { Room = nextRoom } )
	end

	return true
end

function SilenceForDreamRun( source, args )
	args = args or {}
	source.BlockTextLines = true -- for loot
	source.CanReceiveGift = false
	if not args.PreserveUseText then
		source.UseText = "UseDreamRunNPC"
		source.UseTextTalkAndSpecial = "UseDreamRunNPCAndSpecial"
	end
	if args.BlockInteract then
		AddInteractBlock( source, "SilenceForDreamRun" )
	end
	if args.ForceTextLines ~= nil then
		SetNextInteractLines( source, source.InteractTextLineSets[args.ForceTextLines] )
	end
end

function AttemptUseDreamRunExit( door )
	if CheckCooldownNoTrigger( "DoorLocked", 1.6 ) then
		thread( UsedDreamRunExitDoorPresentation, door )
	end
	if not CurrentRun.CurrentRoom.ExitsUnlocked then
		CannotUseDoorPresentation( door )
		return
	end
	thread( EnterNextDreamBiome, door, { SkipChooseReward = true } )
end