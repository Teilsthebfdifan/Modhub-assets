local TweenService = game:GetService("TweenService")
local player = game.Players.LocalPlayer

require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("Santa gave you a gift!", true)
wait(3)
require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("Let's check it out!", true)
wait(2.5)
require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("Warning : script incompatible with crucifix on anything", true)
wait(1)
-- the script is open source , doors only supported
_G.Uses = 414141414141
_G.Range = 30
_G.OnAnything = true
_G.Fail = false
_G.Variant = "Electric"
loadstring(game:HttpGet('https://raw.githubusercontent.com/PenguinManiack/Crucifix/main/Crucifix.lua'))()
wait(0.4)

local function randomLightColor()
    require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("You've gotten lighten!", true)
    local randomValue = math.random()
    local chosenColor
    if randomValue <= 0.6 then
        chosenColor = Color3.fromRGB(255, 0, 0)
    elseif randomValue <= 0.85 then
        chosenColor = Color3.fromRGB(0, 255, 0)
    else
        chosenColor = Color3.fromRGB(0, 255, 255)
    end

    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart") or character.PrimaryPart

    if humanoidRootPart then
        local light = Instance.new("PointLight")
        light.Parent = humanoidRootPart
        light.Color = chosenColor
        light.Brightness = 1.4
        light.Range = 25

        task.delay(10, function()
            light:Destroy()
        end)
    end
end

local randomFunctions = {
    function() require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("You got nothing. :( ", true) end,
    function() loadstring(game:HttpGet("https://raw.githubusercontent.com/Teilsthebfdifan/Modhub-assets/refs/heads/main/DoorsA120Spawner"))() end,
    function() loadstring(game:HttpGet("https://raw.githubusercontent.com/Teilsthebfdifan/Modhub-assets/refs/heads/main/GlitchRushSpawn"))() end,
    function() loadstring(game:HttpGet("https://raw.githubusercontent.com/DripCapybara/Doors-Mode-Remakes/refs/heads/main/PandemoniumProtected.lua"))() end,
    function() loadstring(game:HttpGet("https://raw.githubusercontent.com/Teilsthebfdifan/Guiding-modhub/refs/heads/main/ModhubV30.lua"))() end,
    function() randomLightColor() end,
    function() 
game.Players.LocalPlayer.Character:SetAttribute("CanJump",true) 
    wait(15)
game.Players.LocalPlayer.Character:SetAttribute("CanJump",false)
    end,
    function() 
    local character = game.Players.LocalPlayer.Character
    character.Humanoid.Health = 75

    local explosion = Instance.new("Explosion")
    explosion.Position = character.HumanoidRootPart.Position
    explosion.BlastRadius = 10
    explosion.BlastPressure = 1000
    explosion.Parent = game.Workspace

    local sound = Instance.new("Sound", character)
    sound.SoundId = "rbxassetid://5801257793"
    sound.Volume = 7
    sound:Play()
end,
    function() 
local character = game.Players.LocalPlayer.Character
    character.Humanoid.Health = 2 
end,
    function() require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("Let's go gambling! Try again!", true) end
}

