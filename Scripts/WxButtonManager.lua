-- Quản lý nút bấm Mod cho Hades II

-- Hàm bật/tắt nút bấm (Toggle)
function ToggleModMenuButton()
    if ScreenAnchors.CustomModButtonId ~= nil then
        Destroy({ Id = ScreenAnchors.CustomModButtonId })
        ScreenAnchors.CustomModButtonId = nil
    else
        CreateModMenuButton(150, 150)
    end
end

-- Hàm tạo nút bấm lên màn hình
function CreateModMenuButton(x, y)
    -- Chỉ tạo nút khi đang trong màn chơi (Run)
    if CurrentRun == nil or CurrentRun.Hero == nil then
        return
    end

    -- Nếu nút đã tồn tại (ví dụ khi load lại phòng), xóa nút cũ trước khi tạo mới
    if ScreenAnchors.CustomModButtonId ~= nil then
        Destroy({ Id = ScreenAnchors.CustomModButtonId })
    end

    -- 1. Tạo component nền cho nút
    local button = CreateScreenComponent({
        Name = "rectangle01",
        Group = "Combat_UI",
        X = x or 150,
        Y = y or 150
    })

    -- Lưu Id để quản lý
    ScreenAnchors.CustomModButtonId = button.Id

    -- 2. Cấu hình ngoại hình
    SetColor({ Id = button.Id, Color = Color.Gold })
    SetScale({ Id = button.Id, Fraction = 0.5 })

        -- 3. Cấu hình tương tác
    -- Kết nối bảng Lua với object engine để engine gọi được hàm callback
    AttachLua({ Id = button.Id, Table = button })
    button.OnPressedFunctionName = "HandleModButtonClick"
    SetInteractProperty({ DestinationId = button.Id, Property = "FreeFormSelectable", Value = true })
    SetInteractProperty({ DestinationId = button.Id, Property = "TooltipOffsetX", Value = 0 })

    -- 4. Thêm văn bản hiển thị
    CreateTextBox({
        Id = button.Id,
        Text = "SCAN",
        FontSize = 18,
        Color = Color.Black,
        Justification = "Center"
    })
end

-- Hàm xử lý khi người dùng nhấn vào nút
function HandleModButtonClick(screen, button)
    -- Gọi hàm logic từ file WxTestMod.lua để tránh lặp code
    if testMod ~= nil then
        testMod()
    else
        DebugPrint({ Text = "Lỗi: Không tìm thấy hàm testMod()" })
    end
end

-- Đăng ký phím tắt (Hotkey) để hiện/ẩn nút
-- Tay cầm: Giữ Rush (LB/L1) + nhấn MenuDown (D-Pad xuống)
-- Bàn phím: Giữ Shift + nhấn Mũi tên xuống
OnControlPressed { "MenuDown",
    function()
        if IsControlDown({ Name = "Rush" }) then
            ToggleModMenuButton()
        end
    end
}

-- Đăng ký phím tắt để KÍCH HOẠT nút (thay cho click chuột)
-- Tay cầm: Giữ Rush (LB/L1) + nhấn MenuUp (D-Pad lên)
-- Bàn phím: Giữ Shift + nhấn Mũi tên lên
OnControlPressed { "MenuUp",
    function()
        if IsControlDown({ Name = "Rush" }) then
            -- Chỉ kích hoạt khi nút đang hiển thị trên màn hình
            if ScreenAnchors.CustomModButtonId ~= nil then
                HandleModButtonClick()
            else
                DebugPrint({ Text = "Nút SCAN chưa hiển thị. Nhấn Rush + MenuDown trước." })
            end
        end
    end
}
