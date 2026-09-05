local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local Enabled = false

local function GetTarget()
    local Targets = {}

    for _, Player in Players:GetPlayers() do
        if Player ~= LocalPlayer then
            local Root = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
            if Root then
                Targets[#Targets + 1] = Root
            end
        end
    end

    return #Targets > 0 and Targets[math.random(#Targets)]
end

local Gui = Instance.new("ScreenGui")
Gui.ResetOnSpawn = false
Gui.Parent = game:GetService("CoreGui")

local Button = Instance.new("TextButton")
Button.Size = UDim2.fromOffset(150, 40)
Button.Position = UDim2.new(1, -160, 0, 10)
Button.Text = "use perfection..."
Button.Parent = Gui

Button.Activated:Connect(function()
    Enabled = not Enabled
end)

RunService.Heartbeat:Connect(function()
    if not Enabled then
        return
    end

    local Target = GetTarget()
    local Root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

    if Target and Root then
        Root.CFrame = Target.CFrame * CFrame.new(0, 0, 3)
    end
end)
