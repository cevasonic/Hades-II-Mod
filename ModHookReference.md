# Hades II Modding Hook Reference Guide

Tài liệu này lưu trữ các vị trí tùy chỉnh (hooks) cần thiết để các bản Mod `Wx` hoạt động. Khi game có bản cập nhật mới, các file gốc (`RoomLogic.lua`, `DeathLoopLogic.lua`, v.v.) có thể bị ghi đè. AI hoặc người bảo trì cần đọc file này để tái áp dụng các thay đổi.

## 1. Nguyên tắc chung
- Tất cả các file mod cá nhân bắt đầu bằng tiền tố `Wx` (ví dụ: `WxRoomDamageScale.lua`).
- File trung tâm để nạp mod là `Scripts/WxLoadMods.lua`.

---

## 2. Các vị trí cần Hook (Hook Map)

### A. Khởi tạo Mod (Global Import)
- **File**: `Scripts/RoomLogic.lua`
- **Vị trí**: Cuối danh sách `Import` (khoảng dòng 100-105).
- **Code**:
  ```lua
  Import "WxLoadMods.lua"
  ```
- **Mục tiêu**: Đảm bảo tất cả logic mod được nạp vào engine game.

### B. Kết thúc trận chiến (Room Clear)
- **File**: `Scripts/RoomLogic.lua`
- **Hàm**: `function EndEncounterEffects( currentRun, currentRoom, currentEncounter )`
- **Vị trí chèn**: Ngay sau dòng `if currentEncounter == currentRoom.Encounter or currentEncounter == MapState.EncounterOverride then`.
- **Code**:
  ```lua
  if UpdateRoomDamagePercentGrowth ~= nil then
      UpdateRoomDamagePercentGrowth( CurrentRun.Hero )
  end
  ```
- **Mục tiêu**: Kích hoạt tăng sát thương ngay khi dọn sạch quái.

### C. Tương tác cửa thoát (Exit Door)
- **File**: `Scripts/RoomLogic.lua`
- **Hàm**: `function AttemptUseDoor( door, args )`
- **Vị trí chèn**: Trước các đoạn code logic `door.EncounterCost`.
- **Code**:
  ```lua
  if GrantRandomGoldOnRoomExit ~= nil then
      GrantRandomGoldOnRoomExit( CurrentRun, door )
  end
  if UpdateRoomCounterUI ~= nil then
      UpdateRoomCounterUI( CurrentRun )
  end
  ```
- **Mục tiêu**: Trao vàng và cập nhật UI đếm phòng khi rời đi.

### D. Ghi lại chỉ số khi kết thúc Run (Death/Victory)
- **File**: `Scripts/DeathLoopLogic.lua`
- **Hàm**: `function KillHero( victim, triggerArgs )` hoặc tìm chỗ gọi `RecordRunStats()`.
- **Vị trí chèn**: Trước hoặc sau lệnh gọi `RecordRunStats()`.
- **Code**:
  ```lua
  if RecordRunStats ~= nil then
      RecordRunStats() -- Lưu ý: Mod WxWeaponUnusedActive thường ghi đè hàm này
  end
  ```

---

## 3. Hướng dẫn cho AI tương lai
Khi người dùng yêu cầu "fix mod" hoặc "update mod" sau một bản cập nhật game:
1.  Mở các file gốc tương ứng trong thư mục `Scripts/`.
2.  Tìm kiếm tên hàm (ví dụ: `AttemptUseDoor`).
3.  Kiểm tra xem các dòng `Wx` hook đã tồn tại chưa.
4.  Nếu chưa, hãy chèn lại theo đúng logic đã mô tả ở trên.
5.  Luôn kiểm tra sự tồn tại của hàm mod bằng `if FunctionName ~= nil then` để tránh lỗi crash game.

---
*Tài liệu này được tạo tự động bởi Antigravity AI để hỗ trợ bảo trì lâu dài.*
