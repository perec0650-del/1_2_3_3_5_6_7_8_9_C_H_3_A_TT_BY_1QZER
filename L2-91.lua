local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local UIS = game:GetService("UserInputService")


local character = player.Character or player.CharacterAdded:Wait()
local torso = character:FindFirstChild("UpperTorso") or character:FindFirstChild("Torso")
local humanoid = character:FindFirstChild("Humanoid")
local camera = workspace.CurrentCamera

local flying = false
local flySpeed = 60
local MaxFlySpeed = 555
local connection = nil
local preventJumpConnection = nil

local newGui = Instance.new("ScreenGui", playerGui)
newGui.Name = "A_W_E_S_O_M_E_3_5_782_LDAPROS_MENU_210291939228390282242526967676767_67_SIX_SEVEN_OMEGA-NEMEGA_NEGLARS_BY_BY__V2L_EZ"
newGui.ResetOnSpawn = false

local walkSpeed = humanoid.WalkSpeed
local jumpHeight = humanoid.JumpHeight

local newFrame = Instance.new("Frame", newGui)

newFrame.Name = "M_A_1_N----F_R_A_M_3----C_0_D_3---378921"
newFrame.Size = UDim2.new(0, 576, 0, 471)
newFrame.Position = UDim2.new(0.348, 0, 0.274, -2)
newFrame.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)

local UIDragDetector = Instance.new("UIDragDetector", newFrame)

local WALKSPEEDLabel = Instance.new("TextLabel", newFrame)
WALKSPEEDLabel.Size = UDim2.new(0,200,0,50)
WALKSPEEDLabel.Position = UDim2.new(0.075, 0, 0.096, 0)
WALKSPEEDLabel.Text = "WalkSpeed"

local WALKSPEEDTextBox = Instance.new("TextBox", newFrame)
WALKSPEEDTextBox.Size  = UDim2.new(0,200, 0,50)
WALKSPEEDTextBox.Position = UDim2.new(0.075, 0, 0.242, 0)
WALKSPEEDTextBox.Text = walkSpeed
WALKSPEEDTextBox.TextScaled = true


local JUMPHEIGHTLabel = Instance.new("TextLabel", newFrame)
JUMPHEIGHTLabel.Size = UDim2.new(0,200,0,50)
JUMPHEIGHTLabel.Position = UDim2.new(0.566, 0,0.096, 0)
JUMPHEIGHTLabel.Text = "JumpHeight"

local JUMPHEIGHTTextBox = Instance.new("TextBox", newFrame)
JUMPHEIGHTTextBox.Size  = UDim2.new(0,200, 0,50)
JUMPHEIGHTTextBox.Position = UDim2.new(0.566, 0, 0.242, 0)
JUMPHEIGHTTextBox.Text = jumpHeight
JUMPHEIGHTTextBox.TextScaled = true

local ON_OFF = Instance.new("TextButton", newFrame)
ON_OFF.Size = UDim2.new(0, 200, 0, 50)
ON_OFF.Position = UDim2.new(0.075, 0, 0.732, 0)
ON_OFF.Text = "OFF"
ON_OFF.BackgroundColor3 = Color3.new(1, 0, 0)
ON_OFF.TextScaled = true

local statusWH = false

local WALLHALabel = Instance.new("TextLabel", newFrame)
WALLHALabel.Size = UDim2.new(0,200,0,50)
WALLHALabel.Position = UDim2.new(0.075, 0,0.561, 0)
WALLHALabel.Text = "WALLHACK"
WALLHALabel.TextScaled = true
WALLHALabel.BackgroundColor3 = Color3.new(1, 0.533333, 0)

local INFINITYJUMPBUTTON = Instance.new("TextButton", newFrame)	
INFINITYJUMPBUTTON.Size = UDim2.new(0, 200, 0, 50)
INFINITYJUMPBUTTON.Position = UDim2.new(0.566, 0, 0.732, 0)
INFINITYJUMPBUTTON.Text = "OFF"
INFINITYJUMPBUTTON.BackgroundColor3 = Color3.new(1, 0, 0)
INFINITYJUMPBUTTON.TextScaled = true

local InfJumpStatus = false

