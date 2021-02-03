if not game:IsLoaded() then
    game.Loaded:Wait()
end

local lastupdate = "GUI Last Updated: 12-9-20 9:23 PM EST"
local whitelist = false

local s = {}

local GrindAccounts
local FarmSetting
local IncreaseCap
local Level
local Shards
local Kills
local Layer
local Place
local teleportto

if typeof(_G.Settings) == typeof(s) then
	s = _G.Settings

	if typeof(s["Grind Accounts"]) == "table" then
		GrindAccounts = s["Grind Accounts"]
		warn("Grind Account table not found! Local Player assumed to be a Victim.")
	else
		GrindAccounts = {}
	end

	if typeof(s["Farm Setting"]) == "number" then
		FarmSetting = s["Farm Setting"]
	else
		FarmSetting = 1
		warn("Farm setting not found! Farm setting set to 1.")
	end

	if typeof(s["Increase Cap"]) == "boolean" then
		IncreaseCap = s["Increase Cap"]
	else
		IncreaseCap = false
	end

	if typeof(s["Level"]) ~= "number" then
		Level = -1
		warn("The level limit was incorrectly specified, or was not detected! The level limit was set to -1.")
	elseif s["Level"] >= 0 then
		Level = math.round(s["Level"])
	else
		Level = -1
		warn("The level limit was incorrectly specified, or was not detected! The level limit was set to -1.")
	end

	if typeof(s["Shards"]) ~= "number" then
		Shards = -1
		warn("The shards limit was incorrectly specified, or was not detected! The shards limit was set to -1.")
	elseif s["Shards"] >= 0 then
		Shards = math.round(s["Shards"])
	else
		Shards = -1
		warn("The shards limit was incorrectly specified, or was not detected! The shards limit was set to -1.")
	end

	if typeof(s["Kills"]) ~= "number" then
		Kills = -1
		warn("The kills limit was incorrectly specified, or was not detected! The kills limit was set to -1.")
	elseif s["Kills"] >= 0 then
		Kills = math.round(s["Kills"])
	else
		Kills = -1
		warn("The kills limit was incorrectly specified, or was not detected! The kills limit was set to -1.")
	end

	if typeof(s["Layer"]) ~= "number" then
		Layer = math.round(s["Layer"])
	else
		Layer = 0
		warn("The layer increment was incorrectly specified, or was not detected! The layer was set to 0.")
	end

	local places = {
		566399244, 
		2569625809, 
		570158081, 
		537600204,
		520568240,
		544955560,
		602048550,
		575456646,
		1713986112,
	}

	s["Place"] = tostring(s["Place"]):lower()
	warn(s["Place"])

	if s["Place"] == "standard" or s["Place"] == "566399244" then
		Place = "standard"
		teleportto = places[1]
	elseif s["Place"] == "standard40" or s["Place"] == "2569625809" then
		Place = "standard40"
		teleportto = places[2]
	elseif s["Place"] == "light" or s["Place"] == "570158081" then
		Place = "light"
		teleportto = places[3]
	elseif s["Place"] == "fire" or s["Place"] == "537600204" then
		Place = "fire"
		teleportto = places[4]
	elseif s["Place"] == "water" or s["Place"] == "520568240" then
		Place = "water"
		teleportto = places[5]
	elseif s["Place"] == "grass" or s["Place"] == "544955560" then
		Place = "grass"
		teleportto = places[6]
	elseif s["Place"] == "heaven" or s["Place"] == "602048550" then
		Place = "heaven"
		teleportto = places[7]
	elseif s["Place"] == "minilovania" or s["Place"] == "sans" or s["Place"] == "575456646" then
		Place = "minilovania"
		teleportto = places[8]
	elseif s["Place"] == "default" or s["Place"] == "tournament" or s["Place"] == "1713986112" then
		Place = "default"
		teleportto = places[9]
	else
		Place = "default"
		teleportto = places[9]
		warn("The place was incorrectly specified, or was not detected! Place assumed to be Tournament.")
	end
