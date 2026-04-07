-- WxBoonControl.lua
-- Mục đích: Ghi đè chỉ định RNG Boon và Trait cho đến khi lấy đủ các kỹ năng cấu hình.

WxBoonTargetTraits = {
    "Heaven Strike", -- Tên hiển thị trong game (Ví dụ: Đánh Thường của Zeus)
    "Solar Ring", -- Hoặc tên ID hệ thống cũng được
    "Cardio Gain",
    "Flutter Flourish",
    "Nexus Rush",
    "Electric Overload",
    "Light Smite",
    "Static Shock",
    "Healthy Rebound",
    "Arctic Gale"
}

local _resolvedTraitsCache = nil
function GetResolvedBoonTargetTraits()
    if _resolvedTraitsCache then return _resolvedTraitsCache end
    _resolvedTraitsCache = {}
    
    for _, targetName in ipairs(WxBoonTargetTraits) do
        local found = false
        if TraitData and TraitData[targetName] then
            table.insert(_resolvedTraitsCache, targetName)
            found = true
        elseif TraitData then
            for traitName, _ in pairs(TraitData) do
                local success, displayName = pcall(GetDisplayName, { Text = traitName })
                if success and displayName == targetName then
                    table.insert(_resolvedTraitsCache, traitName)
                    found = true
                    break
                end
            end
        end
        if not found then table.insert(_resolvedTraitsCache, targetName) end
    end
    return _resolvedTraitsCache
end

-- Tracker chống trùng lặp Boon khi xuất hiện nhiều phần thưởng trong 1 phòng
WxPendingGods = WxPendingGods or {}
WxPendingTraits = WxPendingTraits or {}
WxCurrentDepth = WxCurrentDepth or 0

local function CheckResetPending()
    local depth = CurrentRun and CurrentRun.RunDepth or 0
    if WxCurrentDepth ~= depth then
        WxPendingGods = {}
        WxPendingTraits = {}
        WxCurrentDepth = depth
    end
end

local original_ChooseRoomReward = ChooseRoomReward
function ChooseRoomReward( run, room, rewardStoreName, previouslyChosenRewards, args )
    local rewardName = original_ChooseRoomReward( run, room, rewardStoreName, previouslyChosenRewards, args )
    
    -- Chỉ cho phép đè thưởng đối với các loại cửa phần thưởng thông thường
    local safeToOverride = {
        RoomRewardMoney = true,       -- Cửa Tiền
        RoomRewardMetaPoint = true,   -- Cửa Tro (Ashes)
        RoomRewardMaxHealth = true,   -- Cửa máu Centaur
        Boon = true,                  -- Cửa Boon bất kỳ
        RoomRewardPom = true,         -- Cửa Lựu (Pom)
        RoomRewardTrash = true,       -- Rác
        RoomRewardPsyche = true,      -- Psyche (Ếch)
        RoomRewardMixerFabric = true, -- Vải
    }
    
    -- Nếu không phải cửa thông thường (ví dụ: Boss, Sự kiện, Fountain, Trống...), giữ nguyên!
    if not safeToOverride[rewardName] or (room and room.Encounter and room.Encounter.Name == "BossEncounter") then
        return rewardName
    end
    
    CheckResetPending()
    
    for _, traitName in ipairs(GetResolvedBoonTargetTraits()) do
        if not HeroHasTrait(traitName) then
            local forcedGodName = GetLootSourceName(traitName)
            if forcedGodName and not WxPendingGods[forcedGodName] then
                if room ~= nil and room.Reward ~= nil then
                    room.Reward.Name = "Boon"
                    room.Reward.ForceLootName = forcedGodName
                end
                if room ~= nil then
                    room.ForceLootName = forcedGodName
                end
                
                WxPendingGods[forcedGodName] = true
                return "Boon"
            end
        end
    end
    
    return rewardName
end

-- 2. Hook vào hàm ChooseLoot() để ép hệ thống rơi đúng Boon của Thần mà ta đang thiếu Kỹ năng
local original_ChooseLoot = ChooseLoot
function ChooseLoot( excludeLootNames, forceLootName )
    -- Nếu game đã có ý định ép một Loot cụ thể (từ Cửa đã chọn), phải tuân thủ nó để tránh lỗi Hình Cửa và Đồ Rớt khác nhau.
    if forceLootName ~= nil and LootData[forceLootName] ~= nil then
        return original_ChooseLoot( excludeLootNames, forceLootName )
    end

    CheckResetPending()
    
    for _, traitName in ipairs(GetResolvedBoonTargetTraits()) do
        if not HeroHasTrait(traitName) then
            local forcedGodName = GetLootSourceName(traitName)
            if forcedGodName and LootData[forcedGodName] and not WxPendingGods[forcedGodName] then
                WxPendingGods[forcedGodName] = true
                return LootData[forcedGodName]
            end
        end
    end
    -- Nếu đã đủ Kỹ năng, hoặc không thể phân bổ, trở về base logic
    return original_ChooseLoot( excludeLootNames, forceLootName )
end

-- 3. Hook vào Hàm SetTraitsOnLoot() để bảo đảm Kỹ năng ưu tiên luôn lên top và đạt hạng Epic
local original_SetTraitsOnLoot = SetTraitsOnLoot
function SetTraitsOnLoot( lootData, args )
    -- Vẫn chạy hàm gốc để lấy base logic
    original_SetTraitsOnLoot( lootData, args )
    
    if lootData.UpgradeOptions == nil then
        lootData.UpgradeOptions = {}
    end

    -- Lọc ra các Boon mục tiêu thuộc về vị Thần hiện tại
    local targetTraitsForThisGod = {}
    for _, traitName in ipairs(GetResolvedBoonTargetTraits()) do
        if not HeroHasTrait(traitName) and GetLootSourceName(traitName) == lootData.Name then
            table.insert(targetTraitsForThisGod, traitName)
        end
    end
    
    -- Trộn chúng vào UpgradeOptions an toàn
    for idx, traitName in ipairs(targetTraitsForThisGod) do
        if idx > 3 then break end -- Game chỉ hỗ trợ tối đa 3 lựa chọn
        
        local alreadyInOptions = false
        for i, option in ipairs(lootData.UpgradeOptions) do
            if option.ItemName == traitName then
                alreadyInOptions = true
                lootData.UpgradeOptions[i].Rarity = "Epic"
            end
        end
        
        if not alreadyInOptions then
            -- Thay thế an toàn vào index tương ứng
            if lootData.UpgradeOptions[idx] then
                lootData.UpgradeOptions[idx] = { ItemName = traitName, Type = "Trait", Rarity = "Epic" }
            else
                table.insert(lootData.UpgradeOptions, { ItemName = traitName, Type = "Trait", Rarity = "Epic" })
            end
        end
    end
end
