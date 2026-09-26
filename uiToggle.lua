local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local gui = Instance.new("ScreenGui")
gui.Name = "ZicyeHub"
gui.ResetOnSpawn = false
gui.Parent = PlayerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 260, 0, 440)
frame.Position = UDim2.new(0, 20, 0, 100)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.Parent = gui

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 40)
title.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
title.Text = "ZicyeHub v1.0.0"
title.TextColor3 = Color3.fromRGB(255, 80, 80)
title.Font = Enum.Font.GothamBold
title.TextSize = 18
title.Parent = frame

local close = Instance.new("TextButton")
close.Size = UDim2.new(0, 40, 0, 40)
close.Position = UDim2.new(1, -40, 0, 0)
close.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
close.Text = "X"
close.TextColor3 = Color3.fromRGB(255, 255, 255)
close.Font = Enum.Font.GothamBold
close.TextSize = 18
close.Parent = title
close.MouseButton1Click:Connect(function() gui:Destroy() end)

local list = {
    "Anti-AFK",
    "Auto Collect Egg",
    "Auto Steal Egg",
    "Auto Hatch Egg",
    "Auto Place Best Pet",
    "Auto Upgrade Plot",
    "Auto Hunt Drones"
}

local y = 50
for _, name in ipairs(list) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -20, 0, 40)
    btn.Position = UDim2.new(0, 10, 0, y)
    btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    btn.BorderSizePixel = 0
    btn.Text = name
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.Gotham
    btn.TextSize = 14
    btn.TextXAlignment = Enum.TextXAlignment.Left
    btn.Parent = frame

    local status = Instance.new("TextLabel")
    status.Size = UDim2.new(0, 60, 1, 0)
    status.Position = UDim2.new(1, -60, 0, 0)
    status.BackgroundTransparency = 1
    status.Text = "OFF"
    status.TextColor3 = Color3.fromRGB(255, 80, 80)
    status.Font = Enum.Font.GothamBold
    status.TextSize = 14
    status.Parent = btn

    local on = false
    btn.MouseButton1Click:Connect(function()
        on = not on
        if on then
            status.Text = "ON"
            status.TextColor3 = Color3.fromRGB(0, 255, 0)
            btn.BackgroundColor3 = Color3.fromRGB(40, 80, 40)
        else
            status.Text = "OFF"
            status.TextColor3 = Color3.fromRGB(255, 80, 80)
            btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        end
    end)

    y = y + 45
end

print("[ZicyeHub] UI Toggle loaded.")
