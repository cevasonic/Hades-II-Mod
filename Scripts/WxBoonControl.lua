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
        -- 1. Nếu người dùng nhập trực tiếp ID nội bộ
        if TraitData and TraitData[targetName] then
            table.insert(_resolvedTraitsCache, targetName)
            found = true
        elseif TraitData then
            -- 2. Nếu là Tên hiển thị (Ví dụ "Heaven Strike" hoặc tiếng Việt), duyệt tìm
            for traitName, _ in pairs(TraitData) do
                local success, displayName = pcall(GetDisplayName, { Text = traitName })
                if success and displayName == targetName then
                    table.insert(_resolvedTraitsCache, traitName)
                    found = true
                    break
                end
            end
        end
        
        if not found then
            table.insert(_resolvedTraitsCache, targetName)
        end
    end
    
    return _resolvedTraitsCache
end

local original_ChooseRoomReward = ChooseRoomReward
function ChooseRoomReward( run, room, rewardStoreName, previouslyChosenRewards, args )
    local rewardName = original_ChooseRoomReward( run, room, rewardStoreName, previouslyChosenRewards, args )
    
    -- Không đè phần thưởng nếu đó là các phòng đặc biệt
    local specialRewards = {
        Devotion = true,     -- Cửa chọn song thần (Duo)
        Story = true,        -- Cửa sự kiện, Circe, Arachne...
        TrialUpgrade = true, -- Cửa Chaos
        SpellDrop = true,    -- Cửa Vầng Trăng (Selene)
        WeaponUpgrade = true,-- Cửa Búa Daedalus
        HermesUpgrade = true,-- Cửa Hermes
        Shop = true          -- Cửa tiệm Charon
    }
    
    if specialRewards[rewardName] or (room and room.Encounter and room.Encounter.Name == "BossEncounter") then
        return rewardName
    end
    
    for _, traitName in ipairs(GetResolvedBoonTargetTraits()) do
        -- Nếu chưa sở hữu kỹ năng này
        if not HeroHasTrait(traitName) then
            local forcedGodName = GetLootSourceName(traitName)
            -- Bắt nó thành Boon của vị Thần chỉ định
            if forcedGodName then
                if room ~= nil and room.Reward ~= nil then
                    room.Reward.Name = "Boon"
                    room.Reward.ForceLootName = forcedGodName
                end
                if room ~= nil then
                    room.ForceLootName = forcedGodName
                end
                return "Boon"
            end
        end
    end
    
    return rewardName
end

-- 2. Hook vào hàm ChooseLoot() để ép hệ thống rơi đúng Boon của Thần mà ta đang thiếu Kỹ năng
local original_ChooseLoot = ChooseLoot
function ChooseLoot( excludeLootNames, forceLootName )
    for _, traitName in ipairs(GetResolvedBoonTargetTraits()) do
        if not HeroHasTrait(traitName) then
            local forcedGodName = GetLootSourceName(traitName)
            if forcedGodName and LootData[forcedGodName] then
                return LootData[forcedGodName]
            end
        end
    end
    -- Nếu đã đủ Kỹ năng, trở về base logic
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

    local replaceIndex = 1
    for _, traitName in ipairs(GetResolvedBoonTargetTraits()) do
        if not HeroHasTrait(traitName) and GetLootSourceName(traitName) == lootData.Name then
            local alreadyInOptions = false
            for i, option in ipairs(lootData.UpgradeOptions) do
                if option.ItemName == traitName then
                    alreadyInOptions = true
                    lootData.UpgradeOptions[i].Rarity = "Epic" -- Nâng hạng Epic nếu đã có hên RNG trúng
                end
            end
            
            -- Nếu hàm gốc RNG tạch trait này, ta bế nó nhét vào đúng slot trống / đè lên option cũ
            if not alreadyInOptions then
                if replaceIndex <= #(lootData.UpgradeOptions) then
                    lootData.UpgradeOptions[replaceIndex] = { ItemName = traitName, Type = "Trait", Rarity = "Epic" }
                else
                    table.insert(lootData.UpgradeOptions, { ItemName = traitName, Type = "Trait", Rarity = "Epic" })
                end
            end
            
            replaceIndex = replaceIndex + 1
            if replaceIndex > 3 then break end -- Giới hạn hiển thị 3 options chuẩn của Hades
        end
    end
end
