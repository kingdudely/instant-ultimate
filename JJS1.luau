local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
    Name = "hellooooo",
    LoadingTitle = "by iniciante_513"
})

local Tab = Window:CreateTab("bypass and kill")

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local Ativo = false

local function PegarJogadorAleatorio()
    local Lista = {}

    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer 
        and p.Character 
        and p.Character:FindFirstChild("HumanoidRootPart") then
            table.insert(Lista, p)
        end
    end

    if #Lista > 0 then
        return Lista[math.random(1, #Lista)]
    end
end

Tab:CreateToggle({
    Name = "use perfection...",
    CurrentValue = false,
    Callback = function(valor)
        Ativo = valor

        while Ativo do
            local Alvo = PegarJogadorAleatorio()

            if Alvo and Alvo.Character then
                local MeuChar = LocalPlayer.Character
                local MeuHRP = MeuChar and MeuChar:FindFirstChild("HumanoidRootPart")
                local AlvoHRP = Alvo.Character:FindFirstChild("HumanoidRootPart")

                if MeuHRP and AlvoHRP then
                    -- fica colado atrás do jogador
                    local Tempo = 0.01
                    local Inicio = tick()

                    while tick() - Inicio < Tempo and Ativo do
                        MeuHRP.CFrame = AlvoHRP.CFrame * CFrame.new(0, 0, 3)
                        task.wait()
                    end
                end
            end

            task.wait()
        end
    end
})
