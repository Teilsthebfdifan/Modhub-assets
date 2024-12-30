local TweenService = game:GetService("TweenService")
local player = game.Players.LocalPlayer
local screenGui = player.PlayerGui:FindFirstChild("MainUI")
local mainFrame = screenGui and screenGui:FindFirstChild("MainFrame")

if mainFrame then
    local vignette = Instance.new("Frame", mainFrame)
    vignette.Size = UDim2.new(1.5, 0, 1.5, 0)
    vignette.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    vignette.BackgroundTransparency = 1
    vignette.Visible = true

    local tweenInfo = TweenInfo.new(3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
    local goal = {BackgroundTransparency = 0}
    local tween = TweenService:Create(vignette, tweenInfo, goal)
    tween:Play()

    wait(3.5)

    local sound = Instance.new("Sound", player.Character)
    sound.SoundId = "rbxassetid://18554564922"
    sound.Volume = 3.5
    sound:Play()

    wait(3)
    vignette.Visible = false
    vignette:Destroy()
end

require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("You got possessed by Virdis Light.",true)
wait(4.5)
require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("Warning : script incompatible with crucifix on anything",true)
wait(1)
-- the script is open source , doors only supported
_G.Uses = 414141414141
_G.Range = 30
_G.OnAnything = true
_G.Fail = false
_G.Variant = "Electric"
loadstring(game:HttpGet('https://raw.githubusercontent.com/PenguinManiack/Crucifix/main/Crucifix.lua'))()
wait(0.4)

local function setGreenProperties(object)
    if object:IsA("BasePart") then
        object.Color = Color3.fromRGB(0, 255, 0)
        if object.Name == "Base" then
            local decal1 = Instance.new("Decal")
            decal1.Texture = "rbxassetid://83265080555664"
            decal1.Parent = object
            local decal2 = decal1:Clone()
            decal2.Texture = "rbxassetid://102276649181931"
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
            particleEmitter.Texture = "rbxassetid://74695235577665"
            particleEmitter.Rate = 50
            particleEmitter.Speed = NumberRange.new(20, 40)
            particleEmitter.Lifetime = NumberRange.new(1, 2)
            particleEmitter.SpreadAngle = Vector2.new(360, 360)
            particleEmitter.Parent = object

            delay(5.5, function()
                local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
                local goal = {Transparency = 1}
                local tween = game:GetService("TweenService"):Create(decal2, tweenInfo, goal)
                tween:Play()
                tween.Completed:Connect(function()
                    decal2:Destroy()
                end)
            end)

            delay(5.9, function()
                local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
                local goal = {Transparency = 1}
                local tween = game:GetService("TweenService"):Create(decal1, tweenInfo, goal)
                tween:Play()
                tween.Completed:Connect(function()
                    decal1:Destroy()
                    particleEmitter:Destroy()

                local sound = Instance.new("Sound", object)
                    sound.SoundId = "rbxassetid://18554564922"
                    sound.Volume = 7.5
                    sound:Play()

                    game.Players.LocalPlayer.Character:SetAttribute("CanJump", true)
                    require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("I've possessed you. Take control and jump.",true)
                    wait(10)
                    game.Players.LocalPlayer.Character:SetAttribute("CanJump", false)
                end)
            end)
        end
    elseif object:IsA("Light") then
        object.Color = Color3.fromRGB(0, 255, 0)
    elseif object:IsA("ParticleEmitter") then
        object.Color = ColorSequence.new(Color3.fromRGB(0, 255, 0))
    elseif object:IsA("Decal") or object:IsA("Texture") then
        object.Color3 = Color3.fromRGB(0, 255, 0)
    elseif object:IsA("Attachment") then
        local parent = object.Parent
        if parent:IsA("BasePart") then
            parent.Color = Color3.fromRGB(0, 255, 0)
        end
    elseif object:IsA("MeshPart") or object:IsA("SpecialMesh") then
        object.VertexColor = Vector3.new(0, 1, 0)
    elseif object:IsA("Beam") then
        object.Color = ColorSequence.new(Color3.fromRGB(0, 255, 0))
    end
end

local function replaceCrucifixSounds(crucifix)
    local glow = crucifix:FindFirstChild("Glow")
    if glow then
        local sound = glow:FindFirstChild("Sound")
        if sound and sound:IsA("Sound") then
            for _, obj in pairs(crucifix:GetDescendants()) do
                if obj:IsA("Sound") and obj ~= sound then
                    obj:Stop()
                end
            end
            sound.Looped = false
            sound.Volume = 1
            sound:Play()

            local extraSound = Instance.new("Sound", glow)
            extraSound.SoundId = "rbxassetid://107674700312648"
            extraSound.Volume = 10
            extraSound:Play()

            local particleEmitter = Instance.new("ParticleEmitter")
            particleEmitter.Texture = "rbxassetid://74695235577665"
            particleEmitter.Rate = 50
            particleEmitter.Speed = NumberRange.new(20, 40)
            particleEmitter.Lifetime = NumberRange.new(1, 2)
            particleEmitter.SpreadAngle = Vector2.new(360, 360)
            particleEmitter.Parent = glow
        end
    end
end

local function modifyEverythingInModel(targetModel)
    for _, obj in pairs(targetModel:GetDescendants()) do
        setGreenProperties(obj)
    end
end

local function checkAndModifyRepentanceModel(object)
    if object:IsA("Model") and object.Name == "Repentance" then
        local pentagram = object:FindFirstChild("Pentagram")
        if pentagram and pentagram:IsA("Model") then
            modifyEverythingInModel(pentagram)
        end

        local crucifix = object:FindFirstChild("Crucifix")
        if crucifix and crucifix:IsA("Model") then
            modifyEverythingInModel(crucifix)
            replaceCrucifixSounds(crucifix)
        end
    end
end

local function applyCrucifixToolTexture()
    local crucifixTool = game.Players.LocalPlayer.Backpack:FindFirstChild("Crucifix")
    if crucifixTool and crucifixTool:IsA("Tool") then
        crucifixTool.TextureId = "rbxassetid://85783554733206"
    end
end

applyCrucifixToolTexture()

for _, obj in pairs(game:GetDescendants()) do
    checkAndModifyRepentanceModel(obj)
end

game.DescendantAdded:Connect(function(obj)
    checkAndModifyRepentanceModel(obj)
end)