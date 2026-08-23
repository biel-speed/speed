local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local MIN_SPEED = 20
local MAX_SPEED = 1000
local jumpSpeed = 100
local enabled = false
local NORMAL_SPEED = 16
local ACCELERATION = 18
local character
local humanoid
local rootPart
local function setupCharacter(char)
	character = char
	humanoid = char:WaitForChild("Humanoid")
	rootPart = char:WaitForChild("HumanoidRootPart")
	humanoid.WalkSpeed = NORMAL_SPEED
end
if player.Character then
	setupCharacter(player.Character)
end
player.CharacterAdded:Connect(setupCharacter)
local PINK = Color3.fromRGB(255, 105, 150)
local LIGHT_PINK = Color3.fromRGB(255, 180, 205)
local DARK_PINK = Color3.fromRGB(90, 35, 55)
local BACKGROUND = Color3.fromRGB(25, 20, 27)
local DARK = Color3.fromRGB(38, 29, 42)
local WHITE = Color3.fromRGB(255, 255, 255)
local GRAY = Color3.fromRGB(165, 150, 165)
local GREEN = Color3.fromRGB(110, 255, 165)
local gui = Instance.new("ScreenGui")
gui.Name = "BielsSpeed"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")
local main = Instance.new("Frame")
main.Size = UDim2.new(0, 330, 0, 205)
main.Position = UDim2.new(0, 25, 0, 25)
main.BackgroundColor3 = BACKGROUND
main.BorderSizePixel = 0
main.Parent = gui
local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 17)
mainCorner.Parent = main
local outline = Instance.new("UIStroke")
outline.Color = PINK
outline.Transparency = 0.35
outline.Thickness = 1.5
outline.Parent = main
local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 55)
header.BackgroundTransparency = 1
header.Parent = main
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -65, 0, 30)
title.Position = UDim2.new(0, 17, 0, 7)
title.BackgroundTransparency = 1
title.Text = "Biel's Speed"
title.TextColor3 = WHITE
title.TextSize = 20
title.Font = Enum.Font.GothamBlack
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = header
local smallTitle = Instance.new("TextLabel")
smallTitle.Size = UDim2.new(1, -65, 0, 15)
smallTitle.Position = UDim2.new(0, 18, 0, 34)
smallTitle.BackgroundTransparency = 1
smallTitle.Text = "SPEED"
smallTitle.TextColor3 = LIGHT_PINK
smallTitle.TextSize = 9
smallTitle.Font = Enum.Font.GothamBold
smallTitle.TextXAlignment = Enum.TextXAlignment.Left
smallTitle.Parent = header
local hideButton = Instance.new("TextButton")
hideButton.Size = UDim2.new(0, 30, 0, 30)
hideButton.Position = UDim2.new(1, -43, 0, 12)
hideButton.BackgroundColor3 = DARK
hideButton.Text = "×"
hideButton.TextColor3 = LIGHT_PINK
hideButton.TextSize = 17
hideButton.Font = Enum.Font.GothamBold
hideButton.BorderSizePixel = 0
hideButton.Parent = header
local hideCorner = Instance.new("UICorner")
hideCorner.CornerRadius = UDim.new(1, 0)
hideCorner.Parent = hideButton
local content = Instance.new("Frame")
content.Size = UDim2.new(1, 0, 0, 150)
content.Position = UDim2.new(0, 0, 0, 55)
content.BackgroundTransparency = 1
content.Parent = main
local speedLabel = Instance.new("TextLabel")
speedLabel.Size = UDim2.new(0, 150, 0, 25)
speedLabel.Position = UDim2.new(0, 18, 0, 5)
speedLabel.BackgroundTransparency = 1
speedLabel.Text = "Jump Speed"
speedLabel.TextColor3 = WHITE
speedLabel.TextSize = 13
speedLabel.Font = Enum.Font.GothamMedium
speedLabel.TextXAlignment = Enum.TextXAlignment.Left
speedLabel.Parent = content
local valueLabel = Instance.new("TextLabel")
valueLabel.Size = UDim2.new(0, 100, 0, 25)
valueLabel.Position = UDim2.new(1, -118, 0, 5)
valueLabel.BackgroundTransparency = 1
valueLabel.Text = tostring(jumpSpeed)
valueLabel.TextColor3 = LIGHT_PINK
valueLabel.TextSize = 14
valueLabel.Font = Enum.Font.GothamBlack
valueLabel.TextXAlignment = Enum.TextXAlignment.Right
valueLabel.Parent = content
local slider = Instance.new("Frame")
slider.Size = UDim2.new(0, 294, 0, 7)
slider.Position = UDim2.new(0, 18, 0, 38)
slider.BackgroundColor3 = DARK
slider.BorderSizePixel = 0
slider.Parent = content
local sliderCorner = Instance.new("UICorner")
sliderCorner.CornerRadius = UDim.new(1, 0)
sliderCorner.Parent = slider
local startPercent = (jumpSpeed - MIN_SPEED) / (MAX_SPEED - MIN_SPEED)
local fill = Instance.new("Frame")
fill.Size = UDim2.new(startPercent, 0, 1, 0)
fill.BackgroundColor3 = PINK
fill.BorderSizePixel = 0
fill.Parent = slider
local fillCorner = Instance.new("UICorner")
fillCorner.CornerRadius = UDim.new(1, 0)
fillCorner.Parent = fill
local knob = Instance.new("Frame")
knob.Size = UDim2.new(0, 17, 0, 17)
knob.AnchorPoint = Vector2.new(0.5, 0.5)
knob.Position = UDim2.new(startPercent, 0, 0.5, 0)
knob.BackgroundColor3 = WHITE
knob.BorderSizePixel = 0
knob.Parent = slider
local knobCorner = Instance.new("UICorner")
knobCorner.CornerRadius = UDim.new(1, 0)
knobCorner.Parent = knob
local knobStroke = Instance.new("UIStroke")
knobStroke.Color = PINK
knobStroke.Thickness = 2
knobStroke.Parent = knob
local enable = Instance.new("TextButton")
enable.Size = UDim2.new(0, 140, 0, 38)
enable.Position = UDim2.new(0, 18, 0, 65)
enable.BackgroundColor3 = PINK
enable.Text = "ENABLE"
enable.TextColor3 = WHITE
enable.TextSize = 12
enable.Font = Enum.Font.GothamBold
enable.BorderSizePixel = 0
enable.Parent = content
local enableCorner = Instance.new("UICorner")
enableCorner.CornerRadius = UDim.new(0, 10)
enableCorner.Parent = enable
local disable = Instance.new("TextButton")
disable.Size = UDim2.new(0, 140, 0, 38)
disable.Position = UDim2.new(0, 166, 0, 65)
disable.BackgroundColor3 = DARK
disable.Text = "DISABLED"
disable.TextColor3 = GRAY
disable.TextSize = 12
disable.Font = Enum.Font.GothamBold
disable.BorderSizePixel = 0
disable.Parent = content
local disableCorner = Instance.new("UICorner")
disableCorner.CornerRadius = UDim.new(0, 10)
disableCorner.Parent = disable
local status = Instance.new("TextLabel")
status.Size = UDim2.new(1, -36, 0, 20)
status.Position = UDim2.new(0, 18, 0, 112)
status.BackgroundTransparency = 1
status.Text = "● Disabled"
status.TextColor3 = GRAY
status.TextSize = 10
status.Font = Enum.Font.GothamMedium
status.TextXAlignment = Enum.TextXAlignment.Left
status.Parent = content
local circle = Instance.new("TextButton")
circle.Size = UDim2.new(0, 52, 0, 52)
circle.Position = main.Position
circle.BackgroundColor3 = PINK
circle.Text = "S"
circle.TextColor3 = WHITE
circle.TextSize = 20
circle.Font = Enum.Font.GothamBlack
circle.BorderSizePixel = 0
circle.Visible = false
circle.Parent = gui
local circleCorner = Instance.new("UICorner")
circleCorner.CornerRadius = UDim.new(1, 0)
circleCorner.Parent = circle
local circleStroke = Instance.new("UIStroke")
circleStroke.Color = LIGHT_PINK
circleStroke.Thickness = 2
circleStroke.Parent = circle
local sliding = false
local function updateSlider(x)
	local percent = math.clamp((x - slider.AbsolutePosition.X) / slider.AbsoluteSize.X, 0, 1)
	jumpSpeed = math.floor(MIN_SPEED + ((MAX_SPEED - MIN_SPEED) * percent))
	fill.Size = UDim2.new(percent, 0, 1, 0)
	knob.Position = UDim2.new(percent, 0, 0.5, 0)
	valueLabel.Text = tostring(jumpSpeed)
