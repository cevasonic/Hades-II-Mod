-- =========================================================================
-- WxBoonByWeapon.lua
-- Mục đích: Cấu hình danh sách Boon mong muốn (Target Traits) theo từng loại
-- Vũ Khí (Weapon) và Hình Thái (Aspect).
--
-- Hướng dẫn:
-- * Nếu vũ khí và Aspect đang dùng có danh sách ở đây, Mod sẽ ép rơi các loại Boon này.
-- * Nếu Aspect không được định nghĩa, nó sẽ tìm danh sách Default của Vũ Khí đó.
-- * Chọn Boon từ trait_cheatsheet.md để chép tên hiển thị hoặc ID vào đây.
-- * Để mảng rỗng {} nếu bạn muốn vũ khí đó nhận Boon theo chuẩn ngẫu nhiên (RNG thuần).
-- =========================================================================

WxBoonByWeapon = {
    -- ========================
    -- 🗡️ Đôi Dao (Dagger / Sister Blades)
    -- ========================
    Dagger = {
        Default = {
            -- Dùng cho mọi Aspect nếu không ghi cụ thể
            "Healthy Rebound",
            "Light Smite",
            "Static Shock",
        },
        Melinoe = {},
        Artemis = {},
        Morrigan = {},
        Pan = {
            "Heaven Strike",
            "Arctic Ring",
            "Wave Flourish",
            "Flood Gain",
            "Nexus Rush",
            "Super Nova",
            "Slippery Slope",
            "Electric Overload",
            "Light Smite",
            "Static Shock",
            "Arctic Gale",
            "Trick Knives",
            "King Tide"
        }
    },

    -- ========================
    -- 💀 Đầu Lâu (Skull / Argent Skull)
    -- ========================
    Skull = {
        Default = {
            
        },
        Melinoe = {
            "Heaven Strike",
            "Solar Ring",
            "Cardio Gain",
            "Flutter Flourish",
            "Nexus Rush",
            "Electric Overload",
            "Arctic Gale",
            "Shocking Loss",
            "Light Smite",
            "Static Shock",
            "Healthy Rebound",
        },
        Medea = {},
        Persephone = {},
        Hel = {}
    },

    -- ========================
    -- 🧙‍♀️ Quyền Trượng (Staff / Witch's Staff)
    -- ========================
    Staff = {
        Default = {
            "Healthy Rebound",
        },
        Melinoe = {},
        Circe = {
            "Heaven Strike",
            "Wave Flourish",
            "Storm Ring",
            "Lucid Gain",
            "Double Strike",
            "Nexus Rush",
            "Lightning Lance",
            "Static Shock",
            "Electric Overload",
            "Arctic Gale",
            "Shocking Loss",
            "Local Climate",
            "Chasm",
            "Super Nova",
            "Geyser Spout",
            "Meat Grinder",
            "Winner's Circle",
            "Cut Above",
            "Ocean Swell",
            "Hostile Environment"
        },
        Momus = {},
        Asclepius = {}
    },

    -- ========================
    -- 🔥 Ngọn Đuốc (Torch / Umbral Flames)
    -- ========================
    Torch = {
        Default = {},
        Melinoe = {},
        Moros = {
            "Heaven Strike",
            "Healthy Rebound",
            "Static Shock",
            "Solar Ring",
            "Cardio Gain",
            "Flutter Flourish",
            "Nexus Rush",
            "Electric Overload",
            "Arctic Gale",
            "Shocking Loss",
            "Light Smite",
        },
        Eos = {},
        Supay = {}
    },

    -- ========================
    -- 🪓 Búa Rìu (Axe / Moonstone Axe)
    -- ========================
    Axe = {
        Default = {
            "Healthy Rebound",
            "Light Smite",
            "Static Shock",
        },
        Melinoe = {},
        Charon = {
            "Lucid Gain",
            "Nova Flourish",
            "Tidal Ring",
            "Geyser Spout",
            "Local Climate",
            "Racing Thoughts",
            "Hard Target",
            "Success Rate",
            "Shadow Pounce",
            "Exceptional Talent",
            "Sun Worshiper",
            "Giga Cleaver",
            "Sudden Cleaver",
            "Super Nova"
        },
        Thanatos = {},
        Nergal = {}
    },

    -- ========================
    -- 🧥 Áo Choàng Đen (Coat / Black Coat)
    -- ========================
    Coat = {
        Default = {},
        Melinoe = {},
        Selene = {},
        Nyx = {},
        Shiva = {}
    }
}
