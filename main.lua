--[[
    ZicyeHub — Steal An Egg
    Author: REDZ
    UI: Orion Library
]]

local BASE = "https://raw.githubusercontent.com/naufal29x14-ctrl/Zicye-Hub-Script/main/"

--// LOAD ANTI-AFK
local ok1, err1 = pcall(function()
    loadstring(game:HttpGet(BASE .. "antiAfk.lua"))()
end)
if not ok1 then warn("[ZicyeHub] antiAfk error: " .. tostring(err1)) end

--// LOAD AUTO EGG
local ok2, err2 = pcall(function()
    loadstring(game:HttpGet(BASE .. "autoEgg.lua"))()
end)
if not ok2 then warn("[ZicyeHub] autoEgg error: " .. tostring(err2)) end

--// LOAD UI (ORION)
local ok3, err3 = pcall(function()
    loadstring(game:HttpGet(BASE .. "uiToggle.lua"))()
end)
if not ok3 then warn("[ZicyeHub] uiToggle error: " .. tostring(err3)) end

print("[ZicyeHub] All modules loaded.")
