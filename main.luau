local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local Me = Players.LocalPlayer
local TargetName = "ChatGGPT"
local Distance = 3.5

local function GetRoot(Player)
    local Character = Player and Player.Character
    local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")

    return Humanoid and Humanoid.RootPart
end

local function OnSpawn(Character)
    local Humanoid = Character:WaitForChild("Humanoid")
    local LastHealth = Humanoid.Health

    Humanoid.HealthChanged:Connect(function(Health)
        if Health < LastHealth then
            Humanoid.Health = 0
        end

        LastHealth = Health
    end)
end

Me.CharacterAdded:Connect(OnSpawn)

if Me.Character then
    task.spawn(OnSpawn, Me.Character)
end

RunService.PreSimulation:Connect(function()
    local Root = GetRoot(Me)
    local TargetRoot = GetRoot(Players:FindFirstChild(TargetName))

    if Root and TargetRoot then
        Root.CFrame = TargetRoot.CFrame * CFrame.new(0, 0, -Distance)
    end
end)
