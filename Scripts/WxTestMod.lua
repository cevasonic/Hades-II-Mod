function WriteToFile( fileName, content )
    -- Sử dụng thư viện io (lưu ý: hàm này cần quyền truy cập hệ thống của engine)
    local file = io.open(fileName, "w")
    if file then
        file:write(content)
        file:close()
        return true
    end
    return false
end


function GetUnactivatedIncantations()
    local lockedList = {}
    -- Duyệt qua dữ liệu gốc của WorldUpgradeData
    for upgradeName, _ in pairs(WorldUpgradeData) do
        -- Kiểm tra xem upgradeName đã có trong GameState chưa
        if not GameState.WorldUpgrades[upgradeName] then
            table.insert(lockedList, upgradeName)
        end
    end
    return lockedList
end

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

function ExportLockedIncantationsTask()
    local lockedUpgrades = GetUnactivatedIncantations()
    local fileContent = "DANH SÁCH INCANTATIONS CHƯA KÍCH HOẠT\n"
    fileContent = fileContent .. "====================================\n"
    
    for _, name in ipairs(lockedUpgrades) do
        fileContent = fileContent .. "- " .. tostring(name) .. "\n"
    end
    
    local success = WriteToFile("E:\\Steam\\steamapps\\common\\Hades II\\Content\\Scripts\\UnopenedIncantations.txt", fileContent)
    
    if success then
        DebugPrint({ Text = "Đã xuất danh sách Incantations ra file riêng thành công!" }) -- [4], [5]
    else
        DebugPrint({ Text = "Lỗi: Không thể ghi file. Kiểm tra quyền truy cập của game." })
    end
end