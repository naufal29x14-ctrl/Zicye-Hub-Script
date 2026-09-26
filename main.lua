--[[
    ZicyeHub — Steal An Egg
    Author: REDZ
]]

local BASE = "https://raw.githubusercontent.com/nautal29x14-ctrl/Zicye-Hub-Script/main/"

loadstring(game:HttpGet(BASE .. "modules/antiAfk.lua"))()
loadstring(game:HttpGet(BASE .. "modules/autoEgg.lua"))()
loadstring(game:HttpGet(BASE .. "modules/uiToggle.lua"))()

print("[ZicyeHub] Loaded.")
