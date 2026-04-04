function UpdateRoomDamagePercentGrowth( hero )
    -- 1. Kiểm tra hero có OutgoingDamageModifiers không
    if hero.OutgoingDamageModifiers == nil then return end

    -- 2. Tìm CustomDamageBoost modifier
    local damageModifier = nil
    for i, modifier in ipairs( hero.OutgoingDamageModifiers ) do
        if modifier.Name == "CustomDamageBoost" then
            damageModifier = modifier
            break
        end
    end
    if not damageModifier then return end

    -- 3. Tăng hệ số damage thêm 1% (0.01)
    damageModifier.GlobalMultiplier = damageModifier.GlobalMultiplier + 0.01

    -- 4. Hiển thị thông báo nhỏ trên đầu nhân vật

    local damageShow = math.floor( (damageModifier.GlobalMultiplier - 1.0) * 100 )
    if damageShow > 0 then
        damageShow = "+" .. damageShow .. "%"
    else
        damageShow = "-" .. math.abs(damageShow) .. "%"
    end
    thread( PopOverheadText, {
        TargetId = hero.ObjectId,
        Amount = damageShow,
        Text = "{$TempTextData.Amount}{!Icons.RandomLoot}",
        Duration = 2.0,
        Delay = 1
    })
end