local INFINITYJUMPLabel = Instance.new("TextLabel", newFrame)
INFINITYJUMPLabel.Size = UDim2.new(0,200,0,50)
INFINITYJUMPLabel.Position = UDim2.new(0.566, 0,0.561, 0)
INFINITYJUMPLabel.Text = "INFINITY JUMP"
INFINITYJUMPLabel.TextScaled = true
INFINITYJUMPLabel.BackgroundColor3 = Color3.new(0.113725, 0.380392, 1)

INFINITYJUMPBUTTON.MouseButton1Click:Connect(function()
	if not InfJumpStatus then
		InfJumpStatus = true
		INFINITYJUMPBUTTON.BackgroundColor3 = Color3.new(0, 1, 0)
		INFINITYJUMPBUTTON.Text = "ON"
	elseif InfJumpStatus then
		InfJumpStatus = false
		INFINITYJUMPBUTTON.BackgroundColor3 = Color3.new(1, 0, 0)
		INFINITYJUMPBUTTON.Text = "OFF"
	end
end)

local MainButton = Instance.new("TextButton", newFrame)
MainButton.Name = "MAIN"
MainButton.Size = UDim2.new(0, 136, 0, 31)
MainButton.Position = UDim2.new(0.381, 0,0.915, 0)
MainButton.Text = "MAIN"
MainButton.TextScaled = true
MainButton.TextColor3 = Color3.new(1, 1, 1)
MainButton.BackgroundColor3 = Color3.new(0.243137, 0.243137, 0.243137)

local InfoButton = Instance.new("TextButton", newFrame)
InfoButton.Name = "INFO"
InfoButton.Size = UDim2.new(0, 136, 0, 31)
InfoButton.Position = UDim2.new(0.09, 0,0.915, 0)
InfoButton.Text = "INFO"
InfoButton.TextScaled = true
InfoButton.TextColor3 = Color3.new(1, 1, 1)
InfoButton.BackgroundColor3 = Color3.new(0.243137, 0.243137, 0.243137)

local OtherButton = Instance.new("TextButton", newFrame)
OtherButton.Name = "OTHER"
OtherButton.Size = UDim2.new(0, 136, 0, 31)
OtherButton.Position = UDim2.new(0.677, 0,0.915, 0)
OtherButton.Text = "OTHER"
OtherButton.TextScaled = true
OtherButton.TextColor3 = Color3.new(1, 1, 1)
OtherButton.BackgroundColor3 = Color3.new(0.243137, 0.243137, 0.243137)

local InfoLabel = Instance.new("TextLabel", newFrame)
InfoLabel.Name = "InfoLabel"
InfoLabel.Text = "make by anonimous, if you wanna close menu then press to Right Control.                   Сделан неизвестным, если вы хотите закрыть меню тогда нажмите на Правый CTRL "
InfoLabel.Visible = false
InfoLabel.Size = UDim2.new(0, 473, 0, 274)
InfoLabel.Position = UDim2.new(0.088, 0, 0.155, 0)
InfoLabel.BackgroundTransparency = 1
InfoLabel.TextScaled = true
InfoLabel.TextColor3 = Color3.new(1, 1, 1)

local FPSBoost = Instance.new("TextLabel", newFrame)
FPSBoost.Name = "FPSBoost"
FPSBoost.Visible = false
FPSBoost.Text = "FPS Boost"
FPSBoost.TextScaled = true
FPSBoost.TextColor3 = Color3.new(1, 1, 1)
FPSBoost.BackgroundTransparency = 1
FPSBoost.Size = UDim2.new(0, 144, 0, 50)
FPSBoost.Position = UDim2.new(0.082, 0, 0.123, 0)

local FPSBoostButton = Instance.new("TextButton", newFrame)
FPSBoostButton.Name = "FPSBoostButton"
FPSBoostButton.Visible = false
FPSBoostButton.Text = "OFF"
FPSBoostButton.TextScaled = true
FPSBoostButton.TextColor3 = Color3.new(0, 0, 0)
FPSBoostButton.BackgroundColor3 = Color3.new(1, 0, 0)
FPSBoostButton.Size = UDim2.new(0, 93,0, 38)
FPSBoostButton.Position = UDim2.new(0.37, 0,0.136, 0)

