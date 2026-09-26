local Players = game:GetService("Players")
local VirtualUser = game:GetService("VirtualUser")
local LocalPlayer = Players.LocalPlayer

--// Default values (dibaca UI kalau ada)
_G.ZicyeHub_AntiAfk = _G.ZicyeHub_AntiAfk ~= false
_G.ZicyeHub_AntiAfkInterval = _G.ZicyeHub_AntiAfkInterval or 60
_G.ZicyeHub_ReconnectOnKick = _G.ZicyeHub_ReconnectOnKick ~= false
_G.ZicyeHub_ReconnectDelay = _G.ZicyeHub_ReconnectDelay or 10

--// Idle hook
LocalPlayer.Idled:Connect(function()
    if not _G.ZicyeHub_AntiAfk then return end
    pcall(function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end)
end)

--// Heartbeat loop
task.spawn(function()
    while true do
        task.wait(_G.ZicyeHub_AntiAfkInterval or 60)
        if _G.ZicyeHub_AntiAfk then
            pcall(function()
                local char = LocalPlayer.Character
                if char then
                    local hum = char:FindFirstChildOfClass("Humanoid")
                    if hum then
                        hum.Jump = true
                        task.wait(0.1)
                        hum.Jump = false
                    end
                end
            end)
        end
    end
end)

--// Auto reconnect
task.spawn(function()
    while true do
        task.wait(5)
        if _G.ZicyeHub_ReconnectOnKick and not LocalPlayer.Parent then
            task.wait(_G.ZicyeHub_ReconnectDelay or 10)
            game:GetService("TeleportService"):Teleport(game.PlaceId, LocalPlayer)
        end
    end
end)

print("[ZicyeHub] Anti-AFK loaded.")
