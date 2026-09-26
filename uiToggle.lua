--[[
    ZicyeHub — UI Toggle (Orion Library)
    Author: REDZ
]]

--// BOOT ORION
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/jensonhirst/Orion/main/source.lua"))()

--// WINDOW
local Window = OrionLib:MakeWindow({
    Name = "ZicyeHub v1.0.0",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "ZicyeHub",
    IntroEnabled = true,
    IntroText = "ZicyeHub Loading...",
    IntroIcon = "rbxassetid://4483345998",
    Icon = "rbxassetid://4483345998",
    CloseCallback = function()
        print("[ZicyeHub] Window closed.")
    end
})

--// TABS
local EggTab = Window:MakeTab({
    Name = "Egg",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local AntiAfkTab = Window:MakeTab({
    Name = "Anti-AFK",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

--// SECTION: EGG
local EggSection = EggTab:AddSection({ Name = "Egg Automation" })

EggTab:AddToggle({
    Name = "Auto Collect Egg",
    Default = false,
    Save = true,
    Flag = "autoCollectEgg",
    Callback = function(v)
        _G.ZicyeHub_AutoCollectEgg = v
        print("[ZicyeHub] Auto Collect Egg = " .. tostring(v))
    end
})

EggTab:AddToggle({
    Name = "Auto Steal Egg",
    Default = false,
    Save = true,
    Flag = "autoStealEgg",
    Callback = function(v)
        _G.ZicyeHub_AutoStealEgg = v
        print("[ZicyeHub] Auto Steal Egg = " .. tostring(v))
    end
})

EggTab:AddToggle({
    Name = "Auto Hatch Egg",
    Default = false,
    Save = true,
    Flag = "autoHatchEgg",
    Callback = function(v)
        _G.ZicyeHub_AutoHatchEgg = v
        print("[ZicyeHub] Auto Hatch Egg = " .. tostring(v))
    end
})

EggTab:AddToggle({
    Name = "Auto Place Best Pet",
    Default = false,
    Save = true,
    Flag = "autoPlaceBestPet",
    Callback = function(v)
        _G.ZicyeHub_AutoPlaceBestPet = v
        print("[ZicyeHub] Auto Place Best Pet = " .. tostring(v))
    end
})

EggTab:AddSlider({
    Name = "Teleport Speed",
    Min = 0.05,
    Max = 1,
    Default = 0.15,
    Color = Color3.fromRGB(255, 80, 80),
    Increment = 0.05,
    ValueName = "sec",
    Flag = "teleportSpeed",
    Callback = function(v)
        _G.ZicyeHub_TeleportSpeed = v
        print("[ZicyeHub] Teleport Speed = " .. tostring(v))
    end
})

EggTab:AddTextbox({
    Name = "Egg Keyword",
    Default = "Egg",
    TextDisappear = false,
    Flag = "eggKeyword",
    Callback = function(v)
        _G.ZicyeHub_EggKeyword = v
        print("[ZicyeHub] Egg Keyword = " .. tostring(v))
    end
})

EggTab:AddButton({
    Name = "Force Collect Now",
    Callback = function()
        print("[ZicyeHub] Force collect triggered.")
        if _G.ZicyeHub_ForceCollect then
            _G.ZicyeHub_ForceCollect()
        end
    end
})

--// SECTION: ANTI-AFK
local AntiSection = AntiAfkTab:AddSection({ Name = "Anti-AFK Settings" })

AntiAfkTab:AddToggle({
    Name = "Anti-AFK Enabled",
    Default = true,
    Save = true,
    Flag = "antiAfkEnabled",
    Callback = function(v)
        _G.ZicyeHub_AntiAfk = v
        print("[ZicyeHub] Anti-AFK = " .. tostring(v))
    end
})

AntiAfkTab:AddSlider({
    Name = "Interval",
    Min = 10,
    Max = 300,
    Default = 60,
    Color = Color3.fromRGB(255, 80, 80),
    Increment = 5,
    ValueName = "sec",
    Flag = "antiAfkInterval",
    Callback = function(v)
        _G.ZicyeHub_AntiAfkInterval = v
        print("[ZicyeHub] Anti-AFK Interval = " .. tostring(v))
    end
})

AntiAfkTab:AddToggle({
    Name = "Reconnect on Kick",
    Default = true,
    Save = true,
    Flag = "reconnectOnKick",
    Callback = function(v)
        _G.ZicyeHub_ReconnectOnKick = v
        print("[ZicyeHub] Reconnect on Kick = " .. tostring(v))
    end
})

AntiAfkTab:AddSlider({
    Name = "Reconnect Delay",
    Min = 1,
    Max = 60,
    Default = 10,
    Color = Color3.fromRGB(255, 80, 80),
    Increment = 1,
    ValueName = "sec",
    Flag = "reconnectDelay",
    Callback = function(v)
        _G.ZicyeHub_ReconnectDelay = v
        print("[ZicyeHub] Reconnect Delay = " .. tostring(v))
    end
})

--// SECTION: INFO
local InfoSection = AntiAfkTab:AddSection({ Name = "Info" })

AntiAfkTab:AddParagraph(
    "ZicyeHub",
    "Steal An Egg script hub.\nAnti-AFK + Auto Egg + UI Toggle.\n\nAuthor: REDZ"
)

--// NOTIFIKASI
OrionLib:MakeNotification({
    Name = "ZicyeHub",
    Content = "Script loaded successfully!",
    Image = "rbxassetid://4483345998",
    Time = 5
})

--// INIT (WAJIB DI AKHIR)
OrionLib:Init()

print("[ZicyeHub] UI Toggle (Orion) loaded.")