local FlyLabel = Instance.new("TextLabel", newFrame)
FlyLabel.Name = "FlyLabel"
FlyLabel.Visible = false
FlyLabel.Text = "Fly"
FlyLabel.TextScaled = true
FlyLabel.TextColor3 = Color3.new(1, 1, 1)
FlyLabel.BackgroundTransparency = 1
FlyLabel.Size = UDim2.new(0, 144, 0, 50)
FlyLabel.Position = UDim2.new(0.089, 0,0.397, 0)

local FlyButton =  Instance.new("TextButton", newFrame)
FlyButton.Name = "FlyButton"
FlyButton.Text = "OFF"
FlyButton.Visible = false
FlyButton.TextScaled = true
FlyButton.TextColor3 = Color3.new(0, 0, 0)
FlyButton.BackgroundColor3 = Color3.new(1, 0, 0)
FlyButton.Size = UDim2.new(0, 93,0, 38)
FlyButton.Position = UDim2.new(0.37, 0,0.41, 0)

local FlyTextBox = Instance.new("TextBox", newFrame)
FlyTextBox.Name = "FlyTextBox"
FlyTextBox.Visible = false
FlyTextBox.Text = "50"
FlyTextBox.TextScaled = true
FlyTextBox.BackgroundColor3 = Color3.new(1, 1, 1)
FlyTextBox.Size = UDim2.new(0, 65,0, 38)
FlyTextBox.Position = UDim2.new(0.563, 0,0.41, 0)
FlyTextBox.PlaceholderText = "Speed"
FlyTextBox.PlaceholderColor3 = Color3.new(0.498039, 0.498039, 0.498039)

local MainFolder = Instance.new("Folder", newFrame)
MainFolder.Name = "MainFolder"

local OtherFolder = Instance.new("Folder", newFrame)
OtherFolder.Name = "OtherFolder"

local InfoFolder = Instance.new("Folder", newFrame)
InfoFolder.Name = "InfoFolder"

local StatusBackground = Instance.new("TextLabel", newFrame)
StatusBackground.Name = "StatusBackground"
StatusBackground.Text = "Main"
StatusBackground.Size = UDim2.new(0, 200,0, 30)
StatusBackground.Position = UDim2.new(0.325, 0,0.013, 0)
StatusBackground.BackgroundTransparency = 1
StatusBackground.TextScaled = true
StatusBackground.TextColor3 = Color3.new(1, 1, 1)

local CosmeticLabel = Instance.new("TextLabel", newFrame)
CosmeticLabel.Name = "Cosmetics"
CosmeticLabel.Text = "Cosmetics"
CosmeticLabel.TextScaled = true
CosmeticLabel.TextColor3 = Color3.new(1, 1, 1)
CosmeticLabel.BackgroundTransparency = 1
CosmeticLabel.Visible = false
CosmeticLabel.Size = UDim2.new(0, 144,0, 50)
CosmeticLabel.Position = UDim2.new(0.082, 0,0.257, 0)

local CosmeticButton = Instance.new("TextButton", newFrame)
CosmeticButton.Name = "CosmeticButton"
CosmeticButton.Text = "OFF"
CosmeticButton.TextScaled = true
CosmeticButton.Visible = false
CosmeticButton.TextColor3 = Color3.new(0, 0, 0)
CosmeticButton.BackgroundColor3 = Color3.new(1, 0, 0)
CosmeticButton.Size = UDim2.new(0, 93,0, 38)
CosmeticButton.Position = UDim2.new(0.37, 0,0.27, 0)

-- Re:Location --
WALKSPEEDLabel.Parent = MainFolder
JUMPHEIGHTLabel.Parent = MainFolder
WALKSPEEDTextBox.Parent = MainFolder
JUMPHEIGHTTextBox.Parent = MainFolder
WALLHALabel.Parent = MainFolder
ON_OFF.Parent = MainFolder
INFINITYJUMPLabel.Parent = MainFolder
INFINITYJUMPBUTTON.Parent = MainFolder

InfoLabel.Parent = InfoFolder

FPSBoost.Parent = OtherFolder
FPSBoostButton.Parent = OtherFolder
FlyLabel.Parent = OtherFolder
FlyButton.Parent = OtherFolder
CosmeticLabel.Parent = OtherFolder
CosmeticButton.Parent = OtherFolder
FlyTextBox.Parent = OtherFolder