end
slider.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		sliding = true
		updateSlider(input.Position.X)
	end
end)
UserInputService.InputChanged:Connect(function(input)
	if sliding then
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			updateSlider(input.Position.X)
		end
	end
end)
UserInputService.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		sliding = false
	end
end)
enable.MouseButton1Click:Connect(function()
	enabled = true
	enable.Text = "ENABLED"
	enable.BackgroundColor3 = LIGHT_PINK
	enable.TextColor3 = BACKGROUND
	disable.Text = "DISABLE"
	disable.BackgroundColor3 = DARK
	disable.TextColor3 = GRAY
	status.Text = "● Enabled"
	status.TextColor3 = GREEN
end)
disable.MouseButton1Click:Connect(function()
	enabled = false
	enable.Text = "ENABLE"
	enable.BackgroundColor3 = PINK
	enable.TextColor3 = WHITE
	disable.Text = "DISABLED"
	disable.BackgroundColor3 = DARK_PINK
	disable.TextColor3 = LIGHT_PINK
	status.Text = "● Disabled"
	status.TextColor3 = GRAY
	if humanoid then
		humanoid.WalkSpeed = NORMAL_SPEED
	end
end)
hideButton.MouseButton1Click:Connect(function()
	circle.Position = main.Position
	main.Visible = false
	circle.Visible = true
end)
circle.MouseButton1Click:Connect(function()
	main.Position = circle.Position
	circle.Visible = false
	main.Visible = true
end)
local dragging = false
local dragStart
local startPosition
header.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPosition = main.Position
	end
