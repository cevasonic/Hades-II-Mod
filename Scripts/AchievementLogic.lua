function CheckProgressAchievements( args )

	if GameState == nil then
		return
	end

	args = args or {}
	
	local threadName = "CheckProgressAchievements"
	if not args.Silent then
		if SetThreadWait( threadName, 0.3 ) then
			return
		end
		wait( 0.3, threadName )
	end

	for i, achievementName in ipairs( AchievementOrderData ) do
		local achievementData = AchievementData[achievementName]
		if achievementData ~= nil and not SessionState.AchievementsUnlocked[achievementName] then -- Only send unlock requests to the platform once per session
			if GameState.AchievementsUnlocked[achievementName] or -- Check once for back-compat against the GameState in case the request didn't go through to the platform previously (e.g. offline or cross-saved from a different platform)
			 (not achievementData.IgnoreProgressCheck and achievementData.CompleteGameStateRequirements ~= nil and IsGameStateEligible( achievementData, achievementData.CompleteGameStateRequirements ) ) then
				-- Completed
				UnlockAchievement({ Name = achievementName })
				SessionState.AchievementsUnlocked[achievementName] = true
				if not GameState.AchievementsUnlocked[achievementName] then -- Don't print back-compat unlocks
					GameState.AchievementsUnlocked[achievementName] = true
					DebugPrint({ Text = "ACHIEVEMENT UNLOCKED: "..achievementName, Priority = true })
				end
				wait( 0.5, threadName ) -- Don't spam the platform with rapid requests
			else
				wait( 0.02, threadName ) -- Distribute workload over frames
			end
		end
	end
end

function CheckAchievement( source, args, contextArgs )
	local achievementName = args.Name
	local achievementData = AchievementData[achievementName]
	if achievementData == nil then
		return
	end

	if SessionState.AchievementsUnlocked[achievementName] then
		-- Only send unlock requests to the platform once per session
		return
	end

	if achievementData.CompleteGameStateRequirements == nil or IsGameStateEligible( source, achievementData.CompleteGameStateRequirements, contextArgs ) then
		UnlockAchievement({ Name = achievementName })
		SessionState.AchievementsUnlocked[achievementName] = true
		if not GameState.AchievementsUnlocked[achievementName] then -- Don't print back-compat unlocks
			GameState.AchievementsUnlocked[achievementName] = true
			DebugPrint({ Text = "ACHIEVEMENT UNLOCKED: "..achievementName, Priority = true })
		end
	end
end