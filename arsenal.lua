function getPlayersService()
    for _, child in pairs(game:GetChildren()) do
        if child.ClassName == "Players" then
            return child
        end
    end
end

local playersService = getPlayersService()
local localPlayer = game.Players.LocalPlayer

local function manipulateParts()
    while true do
        wait(1)
        for _, v in ipairs(playersService:GetPlayers()) do
            if v ~= localPlayer and v.Character then
                local humanoidRootPart = v.Character:FindFirstChild("HeadHB")
                if humanoidRootPart then
                    humanoidRootPart.Transparency = 0.7
                    humanoidRootPart.Material = Enum.Material.ForceField
                    humanoidRootPart.Size = Vector3.new(5, 5, 5)
                    humanoidRootPart.Color3.new = "Black"

                    local sphereMesh = Instance.new("SpecialMesh")
                    sphereMesh.MeshType = Enum.MeshType.Sphere
                    sphereMesh.Scale = Vector3.new(5, 5, 5)
                    sphereMesh.Parent = humanoidRootPart
                end
            end
        end
    end
end

coroutine.wrap(manipulateParts)()