else
	warn("No settings table found! Retrieving and using default settings.")
	GrindAccounts = {}
	FarmSetting = 1
	IncreaseCap = false
	Level = -1
	Shards = -1
	Kills = -1
	Layer = -1
	Place = "default"

	teleportto = 1713986112
end

warn("Credits: This script was made by jaden#4143! Join my discord server at discord.gg/K2wewFWWFZ.")
warn("Settings:")
warn("Grind Accounts:")
for i, v in pairs(GrindAccounts) do
	if v ~= "" then
		warn(v)
	end
end
warn("Farm Setting: " .. FarmSetting)
warn("Increase Cap enabled: " .. tostring(IncreaseCap))
warn("Specified level limit: " .. Level)
warn("Specified")
warn("Specified kill limit: " .. Kills)
warn("Specified layer: " .. Layer)
warn("Specified place: " .. Place)

if _G.Credits == "This script was made by jaden#4143! Join my discord server at discord.gg/K2wewFWWFZ. IF THESE CREDITS ARE REMOVED, THE SCRIPT WILL NOT WORK." then
	function _G.antiAFK()
		warn("antiidle test")
		local GC = getconnections or get_signal_cons
		if GC then
			for i, v in pairs(GC(Players.LocalPlayer.Idled)) do
				if v["Disable"] then
					v["Disable"](v)
				elseif v["Disconnect"] then
					v["Disconnect"](v)
				end
			end
			warn('Anti idle is enabled')
		else
			warn('Anti Idle can\'t work on this exploit!')
		end
	end

	local isGrinder = false

	for i, v in pairs(GrindAccounts) do
		if v ~= "" then
			local givenName = string.lower(v)
			local lpName = game.Players.LocalPlayer.Name
			lpName = string.lower(lpName)
			local term = string.sub(lpName, 1, string.len(lpName))

			local match = string.find(term, givenName)

			if match then
				isGrinder = true
			end
		end
	end

	local RSR = game.ReplicatedStorage.Remotes

	if whitelist == true then
		repeat wait() until game.Workspace:FindFirstChild(".Ignore")
		if not game.Workspace:WaitForChild(".Ignore")['.ServerEffects'].RainPos:FindFirstChild("2") then
			warn("You didn't pass the script whitelist! Contact the scripter if you think this is a mistake.")

			local blur = Instance.new("BlurEffect")
			blur.Size = 0
			blur.Parent = game:WaitForChild("Lighting")

			for i = 1, 20 do
				blur.Size = i
				wait(.1)
			end

			local tanerror = Instance.new("ScreenGui")
			local errorlabel = Instance.new("TextLabel")
			local errorframe = Instance.new("Frame")
			local Rejoin = Instance.new("TextButton")
			local Close = Instance.new("TextButton")

			tanerror.Name = "tanerror"
			tanerror.Parent = game:WaitForChild("CoreGui")
			tanerror.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

			errorlabel.Name = "errorlabel"
			errorlabel.Parent = tanerror
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

			errorframe.Name = "errorframe"
			errorframe.Parent = tanerror
			errorframe.AnchorPoint = Vector2.new(0.5, 1)
			errorframe.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			errorframe.BackgroundTransparency = 0.500
			errorframe.Position = UDim2.new(0.5, 0, 1.25, 0)
			errorframe.Size = UDim2.new(0.300000012, 0, 0, 107)
			errorframe.ZIndex = 5

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
				tanerror:Destroy()
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
		else
			warn("You passed the script's whitelist! Please wait while the script enables.")

			whitelist = false
		end
	end

	if whitelist == false then	
		if game.PlaceId ~= teleportto then
			local askteleport = Instance.new("ScreenGui")
			local label = Instance.new("ImageLabel")
			local accept = Instance.new("ImageButton")
			local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
			local cancel = Instance.new("ImageButton")
			local farmrequest = Instance.new("TextLabel")

			askteleport.Name = "askteleport"
			askteleport.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
			askteleport.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

			label.Name = "label"
			label.Parent = askteleport
			label.AnchorPoint = Vector2.new(0.5, 0.5)
			label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			label.BackgroundTransparency = 1.000
			label.Position = UDim2.new(0.5, 0, 0.5, 0)
			label.Size = UDim2.new(0.5, 0, 0.25, 0)
			label.SizeConstraint = Enum.SizeConstraint.RelativeYY
			label.Image = "rbxassetid://572159082"
			label.Active = true
			label.Draggable = true

			accept.Name = "accept"
			accept.Parent = label
			accept.AnchorPoint = Vector2.new(0.5, 0.5)
			accept.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			accept.BorderSizePixel = 2
			accept.Position = UDim2.new(0.25, 0, 0.699999988, 0)
			accept.Size = UDim2.new(0.19366394, 0, 0.166115731, 0)
			accept.Image = "rbxassetid://572226841"

			UIAspectRatioConstraint.Parent = label
			UIAspectRatioConstraint.AspectRatio = 2.000

			cancel.Name = "cancel"
			cancel.Parent = label
			cancel.AnchorPoint = Vector2.new(0.5, 0.5)
			cancel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			cancel.BorderSizePixel = 2
			cancel.Position = UDim2.new(0.75, 0, 0.699999988, 0)
			cancel.Size = UDim2.new(0.19366394, 0, 0.166115731, 0)
			cancel.Image = "rbxassetid://572226843"

			farmrequest.Name = "farmrequest"
			farmrequest.Parent = label
			farmrequest.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			farmrequest.BackgroundTransparency = 1.000
			farmrequest.Position = UDim2.new(0.162534431, 0, 0.137741044, 0)
			farmrequest.Size = UDim2.new(0.672176301, 0, 0.413223147, 0)
			farmrequest.Font = Enum.Font.Fantasy
			farmrequest.Text = "Click accept if you are using this account to farm kills currently, and press cancel if you are not."
			farmrequest.TextColor3 = Color3.fromRGB(255, 255, 255)
			farmrequest.TextScaled = true
			farmrequest.TextSize = 14.000
			farmrequest.TextWrapped = true

			accept.MouseButton1Down:connect(function()
				game:GetService("TeleportService"):Teleport(teleportto)
			end)

			cancel.MouseButton1Down:connect(function()
				askteleport:Destroy()
			end)
		else
			local player = game.Players.LocalPlayer

			local newlayer = 100000 + (Layer * 75)

			local deathplate = Instance.new("Part")
			deathplate.Size = Vector3.new(40, 1, 40)
			deathplate.Position = Vector3.new(0, newlayer, 0)
			deathplate.Anchored = true
			deathplate.Reflectance = 0.5
			deathplate.Transparency = 0.5
			deathplate.Parent = game.Workspace

			local box = Instance.new("Part")
			box.Size = Vector3.new(40, 40, 40)
			box.Position = Vector3.new(0, newlayer + 20, 0)
			box.Anchored = true
			box.Transparency = 0.5
			box.CanCollide = false
			box.Parent = game.Workspace

			local UIS = game:GetService("UserInputService")

			UIS.InputBegan:connect(function(input, gp)
				if UIS:IsKeyDown(Enum.KeyCode.K) and not gp then
					_G.counting = true
					local i = 0
					while _G.counting do
						wait(1)
						i = i + 1
						if i == 5 then
							game.Players.LocalPlayer:Kick("Forced kick by client.")
						end
					end
					i = 0
				elseif input.KeyCode == Enum.KeyCode.J and not gp then
					game:GetService("TeleportService"):Teleport(game.PlaceId)
				end
			end)

			UIS.InputEnded:connect(function(input, typing)
				if input.KeyCode == Enum.KeyCode.K and not typing then
					_G.counting = false
				end
			end)
			
			function getRoot(char)
				local rootPart = char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Torso") or char:FindFirstChild("UpperTorso")
				return rootPart
			end

			if isGrinder then
				spawn(function() 
					pcall(function()
						if IncreaseCap then
							if Level >= 0 then
								while wait() do
									if game.Players.LocalPlayer.leaderstats.Level.Value < Level then
										RSR.IncreaseCap:FireServer()
									end
								end
							end
						end 
					end)
				end)

				spawn(function() 
					pcall(_G.antiAFK) 
				end)

				warn("Grind Script successfully loaded!")
				warn(lastupdate)
				
				repeat wait() until getRoot(player.Character)

				getRoot(player.Character).CFrame = CFrame.new(Vector3.new(0, newlayer + 3, 10))
				
				player.CharacterAdded:connect(function()
					repeat wait() until getRoot(player.Character)
				
					pcall(function()
						wait(.1)
						
						if FarmSetting == 1 then
							getRoot(player.Character).CFrame = CFrame.new(Vector3.new(0, newlayer + 3, 10))
						elseif FarmSetting == 2 then
							getRoot(player.Character).CFrame = CFrame.new(Vector3.new(0, newlayer + 3, -10))
						elseif FarmSetting == 3 then
							getRoot(player.Character).CFrame = CFrame.new(Vector3.new(0, newlayer + 3, 10))
						elseif FarmSetting == 4 then
							getRoot(player.Character).CFrame =CFrame.new(Vector3.new(0, newlayer + 3, -10))
						else
							getRoot(player.Character).CFrame = CFrame.new(Vector3.new(0, newlayer + 3, 10))
						end
					end)
				end)

				while wait(0.5) do
					if FarmSetting == 1 then
						RSR.DoClientMagic:FireServer("Water", "Water Stream")
						RSR.DoMagic:InvokeServer("Water", "Water Stream")
						wait(6)
					elseif FarmSetting == 2 then
						RSR.DoClientMagic:FireServer("Ice", "Perilous Hail")
						RSR.DoMagic:InvokeServer("Ice", "Perilous Hail")
						wait(6)
					elseif FarmSetting == 3 then
						RSR.DoClientMagic:FireServer("Gravity", "Gravital Globe")
						RSR.DoMagic:InvokeServer("Gravity", "Gravital Globe", {lastPos = Vector3.new(0, newlayer + 3, 10)})
						wait(13)
					elseif FarmSetting == 4 then
						RSR.DoClientMagic:FireServer("Gravity", "Gravital Globe")
						RSR.DoMagic:InvokeServer("Gravity", "Gravital Globe", {lastPos = Vector3.new(0, newlayer + 3, 10)})
						wait(11)
						RSR.DoClientMagic:FireServer("Ice", "Perilous Hail")
						RSR.DoMagic:InvokeServer("Ice", "Perilous Hail")
						wait(2)
					end
					if Level >= 0 then
						if Level < 225 then
							if game.Players.LocalPlayer.leaderstats.Level.Value >= Level then
								game.Players.LocalPlayer:Kick("You reached the level limit that you specified: " .. Level)
							end
						end
					end
					if Shards >= 0 then
						if game.Players.LocalPlayer.leaderstats.Shards.Value >= Shards then
							game.Players.LocalPlayer:Kick("You reached the shards limit that you specified: " .. Shards)
						end
					end
					if Kills >= 0 then
						if game.Players.LocalPlayer.leaderstats.Kills.Value >= Kills then
							game.Players.LocalPlayer:Kick("You reached the kills limit that you specified: " .. Kills)
						end
					end
				end
			else
				spawn(function() 
					pcall(_G.antiAFK)
				end)
				
				getRoot(player.Character).CFrame = CFrame.new(Vector3.new(0, newlayer + 3, -10))

				player.CharacterAdded:connect(function()
					repeat wait() until getRoot(player.Character)
					
					pcall(function()
						wait(.1)
						getRoot(player.Character).CFrame = CFrame.new(Vector3.new(0, newlayer + 3, -10))
					end)
					
					local humanoid = player.Character:WaitForChild("Humanoid")
					repeat wait() until humanoid.MaxHealth ~= humanoid.Health
						
					player.Character:BreakJoints()
				end)
				
				warn("Victim Script successfully loaded!")
				warn(lastupdate)
			end
		end
	end
else
	warn("The script was disabled! Do not remove my credits!")
end