end)
UserInputService.InputChanged:Connect(function(input)
	if dragging then
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			local delta = input.Position - dragStart
			main.Position = UDim2.new(startPosition.X.Scale, startPosition.X.Offset + delta.X, startPosition.Y.Scale, startPosition.Y.Offset + delta.Y)
		end
	end
end)
UserInputService.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = false
	end
end)
local currentBoost = 0
local wasGrounded = true
RunService.Heartbeat:Connect(function(dt)
	if not character or not humanoid or not rootPart or humanoid.Health <= 0 then
		return
	end
	humanoid.WalkSpeed = NORMAL_SPEED
	if not enabled then
		currentBoost = 0
		return
	end
	local state = humanoid:GetState()
	local airborne = state == Enum.HumanoidStateType.Jumping or state == Enum.HumanoidStateType.Freefall
	local grounded = state == Enum.HumanoidStateType.Running or state == Enum.HumanoidStateType.RunningNoPhysics or state == Enum.HumanoidStateType.Landed
	local direction = humanoid.MoveDirection
	if airborne and direction.Magnitude > 0 then
		local targetSpeed = jumpSpeed
		currentBoost = currentBoost + (targetSpeed - currentBoost) * math.clamp(ACCELERATION * dt, 0, 1)
		local velocity = rootPart.AssemblyLinearVelocity
		rootPart.AssemblyLinearVelocity = Vector3.new(direction.X * currentBoost, velocity.Y, direction.Z * currentBoost)
		wasGrounded = false
	elseif grounded and not wasGrounded then
		local velocity = rootPart.AssemblyLinearVelocity
		local horizontal = Vector3.new(velocity.X, 0, velocity.Z)
		if horizontal.Magnitude > 0 then
			local keepSpeed = math.min(horizontal.Magnitude, jumpSpeed)
			local direction2 = horizontal.Unit
			rootPart.AssemblyLinearVelocity = Vector3.new(direction2.X * keepSpeed, velocity.Y, direction2.Z * keepSpeed)
		end
		wasGrounded = true
	end
end)
