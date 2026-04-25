
function UpdateRoomCounterUI(currentRun)
    -- Lấy giá trị hiện tại, nếu chưa có thì mặc định là 1

    if currentRun == nil then
        return
    end

    local currentDepth = 0
    if CurrentRun ~= nil then
        currentDepth = CurrentRun.BiomeEncounterDepth or 1
    end
    currentDepth = currentDepth - 1

    -- Hiển thị lên HUD (tương tự logic hiển thị Money hoặc Reroll [4, 5])
    thread( PopOverheadText, {
            TargetId = CurrentRun.Hero.ObjectId,
            Amount = currentDepth,
            Text = "{#UseMoneyFormat}{$TempTextData.Amount}{!Icons.PlantGLotusIconAlt}",         -- Sử dụng mã văn bản đã được định cấu hình có icon [1]
            Duration = 2.0,               -- Thời gian hiển thị
            Delay = 1.0
        })

    
end