-- FLY SYSTEM --
local keys = {
	W = false,
	A = false,
	S = false,
	D = false,
	Space = false,
	Ctrl = false
}

local flyInputConnections = {}
local EnabledFly = false

local function createFlightParts()
	local flightHold = Instance.new("BodyPosition")
	flightHold.Name = "FlightHold"
	flightHold.D = 1000
	flightHold.P = 10000
	flightHold.maxForce = Vector3.new(flightHold.P, flightHold.P, flightHold.P)
	flightHold.Parent = torso

	local flightPower = Instance.new("BodyVelocity")
	flightPower.Name = "FlightPower"
	flightPower.P = 1000
	flightPower.maxForce = Vector3.new(flightPower.P * 100, flightPower.P * 100, flightPower.P * 100)
	flightPower.Parent = torso

	local flightSpin = Instance.new("BodyGyro")
	flightSpin.Name = "FlightSpin"
	flightSpin.D = 1000
	flightSpin.P = 10000
	flightSpin.maxTorque = Vector3.new(flightSpin.P, flightSpin.P, flightSpin.P)
	flightSpin.Parent = torso

	return flightHold, flightPower, flightSpin
end

local function destroyFlightParts()
	local parts = {"FlightHold", "FlightPower", "FlightSpin"}
	for _, partName in ipairs(parts) do
		local part = torso:FindFirstChild(partName)
		if part then
			part:Destroy()
		end
	end
end

local function disableJump(disable)
	if preventJumpConnection then
		preventJumpConnection:Disconnect()
		preventJumpConnection = nil
	end

	if disable then
		preventJumpConnection = humanoid.Changed:Connect(function(property)
			if property == "Jump" then
				humanoid.Jump = false
			end
		end)
	end
end

local function stopFlight()
	if not flying then return end

	flying = false

	if connection then
		connection:Disconnect()
		connection = nil
	end

	destroyFlightParts()

	if humanoid and humanoid.Parent then
		humanoid.WalkSpeed = 16
		humanoid.PlatformStand = false
		humanoid.AutoRotate = true
		disableJump(false)

		local rootPart = character:FindFirstChild("HumanoidRootPart")
		if rootPart then
			rootPart.Velocity = Vector3.new(0, 0, 0)
			rootPart.RotVelocity = Vector3.new(0, 0, 0)
		end

		humanoid:ChangeState(Enum.HumanoidStateType.Freefall)
	end
end

local function startFlight()
	if flying then return end

	if not torso or not humanoid then return end

	local flightHold, flightPower, flightSpin = createFlightParts()

	flying = true
	humanoid.WalkSpeed = 0
	humanoid.PlatformStand = true
	humanoid.AutoRotate = false
	disableJump(true)

	connection = RunService.RenderStepped:Connect(function()
		if not flying or not torso or not humanoid or humanoid.Health <= 0 then
			stopFlight()
			return
		end

		local moveVector = Vector3.new(0, 0, 0)
		local cameraCFrame = camera.CFrame

		local forwardVector = cameraCFrame.LookVector
		local rightVector = cameraCFrame.RightVector
		local upVector = cameraCFrame.UpVector
		

		if keys.W then
			moveVector = moveVector + forwardVector * flySpeed
		end
		if keys.S then
			moveVector = moveVector - forwardVector * flySpeed
		end
		if keys.D then
			moveVector = moveVector + rightVector * flySpeed
		end
		if keys.A then
			moveVector = moveVector - rightVector * flySpeed
		end
		if keys.Space then
			moveVector = moveVector + upVector * flySpeed
		end
		if keys.Ctrl then
			moveVector = moveVector - upVector * flySpeed
		end

		if moveVector.Magnitude < 0.1 then
			flightHold.maxForce = Vector3.new(flightHold.P, flightHold.P, flightHold.P)
			flightPower.maxForce = Vector3.new(0, 0, 0)
			flightHold.Position = torso.Position
		else
			flightHold.maxForce = Vector3.new(0, 0, 0)
			flightPower.maxForce = Vector3.new(flightPower.P * 100, flightPower.P * 100, flightPower.P * 100)
			flightPower.Velocity = moveVector
		end

		local lookDirection = forwardVector
		if lookDirection.Magnitude > 0 then
			flightSpin.CFrame = CFrame.new(torso.Position, torso.Position + lookDirection)
		end
	end)
