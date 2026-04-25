function UpdateRoomDamagePercentGrowth( hero )
    -- 1. Đảm bảo hero có OutgoingDamageModifiers
    hero.OutgoingDamageModifiers = hero.OutgoingDamageModifiers or {}

    -- 2. Tìm CustomDamageBoost modifier
    local damageModifier = nil
    for i, modifier in ipairs( hero.OutgoingDamageModifiers ) do
        if modifier.Name == "CustomDamageBoost" then
            damageModifier = modifier
            break
        end
    end

    -- 3. Nếu chưa có thì khởi tạo mới
    if not damageModifier then
        damageModifier = { Name = "CustomDamageBoost", GlobalMultiplier = 1.0 }
        table.insert( hero.OutgoingDamageModifiers, damageModifier )
    end

    -- 3. Tăng hệ số damage thêm 6% (0.06)
    damageModifier.GlobalMultiplier = damageModifier.GlobalMultiplier + 0.06

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