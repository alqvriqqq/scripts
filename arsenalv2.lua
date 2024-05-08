function getPlayersName()
    for i, v in pairs(game:GetChildren()) do
        if v.ClassName == "Players" then
            return v.Name
        end
    end
end

local players = getPlayersName()
local localPlayer = game[players].LocalPlayer

coroutine.resume(coroutine.create(function()
    while wait(1) do
        coroutine.resume(coroutine.create(function()
            for _, v in pairs(game[players]:GetPlayers()) do
                if v.Name ~= localPlayer.Name and v.Character then
                    local parts = {
                        "RightUpperLeg",
                        "LeftUpperLeg",
                        "HeadHB",
                        "HumanoidRootPart"
                    }
                    for _, partName in ipairs(parts) do
                        local part = v.Character[partName]
                        if part then
                            part.Transparency = 10
                        end
                    end
                end
            end
        end))
    end
end))

coroutine.resume(coroutine.create(function()
    while wait(1) do
        coroutine.resume(coroutine.create(function()
            for _, v in pairs(game[players]:GetPlayers()) do
                if v.Name ~= localPlayer.Name and v.Character then
                    local parts = {
                        "RightUpperLeg",
                        "LeftUpperLeg",
                        "HeadHB",
                        "HumanoidRootPart"
                    }
                    for _, partName in ipairs(parts) do
                        local part = v.Character[partName]
                        if part then
                            part.CanCollide = false
                            part.Size = Vector3.new(13, 13, 13)
                        end
                    end
                end
            end
        end))
    end
end))

local esp = Instance.new("BillboardGui")
esp.Size = UDim2.new(0, 50, 0, 50)
esp.StudsOffset = Vector3.new(0, 3, 0)
esp.AlwaysOnTop = true

local espText = Instance.new("TextLabel")
espText.Parent = esp
espText.BackgroundTransparency = 1
espText.Size = UDim2.new(1, 0, 1, 0)
espText.TextScaled = true
espText.TextStrokeTransparency = 0.5
espText.TextColor3 = Color3.fromRGB(255, 255, 255)

for _, v in pairs(game[players]:GetPlayers()) do
    if v.TeamColor ~= localPlayer.TeamColor then
        esp.Adornee = v.Character.Head
        espText.Text = v.Name
    end
end
