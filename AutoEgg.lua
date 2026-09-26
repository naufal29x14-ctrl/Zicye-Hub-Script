local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer

local EGG_KEYWORD = "Egg"
local TELEPORT_SPEED = 0.15

local function findEggs()
    local eggs = {}
    for _, obj in pairs(Workspace:GetDescendants()) do
        if (obj:IsA("BasePart") or obj:IsA("Model"))
           and obj.Name:lower():find(EGG_KEYWORD:lower()) then
            table.insert(eggs, obj)
        end
    end
    return eggs
end

task.spawn(function()
    while true do
        task.wait(0.2)
        local char = LocalPlayer.Character
        if not char then continue end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hrp then continue end

        for _, egg in pairs(findEggs()) do
            pcall(function()
                local pos = egg:IsA("Model") and egg:GetPivot().Position or egg.Position
                local tween = TweenService:Create(
                    hrp,
                    TweenInfo.new(TELEPORT_SPEED, Enum.EasingStyle.Linear),
                    {CFrame = CFrame.new(pos + Vector3.new(0, 3, 0))}
                )
                tween:Play()
                tween.Completed:Wait()

                for _, prompt in pairs(egg:GetDescendants()) do
                    if prompt:IsA("ProximityPrompt") then
                        fireproximityprompt(prompt)
                    end
                end
            end)
        end
    end
end)

print("[ZicyeHub] Auto Egg loaded.")
