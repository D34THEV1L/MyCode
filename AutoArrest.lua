Notification.Notify("AutoArrest, spyro was here", "Loading", "nule", Settings = Default
repeat wait() until game:IsLoaded() and game.Players.LocalPlayer.Character:FindFirstChild("FULLY_LOADED_CHAR")

local Notification = loadstring(game:HttpGet("https://api.irisapp.ca/Scripts/IrisBetterNotifications.lua"))()

TargetPiso_ = Instance.new("Part", game.Workspace)
TargetPiso_.Size = Vector3.new(40, 0.4, 40)
TargetPiso_.Position = Vector3.new(0, -8000, 0)
TargetPiso_.Anchored = true
TargetPiso_.BrickColor = BrickColor.new(255,0,0)
TargetPiso_.Name = 'TargetPiso'

-- Toggle key is Q
getgenv().Target = true
-- Configuration
getgenv().Key = Enum.KeyCode.Q
getgenv().Prediction = 0.130340
getgenv().ChatMode = false
getgenv().NotifMode = true
getgenv().PartMode = true
getgenv().AirshotFunccc = true
getgenv().Partz = "LowerTorso"
getgenv().AutoPrediction = false
--
_G.Types = {
	Ball = Enum.PartType.Ball,
	Block = Enum.PartType.Block, 
	Cylinder = Enum.PartType.Cylinder
}


function e(character)
	for i, v in pairs(character:GetChildren()) do
		if v:FindFirstChild("LocalScript") then
			v:Destroy()
		end
	end
end

for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
	if v:FindFirstChild("LocalScript") then
		v:Destroy()
	end
end

for i, v in next, game.Workspace:GetDescendants() do
	if v:IsA("Seat") then
		v:Destroy()
	end
end
--variables                 
local Tracer = Instance.new("Part", game.Workspace)
Tracer.Name = "gay" 
Tracer.Anchored = true      
Tracer.CanCollide = false
Tracer.Transparency = 0.8
Tracer.Parent = game.Workspace  
Tracer.Shape = _G.Types.Block
Tracer.Size = Vector3.new(14,14,14)
Tracer.Color = Color3.fromRGB(16,0,22)

--
local plr = game.Players.LocalPlayer
local mouse = plr:GetMouse()
local Runserv = game:GetService("RunService")

circle = Drawing.new("Circle")
circle.Color = Color3.fromRGB(255,255,255)
circle.Thickness = 0
circle.NumSides = 732
circle.Radius = 732
circle.Thickness = 0
circle.Transparency = 0.9
circle.Visible = false
circle.Filled = false


Runserv.RenderStepped:Connect(function()
	circle.Position = Vector2.new(mouse.X,mouse.Y+35)
end)

local guimain = Instance.new("Folder", game.CoreGui)
local CC = game:GetService"Workspace".CurrentCamera
local LocalMouse = game.Players.LocalPlayer:GetMouse()
local Locking = false


--
if getgenv().valiansh == true then
	game.StarterGui:SetCore("SendNotification", {
		Title    = " <3 Chloe <37316's lock",
		Text     = "loaded",
		Duration = 1

	})
	return
end

getgenv().valiansh = true

local UserInputService = game:GetService("UserInputService")



function ActivateLock(player_, status_)
	Locking = status_
	Plr = player_
end
Locking = false


--
if getgenv().PartMode then
	game:GetService"RunService".Stepped:connect(function()
		if Locking and Plr.Character and Plr.Character:FindFirstChild("LowerTorso") then
			Tracer.CFrame = CFrame.new(Plr.Character.LowerTorso.Position+(Plr.Character.LowerTorso.Velocity*Prediction))
		else
			Tracer.CFrame = CFrame.new(0, 9999, 0)

		end
	end)
end

function getRoot(char)
	local rootPart = char:FindFirstChild('HumanoidRootPart') or char:FindFirstChild('Torso') or char:FindFirstChild('UpperTorso')
	return rootPart
end

--
local rawmetatable = getrawmetatable(game)
local old = rawmetatable.__namecall
setreadonly(rawmetatable, false)
rawmetatable.__namecall = newcclosure(function(...)
	local args = {...}
	if Locking and getnamecallmethod() == "FireServer" and args[2] == "UpdateMousePos" then
		args[3] = Plr.Character[getgenv().Partz].Position+(Plr.Character[getgenv().Partz].Velocity*Prediction)
		return old(unpack(args))
	end
	return old(...)
end)


if getgenv().AirshotFunccc == true then
	pcall(function()
		if Plr.Character.Humanoid.Jump == true and Plr.Character.Humanoid.FloorMaterial == Enum.Material.Air then
			getgenv().Partz = "RightFoot"
		else
			Plr.Character:WaitForChild("Humanoid").StateChanged:Connect(function(old,new)
				if new == Enum.HumanoidStateType.Freefall then
					getgenv().Partz = "RightFoot"
				else
					getgenv().Partz = "LowerTorso"

				end

			end)

		end
	end)
end
---

game:GetService('RunService'):BindToRenderStep("SwagChecker", 0 , function()
	if getgenv().AutoPrediction == true then
		local pingvalue = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
		local split = string.split(pingvalue,'(')
		local ping = tonumber(split[1])
		if ping < 130 then
			getgenv().Prediction = 0.151
		elseif ping < 125 then
			getgenv().Prediction = 0.149
		elseif ping < 110 then
			getgenv().Prediction = 0.146
		elseif ping < 105 then
			getgenv().Prediction = 0.138
		elseif ping < 90 then
			getgenv().Prediction = 0.136
		elseif ping < 80 then
			getgenv().Prediction = 0.134
		elseif ping < 70 then
			getgenv().Prediction = 0.131
		elseif ping < 60 then
			getgenv().Prediction = 0.1229
		elseif ping < 50 then
			getgenv().Prediction = 0.1225
		elseif ping < 40 then
			getgenv().Prediction = 0.1256
		end
	end
end)





local CURRENT_cash = game:GetService("Players").LocalPlayer.DataFolder.Currency.Value


local CASHIERS = game:GetService("Workspace").Cashiers
local CASH = game.Workspace.Ignored.Drop

function ShopSearch(string_)

	for i,v in pairs(game:GetService("Workspace").Ignored.Shop:GetChildren()) do
		if (string.sub(string.lower(v.Name),1,string.len(string_))) == string.lower(string_) then
			return v
		end
	end
end


function GetShotgun()


	while game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("[Shotgun]") == nil and game.Players.LocalPlayer.Character:FindFirstChild('[Shotgun]') == nil do wait()
		pcall(function()
			local k = ShopSearch('[Shotgun]')
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
			if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - k.Head.Position).Magnitude <= 50 then
				wait(.5)
				fireclickdetector(k:FindFirstChild("ClickDetector"), 4)
				wait(.5)
			end	
		end)
	end
	return true