end

local function enableFlyFeature()
	if EnabledFly then return end
	EnabledFly = true

	FlyButton.Text = "ON"
	FlyButton.BackgroundColor3 = Color3.new(0, 1, 0)

	local inputBeganConnection = UIS.InputBegan:Connect(function(input, gameProcessed)
		if gameProcessed then return end

		if EnabledFly then
			local key = input.KeyCode

			if key == Enum.KeyCode.U then
				if flying then
					stopFlight()
					print("fly disabled")
				else
					if character and humanoid and humanoid.Health > 0 then
						startFlight()
						print("fly enabled")
					end
				end
			end

			if key == Enum.KeyCode.W then keys.W = true end
			if key == Enum.KeyCode.A then keys.A = true end
			if key == Enum.KeyCode.S then keys.S = true end
			if key == Enum.KeyCode.D then keys.D = true end
			if key == Enum.KeyCode.Space then keys.Space = true end
			if key == Enum.KeyCode.LeftControl then keys.Ctrl = true end
		end
	end)

	local inputEndedConnection = UIS.InputEnded:Connect(function(input, gameProcessed)
		if gameProcessed then return end

		if EnabledFly then
			local key = input.KeyCode

			if key == Enum.KeyCode.W then keys.W = false end
			if key == Enum.KeyCode.A then keys.A = false end
			if key == Enum.KeyCode.S then keys.S = false end
			if key == Enum.KeyCode.D then keys.D = false end
			if key == Enum.KeyCode.Space then keys.Space = false end
			if key == Enum.KeyCode.LeftControl then keys.Ctrl = false end
		end
	end)

	flyInputConnections = {inputBeganConnection, inputEndedConnection}
end

local function disableFlyFeature()
	if not EnabledFly then return end

	EnabledFly = false
	FlyButton.Text = "OFF"
	FlyButton.BackgroundColor3 = Color3.new(1, 0, 0)

	stopFlight()

	for _, conn in ipairs(flyInputConnections) do
		if conn then
			conn:Disconnect()
		end
	end
	flyInputConnections = {}

	for k in pairs(keys) do
		keys[k] = false
	end
end

FlyButton.MouseButton1Click:Connect(function()
	if EnabledFly then
		disableFlyFeature()
		print("Fly feature DISABLED")
	else
		enableFlyFeature()
		print("Fly feature ENABLED")
	end
end)

local function onCharacterAdded(newCharacter)
	character = newCharacter
	humanoid = character:WaitForChild("Humanoid")
	torso = character:FindFirstChild("UpperTorso") or character:FindFirstChild("Torso")

	if EnabledFly and flying then
		stopFlight()
	end
end

player.CharacterAdded:Connect(onCharacterAdded)

-- COSMETICS FUNCTION --

local cosmeticsConnection = nil
local CosmeticsEnabled = false

local function giveAccessory(character, ID, ID2, bodyPart)
	local characterMesh = Instance.new("CharacterMesh")
	characterMesh.Name = "Korblox " .. tostring(bodyPart)
	characterMesh.MeshId = ID
	characterMesh.BodyPart = bodyPart
	characterMesh.BaseTextureId = 0
	characterMesh.OverlayTextureId = ID2
	characterMesh.Parent = character
end

local function headless(character)
	local head = character:FindFirstChild("Head")
	if head then
		head.Transparency = 1
		local face = head:FindFirstChild("face")
		if face then
			face.Transparency = 1
		end
	end
end

local function removeHeadless(character)
	local head = character:FindFirstChild("Head")
	if head then
		head.Transparency = 0
		local face = head:FindFirstChild("face")
		if face then
			face.Transparency = 0
		end
	end
end

local function deleteKorblox(character)
	for _, v in ipairs(character:GetChildren()) do
		if v:IsA("CharacterMesh") and string.find(v.Name, "Korblox") then
			v:Destroy()
		end
	end
end

local function applyCosmetics(character)
	if not character then return end
	character:WaitForChild("Humanoid")

	headless(character)
	giveAccessory(character, 101851582, 101851254, Enum.BodyPart.LeftLeg)
