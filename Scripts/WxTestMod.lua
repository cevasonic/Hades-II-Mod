function testMod()
    -- Mỗi khi bạn nhấn nút Confirm (thường là Enter/E) trong game
    -- Đoạn code kiểm tra Incantation của bạn sẽ chạy
    local count = 0
    for upgradeName, upgradeData in pairs(WorldUpgradeData) do
        if not GameState.WorldUpgrades[upgradeName] then
            count = count + 1
            -- In ra console của game hoặc thông báo trên đầu nhân vật
            DebugPrint({ Text = "Gia tri cua bien la: " .. upgradeName })
        end
    end
    -- Hiển thị thông báo trực tiếp trên đầu Melinoë để bạn thấy ngay
    thread( PopOverheadText, { Text = "Con thieu: "..count, Color = Color.White } )
end