end


function reload(name, gun)
	local A_1 = "Reload"
	local A_2 = game:GetService("Workspace").Players[name][gun]
	local Event = game:GetService("ReplicatedStorage").MainEvent
	Event:FireServer(A_1, A_2)
end

function GetShotgunAmmo()


	pcall(function()
		local k = ShopSearch('20 [Shotgun Ammo]')
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
		if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - k.Head.Position).Magnitude <= 50 then
			wait(.3)
			fireclickdetector(k:FindFirstChild("ClickDetector"), 4)
			wait(.1)
		end	
	end)


end


function CheckShotgunAmmo()
	return game.Players.LocalPlayer.DataFolder.Inventory["[Shotgun]"].Value
end


function serverhop()
queue_on_teleport(loadstring(game:HttpGet)("https://raw.githubusercontent.com/D34THEV1L/MyCode/main/AutoArrest.lua"))
	if not IrisNotificationMrJack then loadstring(game:HttpGet"https://raw.githubusercontent.com/thedragonslayer2/hey/main/Misc./iris%20notification%20function")()elseif IrisNotificationUserMrJack then IrisNotificationUserMrJack.ClearAllNotifications()end;warn"Looking For A Server"IrisNotificationMrJack(1,"Notification","Looking For A Server",2)local a,b,c="https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Desc&limit=100",{game.JobId}pcall(function()if not isfolder"MrJack Settings"then makefolder"MrJack Settings"end;b=game:GetService"HttpService":JSONDecode(readfile"MrJack Settings/ServerHop.json")end)local function d()pcall(function()writefile("MrJack Settings/ServerHop.json",game:GetService"HttpService":JSONEncode(b))end)end;local function e()while task.wait()do local f=game:GetService"HttpService":JSONDecode(game:HttpGetAsync(a))local g=f.nextPageCursor;for h,i in next,f.data do if type(i)=="table"and i.id and tonumber(i.playing)and tonumber(i.maxPlayers)and tonumber(i.maxPlayers)>tonumber(i.playing)and i.id~=game.JobId and not table.find(b,i.id)then c=i.id;warn("Server Found "..i.id)IrisNotificationMrJack(1,"Notification","Teleporting To Server\n"..i.id,5)table.insert(b,i.id)d()game:GetService"TeleportService":TeleportToPlaceInstance(game.PlaceId,i.id)wait(5)end end;if g then local j=a:find"&cursor="if j then a=a:gsub(a:sub(j),"")end;a=a.."&cursor="..g else break end end end;e()if c==nil then b={game.JobId}d()e()end;if c==nil then warn"Server Hop Failed"IrisNotificationMrJack(1,"Notification","No Server Found",2)end
end

getgenv().rejoin = game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(child)
	if child.Name == 'ErrorPrompt' and child:FindFirstChild('MessageArea') and child.MessageArea:FindFirstChild("ErrorFrame") then
		serverhop()
	end