end

local function removeCosmetics(character)
	if not character then return end

	removeHeadless(character)
	deleteKorblox(character)
end

CosmeticButton.MouseButton1Click:Connect(function()
	if CosmeticsEnabled == false then

		CosmeticsEnabled = true
		CosmeticButton.Text = "ON"
		CosmeticButton.BackgroundColor3 = Color3.new(0, 1, 0)

		if player.Character then
			applyCosmetics(player.Character)
		end

		cosmeticsConnection = player.CharacterAdded:Connect(function(character)
			task.wait(0.5)
			if CosmeticsEnabled then
				applyCosmetics(character)
			end
		end)

	else
	
		CosmeticsEnabled = false
		CosmeticButton.Text = "OFF"
		CosmeticButton.BackgroundColor3 = Color3.new(1, 0, 0)

		if player.Character then
			removeCosmetics(player.Character)
		end

		if cosmeticsConnection then
			cosmeticsConnection:Disconnect()
			cosmeticsConnection = nil
		end
	end
end)

-- FUNCTIONS --
local function ClearBackground(clear)
	for _, v in ipairs(clear:GetChildren()) do
		v.Visible = false
	end
end

local function openBackground(open)
	for _, v in ipairs(open:GetChildren()) do
		v.Visible = true
	end
end

local function background(status)
	if status == "Main" then
		ClearBackground(OtherFolder)
		ClearBackground(InfoFolder)
		StatusBackground.Text = "Main"

	elseif status == "Info" then
		ClearBackground(OtherFolder)
		ClearBackground(MainFolder)
		StatusBackground.Text = "Info"

	elseif status == "Other" then
		ClearBackground(InfoFolder)
		ClearBackground(MainFolder)
		StatusBackground.Text = "Other"

	end
end

MainButton.MouseButton1Click:Connect(function()
	background("Main")
	openBackground(MainFolder)
end)

InfoButton.MouseButton1Click:Connect(function()
	background("Info")
	openBackground(InfoFolder)
end)

OtherButton.MouseButton1Click:Connect(function()
	background("Other")
	openBackground(OtherFolder)
end)

--auto function mini --

local StarterGui = game:GetService("StarterGui")

--close AFM

local function FPS_BOOST(on)
	if on then
		for _, v in ipairs(workspace:GetDescendants()) do
			if v:IsA("BasePart") or v:IsA("MeshPart") then
				v.Material = Enum.Material.SmoothPlastic
			elseif v:IsA("Decal") then
				v.Transparency = 1
			elseif v:IsA("Texture") then
				v.Transparency = 1
			elseif v:IsA("ParticleEmitter") then
				v.Enabled = false
			elseif v:IsA("Beam") then
				v.Enabled = false
			elseif v:IsA("Trail") then
				v.Enabled = false
			elseif v:IsA("BillboardGui") then
				v.Enabled = false
			elseif v:IsA("SurfaceGui") then
				v.Enabled = false
			end
		end
	elseif not on then
		for _, v in ipairs(workspace:GetDescendants()) do
			if v:IsA("BasePart") or v:IsA("MeshPart") then
				v.Material = Enum.Material.Plastic
			elseif v:IsA("Decal") then
				v.Transparency = 0
			elseif v:IsA("Texture") then
				v.Transparency = 0
			elseif v:IsA("ParticleEmitter") then
				v.Enabled = true
			elseif v:IsA("Beam") then
				v.Enabled = true	
			elseif v:IsA("Trail") then
				v.Enabled = true	
			elseif v:IsA("BillboardGui") then
				v.Enabled = true	
			elseif v:IsA("SurfaceGui") then
				v.Enabled = true	
			end
		end
	end
end

local FPSBoostState = false

FPSBoostButton.MouseButton1Click:Connect(function()
	if FPSBoostState == false then
		FPS_BOOST(true)
		FPSBoostState = true
		FPSBoostButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
		FPSBoostButton.Text = "ON"
	elseif FPSBoostState == true then
		FPS_BOOST(false)
		FPSBoostState = false
		FPSBoostButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
		FPSBoostButton.Text = "OFF"
	end
end)

