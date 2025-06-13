-- Momo jumpscare script by 100days0o
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local SoundService = game:GetService("SoundService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- Đợi PlayerGui có sẵn
local playerGui = LocalPlayer:WaitForChild("PlayerGui", 5)
if not playerGui then return end

-- GUI setup
local gui = Instance.new("ScreenGui")
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.Name = "MomoJumpscare"
gui.Parent = playerGui

-- White flash
local flash = Instance.new("Frame")
flash.Size = UDim2.new(1, 0, 1, 0)
flash.BackgroundColor3 = Color3.new(1, 1, 1)
flash.BackgroundTransparency = 1
flash.ZIndex = 9
flash.Parent = gui

-- Momo face
local momo = Instance.new("ImageLabel")
momo.Size = UDim2.new(0.1, 0, 0.1, 0)
momo.Position = UDim2.new(0.45, 0, 0.45, 0)
momo.BackgroundTransparency = 1
momo.Image = "rbxassetid://10493515256"
momo.ImageTransparency = 0
momo.ZIndex = 10
momo.Parent = gui

-- Scream sounds
local scream1 = Instance.new("Sound", SoundService)
scream1.SoundId = "rbxassetid://138186576"
scream1.Volume = 1

local scream2 = Instance.new("Sound", SoundService)
scream2.SoundId = "rbxassetid://9118823100"
scream2.Volume = 1

-- Flash effect
TweenService:Create(flash, TweenInfo.new(0.1), {BackgroundTransparency = 0}):Play()
task.wait(0.1)
TweenService:Create(flash, TweenInfo.new(0.5), {BackgroundTransparency = 1}):Play()

-- Zoom in Momo
TweenService:Create(momo, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {
	Size = UDim2.new(1.5, 0, 1.5, 0),
	Position = UDim2.new(-0.25, 0, -0.25, 0)
}):Play()

-- Camera shake and scream
task.spawn(function()
	scream1:Play()
	scream2:Play()
	for i = 1, 15 do
		Camera.CFrame *= CFrame.new(math.random(-1,1)*0.25, math.random(-1,1)*0.25, 0)
		task.wait(0.03)
	end
end)

-- Show text before kick
task.delay(9, function()
	local text = Instance.new("TextLabel", gui)
	text.Size = UDim2.new(1, 0, 1, 0)
	text.Position = UDim2.new(0, 0, 0, 0)
	text.BackgroundTransparency = 1
	text.Text = "⚠️ Error 100: You are too dumb 😹"
	text.TextColor3 = Color3.new(1, 0, 0)
	text.TextScaled = true
	text.Font = Enum.Font.GothamBlack
	text.ZIndex = 11
end)

-- Kick after 10 seconds
task.delay(10, function()
	LocalPlayer:Kick("Error 100: You are too dumb 😹")
end)
