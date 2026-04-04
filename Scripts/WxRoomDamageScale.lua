function UpdateRoomDamageBonus( currentRun )
    if currentRun == nil then return end
    
    -- Mỗi lần qua room, tăng thêm 1% sát thương (0.01)
    local bonusPerRoom = 0.01
    currentRun.WxRoomDamageBonus = (currentRun.WxRoomDamageBonus or 0) + bonusPerRoom
end

function ApplyRoomDamageBonus( hero )
    if CurrentRun == nil or CurrentRun.WxRoomDamageBonus == nil or CurrentRun.WxRoomDamageBonus <= 0 then
        return
    end

    -- Đảm bảo danh sách modifier sát thương tồn tại
    hero.OutgoingDamageModifiers = hero.OutgoingDamageModifiers or {}
    
    -- Xóa modifier cũ của Mod này để cập nhật giá trị mới (tránh cộng dồn lặp lại khi load room)
    for i = #hero.OutgoingDamageModifiers, 1, -1 do
        if hero.OutgoingDamageModifiers[i].Name == "WxRoomDamageBonus" then
            table.remove(hero.OutgoingDamageModifiers, i)
        end
    end

    -- Thêm modifier sát thương tổng dựa trên số phòng đã qua
    table.insert( hero.OutgoingDamageModifiers, 
    {
        Name = "WxRoomDamageBonus",
        Multiplier = 1.0 + CurrentRun.WxRoomDamageBonus
    })
    
    -- Sử dụng PreDelay để thông báo hiện ra chậm hơn một chút (ví dụ 1.5 giây)
    -- giúp người chơi dễ chú ý hơn khi vừa load xong màn hình đen
    thread( 
        InCombatText, {
            TargetId = CurrentRun.Hero.ObjectId,
            Text = "{!Icons.UnderworldIcon}: " .. (CurrentRun.WxRoomDamageBonus * 100) .. "%",
            Duration = 2.0,
            PreDelay = 1.5,
            ShadowScale = 1.5,
        }
    )
end