UIS.InputBegan:Connect(function(inp, gameproc)
	if gameproc then return end
	if InfJumpStatus == true then
		if inp.KeyCode == Enum.KeyCode.Space then
			local character = player.Character
			if character then
				local humanoid = character:FindFirstChild("Humanoid")
				if humanoid then
					humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
				end
			end
		end
	end
end)

local function WALLHACK(status)
	if not status then
		for _, v in ipairs(game.Players:GetPlayers()) do
			if v:IsA("Player") and v.Character and v.Character:FindFirstChild("Humanoid") then
				local hl = v.Character:FindFirstChild("1Qozer_0291_Pdosard-a4QQQ+DA_STATUSBRUUUH_DEV_L_E_POPER_H_1_E_2_S_#OS")
				if hl then
					hl.Enabled = false
				end
			end
		end
	end
	if status then
		local hl = Instance.new("Highlight")
		hl.Name = "1Qozer_0291_Pdosard-a4QQQ+DA_STATUSBRUUUH_DEV_L_E_POPER_H_1_E_2_S_#OS"
		for _, v in ipairs(game.Players:GetPlayers()) do
			if v:IsA("Player") and v.Character and v.Character:FindFirstChild("Humanoid") then
				if not v.Character:FindFirstChild("1Qozer_0291_Pdosard-a4QQQ+DA_STATUSBRUUUH_DEV_L_E_POPER_H_1_E_2_S_#OS") then 
					local clone = hl:Clone()
					clone.Parent = v.Character
					clone.FillColor = Color3.new(0.54902, 0, 1)
					clone.FillTransparency = 0.45
					clone.OutlineTransparency = 0.3
					print("wh loaded in player:", v.Name)
				end
				local highlight = v.Character:FindFirstChild("1Qozer_0291_Pdosard-a4QQQ+DA_STATUSBRUUUH_DEV_L_E_POPER_H_1_E_2_S_#OS")
				if highlight then
					highlight.Enabled = true
					if v == player then
						highlight.Enabled = false
					end
				end
			end
		end
	end
end

ON_OFF.MouseButton1Click:Connect(function()
	if statusWH == false then
		ON_OFF.Text = "ON"
		ON_OFF.BackgroundColor3 = Color3.new(0, 1, 0)
		statusWH = true
		WALLHACK(true)

		task.spawn(function()
			while statusWH do
				task.wait(0.5)
				if statusWH then
					WALLHACK(true)
				end
			end
		end)

	elseif statusWH == true then
		ON_OFF.Text = "OFF"
		ON_OFF.BackgroundColor3 = Color3.new(1, 0, 0)
		statusWH = false
		WALLHACK(false)
	end
end)

FlyTextBox.FocusLost:Connect(function()


	local SPEED = tonumber(FlyTextBox.Text)
	if SPEED then
		task.spawn(function()
			while true do
				task.wait()
				if humanoid and humanoid.Parent then
					if SPEED > MaxFlySpeed then 
							return end
				flySpeed = SPEED
				
				end
			end
		end)
	end
end)

WALKSPEEDTextBox.FocusLost:Connect(function()
	local speed = tonumber(WALKSPEEDTextBox.Text)
	if speed then
		task.spawn(function()
			while true do
				task.wait()
				if humanoid and humanoid.Parent then
					humanoid.WalkSpeed = speed
				end
			end
		end)
	end
end)


local i = 3.8230281234259102
local x = 9.2109128 / 0.492

JUMPHEIGHTTextBox.FocusLost:Connect(function()
	local height = tonumber(JUMPHEIGHTTextBox.Text)
	if height then
		task.spawn(function()
			while true do
				task.wait()
				if humanoid and humanoid.Parent then
					humanoid.JumpHeight = height
					humanoid.JumpPower = height * i * x
				end
			end
		end)
	end
end)

UIS.InputBegan:Connect(function(inp, gameproc)
	if gameproc then return end
	if inp.KeyCode == Enum.KeyCode.RightControl then
		newFrame.Visible = not newFrame.Visible
	end
end)


local resetButtonActive = false

while true do
	task.wait()
	local success, result = pcall(function()
		return StarterGui:GetCore("ResetButtonCallback")
	end)

	if not resetButtonActive or (success and result == false) then
		StarterGui:SetCore("ResetButtonCallback", true)
		resetButtonActive = true
	end
end
