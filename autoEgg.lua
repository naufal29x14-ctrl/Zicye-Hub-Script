local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer

_G.ZicyeHub_AutoCollectEgg = _G.ZicyeHub_AutoCollectEgg or false
_G.ZicyeHub_TeleportSpeed = _G.ZicyeHub_TeleportSpeed or 0.15
_G.ZicyeHub_EggKeyword = _G.ZicyeHub_EggKeyword or "Egg"

local function findEggs()
    local eggs = {}
    local kw = (_G.ZicyeHub_EggKeyword or "Egg"):lower()
    for _, obj in pairs(Workspace:GetDescendants()) do
        if (obj:IsA("BasePart") or obj:IsA("Model"))
           and obj.Name:lower():find(kw) then
            table.insert(eggs, obj)
        end
    end
    return eggs
end

local function collectEgg(egg, hrp)
    local pos = egg:IsA("Model") and egg:GetPivot().Position or egg.Position
    local tween = TweenService:Create(
        hrp,
        TweenInfo.new(_G.ZicyeHub_TeleportSpeed or 0.15, Enum.EasingStyle.Linear),
        {CFrame = CFrame.new(pos + Vector3.new(0, 3, 0))}
    )
    tween:Play()
    tween.Completed:Wait()

    for _, prompt in pairs(egg:GetDescendants()) do
        if prompt:IsA("ProximityPrompt") then
            fireproximityprompt(prompt)
        end
    end
end

--// Loop
task.spawn(function()
    while true do
        task.wait(0.2)
        if _G.ZicyeHub_AutoCollectEgg then
            local char = LocalPlayer.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            if hrp then
                for _, egg in pairs(findEggs()) do
                    pcall(function() collectEgg(egg, hrp) end)
                end
            end
        end
    end
end)

--// Force collect trigger buat button
_G.ZicyeHub_ForceCollect = function()
    local char = LocalPlayer.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if hrp then
        for _, egg in pairs(findEggs()) do
            pcall(function() collectEgg(egg, hrp) end)
        end
    end
end

print("[ZicyeHub] Auto Egg loaded.")
