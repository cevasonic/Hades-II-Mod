-- WxBoonControl.lua
-- Mục đích: Ghi đè chỉ định RNG Boon và Trait cho đến khi lấy đủ các kỹ năng cấu hình.
Import "WxBoonByWeapon.lua"



local _resolvedTraitsCache = nil
local _resolvedSourceTable = nil

function GetResolvedBoonTargetTraits()
    local weaponName = "Unknown"
    local rawWeaponName = "WeaponStaffSwing"
    if GetEquippedWeapon then
        local w = GetEquippedWeapon()
        if w then rawWeaponName = w end
        local weaponMapping = {
            WeaponStaffSwing = "Staff", WeaponDagger = "Dagger",
            WeaponTorch = "Torch", WeaponAxe = "Axe", WeaponLob = "Skull",
            WeaponSuit = "Coat"
        }
        weaponName = weaponMapping[rawWeaponName] or "Unknown"
    elseif CurrentRun and CurrentRun.Hero and CurrentRun.Hero.Weapons then
        for wId, _ in pairs(CurrentRun.Hero.Weapons) do
            if string.match(wId, "Weapon") then
                rawWeaponName = wId
                break
            end
        end
        local weaponMapping = {
            WeaponStaffSwing = "Staff", WeaponDagger = "Dagger",
            WeaponTorch = "Torch", WeaponAxe = "Axe", WeaponLob = "Skull",
            WeaponSuit = "Coat"
        }
        weaponName = weaponMapping[rawWeaponName] or "Unknown"
    end
    
    local aspect = "Melinoe"
    if CurrentRun and CurrentRun.Hero and CurrentRun.Hero.TraitDictionary then
        for traitName, _ in pairs(CurrentRun.Hero.TraitDictionary) do
            local tData = TraitData and TraitData[traitName]
            if tData and tData.InheritFrom then
                for _, parent in pairs(tData.InheritFrom) do
                    if parent == "WeaponEnchantmentTrait" then
                        local model = tData.WeaponKitGrannyModel or ""
                        local extracted = string.match(model, "_([a-zA-Z]+)_Mesh")
                        if extracted then aspect = extracted end
                    end
                end
            end
        end
    end
    
    -- Map lại các tên Internal Data cho đúng với hiển thị của Game
    if aspect == "Anubis" then aspect = "Momus" end
    -- Mod có thể mở rộng map nếu NSX thay đổi tên (vd: Nergal -> ...)
    
    local combinedTable = {}
    local sourceKey = weaponName .. "_" .. aspect
    
    if WxBoonByWeapon and WxBoonByWeapon[weaponName] then
        local defaultTable = WxBoonByWeapon[weaponName].Default
        local aspectTable = WxBoonByWeapon[weaponName][aspect]
        
        local addedTraits = {}
        if defaultTable and type(defaultTable) == "table" then
            for _, v in ipairs(defaultTable) do
                if not addedTraits[v] then
                    table.insert(combinedTable, v)
                    addedTraits[v] = true
                end
            end
        end
        
        if aspectTable and type(aspectTable) == "table" then
            for _, v in ipairs(aspectTable) do
                if not addedTraits[v] then
                    table.insert(combinedTable, v)
                    addedTraits[v] = true
                end
            end
        end
    end
    
    if #combinedTable == 0 then return {} end

    if _resolvedTraitsCache and _resolvedSourceTable == sourceKey then return _resolvedTraitsCache end
    _resolvedSourceTable = sourceKey
    _resolvedTraitsCache = {}
    
    for _, targetName in ipairs(combinedTable) do
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
WxLastPendingTime = WxLastPendingTime or 0

local function CheckResetPending()
    local now = 0
    if GetTime then now = GetTime({}) else now = os.time() end
    
    if now - WxLastPendingTime > 1.5 then
        WxPendingGods = {}
    end
    WxLastPendingTime = now
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
        if not HeroHasTrait(traitName) and TraitData[traitName] and IsTraitEligible(TraitData[traitName]) then
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
        if not HeroHasTrait(traitName) and TraitData[traitName] and IsTraitEligible(TraitData[traitName]) then
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

local function CreateForcedOption(traitName)
    local option = { ItemName = traitName, Type = "Trait" }
    local isSpecial = false
    local specialType = nil
    local tData = TraitData and TraitData[traitName] or {}
    
    if tData.InheritFrom then
        for _, parent in pairs(tData.InheritFrom) do
            if parent == "SynergyTrait" then
                isSpecial = true
                specialType = "Duo"
            elseif parent == "LegendaryTrait" then
                isSpecial = true
                specialType = "Legendary"
            elseif parent == "UnityTrait" then
                isSpecial = true
                specialType = nil
            end
        end
    end
    
    if isSpecial then
        if specialType then option.Rarity = specialType end
    else
        option.Rarity = "Heroic"
    end
    return option
end

-- 3. Hook vào Hàm SetTraitsOnLoot() để bảo đảm Kỹ năng ưu tiên luôn lên top và đạt hạng Heroic
local original_SetTraitsOnLoot = SetTraitsOnLoot
function SetTraitsOnLoot( lootData, args )
    original_SetTraitsOnLoot( lootData, args )
    
    if lootData.UpgradeOptions == nil then
        lootData.UpgradeOptions = {}
    end

    local targetTraitsForThisGod = {}
    for _, traitName in ipairs(GetResolvedBoonTargetTraits()) do
        if not HeroHasTrait(traitName) and TraitData[traitName] and IsTraitEligible(TraitData[traitName]) and GetLootSourceName(traitName) == lootData.Name then
            table.insert(targetTraitsForThisGod, traitName)
        end
    end
    
    for idx, traitName in ipairs(targetTraitsForThisGod) do
        if idx > 3 then break end
        
        local targetOption = CreateForcedOption(traitName)
        local alreadyInOptions = false
        
        for i, option in ipairs(lootData.UpgradeOptions) do
            if option.ItemName == traitName then
                alreadyInOptions = true
                if targetOption.Rarity then
                    lootData.UpgradeOptions[i].Rarity = targetOption.Rarity
                end
            end
        end
        
        if not alreadyInOptions then
            if lootData.UpgradeOptions[idx] then
                lootData.UpgradeOptions[idx] = targetOption
            else
                table.insert(lootData.UpgradeOptions, targetOption)
            end
        end
    end
end
