if not game:IsLoaded() then
    game.Loaded:Wait()
end

if game.CoreGui:FindFirstChild("ebggui") then
	game.CoreGui.ebggui:Destroy()
end

if not game.Workspace:WaitForChild(".Ignore")['.ServerEffects'].RainPos:FindFirstChild("1") then
	if not game.CoreGui:FindFirstChild("errorgui") then
		warn("You didn't pass the script whitelist! Contact the scripter if you think this is a mistake.")

		local blur = Instance.new("BlurEffect")
		blur.Size = 0
		blur.Parent = game:WaitForChild("Lighting")

		for i = 1, 20 do
			blur.Size = i
			wait(.1)
		end

		local errorgui = Instance.new("ScreenGui")
		errorgui.Name = "errorgui"
		errorgui.Parent = game:WaitForChild("CoreGui")
		errorgui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

		local errorlabel = Instance.new("TextLabel")
		errorlabel.Name = "errorlabel"
		errorlabel.Parent = errorgui
		errorlabel.AnchorPoint = Vector2.new(0.5, 0.5)
		errorlabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		errorlabel.BackgroundTransparency = 1.000
		errorlabel.Position = UDim2.new(0.5, 0, 0.5, 0)
		errorlabel.Size = UDim2.new(1, 0, 0.75, 0)
		errorlabel.Font = Enum.Font.SciFi
		errorlabel.Text = ""
		errorlabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		errorlabel.TextScaled = true
		errorlabel.TextSize = 14.000
		errorlabel.TextStrokeTransparency = 0.000
		errorlabel.TextWrapped = true
		errorlabel.TextYAlignment = Enum.TextYAlignment.Top

		local errorframe = Instance.new("Frame")
		errorframe.Name = "errorframe"
		errorframe.Parent = errorgui
		errorframe.AnchorPoint = Vector2.new(0.5, 1)
		errorframe.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		errorframe.BackgroundTransparency = 0.500
		errorframe.Position = UDim2.new(0.5, 0, 1.25, 0)
		errorframe.Size = UDim2.new(0.300000012, 0, 0, 107)
		errorframe.ZIndex = 5

		local Rejoin = Instance.new("TextButton")
		Rejoin.Name = "Rejoin"
		Rejoin.Parent = errorframe
		Rejoin.AnchorPoint = Vector2.new(0, 0.5)
		Rejoin.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
		Rejoin.BorderColor3 = Color3.fromRGB(255, 255, 255)
		Rejoin.Position = UDim2.new(0.0392644666, 0, 0.495518774, 0)
		Rejoin.Size = UDim2.new(0.449999988, 0, 0.663999975, 0)
		Rejoin.Font = Enum.Font.SciFi
		Rejoin.Text = "Rejoin"
		Rejoin.TextColor3 = Color3.fromRGB(255, 255, 255)
		Rejoin.TextScaled = true
		Rejoin.TextSize = 14.000
		Rejoin.TextWrapped = true
		Rejoin.ZIndex = 6
		
		Rejoin.MouseButton1Down:Connect(function()
			errorframe:TweenPosition(
				UDim2.new(0.5, 0, 1.25, 0),
				"In",
				"Quad",
				1,
				true
			)
			wait(1)
			local ts = game:GetService("TeleportService")
			local p = game:GetService("Players").LocalPlayer

			ts:Teleport(game.PlaceId, p)
		end)

		local Close = Instance.new("TextButton")
		Close.Name = "Close"
		Close.Parent = errorframe
		Close.AnchorPoint = Vector2.new(1, 0.5)
		Close.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
		Close.BorderColor3 = Color3.fromRGB(255, 255, 255)
		Close.Position = UDim2.new(0.960476518, 0, 0.495518774, 0)
		Close.Size = UDim2.new(0.449999988, 0, 0.663999975, 0)
		Close.Font = Enum.Font.SciFi
		Close.Text = "Close"
		Close.TextColor3 = Color3.fromRGB(255, 255, 255)
		Close.TextScaled = true
		Close.TextSize = 14.000
		Close.TextWrapped = true
		Close.ZIndex = 6
		
		Close.MouseButton1Down:Connect(function()
			errorframe:TweenPosition(
				UDim2.new(0.5, 0, 1.25, 0),
				"In",
				"Quad",
				1,
				true
			)

			wait(1)

			for i = 20, 0, -1 do
				errorlabel.TextTransparency = 1 - (i / 20)
				errorlabel.TextStrokeTransparency = 1 - (i / 20)
				blur.Size = i
				wait(.1)
			end

			blur.Size = 0

			blur:Destroy()
			errorgui:Destroy()
		end)

		errorframe:TweenPosition(
			UDim2.new(0.5, 0, 1, 0),
			"Out",
			"Quad",
			1,
			true
		)

		local errorText = "Your Client-ID was not found in the whitelist system.\n To be whitelisted, join scrypt0r's server,\n discord.gg/K2wewFWWFZ\n When you join, open a support ticket\n in the #support-only channel.\n Prove who you are, and your proof of purchase.\n Then, send your Roblox Client-ID which has\n been copied to your clipboard."

		local clientid = game:GetService("RbxAnalyticsService"):GetClientId()
		pcall(function() setclipboard(clientid) end)

		for i = 1, #errorText do
			local displayText = string.sub(errorText, 1, i)
			errorlabel.Text = displayText
			wait(0.075)
		end
	end