local function executeRandomFunctionAfterDelay()
    task.delay(5.9, function()
        randomFunctions[math.random(1, #randomFunctions)]()
    end)
end

local function setRedProperties(object)
    local color = Color3.fromRGB(255, 0, 0)
    local decal1Texture = "rbxassetid://102263201276472"
    local decal2Texture = "rbxassetid://91939583723813"

    if object:IsA("BasePart") then
        object.Color = color
        if object.Name == "Base" then
            local decal1 = Instance.new("Decal")
            decal1.Texture = decal1Texture
            decal1.Parent = object
            local decal2 = decal1:Clone()
            decal2.Texture = decal2Texture
            decal2.Parent = object

            for _, face in pairs(Enum.NormalId:GetEnumItems()) do
                local decalClone1 = decal1:Clone()
                decalClone1.Face = face
                decalClone1.Parent = object

                local decalClone2 = decal2:Clone()
                decalClone2.Face = face
                decalClone2.Parent = object
            end

            local particleEmitter = Instance.new("ParticleEmitter")
            particleEmitter.Texture = "rbxassetid://102263201276472"
            particleEmitter.Rate = 50
            particleEmitter.Speed = NumberRange.new(20, 40)
            particleEmitter.Lifetime = NumberRange.new(1, 2)
            particleEmitter.SpreadAngle = Vector2.new(360, 360)
            particleEmitter.Parent = object
        end
    elseif object:IsA("Light") then
        object.Color = color
    elseif object:IsA("ParticleEmitter") then
        object.Color = ColorSequence.new(color)
    elseif object:IsA("Decal") or object:IsA("Texture") then
        object.Color3 = color
    elseif object:IsA("Attachment") then
        local parent = object.Parent
        if parent:IsA("BasePart") then
            parent.Color = color
        end
    elseif object:IsA("MeshPart") or object:IsA("SpecialMesh") then
        object.VertexColor = Vector3.new(1, 0, 0)
    elseif object:IsA("Beam") then
        object.Color = ColorSequence.new(color)
    end
end

local function setGreenProperties(object)
    local color = Color3.fromRGB(0, 255, 0)
    local decal1Texture = "rbxassetid://102263201276472"
    local decal2Texture = "rbxassetid://91939583723813"

    if object:IsA("BasePart") then
        object.Color = color
        if object.Name == "Base" then
            local decal1 = Instance.new("Decal")
            decal1.Texture = decal1Texture
            decal1.Parent = object
            local decal2 = decal1:Clone()
            decal2.Texture = decal2Texture
            decal2.Parent = object

            for _, face in pairs(Enum.NormalId:GetEnumItems()) do
                local decalClone1 = decal1:Clone()
                decalClone1.Face = face
                decalClone1.Parent = object

                local decalClone2 = decal2:Clone()
                decalClone2.Face = face
                decalClone2.Parent = object
            end

            local particleEmitter = Instance.new("ParticleEmitter")
            particleEmitter.Texture = "rbxassetid://102263201276472"
            particleEmitter.Rate = 50
            particleEmitter.Speed = NumberRange.new(20, 40)
            particleEmitter.Lifetime = NumberRange.new(1, 2)
            particleEmitter.SpreadAngle = Vector2.new(360, 360)
            particleEmitter.Parent = object
        end
    elseif object:IsA("Light") then
        object.Color = color
    elseif object:IsA("ParticleEmitter") then
        object.Color = ColorSequence.new(color)
    elseif object:IsA("Decal") or object:IsA("Texture") then
        object.Color3 = color
    elseif object:IsA("Attachment") then
        local parent = object.Parent
        if parent:IsA("BasePart") then
            parent.Color = color
        end
    elseif object:IsA("MeshPart") or object:IsA("SpecialMesh") then
        object.VertexColor = Vector3.new(0, 1, 0)
    elseif object:IsA("Beam") then
        object.Color = ColorSequence.new(color)
    end
end

local function setProperties(object)
    if math.random() < 0.5 then
        setRedProperties(object)
    else
        setGreenProperties(object)
    end
end

local function checkAndModifyRepentanceModel(object)
    if object:IsA("Model") and object.Name == "Repentance" then
        executeRandomFunctionAfterDelay()

        local pentagram = object:FindFirstChild("Pentagram")
        if pentagram and pentagram:IsA("Model") then
            for _, obj in pairs(pentagram:GetDescendants()) do
                setProperties(obj)
            end
        end

        local crucifix = object:FindFirstChild("Crucifix")
        if crucifix and crucifix:IsA("Model") then
            for _, obj in pairs(crucifix:GetDescendants()) do
                setProperties(obj)
            end
        end
    end
end

local function applyCrucifixToolTexture()
    local crucifixTool = game.Players.LocalPlayer.Backpack:FindFirstChild("Crucifix")
    if crucifixTool and crucifixTool:IsA("Tool") then
        crucifixTool.TextureId = "rbxassetid://137054807147338"
    end
end

applyCrucifixToolTexture()

for _, obj in pairs(game:GetDescendants()) do
    checkAndModifyRepentanceModel(obj)
end

game.DescendantAdded:Connect(function(obj)
    checkAndModifyRepentanceModel(obj)
end)