end)

spawn(function()
	wait(getgenv().Time)
	serverhop()
end)

function GetPlayerWanted()
	target = nil
	local highest = 0
	for i, v in pairs(game.Players:GetPlayers()) do
		if v:FindFirstChild("DataFolder") and v.Character:FindFirstChild("FULLY_LOADED_CHAR") and v.Character.BodyEffects:FindFirstChild("Defense") and tonumber(v.DataFolder.Information.Wanted.Value) > 500 and tonumber(v.DataFolder.Information.Wanted.Value) >= highest and v.Character.BodyEffects:FindFirstChild("Armor") then
			target = v 
			highest = tonumber(v.DataFolder.Information.Wanted.Value)
		end
	end

	if not target then
		serverhop()
		return false
	end

	return target

end
print("se ejecuto")

local Plr__ = game.Players.LocalPlayer


local a = false
spawn(function()
	while true do task.wait() print(a)
		pcall(function()
		if a == false then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(TargetPiso_.Position + Vector3.new(0,3,0))
		elseif a == true then
			Plr__.Character.HumanoidRootPart.CFrame = target.Character.UpperTorso.CFrame
				
			elseif a == "nada" then
				
			end
		end)	
		end
	
end)

while wait() do
	local succes, err = pcall(function()
		repeat wait()
			for _,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
				if v:IsA("Tool") then v.Parent = game.Players.LocalPlayer.Backpack end
			end
			local PlayerTarget = GetPlayerWanted()
			repeat task.wait()
				ActivateLock(game.Players:FindFirstChild(PlayerTarget.Name), true)

				if not game.Players.LocalPlayer.Character:FindFirstChild("[Shotgun]") and not game.Players.LocalPlayer.Backpack:FindFirstChild("[Shotgun]") then
					a = "nada"
					GetShotgun()	

				elseif game.Players.LocalPlayer.Backpack:FindFirstChild("[Shotgun]") then
					game.Players.LocalPlayer.Backpack:FindFirstChild("[Shotgun]").Parent = game.Players.LocalPlayer.Character


				elseif game.Players.LocalPlayer.Character:FindFirstChild("[Shotgun]") or game.Players.LocalPlayer.Backpack:FindFirstChild("[Shotgub]") then
					if tonumber(CheckShotgunAmmo()) < 15 then
						a = "nada"
						for _, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
							if v:IsA("Tool") then v.Parent = game.Players.LocalPlayer.Backpack end
						end
						GetShotgunAmmo()
						wait(1)
					end	

				end

				a = false
				
				TargetPiso_.CFrame = CFrame.new(PlayerTarget.Character.HumanoidRootPart.Position + Vector3.new(0, -11 ,0))
				print("Funcionando")
				local r15 = game.Players.LocalPlayer.Character

				r15.Head.CanCollide = false
				r15.UpperTorso.CanCollide = false
				r15.LowerTorso.CanCollide = false
				r15.LeftUpperArm.CanCollide = false
				r15.LeftLowerArm.CanCollide = false
				r15.RightUpperArm.CanCollide = false
				r15.RightLowerArm.CanCollide = false
				r15.LeftUpperLeg.CanCollide = false
				r15.LeftLowerLeg.CanCollide = false
				r15.RightUpperLeg.CanCollide = false
				r15.RightLowerLeg.CanCollide = false
				r15.HumanoidRootPart.CanCollide = false


				if not game.Players.LocalPlayer.Character:FindFirstChild("[Shotgun]") then 
					local a = game.Players.LocalPlayer.Backpack["[Shotgun]"]
					a.Parent = game.Players.LocalPlayer.Character end
				reload(game.Players.LocalPlayer.Name, "[Shotgun]")
				for _, v in pairs(game:GetService("Players").LocalPlayer.Character:GetChildren()) do
					if v:isA("Tool") then
						v.GripPos = Vector3.new(-3,-10,-3)
					end
				end
				Plr__.Character["[Shotgun]"]:Activate()

			until not target or target.Character.BodyEffects["K.O"].Value == true or game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.V)
			for _,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
				if v:IsA("Tool") then v.Parent = game.Players.LocalPlayer.Backpack end
			end
			repeat wait()
				if Plr__.Character.Humanoid.Health > 80 then
					pcall(function()Plr__.Character.Humanoid:EquipTool(Plr__.Backpack.Cuff)end)
					pcall(function()
						a = true
						print("arrestando")
						Plr__.Character.Cuff:Activate()
						wait(0.001)
						Plr__.Character.Cuff:Deactivate()

					end)
				end
			until target.Character.BodyEffects["K.O"].Value == false or game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.V)
		until tonumber(target.DataFolder.Information.Wanted.Value) == 0 or game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.V)
	end)

	if not succes then print(err) end
end