else
	game.Workspace['.Ignore']['.ServerEffects'].RainPos['1']:Destroy()
	warn("You passed the script's whitelist! Please wait while the script enables.")
	wait(0.5)

	local lastupdate = "GUI Last Updated: 12-9-20 9:23 PM EST"

	-- GUI Instances, Events and Functions

	local ebggui = Instance.new("ScreenGui")
	ebggui.Name = "ebggui"
	ebggui.Parent = game:WaitForChild("CoreGui")
	
	game.CoreGui.ChildRemoved:connect(function(child)
	    if child.Name == "ebggui" then
		    closedforever = true
		    buttonsopened = false
		    commandsopened = false
		    buttonsdebounce = true
		    commanddebounce = true
		    terminateuis = true
		    UIS = nil
		    breakable = true
		    BlazeColumnEnabled = nil
		    VineTrapEnabled = nil
	        PlasmaImplosionEnabled = nil
		    LuminousDispersionEnabled = nil
		    LDRadius = nil
		    CrystalArmamentEnabled = nil
		    AmauroticLambentHackEnabled = nil
		    AblazeJudgementHackEnabled = nil
		    VoidOpeningHackEnabled = nil
		    SkeletonGrabEnabled = nil
		    TheWorldEnabled = nil
		    PolarisEnabled = nil
		    AmplifiedSONARQuakeEnabled = nil
		    SQCharge = nil
		    LagServerEnabled = nil
		    ShatteringEruptionEnabled = nil
		    IllusiveAtakeEnabled = nil
		    EtherealAcumenEnabled = nil
		    FormidableRoarEnabled = nil
		    ToxicBasiliskEnabled = nil
		    SplittingSlimeEnabled = nil
		    VirtualZoneEnabled = nil
		    AntiBlindEnabled = nil
		    AntiLagEnabled = nil
		    SpeedhackEnabled = nil
		    HolobeamEnabled = nil
		    SetSpeed = nil
		    IgnorePhysicsEnabled = nil
		    AntiGravityEnabled = nil
		    InertiaGravityEnabled = nil
		    ClickTPEnabled = nil
		    FreezeEnabled = nil
		    ThrustEnabled = nil
		    ThrustPower = nil
		    viewing = nil
		    ESPEnabled = nil
		    TPShardsEnabled = nil
		    TPDiamondsEnabled = nil
		end
	end)
	
	local borders = {}

	local buttonsmain = Instance.new("Frame")
	buttonsmain.Name = "buttonsmain"
	buttonsmain.Position = UDim2.new(1.25, 0, 0.65, 0)
	buttonsmain.Size = UDim2.new(0.4, 0, 0.225, 0)
	table.insert(borders, buttonsmain)
	
	buttonsdebounce = false
	buttonsopened = true

	local commandsmain = Instance.new("Frame")
	commandsmain.Name = "commandsmain"
	commandsmain.Position = UDim2.new(1.25, 0, 0.45, 0)
	commandsmain.Size = UDim2.new(0.3, 0, 0.175, 0)
	table.insert(borders, commandsmain)
	
	commanddebounce = false
	commandsopened = true
	
	closedforever = false
	
	local frames = {}
	
	local buttonsframe = Instance.new("Frame")
	buttonsframe.Name = "buttonsframe"
	buttonsframe.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	buttonsframe.BorderColor3 = Color3.fromRGB(0, 0, 0)
	buttonsframe.BorderSizePixel = 2
	buttonsframe.AnchorPoint = Vector2.new(0.5, 0.5)
	buttonsframe.Position = UDim2.new(0.5, 0, 0.5, 0)
	buttonsframe.Size = UDim2.new(0.9, 0, 0.85, 0)
	table.insert(frames, buttonsframe)
	buttonsframe.Parent = buttonsmain

	local commandsframe = Instance.new("Frame")
	commandsframe.Name = "commandsframe"
	commandsframe.AnchorPoint = Vector2.new(0.5, 0.5)
	commandsframe.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	commandsframe.BorderColor3 = Color3.fromRGB(0, 0, 0)
	commandsframe.BorderSizePixel = 2
	commandsframe.Position = UDim2.new(0.5, 0, 0.5, 0)
	commandsframe.Size = UDim2.new(0.9, 0, 0.85, 0)
	table.insert(frames, commandsframe)
	commandsframe.Parent = commandsmain

	local commandBox = Instance.new("TextBox")
	commandBox.Name = "commandBox"
	commandBox.AnchorPoint = Vector2.new(0.5, 0.5)
	commandBox.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	commandBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
	commandBox.BorderSizePixel = 2
	commandBox.Position = UDim2.new(0.5, 0, 0.3, 0)
	commandBox.Size = UDim2.new(0.85, 0, 0.20, 0)
	commandBox.Font = Enum.Font.SciFi
	commandBox.Text = ""
	commandBox.TextColor3 = Color3.fromRGB(255, 255, 255)
	commandBox.TextScaled = true
	commandBox.TextSize = 14.000
	commandBox.TextWrapped = true
	commandBox.Parent = commandsframe
	
	local labels = {}

	local commandBoxOutput = Instance.new("TextLabel")
	commandBoxOutput.Name = "commandBoxOutput"
	commandBoxOutput.AnchorPoint = Vector2.new(0.5, 0.5)
	commandBoxOutput.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	commandBoxOutput.BackgroundTransparency = 1.000
	commandBoxOutput.BorderColor3 = Color3.fromRGB(0, 0, 0)
	commandBoxOutput.BorderSizePixel = 0
	commandBoxOutput.Position = UDim2.new(0.5, 0, 0.6, 0)
	commandBoxOutput.Size = UDim2.new(0.9, 0, 0.2, 0)
	commandBoxOutput.Font = Enum.Font.SciFi
	commandBoxOutput.Text = "Current Target | (None)"
	commandBoxOutput.TextColor3 = Color3.fromRGB(255, 255, 255)
	commandBoxOutput.TextScaled = true
	commandBoxOutput.TextSize = 14.000
	commandBoxOutput.TextWrapped = true
	table.insert(labels, commandBoxOutput)
	commandBoxOutput.Parent = commandsframe

	local Details = Instance.new("TextLabel")
	Details.Name = "Details"
	Details.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Details.BackgroundTransparency = 1.000
	Details.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Details.Position = UDim2.new(0, 0, 0.0141414143, 0)
	Details.Size = UDim2.new(1, 0, 0.15, 0)
	Details.Font = Enum.Font.SciFi
	Details.Text = "5crypt0r | EBGGui | discord.gg/K2wewFWWFZ"
	Details.TextColor3 = Color3.fromRGB(255, 255, 255)
	Details.TextScaled = true
	Details.ZIndex = 5
	Details.TextSize = 14.000
	Details.TextWrapped = true
	table.insert(labels, Details)
	Details.Parent = buttonsframe

	local Details2 = Instance.new("TextLabel")
	Details2.Name = "Details2"
	Details2.AnchorPoint = Vector2.new(0.5, 0.5)
	Details2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Details2.BackgroundTransparency = 1.000
	Details2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Details2.Position = UDim2.new(0.5, 0, 0.9, 0)
	Details2.Size = UDim2.new(1, 0, 0.15, 0)
	Details2.Font = Enum.Font.SciFi
	Details2.Text = "Press ] to open and close this GUI."
	Details2.TextColor3 = Color3.fromRGB(255, 255, 255)
	Details2.TextScaled = true
	Details2.TextSize = 14.000
	Details2.TextWrapped = true
	table.insert(labels, Details2)
	Details2.Parent = commandsframe

	local Details3 = Instance.new("TextLabel")
	Details3.Name = "Details3"
	Details3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Details3.BackgroundTransparency = 1.000
	Details3.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Details3.Position = UDim2.new(0, 0, 0.875, 0)
	Details3.Size = UDim2.new(1, 0, 0.15, 0)
	Details3.Font = Enum.Font.SciFi
	Details3.Text = "Press [ to open and close this GUI."
	Details3.TextColor3 = Color3.fromRGB(255, 255, 255)
	Details3.TextScaled = true
	Details3.TextSize = 14.000
	Details3.TextWrapped = true
	table.insert(labels, Details3)
	Details3.Parent = buttonsframe

	local Details4 = Instance.new("TextLabel")
	Details4.Name = "Details4"
	Details4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Details4.BackgroundTransparency = 1.000
	Details4.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Details4.Position = UDim2.new(0, 0, 1.1, 0)
	Details4.Size = UDim2.new(1, 0, 0.175, 0)
	Details4.Font = Enum.Font.SciFi
	Details4.Text = "Hold Left arrow and Right arrow to terminate the script and GUIs."
	Details4.TextColor3 = Color3.fromRGB(0, 0, 0)
	Details4.TextScaled = true
	Details4.TextSize = 14.000
	Details4.TextWrapped = true
	Details4.Parent = buttonsframe

	local Version = Instance.new("TextLabel")
	Version.Name = "Version"
	Version.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Version.BackgroundTransparency = 1.000
	Version.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Version.Position = UDim2.new(0, 0, 0.05, 0)
	Version.Size = UDim2.new(1, 0, 0.1, 0)
	Version.Font = Enum.Font.SciFi
	Version.Text = "Version | v0.8.4"
	Version.TextColor3 = Color3.fromRGB(255, 255, 255)
	Version.TextScaled = true
	Version.TextSize = 14.000
	Version.TextWrapped = true
	table.insert(labels, Version)
	Version.Parent = commandsframe

	local mainframe = Instance.new("ScrollingFrame")
	mainframe.Name = "mainframe"
	mainframe.Active = true
	mainframe.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	mainframe.BorderColor3 = Color3.fromRGB(0, 0, 0)
	mainframe.BorderSizePixel = 2
	mainframe.Position = UDim2.new(0.5, 0, 0.5, 0)
	mainframe.AnchorPoint = Vector2.new(0.5, 0.5)
	mainframe.Size = UDim2.new(0.867768586, 0, 0.6, 0)
	mainframe.CanvasSize = UDim2.new(0, 0, 3, 0)
	mainframe.ScrollBarThickness = 6
	mainframe.Parent = buttonsmain

	local UIGridLayout = Instance.new("UIGridLayout")
	UIGridLayout.FillDirection = Enum.FillDirection.Horizontal
	UIGridLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIGridLayout.CellPadding = UDim2.new(0, 7, 0, 7)
	UIGridLayout.CellSize = UDim2.new(0.45, 0, 0.03, 0)
	UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIGridLayout.Parent = mainframe
	
	local buttons = {}

	-- Instant Blaze Column
	
	local BlazeColumn = Instance.new("TextButton")
	BlazeColumn.Name = "BlazeColumn"
	BlazeColumn.Text = "Instant Blaze Column (OFF)"
	table.insert(buttons, BlazeColumn)
	
	BlazeColumnEnabled = false

	BlazeColumn.MouseButton1Down:connect(function()
		if BlazeColumnEnabled == false then
			BlazeColumnEnabled = true
			BlazeColumn.Text = "Instant Blaze Column (ON)"
		else
			BlazeColumnEnabled = false
			BlazeColumn.Text = "Instant Blaze Column (OFF)"
		end
	end)
	
	-- Infinite Flame Body
	
	local FlameBody = Instance.new("TextButton")
	FlameBody.Name = "FlameBody"
	FlameBody.Text = "Infinite Flame Body"
	table.insert(buttons, FlameBody)
	
	FlameBody.MouseButton1Down:connect(function()
		if game.Players.LocalPlayer.Character:FindFirstChild("Body Colors") then
			game.Players.LocalPlayer.Character["Body Colors"]:Destroy()
		end
		RSR.DoClientMagic:FireServer("Fire", "Flame Body")
		RSR.DoMagic:InvokeServer("Fire", "Flame Body")
	end)
	
	-- Hide Flames
	
	local HideFlames = Instance.new("TextButton")
	HideFlames.Name = "HideFlames"
	HideFlames.Text = "Hide Flames"
	table.insert(buttons, HideFlames)

	HideFlames.MouseButton1Down:connect(function()
		for i, v in pairs(game.Players.LocalPlayer.Character.HumanoidRootPart:GetChildren()) do
			if v.Name == "Fire" then
				v:Destroy()
			end
		end
	end)
	
	-- Invisible Infinite Flame Body
	
	local InvisibleFlameBody = Instance.new("TextButton")
	InvisibleFlameBody.Name = "InvisibleFlameBody"
	InvisibleFlameBody.Text = "Invisible Infinite Flame Body"
	table.insert(buttons, InvisibleFlameBody)

	InvisibleFlameBody.MouseButton1Down:connect(function()
		if game.Players.LocalPlayer.Character:FindFirstChild("Body Colors") then
			game.Players.LocalPlayer.Character["Body Colors"]:Destroy()
		end
		RSR.DoClientMagic:FireServer("Fire", "Flame Body")
		RSR.DoMagic:InvokeServer("Fire", "Flame Body")
		for i, v in pairs(game.Players.LocalPlayer.Character.HumanoidRootPart:GetChildren()) do
			if v.Name == "Fire" then
				v:Destroy()
			end
		end
	end)
	
	-- Infinite Rock Armor
	
	local RockArmor = Instance.new("TextButton")
	RockArmor.Name = "RockArmor"
	RockArmor.Text = "Infinite Rock Armor"
	table.insert(buttons, RockArmor)

	RockArmor.MouseButton1Down:connect(function()
		if game.Players.LocalPlayer.Character:FindFirstChild("Body Colors") then
			game.Players.LocalPlayer.Character["Body Colors"]:Destroy()
		end
		RSR.DoClientMagic:FireServer("Earth", "Rock Armor")
		RSR.DoMagic:InvokeServer("Earth", "Rock Armor")
	end)

	-- Instant Vine Trap

	local VineTrap = Instance.new("TextButton")
	VineTrap.Name = "VineTrap"
	VineTrap.Text = "Instant Vine Trap (OFF)"
	table.insert(buttons, VineTrap)
	
	VineTrapEnabled = false

	VineTrap.MouseButton1Down:connect(function()
		if VineTrapEnabled == false then
			VineTrapEnabled = true
			VineTrap.Text = "Instant Vine Trap (ON)"
		else
			VineTrapEnabled = false
			VineTrap.Text = "Instant Vine Trap (OFF)"
		end
	end)
	
	-- Instant Plasma Implosion

	local PlasmaImplosion = Instance.new("TextButton")
	PlasmaImplosion.Name = "PlasmaImplosion"
	PlasmaImplosion.Text = "Instant Plasma Implosion (OFF)"
	table.insert(buttons, PlasmaImplosion)
	
	PlasmaImplosionEnabled = false
	
	PlasmaImplosion.MouseButton1Down:connect(function()
		if PlasmaImplosionEnabled == false then
			PlasmaImplosionEnabled = true
			PlasmaImplosion.Text = "Instant Plasma Implosion (ON)"
		else
			PlasmaImplosionEnabled = false
			PlasmaImplosion.Text = "Instant Plasma Implosion (OFF)"
		end
	end)
	
	-- Amplified Luminous Dispersion Hack

	local LuminousDispersion = Instance.new("TextButton")
	LuminousDispersion.Name = "LuminousDispersion"
	LuminousDispersion.Text = "Amplified Luminous Dispersion Hack (OFF)"
	table.insert(buttons, LuminousDispersion)

	local LuminousDispersionEnabled = false
	local LDRadius = 30 -- 25000

	LuminousDispersion.MouseButton1Down:connect(function()
		if LuminousDispersionEnabled == false then
			LuminousDispersionEnabled = true
			LuminousDispersion.Text = "Amplified Luminous Dispersion Hack (ON)"
		else
			LuminousDispersionEnabled = false
			LuminousDispersion.Text = "Amplified Luminous Dispersion Hack (OFF)"
		end
	end)
	
	-- Crystal Armament Hack

	local CrystalArmament = Instance.new("TextButton")
	CrystalArmament.Name = "CrystalArmament"
	CrystalArmament.Text = "Crystal Armament Hack (OFF)"
	table.insert(buttons, CrystalArmament)
	
	CrystalArmamentEnabled = false

	CrystalArmament.MouseButton1Down:connect(function()
		if CrystalArmamentEnabled == false then
			CrystalArmamentEnabled = true
			CrystalArmament.Text = "Crystal Armament Hack (ON)"
		else
			CrystalArmamentEnabled = false
			CrystalArmament.Text = "Crystal Armament Hack (OFF)"
		end
	end)
	
	-- Spectral Embodiment
	
	local SpectralEmbodiment = Instance.new("TextButton")
	SpectralEmbodiment.Name = "SpectralEmbodiment"
	SpectralEmbodiment.Text = "Spectral Embodiment Keybind (OFF) [X]"
	table.insert(buttons, SpectralEmbodiment)
	
	SpectralEmbodimentEnabled = false

	SpectralEmbodiment.MouseButton1Down:connect(function()
		if SpectralEmbodimentEnabled == false then
			SpectralEmbodimentEnabled = true
			SpectralEmbodiment.Text = "Spectral Embodiment Keybind (ON) [X]"
		else
			SpectralEmbodimentEnabled = false
			SpectralEmbodiment.Text = "Spectral Embodiment Keybind (OFF) [X]"
		end
	end)
	
	-- Amaurotic Lambent Hack

	local AmauroticLambent = Instance.new("TextButton")
	AmauroticLambent.Name = "AmauroticLambent"
	AmauroticLambent.Text = "Amaurotic Lambent Hack (OFF)"
	table.insert(buttons, AmauroticLambent)
	
	AmauroticLambentHackEnabled = false
	
	AmauroticLambent.MouseButton1Down:connect(function()
		if AmauroticLambentHackEnabled == false then
			AmauroticLambentHackEnabled = true
			AmauroticLambent.Text = "Amaurotic Lambent Hack (ON)"
		else
			AmauroticLambentHackEnabled = false
			AmauroticLambent.Text = "Amaurotic Lambent Hack (OFF)"
		end
	end)
	
	-- Ablaze Judgement Hack

	local AblazeJudgement = Instance.new("TextButton")
	AblazeJudgement.Name = "AblazeJudgement"
	AblazeJudgement.Text = "Ablaze Judgement Hack (OFF)"
	table.insert(buttons, AblazeJudgement)
	
	AblazeJudgementHackEnabled = false
	
	AblazeJudgement.MouseButton1Down:connect(function()
		if AblazeJudgementHackEnabled == false then
			AblazeJudgementHackEnabled = true
			AblazeJudgement.Text = "Ablaze Judgement Hack (ON)"
		else
			AblazeJudgementHackEnabled = false
			AblazeJudgement.Text = "Ablaze Judgement Hack (OFF)"
		end
	end)
	
	-- Void Opening Hack

	local VoidOpening = Instance.new("TextButton")
	VoidOpening.Name = "VoidOpening"
	VoidOpening.Text = "Void Opening Hack (OFF)"
	table.insert(buttons, VoidOpening)
	
	VoidOpeningHackEnabled = false
	
	VoidOpening.MouseButton1Down:connect(function()
		if VoidOpeningHackEnabled == false then
			VoidOpeningHackEnabled = true
			VoidOpening.Text = "Void Opening Hack (ON)"
		else
			VoidOpeningHackEnabled = false
			VoidOpening.Text = "Void Opening Hack (OFF)"
		end
	end)
	
	-- Instant Skeleton Grab

	local SkeletonGrab = Instance.new("TextButton")
	SkeletonGrab.Name = "SkeletonGrab"
	SkeletonGrab.Text = "Instant Skeleton Grab (OFF) [AIMED]"
	table.insert(buttons, SkeletonGrab)
	
	SkeletonGrabEnabled = false

	SkeletonGrab.MouseButton1Down:connect(function()
		if SkeletonGrabEnabled == false then
			SkeletonGrabEnabled = true
			SkeletonGrab.Text = "Instant Skeleton Grab (ON) [AIMED]"
		else
			SkeletonGrabEnabled = false
			SkeletonGrab.Text = "Instant Skeleton Grab (OFF) [AIMED]"
		end
	end)
	
	-- Holobeam Camera Attach
	
	local Holobeam = Instance.new("TextButton")
	Holobeam.Name = "Holobeam"
	Holobeam.Text = "Holobeam Camera Attach (OFF)"
	table.insert(buttons, Holobeam)
	
	HolobeamEnabled = false

	function attachCamera(v)
		if v ~= nil then
			if not viewing then
				game.Workspace.Camera.CameraSubject = game.Workspace['.Ignore']['.Attacks'][v.Name]
			else 
				return 
			end

			v.CanCollide = true
			v.Transparency = 0

			wait(4)
			if not viewing then
				game.Workspace.Camera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
				v.Name = "Part"
			end

		end
	end

	function touchDetector(e)
		print(e.Name)
		e.Touched:connect(function(touchedpart)
			if not touchedpart:IsDescendantOf(game.Workspace['.Ignore']) then
				e:Destroy()
				game.Workspace.Camera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
			end
		end)
	end

	function beginHolobeam()
		while true do
			wait()
			if HolobeamEnabled then
				for i, v in pairs(game.Workspace['.Ignore']['.Attacks']:GetChildren()) do
					if v.Name == "Part" then
						local distance = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).Magnitude
						if v:FindFirstChild("BodyVelocity") and v:FindFirstChild("BodyGyro") and distance < 10 then
							if v.BodyVelocity.P >= 1250 and v.BodyGyro.D >= 5 then
								v.Name = "spectrumpart"
								spawn(function() 
									pcall(_G.touchDetector, v) 
								end)
								_G.attachCamera(v)
							end
						end
					end
				end
			end

			if not HolobeamEnabled then
				break
			end
		end

		return 
	end

	Holobeam.MouseButton1Down:connect(function()
		if HolobeamEnabled == false then
			HolobeamEnabled = true
			Holobeam.Text = "Holobeam Camera Attach (ON)"
			beginHolobeam()
			while HolobeamEnabled do
				wait()
				if game.Players.LocalPlayer.Character.Humanoid.Health == 0 then
					repeat wait() until game.Players.LocalPlayer.Character.Humanoid.Health ~= 0
					beginHolobeam()
				end
			end
		else
			HolobeamEnabled = false
			Holobeam.Text = "Holobeam Camera Attach (OFF)"
		end
	end)
	
	-- Amplified Genesis Ray
	
	local GenesisRay = Instance.new("TextButton")
	GenesisRay.Name = "GenesisRay"
	GenesisRay.Text = "Amplified Genesis Ray (OFF)"
	table.insert(buttons, GenesisRay)
	
	local GenesisRayEnabled = false
	local GRCharge = 1 -- 1000000
	
	GenesisRay.MouseButton1Down:connect(function()
		if GenesisRayEnabled == false then
			GenesisRayEnabled = true
			GenesisRay.Text = "Amplified Genesis Ray (ON)"
		else
			GenesisRayEnabled = false
			GenesisRay.Text = "Amplified Genesis Ray (OFF)"
		end
	end)
	
	-- The World Hack

	local TheWorld = Instance.new("TextButton")
	TheWorld.Name = "TheWorld"
	TheWorld.Text = "The World Hack (OFF)"
	table.insert(buttons, TheWorld)
	
	TheWorldEnabled = false
	
	TheWorld.MouseButton1Down:connect(function()
		if TheWorldEnabled == false then
			TheWorldEnabled = true
			TheWorld.Text = "The World Hack (ON)"
		else
			TheWorldEnabled = false
			TheWorld.Text = "The World Hack (OFF)"
		end
	end)
	
	-- Polaris Hack

	local Polaris = Instance.new("TextButton")
	Polaris.Name = "Polaris"
	Polaris.Text = "Polaris Hack (OFF)"
	table.insert(buttons, Polaris)
	
	PolarisEnabled = false

	Polaris.MouseButton1Down:connect(function()
		if PolarisEnabled == false then
			PolarisEnabled = true
			Polaris.Text = "Polaris Hack (ON)"
		else
			PolarisEnabled = false
			Polaris.Text = "Polaris Hack (OFF)"
		end
	end)
	
	-- Amplified SONAR Quake

	local SONARQuake = Instance.new("TextButton")
	SONARQuake.Name = "SONARQuake"
	SONARQuake.Text = "Amplified SONAR Quake (OFF)"
	table.insert(buttons, SONARQuake)
	
	AmplifiedSONARQuakeEnabled = false
	SQCharge = 1 -- 50

	SONARQuake.MouseButton1Down:connect(function()
		if AmplifiedSONARQuakeEnabled == false then
			AmplifiedSONARQuakeEnabled = true
			SONARQuake.Text = "Amplified SONAR Quake (ON)"
		else
			AmplifiedSONARQuakeEnabled = false
			SONARQuake.Text = "Amplified SONAR Quake (OFF)"
		end
	end)
	
	-- Instant Shattering Eruption

	local ShatteringEruption = Instance.new("TextButton")
	ShatteringEruption.Name = "ShatteringEruption"
	ShatteringEruption.Text = "Instant Shattering Eruption (OFF)"
	table.insert(buttons, ShatteringEruption)
	
	ShatteringEruptionEnabled = false

	ShatteringEruption.MouseButton1Down:connect(function()
		if ShatteringEruptionEnabled == false then
			ShatteringEruptionEnabled = true
			ShatteringEruption.Text = "Instant Shattering Eruption (ON)"
		else
			ShatteringEruptionEnabled = false
			ShatteringEruption.Text = "Instant Shattering Eruption (OFF)"
		end
	end)
	
	-- Illusive Atake Hack

	local IllusiveAtake = Instance.new("TextButton")
	IllusiveAtake.Name = "IllusiveAtake"
	IllusiveAtake.Text = "Illusive Atake Hack (OFF)"
	table.insert(buttons, IllusiveAtake)
	
	IllusiveAtakeEnabled = false

	IllusiveAtake.MouseButton1Down:connect(function()
		if IllusiveAtakeEnabled == false then
			IllusiveAtakeEnabled = true
			IllusiveAtake.Text = "Illusive Atake Hack (ON)"
		else
			IllusiveAtakeEnabled = false
			IllusiveAtake.Text = "Illusive Atake Hack (OFF)"
		end
	end)
	
	-- Ethereal Acumen Hack

	local EtherealAcumen = Instance.new("TextButton")
	EtherealAcumen.Name = "EtherealAcumen"
	EtherealAcumen.Text = "Ethereal Acumen Hack (OFF)"
	table.insert(buttons, EtherealAcumen)
	
	EtherealAcumenEnabled = false

	EtherealAcumen.MouseButton1Down:connect(function()
		if EtherealAcumenEnabled == false then
			EtherealAcumenEnabled = true
			EtherealAcumen.Text = "Ethereal Acumen Hack (ON)"
		else
			EtherealAcumenEnabled = false
			EtherealAcumen.Text = "Ethereal Acumen Hack (OFF)"
		end
	end)
	
	-- Formidable Roar Hack

	local FormidableRoar = Instance.new("TextButton")
	FormidableRoar.Name = "FormidableRoar"
	FormidableRoar.Text = "Formidable Roar Hack (OFF)"
	table.insert(buttons, FormidableRoar)
	
	FormidableRoarEnabled = false

	FormidableRoar.MouseButton1Down:connect(function()
		if FormidableRoarEnabled == false then
			FormidableRoarEnabled = true
			FormidableRoar.Text = "Formidable Roar Hack (ON)"
		else
			FormidableRoarEnabled = false
			FormidableRoar.Text = "Formidable Roar Hack (OFF)"
		end
	end)

	-- Toxic Basilisk Hack

	local ToxicBasilisk = Instance.new("TextButton")
	ToxicBasilisk.Name = "ToxicBasilisk"
	ToxicBasilisk.Text = "Toxic Basilisk Hack (OFF)"
	table.insert(buttons, ToxicBasilisk)
	
	ToxicBasiliskEnabled = false

	ToxicBasilisk.MouseButton1Down:connect(function()
		if ToxicBasiliskEnabled == false then
			ToxicBasiliskEnabled = true
			ToxicBasilisk.Text = "Toxic Basilisk Hack (ON)"
		else
			ToxicBasiliskEnabled = false
			ToxicBasilisk.Text = "Toxic Basilisk Hack (OFF)"
		end
	end)
	
	-- Arcane Guardian Hack
	
	local ArcaneGuardian = Instance.new("TextButton")
	ArcaneGuardian.Name = "ArcaneGuardian"
	ArcaneGuardian.Text = "Arcane Guardian Hack (OFF)"
	table.insert(buttons, ArcaneGuardian)
	
	ArcaneGuardianEnabled = false

	ArcaneGuardian.MouseButton1Down:connect(function()
		if ArcaneGuardianEnabled == false then
			ArcaneGuardianEnabled = true
			ArcaneGuardian.Text = "Arcane Guardian Hack (ON)"
		else
			ArcaneGuardianEnabled = false
			ArcaneGuardian.Text = "Arcane Guardian Hack (OFF)"
		end
	end)
	
	-- Splitting Slime Hack
	
	local SplittingSlime = Instance.new("TextButton")
	SplittingSlime.Name = "SplittingSlime"
	SplittingSlime.Text = "Splitting Slime Hack (OFF)"
	table.insert(buttons, SplittingSlime)
	
	SplittingSlimeEnabled = false

	SplittingSlime.MouseButton1Down:connect(function()
		if SplittingSlimeEnabled == false then
			SplittingSlimeEnabled = true
			SplittingSlime.Text = "Splitting Slime Hack (ON)"
		else
			SplittingSlimeEnabled = false
			SplittingSlime.Text = "Splitting Slime Hack (OFF)"
		end
	end)

	-- Virtual Zone Hack

	local VirtualZone = Instance.new("TextButton")
	VirtualZone.Name = "VirtualZone"
	VirtualZone.Text = "Virtual Zone Hack (OFF)"
	table.insert(buttons, VirtualZone)
	
	VirtualZoneEnabled = false

	VirtualZone.MouseButton1Down:connect(function()
		if VirtualZoneEnabled == false then
			VirtualZoneEnabled = true
			VirtualZone.Text = "Virtual Zone Hack (ON)"
		else
			VirtualZoneEnabled = false
			VirtualZone.Text = "Virtual Zone Hack (OFF)"
		end
	end)
	
	-- Anti-Blind

	local AntiBlind = Instance.new("TextButton")
	AntiBlind.Name = "AntiBlind"
	AntiBlind.Text = "Anti-Blind (OFF) [K]"
	table.insert(buttons, AntiBlind)
	
	AntiBlindEnabled = false

	local normalFogColor = game.Lighting.FogColor
	local normalFogEnd = game.Lighting.FogEnd
	local normalBrightness = game.Lighting.Brightness
	local normalClockTime = game.Lighting.ClockTime

	local function AntiBlindFunc()
		if AntiBlindEnabled == false then
			AntiBlindEnabled = true
			AntiBlind.Text = "Anti-Blind (ON) [K]"
			while AntiBlindEnabled do
				wait()
				game.Lighting.FogColor = normalFogColor
				game.Lighting.FogEnd = normalFogEnd
				game.Lighting.Brightness = normalBrightness
				game.Lighting.ClockTime = normalClockTime
			end
		else
			AntiBlindEnabled = false
			AntiBlind.Text = "Anti-Blind (OFF) [K]"
		end
	end
	
	AntiBlind.MouseButton1Down:connect(AntiBlindFunc)

	game.Players.LocalPlayer:WaitForChild("PlayerGui").DescendantAdded:Connect(function(d)
		if AntiBlindEnabled then
			if d.Name == "ScreenGui" then
				wait()
				game.Players.LocalPlayer.PlayerGui.ScreenGui:Destroy()
			elseif d.Name == "Distort" then
				wait()
				game.Players.LocalPlayer.PlayerGui.Distort:Destroy()
			end
		end
	end)

	-- Anti-Lag

	local AntiLag = Instance.new("TextButton")
	AntiLag.Name = "AntiLag"
	AntiLag.Text = "Anti-Lag (OFF)"
	table.insert(buttons, AntiLag)
	
	AntiLagEnabled = false

	function removeLag()
		for i, v in pairs(game.Workspace['.Ignore']['.LocalEffects']:GetChildren()) do
			if v:FindFirstChild("Mesh") and v:FindFirstChild("D1") and v:FindFirstChild("D2") then
				if v.D1.Texture == "rbxassetid://2671622646" then
					v:Destroy()
				end
			elseif v:FindFirstChild("FrontDecal") and v:FindFirstChild("BackDecal") and v:FindFirstChild("SpecialMesh") then
				if v.FrontDecal.Texture == "rbxassetid://979004291" then
					v:Destroy()
				end
			end
		end

		for i, v in pairs(game.Players:GetPlayers()) do
			for _, x in pairs(v.Character:GetChildren()) do
				if x.Name == "AngelSword" then
					x:Destroy()
				end
			end
		end

		game.Workspace.DescendantAdded:connect(function(v)
			if AntiLagEnabled then
				if v:FindFirstChild("Mesh") and v:FindFirstChild("D1") and v:FindFirstChild("D2") then
					if v.D1.Texture == "rbxassetid://2671622646" then
						wait()
						v:Destroy()
					end
				elseif v.Name == "AngelSword" then
					wait()
					v:Destroy()
				elseif v:FindFirstChild("FrontDecal") then
					if v.FrontDecal.Texture == "rbxassetid://979004291" then
						wait()
						v:Destroy()
					end
				end
			end
		end)
	end

	AntiLag.MouseButton1Down:connect(function()
		if AntiLagEnabled == false then
			AntiLagEnabled = true
			AntiLag.Text = "Anti-Lag (ON)"
			removeLag()
		else
			AntiLagEnabled = false
			AntiLag.Text = "Anti-Lag (OFF)"
		end
	end)
	
	-- Infinite Sprint

	local Speedhack = Instance.new("TextButton")
	Speedhack.Name = "Speedhack"
	Speedhack.Text = "Speedhack [default 64] (OFF) [T]"
	table.insert(buttons, Speedhack)
	
	SpeedhackEnabled = false
	SetSpeed = 64

	function modifySpeed()
		game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Changed:connect(function()
			if SpeedhackEnabled and SetSpeed ~= nil then
				game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = SetSpeed
			else
				return
			end
		end)
	end

	function beginSpeed()
		if SpeedhackEnabled == false then
			SpeedhackEnabled = true
			Speedhack.Text = "Speedhack [default 64] (ON) [T]"
			modifySpeed()
			wait()
			game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = SetSpeed
			while SpeedhackEnabled do
				wait()
				if game.Players.LocalPlayer.Character.Humanoid.Health == 0 then
					repeat wait() until game.Players.LocalPlayer.Character.Humanoid.Health ~= 0
					modifySpeed()
					wait()
					game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = SetSpeed
				end
			end
		else
			SpeedhackEnabled = false
			Speedhack.Text = "Speedhack [default 64] (OFF) [T]"
		end
	end

	Speedhack.MouseButton1Down:connect(beginSpeed)

	-- Sans Immunity

	local SansImmunity = Instance.new("TextButton")
	SansImmunity.Name = "SansImmunity"
	SansImmunity.Text = "Enable Sans Immunity"
	table.insert(buttons, SansImmunity)

	SansImmunity.MouseButton1Down:connect(function()
		game.Workspace.Map:FindFirstChild("UrWho")['me?'].TouchInterest:Destroy()
	end)

	-- Teleport to Sans Head
	
	local SansTeleport = Instance.new("TextButton")
	SansTeleport.Name = "SansTeleport"
	SansTeleport.Text = "Teleport to Sans Head (OFF) [P]"
	table.insert(buttons, SansTeleport)
	
	SansTeleportEnabled = false

	SansTeleport.MouseButton1Down:connect(function()
		if SansTeleportEnabled == false then
			SansTeleportEnabled = true
			SansTeleport.Text = "Teleport to Sans Head (ON) [P]"
		else
			SansTeleportEnabled = false
			SansTeleport.Text = "Teleport to Sans Head (OFF) [P]"
		end
	end)
	
	local SwitchMap = Instance.new("TextButton")
	SwitchMap.Name = "SwitchMap"
	SwitchMap.Text = "Switch Map (STANDARD 40+)"
	table.insert(buttons, SwitchMap)
	
	local TeleportToMap = Instance.new("TextButton")
	TeleportToMap.Name = "TeleportToMap"
	TeleportToMap.Text = "Teleport To Selected Map"
	table.insert(buttons, TeleportToMap)
	
	-- Ignore Physics

	local IgnorePhysics = Instance.new("TextButton")
	IgnorePhysics.Name = "fIgnorePhysics"
	IgnorePhysics.Text = "Ignore Physics (OFF) [Z]"
	table.insert(buttons, IgnorePhysics)
	
	IgnorePhysicsEnabled = false

	local function initialNullifyForces()
		for i, v in pairs(game.Players.LocalPlayer.Character.HumanoidRootPart:GetChildren()) do
			if v:IsA("BodyGyro") then
				wait()
				v:Destroy()
			elseif v:IsA("BodyPosition") then
				wait()
				v:Destroy()
			elseif v:IsA("BodyVelocity") then
				wait()
				v:Destroy()
			elseif v:IsA("BodyAngularVelocity") then
				wait()
				v:Destroy()
			elseif v:IsA("BodyForce") then
				wait()
				v:Destroy()
			elseif v:IsA("BodyThrust") then
				wait()
				v:Destroy()
			elseif v:IsA("RocketPropulsion") then
				wait()
				v:Destroy()
			end
		end

		for i, v in pairs(game.Players.LocalPlayer.Character.FlipsHolder:GetChildren()) do
			if v:IsA("BodyGyro") then
				wait()
				v:Destroy()
			elseif v:IsA("BodyPosition") then
				wait()
				v:Destroy()
			elseif v:IsA("BodyVelocity") then
				wait()
				v:Destroy()
			elseif v:IsA("BodyAngularVelocity") then
				wait()
				v:Destroy()
			elseif v:IsA("BodyForce") then
				wait()
				v:Destroy()
			elseif v:IsA("BodyThrust") then
				wait()
				v:Destroy()
			elseif v:IsA("RocketPropulsion") then
				wait()
				v:Destroy()
			end
		end
	end

	local function AfterNullifyForces()
		game.Players.LocalPlayer.Character.DescendantAdded:connect(function(v)
			if IgnorePhysicsEnabled then
				if v:IsA("BodyGyro") then
					wait()
					v:Destroy()
				elseif v:IsA("BodyPosition") then
					wait()
					v:Destroy()
				elseif v:IsA("BodyVelocity") then
					wait()
					v:Destroy()
				elseif v:IsA("BodyAngularVelocity") then
					wait()
					v:Destroy()
				elseif v:IsA("BodyForce") then
					wait()
					v:Destroy()
				elseif v:IsA("BodyThrust") then
					wait()
					v:Destroy()
				elseif v:IsA("RocketPropulsion") then
					wait()
					v:Destroy()
				end
			end
		end)
	end

	function beginNullifyForces()
		if IgnorePhysicsEnabled == false then
			IgnorePhysicsEnabled = true
			IgnorePhysics.Text = "Ignore Physics (ON) [Z]"
			initialNullifyForces()
			AfterNullifyForces()
			while IgnorePhysicsEnabled do
				wait()
				if game.Players.LocalPlayer.Character.Humanoid.Health == 0 then
					repeat wait() until game.Players.LocalPlayer.Character.Humanoid.Health ~= 0
					AfterNullifyForces()
				end
			end
		else
			IgnorePhysicsEnabled = false
			IgnorePhysics.Text = "Ignore Physics (OFF) [Z]"
		end
	end

	IgnorePhysics.MouseButton1Down:connect(beginNullifyForces)
	
	-- Anti-Gravity
	
	local AntiGravity = Instance.new("TextButton")
	AntiGravity.Name = "AntiGravity"
	AntiGravity.Text = "Anti-Gravity (OFF) [G]"
	table.insert(buttons, AntiGravity)
	
	AntiGravityEnabled = false
	
	function AntiGravityFunc()
		if AntiGravityEnabled == false then
			AntiGravityEnabled = true
			AntiGravity.Text = "Anti-Gravity (ON) [G]"
			local BodyForce = Instance.new("BodyForce")
			BodyForce.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
			BodyForce.Name = "AntiGravityForce"
			BodyForce.Force = Vector3.new(0, 5000, 0)
		else
			AntiGravityEnabled = false
			AntiGravity.Text = "Anti-Gravity (OFF) [G]"
			if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("AntiGravityForce") then
				game.Players.LocalPlayer.Character.HumanoidRootPart.AntiGravityForce:Destroy()
			end
		end
	end

	AntiGravity.MouseButton1Down:connect(AntiGravityFunc)

	-- Inertia Gravity

	local InertiaGravity = Instance.new("TextButton")
	InertiaGravity.Name = "InertiaGravity"
	InertiaGravity.Text = "Inertia Gravity (OFF)"
	table.insert(buttons, InertiaGravity)
	
	InertiaGravityEnabled = false

	InertiaGravity.MouseButton1Down:connect(function()
		if InertiaGravityEnabled == false then
			InertiaGravityEnabled = true
			InertiaGravity.Text = "Inertia Gravity (ON)"
			local BodyForce = Instance.new("BodyForce")
			BodyForce.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
			BodyForce.Name = "InertiaGravityForce"
			BodyForce.Force = Vector3.new(0, 1638, 0)
		else
			InertiaGravityEnabled = false
			InertiaGravity.Text = "Inertia Gravity (OFF)"
			if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("InertiaGravityForce") then
				game.Players.LocalPlayer.Character.HumanoidRootPart.InertiaGravityForce:Destroy()
			end
		end
	end)

	-- Click-TP

	local ClickTP = Instance.new("TextButton")
	ClickTP.Name = "ClickTP"
	ClickTP.Text = "Click-TP (ON) [J to ClickTP]"
	table.insert(buttons, ClickTP)
	
	ClickTPEnabled = true
	
	ClickTP.MouseButton1Down:connect(function()
		if ClickTPEnabled == true then
			ClickTPEnabled = false
			ClickTP.Text = "Click-TP (OFF) [J to Click-TP]"
		else
			ClickTPEnabled = true
			ClickTP.Text = "Click-TP (ON) [J to Click-TP]"
		end
	end)

	function clicktp(position)
		local player = game.Players.LocalPlayer
		if player == nil or player.Character == nil then return end
		player.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(position.x, position.y + 3, position.z))
	end

	-- Freeze

	local Freeze = Instance.new("TextButton")
	Freeze.Name = "Freeze"
	Freeze.Text = "Freeze (OFF) [F]"
	table.insert(buttons, Freeze)
	
	FreezeEnabled = false

	function FreezeFunc()
		if FreezeEnabled == false then
			FreezeEnabled = true
			Freeze.Text = "Freeze (ON) [F]"
			game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
		else
			FreezeEnabled = false
			Freeze.Text = "Freeze (OFF) [F]"
			game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
		end
	end

	Freeze.MouseButton1Down:connect(FreezeFunc)
	
	-- Thrust Forward
	
	local Thrust = Instance.new("TextButton")
	Thrust.Name = "Thrust"
	Thrust.Text = "Thrust Forward (OFF) [E to Thrust]"
	table.insert(buttons, Thrust)
	
	ThrustEnabled = false
	ThrustPower = 500

	function thrust()
		local mouse = game.Players.LocalPlayer:GetMouse()
		local mousepos = mouse.Hit.lookVector
		local chr = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()

		if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
			local ThrustForce = Instance.new("BodyVelocity")
			ThrustForce.Name = "Thrust"
			ThrustForce.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
			ThrustForce.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
			ThrustForce.P = 2000
			ThrustForce.Velocity = ThrustPower * mousepos
			wait(.1)
			ThrustForce:Destroy()
		end
	end
	
	Thrust.MouseButton1Down:connect(function()
		if ThrustEnabled == false then
			ThrustEnabled = true
			Thrust.Text = "Thrust Forward (ON) [E to Thrust]"
		else
			ThrustEnabled = false
			Thrust.Text = "Thrust Forward (OFF) [E to Thrust]"
		end
	end)
	
	-- View Target
	
	local ViewTarget = Instance.new("TextButton")
	ViewTarget.Name = "ViewTarget"
	ViewTarget.Text = "View Target (OFF) [V]"
	table.insert(buttons, ViewTarget)
	
	viewing = false

	function view()
		if target ~= game.Players.LocalPlayer.Name then
			if viewing == false then
				viewing = true
				game.Workspace.Camera.CameraSubject = game.Players[target].Character.Humanoid
				ViewTarget.Text = "View Target (ON) [V]"
			else
				viewing = false
				game.Workspace.Camera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
				ViewTarget.Text = "View Target (OFF) [V]"
			end
		elseif viewing == true then 
			viewing = false
			game.Workspace.Camera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
			ViewTarget.Text = "View Target (OFF) [V]"
		end
	end

	ViewTarget.MouseButton1Down:connect(view)

	local TPTarget = Instance.new("TextButton")
	TPTarget.Name = "TPTarget"
	TPTarget.Text = "Teleport To Target (ON) [U]"
	table.insert(buttons, TPTarget)
	
	function TPToTarget()
		if target ~= game.Players.LocalPlayer.Name then
			repeat wait() until getRoot(game.Players.LocalPlayer.Character) and getRoot(game.Players[target].Character)
			
			getRoot(game.Players.LocalPlayer.Character).CFrame = getRoot(game.Players[target].Character).CFrame
		end
	end
	
	TPTarget.MouseButton1Down:connect(TPToTarget)
	
	local LoopTPTarget = Instance.new("TextButton")
	LoopTPTarget.Name = "LoopTPTarget"
	LoopTPTarget.Text = "Loop Teleport To Target (ON) [U]"
	table.insert(buttons, LoopTPTarget)

	local CBringTarget = Instance.new("TextButton")
	CBringTarget.Name = "CBringTarget"
	CBringTarget.Text = "CBring Target (OFF) [M]"
	table.insert(buttons, CBringTarget)

	local LoopCBringTarget = Instance.new("TextButton")
	LoopCBringTarget.Name = "LoopCBringTarget"
	LoopCBringTarget.Text = "Loop CBring Target (OFF)"
	table.insert(buttons, LoopCBringTarget)

	local CBringServer = Instance.new("TextButton")
	CBringServer.Name = "CBringServer"
	CBringServer.Text = "CBring Server (OFF) [N]"
	table.insert(buttons, CBringServer)

	local LoopCBringServer = Instance.new("TextButton")
	LoopCBringServer.Name = "LoopCBringServer"
	LoopCBringServer.Text = "Loop CBring Server (OFF)"
	table.insert(buttons, LoopCBringServer)

	-- ESP

	local ESP = Instance.new("TextButton")
	ESP.Name = "ESP"
	ESP.Text = "ESP (ON) [B]"
	table.insert(buttons, ESP)
	
	ESPEnabled = true

	local Holder = Instance.new("Folder", game.CoreGui)
	Holder.Name = "ESP"

	local UpdateFuncs = {}

	local Box = Instance.new("BoxHandleAdornment")
	Box.Name = "nilBox"
	Box.Size = Vector3.new(4, 7, 4)
	Box.Color3 = Color3.new(100 / 255, 100 / 255, 100 / 255)
	Box.Transparency = 0.7
	Box.ZIndex = 0
	Box.AlwaysOnTop = true
	Box.Visible = true

	local NameTag = Instance.new("BillboardGui")
	NameTag.Name = "nilNameTag"
	NameTag.Enabled = true
	NameTag.Size = UDim2.new(0, 200, 0, 50)
	NameTag.AlwaysOnTop = true
	NameTag.StudsOffset = Vector3.new(0, 3.6, 0)

	local Tag = Instance.new("TextLabel", NameTag)
	Tag.Name = "Tag"
	Tag.BackgroundTransparency = 1
	Tag.Position = UDim2.new(0, -50, 0, 0)
	Tag.Size = UDim2.new(0, 300, 0, 20)
	Tag.TextSize = 20
	Tag.TextColor3 = Color3.new(100 / 255, 100 / 255, 100 / 255)
	Tag.TextStrokeColor3 = Color3.new(0 / 255, 0 / 255, 0 / 255)
	Tag.TextStrokeTransparency = 0.4
	Tag.Text = "nil"
	Tag.Font = Enum.Font.SourceSansBold
	Tag.TextScaled = false
	Tag.TextTransparency = 0

	function LoadCharacter(v)
		if v ~= game.Players.LocalPlayer then
			repeat wait() until v.Character ~= nil
			v.Character:WaitForChild("Humanoid")
			local vHolder = Holder:FindFirstChild(v.Name)
			vHolder:ClearAllChildren()

			local b = Box:Clone()
			b.Name = v.Name .. "Box"
			b.Adornee = v.Character.HumanoidRootPart
			b.Parent = vHolder

			local t = NameTag:Clone()
			t.Name = v.Name .. "NameTag"
			t.Parent = vHolder
			t.Adornee = v.Character:WaitForChild("HumanoidRootPart", 5)
			if not t.Adornee then
				return UnloadCharacter(v)
			end
			t.Tag.Text = v.Name
			t.Enabled = true
			wait()

			local function UpdateNameTag()
				if not pcall(function()
						-- v.Character.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
						local maxh = math.ceil(v.Character.Humanoid.MaxHealth * 10)
						local h = math.ceil(v.Character.Humanoid.Health * 10)
						t.Tag.Text = v.Name .. "\n" .. ((maxh ~= 0 and tostring(math.ceil((h / maxh) * 100))) or "0") .. "%  " .. tostring(h) .. "/" .. tostring(maxh)
						if ESPEnabled then
							t.Tag.TextTransparency = 0
							b.Transparency = 0.7
						else
							t.Tag.TextTransparency = 1
							b.Transparency = 1
						end
						if h / maxh == 1 then
							t.Tag.TextColor3 = Color3.fromRGB(255, 255, 255)
							b.Color3 = Color3.fromRGB(255, 255, 255)
						elseif h / maxh == 0 then
							t.Tag.TextColor3 = Color3.fromRGB(0, 0, 0)
							b.Color3 = Color3.fromRGB(0, 0, 0)
						else
							t.Tag.TextColor3 = Color3.fromRGB(192, (192 * (h / maxh)), (192 * (h / maxh)))
							b.Color3 = Color3.fromRGB(192, (192 * (h / maxh)), (192 * (h / maxh)))
						end
					end) then
					UpdateFuncs[v] = nil
				end
			end
			UpdateNameTag()
			UpdateFuncs[v] = UpdateNameTag
		end
	end

	function UnloadCharacter(v)
		local vHolder = Holder:FindFirstChild(v.Name)
		if vHolder and (vHolder:FindFirstChild(v.Name .. "Box") ~= nil or vHolder:FindFirstChild(v.Name .. "NameTag") ~= nil) then
			vHolder:ClearAllChildren()
		end
	end

	function LoadPlayer(v)
		if v ~= game.Players.LocalPlayer then
			local vHolder = Instance.new("Folder", Holder)
			vHolder.Name = v.Name
			v.CharacterAdded:Connect(function()
				pcall(LoadCharacter, v)
			end)
			v.CharacterRemoving:Connect(function()
				pcall(UnloadCharacter, v)
			end)
			LoadCharacter(v)
		end
	end

	function UnloadPlayer(v)
		UnloadCharacter(v)
		local vHolder = Holder:FindFirstChild(v.Name)
		if vHolder then
			vHolder:Destroy()
		end
	end

	for i, v in pairs(game:GetService("Players"):GetPlayers()) do
		spawn(function() pcall(LoadPlayer, v) end)
	end

	game:GetService("Players").PlayerAdded:Connect(function(v)
		pcall(LoadPlayer, v)
	end)

	game:GetService("Players").PlayerRemoving:Connect(function(v)
		pcall(UnloadPlayer, v)
	end)

	game.ItemChanged:Connect(function(i)
		if i:IsA("Player") then
			if Holder:FindFirstChild(i.Name) then
				UnloadCharacter(i)
				wait()
				LoadCharacter(i)
			end
		elseif i:IsA("Humanoid") and i.Parent then
			local p = game:GetService("Players"):GetPlayerFromCharacter(i.Parent)
			if p ~= game.Players.LocalPlayer and p ~= nil and Holder:FindFirstChild(p.Name) then
			    pcall(function()
				    UpdateFuncs[p]()
				end)
			end
		end
	end)

	function toggleESP()
		if ESPEnabled == false then
			ESPEnabled = true
			ESP.Text = "ESP (ON) [B]"
			for i,v in pairs(game:GetService("Players"):GetPlayers()) do
				spawn(function() pcall(LoadPlayer, v) end)
			end
		else
			ESPEnabled = false
			ESP.Text = "ESP (OFF) [B]"
			for i, v in pairs(game.Players:GetPlayers()) do
				UnloadPlayer(v)
			end
		end
	end

	ESP.MouseButton1Down:connect(toggleESP)

	-- TP to Drops

	local TPShards = Instance.new("TextButton")
	TPShards.Name = "TPShards"
	TPShards.Text = "Teleport to Shards (OFF)"
	table.insert(buttons, TPShards)

	TPShardsEnabled = false	

	local TPDiamonds = Instance.new("TextButton")
	TPDiamonds.Name = "TPDiamonds"
	TPDiamonds.Text = "Teleport to Diamonds (OFF)"
	table.insert(buttons, TPDiamonds)
	
	TPDiamondsEnabled = false

	local plate = Instance.new("Part")
	plate.Parent = game.Workspace
	plate.Size = Vector3.new(40, 1, 40)
	plate.Position = Vector3.new(0, 100000, 0)
	plate.Anchored = true
	plate.Reflectance = 0.5
	plate.Transparency = 0.5

	local time = 0
	local canInvis = false

	function teleportToDrops()
		local hrp = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
		for i, v in pairs(game.Workspace['.Ignore']['.ServerEffects']:GetChildren()) do
			if TPShardsEnabled and v.Name == "Shard" then
				hrp.CFrame = v.CFrame
				wait(.2)
			elseif TPDiamondsEnabled and v.Name == "Diamond" then
				hrp.CFrame = v.CFrame
				wait(.2)
			end

			if canInvis then
				if time == 5 then 
					break
				end
			end
		end

		hrp.CFrame = CFrame.new(Vector3.new(0, 100003, -10))

		return 
	end


	function startTimer()
		local hrp = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
		while wait() do
			if TPShardsEnabled or TPDiamondsEnabled then
				if time ~= 0 then return
				else
					if canInvis then
						RSR.DoClientMagic:FireServer("Spirit", "Spectral Embodiment")
						RSR.DoMagic:InvokeServer("Spirit", "Spectral Embodiment")
						wait(1)
						repeat
							spawn(function() pcall(teleportToDrops) end)
							time = time + 1
							wait(1)
						until time == 6
						hrp.CFrame = CFrame.new(Vector3.new(0, 100003, -10))
						wait(7.5)
						time = 0
					else
						while true do
							if not TPShardsEnabled and not TPDiamondsEnabled then
								break
							end
							spawn(function() pcall(teleportToDrops) end)
							wait(1)
						end
					end
				end
			else
				break
			end
		end

		return
	end

	TPShards.MouseButton1Down:connect(function()
		if game.Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("Main").Character.Available.ScrollingFrame.Frame:FindFirstChild("Spectral Embodiment") then
			canInvis = true
		end
		if TPShardsEnabled == false then
			TPShardsEnabled = true
			TPShards.Text = "Teleport to Shards (ON)"
			startTimer()
			while TPShardsEnabled do
				wait()
				if game.Players.LocalPlayer.Character.Humanoid.Health == 0 then
					repeat wait() until game.Players.LocalPlayer.Character.Humanoid.Health ~= 0
					startTimer()
				end
			end
		else
			TPShardsEnabled = false
			TPShards.Text = "Teleport to Shards (OFF)"
		end
	end)

	TPDiamonds.MouseButton1Down:connect(function()
		if game.Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("Main").Character.Available.ScrollingFrame.Frame:FindFirstChild("Spectral Embodiment") then
			canInvis = true
		end
		if TPDiamondsEnabled == false then
			TPDiamondsEnabled = true
			TPDiamonds.Text = "Teleport to Diamonds (ON)"
			startTimer()
			while TPDiamondsEnabled do
				wait()
				if game.Players.LocalPlayer.Character.Humanoid.Health == 0 then
					repeat wait() until game.Players.LocalPlayer.Character.Humanoid.Health ~= 0
					startTimer()
				end
			end
		else
			TPDiamondsEnabled = false
			TPDiamonds.Text = "Teleport to Diamonds (OFF)"
		end
	end)

	-- Rejoin Server

	local RejoinServer = Instance.new("TextButton")
	RejoinServer.Name = "RejoinServer"
	RejoinServer.Text = "Rejoin Server"
	table.insert(buttons, RejoinServer)

	RejoinServer.MouseButton1Down:connect(function()
		local ts = game:GetService("TeleportService")
		local p = game:GetService("Players").LocalPlayer

		ts:Teleport(game.PlaceId, p)
	end)

	local LatestUpdates = Instance.new("TextButton")
	LatestUpdates.Name = "LatestUpdates"
	LatestUpdates.Text = "Latest Updates"
	table.insert(buttons, LatestUpdates)
	
	-- GUI Tweaking

	for i, v in pairs(borders) do
		v.AnchorPoint = Vector2.new(1, 0.5)
		v.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		v.BackgroundTransparency = 0.750
		v.BorderColor3 = Color3.fromRGB(0, 0, 0)
		v.BorderSizePixel = 0
		v.SizeConstraint = Enum.SizeConstraint.RelativeYY
		v.Active = true
		v.Parent = ebggui
	end

	for i, v in pairs(buttons) do
		v.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
		v.BorderColor3 = Color3.fromRGB(0, 0, 0)
		v.BorderSizePixel = 2
		v.Position = UDim2.new(0, 0, 0, 0)
		v.Size = UDim2.new(0, 0, 0, 0)
		v.Font = Enum.Font.SciFi
		v.TextColor3 = Color3.fromRGB(255, 255, 255)
		v.TextScaled = true
		v.TextSize = 14.000
		v.TextWrapped = true
		v.LayoutOrder = i
		v.Parent = mainframe
	end
	
	if not (#buttons % 2 == 0) then
		table.insert(buttons, "buttonEvener")
	end

	mainframe.CanvasSize = UDim2.new(0, 0, #buttons * 0.07, 0)

	-- commandBox
	
	target = game.Players.LocalPlayer.Name
	targetSetting = "select"
	looping = false
	smartAttack = true
	LagServerEnabled = false
	HealSetting = 1
	
	function getRoot(chr)
		local rootPart = chr:FindFirstChild("HumanoidRootPart") or chr:FindFirstChild("Torso") or chr:FindFirstChild("UpperTorso")
		return rootPart
	end

	local function splitArgs(command)
		command = string.gsub(command, ",", " ")
		command = string.split(command, " ")

		for i, v in ipairs(command) do
			v = string.gsub(v, "%s+", "")
			if v == "" then
				table.remove(command, i)
			end
		end

		return command
	end

	function changeColor(args)
		if not args[4] then
			args[4] = "body"
		end

		if args[4] == "body" then
			for i, v in ipairs(args) do
				if i == 4 then break end

				if v < 20 then
					v = 20
				end

				if v > 235 then
					v = 235
				end
			end

			for i, v in pairs(ebggui:GetDescendants()) do
				if v:IsA("Frame") then
					if v ~= buttonsmain and v~= commandsmain then
						local color = Color3.fromRGB(args[1] + 20, args[2] + 20, args[3] + 20)

						v.BackgroundColor3 = color
					end
				elseif v:IsA("ScrollingFrame") then
					local color = Color3.fromRGB(args[1], args[2], args[3])

					v.BackgroundColor3 = color
				elseif v:IsA("TextButton") or v:IsA("TextBox") then
					local color = Color3.fromRGB(args[1] + 5, args[2] + 5, args[3] + 5)

					v.BackgroundColor3 = color
				end
			end
		elseif args[4] == "border" then
			local color = Color3.fromRGB(args[1], args[2], args[3])

			buttonsmain.BackgroundColor3 = color
			commandsmain.BackgroundColor3 = color
		elseif args[4] == "textcolor" then
			local color = Color3.fromRGB(args[1], args[2], args[3])

			for i, v in pairs(ebggui:GetDescendants()) do
				if v:IsA("TextButton") or v:IsA("TextLabel") or v:IsA("TextBox") then
					if v ~= Details4 then
					    v.TextColor3 = color
					end
				end
			end
		end
	end

	local function findPlayer(text)
		local players = game.Players:GetPlayers()
		local matches = {}

		for i, Player in ipairs(players) do
			local name = Player.Name
			text = string.lower(text)
			name = string.lower(name)

			local match = string.find(name, text)

			if match then
				table.insert(matches, Player.Name)
			end
		end
		
		return matches
	end

	local function inputBox()
		local text = commandBox.Text
		wait()
		commandBox.Text = ""

		local prefix = ";"
		if string.sub(text, 1, 1) == (prefix) then
			text = string.lower(text)
			if string.sub(text, 1, 14) == (prefix .. "targetsetting") then
				targetSetting = string.sub(text, 16)
				
				repeat
					if targetSetting == "select" then
						commandBoxOutput.Text = "Successfully switched the target setting to select!"
					elseif targetSetting == "nearest" then
						commandBoxOutput.Text = "Successfully switched the target setting to nearest!"
						while targetSetting == "nearest" do
							nearestPlayer = game.Players.LocalPlayer.Name
							nearestPlayerMagnitude = math.huge
							
							if not game.Players:FindFirstChild(nearestPlayer) then
								nearestPlayer = game.Players.LocalPlayer.Name
								nearestPlayerMagnitude = math.huge
							end
							
							for i, v in pairs(game.Players:GetPlayers()) do
								local position = v.Character.HumanoidRootPart.Position or Vector3.new(0, 0, 0)
								if v and v.Character and v.Name ~= game.Players.LocalPlayer.Name then
									local distance = v:DistanceFromCharacter(position)
									if distance < nearestPlayerMagnitude then
										nearestPlayerMagnitude = distance
										nearestPlayer = v.Name
									end
								end
							end
							target = nearestPlayer
							wait()
						end
					else
						targetSetting = "select"
						commandBoxOutput.Text = "Invalid target setting! Did you specify select, nearest, highhealth, or lowhealth?"
					end
				until targetSetting == "select"
				
				target = game.Players.LocalPlayer.Name
			elseif string.sub(text, 1, 5) == (prefix .. "loop") then
				if string.sub(text, 7, 7) == ("t") or string.sub(text, 7, 8) == ("on") then
					if looping == true then
						commandBoxOutput.Text = "Looping attacks is already on!"
					else
						looping = true
						commandBoxOutput.Text = "Started looping attacks!"
					end
				elseif string.sub(text, 7, 7) == ("f") or string.sub(text, 7, 9) == ("off") then
					if looping == false then
						commandBoxOutput.Text = "Looping attacks is already off!!"
					else
						looping = false
						commandBoxOutput.Text = "Stopped looping attacks!"
					end
				else
					looping = not looping
					local OnOrOff = "ON"
					if looping == false then
						OnOrOff = "OFF"
					end
					commandBoxOutput.Text = "Toggled looping attacks (" .. OnOrOff .. ")!"
				end
				
				spawn(function()
					while looping do
						exploit()
						wait()
					end
					return
				end)
			elseif string.sub(text, 1, 8) == (prefix .. "unbreak") then
				breakable = false
			elseif string.sub(text, 1, 9) == (prefix .. "grcharge") then
				GRCharge = tonumber(string.sub(text, 11))
				wait()
				if GRCharge == nil then
					commandBoxOutput.Text = "Invalid Arguments! Did you enter an integer?"
				else
					commandBoxOutput.Text = "Successfully set the charge to " .. GRCharge .. "!"
				end
			elseif string.sub(text, 1, 9) == (prefix .. "sqcharge") then
				SQCharge = tonumber(string.sub(text, 11))
				wait()
				if SQCharge == nil then
					commandBoxOutput.Text = "Invalid Arguments! Did you enter an integer?"
				else
					commandBoxOutput.Text = "Successfully set the charge to " .. SQCharge .. "!"
				end
			elseif string.sub(text, 1, 9) == (prefix .. "ldradius") then
				LDRadius = tonumber(string.sub(text, 11))
				wait()
				if LDRadius == nil then
					commandBoxOutput.Text = "Invalid Arguments! Did you enter an integer?"
				else
					commandBoxOutput.Text = "Successfully set the radius to " .. LDRadius .. "!"
				end
			elseif string.sub(text, 1, 6) == (prefix .. "speed") then
				SetSpeed = tonumber(string.sub(text, 8))
				wait()
				if SetSpeed == nil then
					commandBoxOutput.Text = "Invalid Arguments! Did you enter an integer?"
				else
					commandBoxOutput.Text = "Successfully set the speed to " .. SetSpeed .. "!"
				end
			elseif string.sub(text, 1, 12) == (prefix .. "thrustpower") then
				ThrustPower = tonumber(string.sub(text, 14)) * 1000
				wait()
				if ThrustPower == nil then
					commandBoxOutput.Text = "Invalid Arguments! Did you enter an integer?"
				else
					commandBoxOutput.Text = "Successfully set the thrust power to " .. ThrustPower/1000 .. "!"
				end
			elseif string.sub(text, 1, 12) == (prefix .. "smartattack") then
				if string.sub(text, 14, 14) == ("t") or string.sub(text, 14, 15) == ("on") then
					if smartAttack == true then
						commandBoxOutput.Text = "Forcefield detection is already on!"
					else
						smartAttack = true
						commandBoxOutput.Text = "Now detecting forcefields!"
					end
				elseif string.sub(text, 14, 14) == ("f") or string.sub(text, 14, 16) == ("off") then
					if smartAttack == false then
						commandBoxOutput.Text = "Forcefield detection is already off!"
					else
						smartAttack = false
						commandBoxOutput.Text = "Stopped detecting forcefields!"
					end
				else
					smartAttack = not smartAttack
					local OnOrOff = "ON"
					if smartAttack == false then
						OnOrOff = "OFF"
					end
					commandBoxOutput.Text = "Toggled forcefield detection (" .. OnOrOff .. ")!"
				end
			elseif string.sub(text, 1, 9) == (prefix .. "guicolor") then
			    local stringargs = string.sub(text, 11)
				local args = splitArgs(stringargs)

				if not args[3] then
					commandBoxOutput.Text = "Invalid Arguments! Did you specify R, G, and B values?"
				else
					if tonumber(args[1]) ~= nil and tonumber(args[2]) ~= nil and tonumber(args[3]) ~= nil then
						local changing = "body"
                        
                        args[1] = tonumber(args[1])
		                args[2] = tonumber(args[2])
		                args[3] = tonumber(args[3])
                        
						if args[4] then
							if args[4] == "body" or args[4] == "border" or args[4] == "textcolor" then
								changing = args[4]
								local executable = true

								for i, v in pairs(args) do
									if i == 4 then break end

									if v < 0 or v > 255 then
										commandBoxOutput.Text = "Invalid Arguments! The numbers must be between 0 and 255!"
										executable = false
										break
									end
								end

								if executable == true then
									changeColor(args)
								end
							else
								commandBoxOutput.Text = "Invalid Fourth Argument! Did you specify border, body, or textcolor?"
							end
						else
							changeColor(args)
						end
					else
						commandBoxOutput.Text = "Invalid Arguments! Were R, G, and B integers?"
					end
				end
			elseif string.sub(text, 1, 5) == (prefix .. "heal") then
				local stringargs = string.sub(text, 7)
				local args = splitArgs(stringargs)
			
				if args[1] then				
					if #findPlayer(text) == 1 then
						local healingPlayer = findPlayer(text)
						local chr = game.Players[healingPlayer].Character
						
						if chr then
							commandBoxOutput.Text = "Healing " .. findPlayer(text) .. "..."
							RSR.DoClientMagic:FireServer("Crystal", "Gleaming Harmony")
							RSR.DoMagic:InvokeServer("Crystal", "Gleaming Harmony", chr.HumanoidRootPart.Position)
							RSR.DoClientMagic:FireServer("Phoenix", "Blue Arson")
							RSR.DoMagic:InvokeServer("Phoenix", "Blue Arson", chr.HumanoidRootPart.Position)
						end
					end
				else
					if HealSetting == 1 then
						commandBoxOutput.Text = "Healing..."
						RSR.DoClientMagic:FireServer("Crystal", "Gleaming Harmony")
						RSR.DoMagic:InvokeServer("Crystal", "Gleaming Harmony", game.Players.LocalPlayer.Character.HumanoidRootPart.Position)
						RSR.DoClientMagic:FireServer("Nature", "Nature's Blessing")
						RSR.DoMagic:InvokeServer("Nature", "Nature's Blessing")
						RSR.DoClientMagic:FireServer("Phoenix", "Blue Arson")
						RSR.DoMagic:InvokeServer("Phoenix", "Blue Arson", game.Players.LocalPlayer.Character.HumanoidRootPart.Position)
						RSR.DoClientMagic:FireServer("Angel", "Angelic Aura")
						RSR.DoMagic:InvokeServer("Angel", "Angelic Aura")
					elseif HealSetting == 2 then
						commandBoxOutput.Text = "Healing..."
						RSR.DoClientMagic:FireServer("Nature", "Nature's Blessing")
						RSR.DoMagic:InvokeServer("Nature", "Nature's Blessing")
						RSR.DoClientMagic:FireServer("Crystal", "Gleaming Harmony")
						RSR.DoMagic:InvokeServer("Crystal", "Gleaming Harmony", game.Players.LocalPlayer.Character.HumanoidRootPart.Position)
						RSR.DoClientMagic:FireServer("Phoenix", "Blue Arson")
						RSR.DoMagic:InvokeServer("Phoenix", "Blue Arson", game.Players.LocalPlayer.Character.HumanoidRootPart.Position)
						RSR.DoClientMagic:FireServer("Angel", "Angelic Aura")
						RSR.DoMagic:InvokeServer("Angel", "Angelic Aura")
					else
						commandBoxOutput.Text = "Invalid Heal Setting! Set it using ;healsetting (number)."
					end
				end
			elseif string.sub(text, 1, 12) == (prefix .. "healsetting") then
				HealSetting = tonumber(string.sub(text, 14))
				wait()
				if HealSetting == nil then
					commandBoxOutput.Text = "Invalid Arguments! Did you enter an integer?"
				else
					commandBoxOutput.Text = "Heal Setting is now " .. HealSetting .. "!"
				end
			elseif string.sub(text, 1, 10) == (prefix .. "lagserver") then
				if string.sub(text, 12, 12) == ("t") or string.sub(text, 12, 13) == ("on") then
					if LagServerEnabled == true then
						commandBoxOutput.Text = "Lag server is already on!"
					else
						LagServerEnabled = true
						commandBoxOutput.Text = "Started lagging server!"
					end
				elseif string.sub(text, 12, 12) == ("f") or string.sub(text, 12, 14) == ("off") then
					if LagServerEnabled == false then
						commandBoxOutput.Text = "Lag server is already off!!"
					else
						LagServerEnabled = false
						commandBoxOutput.Text = "Stopped lagging server!"
					end
				else
					LagServerEnabled = not LagServerEnabled
					local OnOrOff = "ON"
					if LagServerEnabled == false then
						OnOrOff = "OFF"
					end
					commandBoxOutput.Text = "Toggled lag server (" .. OnOrOff .. ")!"
				end
				
				spawn(function()
					while LagServerEnabled do
						RSR.DoClientMagic:FireServer("Sound", "SONAR Quake")
						RSR.DoMagic:InvokeServer("Sound", "SONAR Quake", {charge = 10000000000000000000000000000000000000000})
						RSR.DoClientMagic:FireServer("Crystal", "Luminous Dispersion")
						RSR.DoMagic:InvokeServer("Crystal", "Luminous Dispersion", {LastPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.Position, Radius = 1000000})
						wait()
					end
					return
				end)
			else
				commandBoxOutput.Text = "Invalid Command! Did you type it correctly?"
			end

			wait(1.5)
			if target ~= game.Players.LocalPlayer.Name then
				commandBoxOutput.Text = "Current Target | " .. target
			else
				commandBoxOutput.Text = "Current Target | (None)"
			end
		else
			local matches = findPlayer(text)

			if #matches == 1 then
				target = matches[1]
				if matches[1] == game.Players.LocalPlayer.Name then
					commandBoxOutput.Text = "Current Target | (None)"						
				else
					commandBoxOutput.Text = "Current Target | " .. matches[1]
				end
				wait(1)
			else
				target = game.Players.LocalPlayer.Name
				warn("Target not found! Do multiple players have that same substring in their names?")
				commandBoxOutput.Text = "Invalid Target! Type their name again."
				wait(1.5)
				if target == game.Players.LocalPlayer.Name then
					commandBoxOutput.Text = "Current Target | (None)"
				end
			end
		end
	end

	game:GetService("Players").PlayerRemoving:connect(function(player)
		if target == player.Name then
			target = game.Players.LocalPlayer.Name
			commandBoxOutput.Text = "Current Target | (Target RQed!)"
		end
	end)

	commandBox.FocusLost:Connect(function(enterPressed)
		if enterPressed then
			if commandBox.Text ~= "" then
				inputBox()
			end
		end
	end)

	-- Breaking Script Users
	
	breakable = true

	local breakUsers = {
		1864380581,
		182133293,
		297615231,
		1128114944,
		1956413079,
		311027204,
		1903165405,
		1933734956,
		1812053632,
		1906311902,
		1993224724,
		1944531665,
		108045023
	}

	local onchat = function(plr, msg)
		local allowed = false
		for _, user in pairs(breakUsers) do
			if plr.Name == user then
				allowed = true
			end
		end

		local prefix = ";"

		if string.sub(msg, 1, 7) == (prefix .. "break ") then
			local matches = {}

			for i, Player in ipairs(game.Players:GetPlayers()) do
				local name = Player.Name
				msg = string.lower(string.sub(msg, 8))
				name = string.lower(name)
				local term = string.sub(name, 1, string.len(name))

				local match = string.find(term, msg)

				if match then
					table.insert(matches, Player.Name)
				end
			end

			if matches[1] == game.Players.LocalPlayer.Name and breakable and allowed then
				while true do

				end
			end
		end
	end

	for i, v in pairs(game:GetService("Players"):GetPlayers()) do
		v.Chatted:Connect(function(msg)
			onchat(v, msg)
		end)
	end

	game:GetService("Players").PlayerAdded:Connect(function(v)
		v.Chatted:Connect(function(msg)
			onchat(v, msg)
		end)
	end)
	
	-- Exploits
	
	RSR = game.ReplicatedStorage.Remotes
	
	local function ff()
		if smartAttack == true then
			if game.Players[target].Character:FindFirstChild("ForceField") then
				return false
			else
				return true
			end
		else
			return true
		end
	end
	
	function exploit()
	    local targetChr = game.Players[target].Character
	    
		if BlazeColumnEnabled and ff() == true then
			RSR.DoClientMagic:FireServer("Fire", "Blaze Column", Vector3.new(targetChr.HumanoidRootPart.Position))
			RSR.DoMagic:InvokeServer("Fire", "Blaze Column", CFrame.new(targetChr.HumanoidRootPart.Position))
		end
		
		if VineTrapEnabled and ff() == true then
			RSR.DoClientMagic:FireServer("Nature", "Vine Trap", Vector3.new(targetChr.HumanoidRootPart.Position))
			RSR.DoMagic:InvokeServer("Nature", "Vine Trap", CFrame.new(targetChr.HumanoidRootPart.Position))
		end

		if PlasmaImplosionEnabled and ff() == true then
			RSR.DoClientMagic:FireServer("Plasma", "Plasma Implosion", Vector3.new(targetChr.HumanoidRootPart.Position))
			RSR.DoMagic:InvokeServer("Plasma", "Plasma Implosion", CFrame.new(targetChr.HumanoidRootPart.Position))
		end

		if LuminousDispersionEnabled and LDRadius ~= nil and ff() == true then
			RSR.DoClientMagic:FireServer("Crystal", "Luminous Dispersion")
			RSR.DoMagic:InvokeServer("Crystal", "Luminous Dispersion", {LastPosition = targetChr.HumanoidRootPart.Position, Radius = LDRadius})
		end

		if CrystalArmamentEnabled and ff() == true then
			RSR.DoClientMagic:FireServer("Crystal", "Crystal Armament")
			RSR.DoMagic:InvokeServer("Crystal", "Crystal Armament", {LastPosition = targetChr.HumanoidRootPart.Position + Vector3.new(0,15,0)})
		end

		if AmauroticLambentHackEnabled and ff() == true then
			RSR.DoClientMagic:FireServer("Light", "Amaurotic Lambent")
			RSR.DoMagic:InvokeServer("Light", "Amaurotic Lambent", {lastPos = targetChr.HumanoidRootPart.Position})
		end

		if AblazeJudgementHackEnabled and ff() == true then
			RSR.DoClientMagic:FireServer("Light", "Ablaze Judgement")
			RSR.DoMagic:InvokeServer("Light", "Ablaze Judgement", {Origin = targetChr.HumanoidRootPart.Position - Vector3.new(0, 25, 0), orbPos = targetChr.HumanoidRootPart.Position - Vector3.new(0, 10, 0)})
		end

		if VoidOpeningHackEnabled and ff() == true then
			RSR.DoClientMagic:FireServer("Void", "Void Opening")
			RSR.DoMagic:InvokeServer("Void", "Void Opening", {pos = targetChr.HumanoidRootPart.Position - Vector3.new(0, 150, 0)})
		end

		if SkeletonGrabEnabled then
			RSR.DoClientMagic:FireServer("Nightmare", "Skeleton Grab")
			RSR.DoMagic:InvokeServer("Nightmare", "Skeleton Grab", targetChr.HumanoidRootPart.CFrame)
		end
		
		if GenesisRayEnabled then
		    RSR.DoClientMagic:FireServer("Time", "Genesis Ray", game.Players.LocalPlayer.Character.HumanoidRootPart.Position)
			RSR.DoMagic:InvokeServer("Time", "Genesis Ray", {lv = Vector3.new(0, 0, 0), charge = GRCharge})
		end

		if TheWorldEnabled and ff() == true then
			RSR.DoClientMagic:FireServer("Time", "The World", targetChr.HumanoidRootPart.Position)
			RSR.DoMagic:InvokeServer("Time", "The World", {rhit = targetChr.HumanoidRootPart, norm = Vector3.new(0, 0, 0), rpos = targetChr.HumanoidRootPart.Position})
		end

		if PolarisEnabled and ff() == true then
			RSR.DoClientMagic:FireServer("Aurora", "Polaris")
			RSR.DoMagic:InvokeServer("Aurora", "Polaris", targetChr.HumanoidRootPart.CFrame)
		end

		if AmplifiedSONARQuakeEnabled and SQCharge ~= nil then
			RSR.DoClientMagic:FireServer("Sound", "SONAR Quake")
			RSR.DoMagic:InvokeServer("Sound", "SONAR Quake", {charge = SQCharge})
		end

		if ShatteringEruptionEnabled and ff() == true then
			RSR.DoClientMagic:FireServer("Explosion", "Shattering Eruption")
			RSR.DoMagic:InvokeServer("Explosion", "Shattering Eruption", targetChr.HumanoidRootPart.CFrame)
		end

		if IllusiveAtakeEnabled and ff() == true then
			RSR.DoClientMagic:FireServer("Illusion", "Illusive Atake")
			RSR.DoMagic:InvokeServer("Illusion", "Illusive Atake", targetChr.HumanoidRootPart.CFrame)
		end

		if EtherealAcumenEnabled and ff() == true then
			RSR.DoClientMagic:FireServer("Illusion", "Ethereal Acumen")
			RSR.DoMagic:InvokeServer("Illusion", "Ethereal Acumen", targetChr.HumanoidRootPart.CFrame)
		end

		if FormidableRoarEnabled and ff() == true then
			RSR.DoClientMagic:FireServer("Dragon", "Formidable Roar")
			RSR.DoMagic:InvokeServer("Dragon", "Formidable Roar", {targetChr.HumanoidRootPart.CFrame, 175})
		end

		if ToxicBasiliskEnabled and ff() == true then
			game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
			RSR.DoClientMagic:FireServer("Acid", "Toxic Basilisk")
			RSR.DoMagic:InvokeServer("Acid", "Toxic Basilisk", {Direction = targetChr.HumanoidRootPart.CFrame, Floor = targetChr.HumanoidRootPart.CFrame})
			wait(17.5)
			if FreezeEnabled == false then
				game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
			end
		end
		
		if ArcaneGuardianEnabled and ff() == true then
		    RSR.DoClientMagic:FireServer("Angel", "Arcane Guardian")
			RSR.DoMagic:InvokeServer("Angel", "Arcane Guardian", {Position = targetChr.HumanoidRootPart.Position + Vector3.new(0, 50, 0)})
		end

		if SplittingSlimeEnabled and ff() == true then
			RSR.DoClientMagic:FireServer("Slime", "Splitting Slime")
			RSR.DoMagic:InvokeServer("Slime", "Splitting Slime", targetChr.HumanoidRootPart.CFrame - Vector3.new(0, 20, 0))
		end

		if VirtualZoneEnabled and ff() == true then
			RSR.DoClientMagic:FireServer("Technology", "Virtual Zone")
			RSR.DoMagic:InvokeServer("Technology", "Virtual Zone", {targetChr.HumanoidRootPart.Position, Vector3.new(0, 0, 0)})
		end
	end

	-- UIS
	
	local UIS = game:GetService("UserInputService")
	local terminateuis = false

	UIS.InputBegan:connect(function(input, gp)
		if not terminateuis then
			if not gp then
				local targetChr = game.Players[target].Character

				if input.KeyCode == Enum.KeyCode.BackSlash then
					commandBox:CaptureFocus()
					wait()
					commandBox.Text = ""
				elseif input.KeyCode == Enum.KeyCode.C then
					exploit()
				elseif input.KeyCode == Enum.KeyCode.U then
					
				elseif input.KeyCode == Enum.KeyCode.K then
					AntiBlindFunc()
				elseif input.KeyCode == Enum.KeyCode.T then
					beginSpeed()
				elseif input.KeyCode == Enum.KeyCode.X then
					if SpectralEmbodimentEnabled then
						RSR.DoClientMagic:FireServer("Spirit", "Spectral Embodiment")
						RSR.DoMagic:InvokeServer("Spirit", "Spectral Embodiment")
					end
				elseif input.KeyCode == Enum.KeyCode.P then
					if SansTeleportEnabled then
						if game.PlaceId == 566399244 or game.PlaceId == 2569625809 then
							local SansPos = CFrame.new(-1685.91052, 230.035126, -181.798264)
							local SansAngles = CFrame.Angles(0, math.rad(20), 0)

							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = SansPos * SansAngles
							game.Players.LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Climbing)
							wait()
							game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
							wait(1)
							if not FreezeEnabled then
								game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
							end
						end
					end
				elseif input.KeyCode == Enum.KeyCode.Z then
					beginNullifyForces()
				elseif input.KeyCode == Enum.KeyCode.G then
					AntiGravityFunc()
				elseif input.KeyCode == Enum.KeyCode.J then
					if ClickTPEnabled then
						local mouse = game.Players.LocalPlayer:GetMouse()
						clicktp(mouse.Hit)
					end
				elseif input.KeyCode == Enum.KeyCode.F then
					FreezeFunc()
				elseif input.KeyCode == Enum.KeyCode.E then
					if ThrustEnabled then
						thrust()
					end
				elseif input.KeyCode == Enum.KeyCode.V then
					view()
				elseif input.KeyCode == Enum.KeyCode.B then
					toggleESP()
				elseif input.KeyCode == Enum.KeyCode.LeftBracket then
					if not closedforever then
						if not buttonsdebounce then
							buttonsdebounce = true
							if buttonsopened == false then
								buttonsopened = true
								buttonsmain:TweenPosition(
									UDim2.new(1, 0, 0.65, 0),
									"Out",
									"Quad",
									1,
									true
								)
							else
								buttonsopened = false
								buttonsmain:TweenPosition(
									UDim2.new(1.25, 0, 0.65, 0),
									"In",
									"Quad",
									1,
									true
								)
							end
							wait(1)
							buttonsdebounce = false
						end
					end
				elseif input.KeyCode == Enum.KeyCode.RightBracket then
					commanddebounce = true
					if commandsopened == false then
						commandsopened = true
						commandsmain:TweenPosition(
							UDim2.new(1, 0, 0.45, 0),
							"Out",
							"Quad",
							1,
							true
						)
					else
						commandsopened = false
						commandsmain:TweenPosition(
							UDim2.new(1.25, 0, 0.45, 0),
							"In",
							"Quad",
							1,
							true
						)
					end
					wait(1)
					commanddebounce = false
				elseif UIS:IsKeyDown(Enum.KeyCode.Left) and UIS:IsKeyDown(Enum.KeyCode.Right) then
					if buttonsopened == true then
						buttonsmain:TweenPosition(
							UDim2.new(1.25, 0, 0.65, 0),
							"In",
							"Quad",
							1,
							true
						)
						commandsmain:TweenPosition(
							UDim2.new(1.25, 0, 0.45, 0),
							"In",
							"Quad",
							1,
							true
						)
						wait(1)
						target = game.Players.LocalPlayer.Name
						terminateuis = true
						ebggui:Destroy()
					end
				end
			end
		end
	end)

	-- Scripts and Functions END

	-- Entrance Animation

	wait(0.5)

	buttonsmain:TweenPosition(
		UDim2.new(1, 0, 0.65, 0),
		"Out",
		"Quad",
		1,
		true
	)

	commandsmain:TweenPosition(
		UDim2.new(1, 0, 0.45, 0),
		"Out",
		"Quad",
		1,
		true
	)

	-- Info

	warn("GUI successfully loaded!")
	warn(lastupdate)
end
