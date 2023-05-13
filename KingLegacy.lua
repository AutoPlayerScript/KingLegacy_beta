print("1")
if not game:IsLoaded() then
	game.Loaded:Wait()
end
print("2")
local rawlinkcallback = "https://raw.githubusercontent.com/AutoPlayerScript/AnimeDimension/main/ADS.lua"
local rawlinkGUI = "https://raw.githubusercontent.com/AutoPlayerScript/AnimeDimension/main/LibGui.lua"
local linkdiscord ="https://discord.gg/QJBEq64dc3"
local linkkey24h ="https://work.ink/4zX/GetKey"
local SCRIPT1 ="I'm too happy. It's coming soon"
local SCRIPT2 ="I'm too happy. It's coming soon"
local SCRIPT3 ="I'm too happy. It's coming soon"
local linkDONATE="https://work.ink/4zX/DONATEME"
local adminCode = "eventfree0user"



_G.Settings = {
	autofarm = false,
	farmselect = false,
	monster_selected ="No chosen",
	NormalAttack=false,
	super_Attack=false,
	SWZSkill=false,
	SWXSkill=false,

	DFZSkill=false,
	DFXSkill=false,
	DFCSkill=false,
	DFVSkill=false,
	DFBSkill=false,
	DFESkill=false,

	FSZSkill=false,
	FSXSkill=false,
	FSCSkill=false,
	FSVSkill=false,
	FSBSkill=false,

	TeleON = false,
	Teleselect = "Teleport Behind",

	Haki = true,
	Ken = false,
	equipauto = "Sword",

	khoangcach = 10,
	target = false,
	
	quest = "No Quest"




}

local a = "Auto Player"
local b = "King Legacy.lua"
local gamefolder = "King Legacy"
local key = "Key.txt"

local ModeAuto = {
}
print("load rawlinkGUI")
local u = loadstring(game:HttpGet(rawlinkGUI))()
function saveSettings()
	local c = game:GetService("HttpService")
	local d = c:JSONEncode(_G.Settings)
	if writefile then
		if isfolder(a) then
			if not isfolder(a .. "\\" .. gamefolder) then
				makefolder(a .. "\\" .. gamefolder)
			end
			writefile(a .. "\\" .. gamefolder .. "\\" .. b, d)
		else
			makefolder(a)
			if not isfolder(a .. "\\" .. gamefolder) then
				makefolder(a .. "\\" .. gamefolder)
			end
			writefile(a .. "\\" .. gamefolder .. "\\" .. b, d)
		end
	end
end
print("4")
function loadSettings()
	local c = game:GetService("HttpService")
	local fullPath = a .. "\\" .. gamefolder .. "\\" .. b
	if isfile(fullPath) then
		return c:JSONDecode(readfile(fullPath))
	end
	return nil
end
_G.Settings = loadSettings() or _G.Settings
print("5")
--KEYCHECK - vô dungj quas 
function keyCheck()
	-- Get the current player's username and IP address
	local player = game.Players.LocalPlayer
	local username = player.Name

	local response = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://api.ipify.org?format=json"))
	local ip = response["ip"]

	-- Create the contents of the Key.txt file
	local keyFileContents = os.time() .. "\n" .. username .. "\n" .. ip

	-- Write the contents to the file
	local gamefolder = "ADS"
	local key = "Key.txt"
	local keyPath = a .. "\\" .. gamefolder .. "\\" .. key

	if not isfolder(a .. "\\" .. gamefolder) then
		makefolder(a .. "\\" .. gamefolder)
	end

	local success, error = pcall(writefile, keyPath, keyFileContents)
	if not success then
		warn("Failed to write to file: " .. error)
	end
end
print("6")
--keyCheck() -- Tao file key sieu nang


print("7")

function keyValid(inputKey)
	local timeLimit = 36000 -- thời hạn của key tính bằng giây (10 giờ)

	-- Kiểm tra ADMIN code
	if inputKey == adminCode then
		return true
	end

	-- Kiểm tra độ dài key
	if type(inputKey) ~= "string" or #inputKey ~= 13 or not string.match(inputKey, "^[0-9a-fA-F]+$") then
		return false
	end

	-- Tách giá trị hex cần thiết
	local hexString1 = inputKey:sub(2, 6) -- lấy từ vị trí thứ 2 đến vị trí thứ 6
	local hexString2 = inputKey:sub(8, 12) -- lấy từ vị trí thứ 8 đến vị trí thứ 12

	-- Ghép các chuỗi hex cần thiết và đảo ngược thứ tự các ký tự
	local hexString = hexString1 .. hexString2
	-- Đảo ngược thứ tự các ký tự trong chuỗi hex
	hexString = hexString:reverse()

	-- Xóa bỏ các ký tự 0 ở đầu chuỗi
	hexString = hexString:gsub("^0+", "")

	-- Chuyển đổi giá trị hex sang decimal
	local decValue = tonumber(hexString, 16)


	--[[-- Đọc thời gian từ file Key.txt
	local file = io.open(a .. "\\" .. key, "r")
	if not file then
		return false
	end

	local fileTimeString = file:read("*line")
	file:close()

	if not fileTimeString then
		return false
	end

	-- Chuyển đổi thời gian từ chuỗi sang số
	local fileTime = tonumber(fileTimeString)
	print(fileTime)
	if fileTime == nil then
		return false
	end
		--]]
	local fileTime = os.time()
	print(fileTime)
	-- So sánh thời gian với thời gian trong file Key.txt
	if (decValue - fileTime) > timeLimit or (decValue - fileTime) < (0-timeLimit) then
		return false
	end

	-- Key hợp lệ
	return true
end




-- Lưu giá trị checkKey ban đầu
local checkKey = keyValid(_G.Settings.inputKey)
print("8")
--[[ Kiểm tra giá trị của checkKey
if not game:IsLoaded() then
	game.Loaded:Wait()
end
--]]
-- Kiểm tra giá trị của checkKey lần thứ hai
if not checkKey then
	checkKey = keyValid(_G.Settings.inputKey)
end
-- Tạo UI 
print("9")
local e = game:GetService("ReplicatedStorage")
local f = game:GetService("VirtualInputManager")
local g = game:GetService("Players")
local h = game:GetService("VirtualUser")
local i = game:GetService("TweenService")
local j = g.LocalPlayer
--local u = loadstring(game:HttpGet(rawlinkGUI))()
--hide/show GUI
function HideGui()
	local k = game.CoreGui:FindFirstChild("Autoplayer")
	local l
	for m, n in pairs(k:GetChildren()) do
		if m == 2 then
			l = n
		end
	end
	if k.Enabled then
		l:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .6, true)
		repeat
			task.wait()
		until l.Size.Y.Offset < 1
		k.Enabled = false
	else
		l:TweenSize(UDim2.new(0, 615, 0, 344), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .6, true)
		repeat
			task.wait()
		until l.Size.Y.Offset > 1
		k.Enabled = true
	end
end
spawn(
	function()
		j = game.Players.LocalPlayer
		Mouse = j:GetMouse()
		Mouse.KeyDown:connect(
			function(o)
				o = o:lower()
				if o == _G.Settings.toggleguikey then
					task.spawn(HideGui)
				end
			end
		)
	end
)
--Anti AFK
j.Idled:Connect(
	function()
		h:ClickButton2(Vector2.new())
	end
)
print("10")
if true then --or checkKey
	print("1.0")
	-- Tạo UI nếu có Key đúng
	local v = u:MakeWindow({Name = "     AutoPlayer  - King Legacy BETA 1", HidePremium = true})
	print("1.1")
	--local w = v:MakeTab({Name = "Auto Mode", PremiumOnly = false})
	local x = v:MakeTab({Name = "Manual Mode", PremiumOnly = false})
	print("1.2")
	local y = v:MakeTab({Name = "Skill & Tele", PremiumOnly = false})
	print("1.3")
	local z = v:MakeTab({Name = "Equip Auto", PremiumOnly = false})
	print("1.4")
	local A = v:MakeTab({Name = "Misc", PremiumOnly = false})
	--local B = v:MakeTab({Name = "Misc & Notification", PremiumOnly = false})
	local C = v:MakeTab({Name = "☣AutoPlayer☣", PremiumOnly = false})
	print("Load GUI OK ")
	--AutoMode


	-------------------Manual Mode-----------------------------------
	--local enemy = _G.Settings.monster_selected or nil
	local Monster = {
		"No chosen",
		"Soldier [Lv. 1]",
		"Clown Pirate [Lv. 10]",
		"Shadow Master [Lv. 1600]",
		"New World Pirate [Lv. 1700]",
		"Rear Admiral [Lv. 1800]",
		"True Karate Fishman [Lv. 1850]",
		"-----Sea 2-------",
		"Powerful Beast Pirate [Lv. 2450]",
		"Kitsune Samurai [Lv. 2650]",
		--"Skull Pirate [Lv. 3050]",
		"Elite Skeleton [Lv. 3100]",
		"Desert Thief [Lv. 3125]",
		"Anubis [Lv. 3150]",
		--"Pharaoh [Lv. 3175]",
		"Flame User [Lv. 3200]",
		"Prince Aria[Lv. 3700]",
		"Floffy [Lv. 3775]",
		"Dead Troupe [Lv. 3800]",
		"WaitUpdate More Monster",
		"------If boss Error------",
		"King Samurai [Lv. 3500]",
		"Big Mother [Lv. 7500]",
		"Dragon [Lv. 7500]"
	}
	local Tele ={
		"Teleport Behind",
		"Teleport Top(Wait Update)",
		"OFF"		
	}
	------------------------------------------------------------------------------


	local function teleportToTarget(targetPosition)
		local character = game.Players.LocalPlayer.Character
		local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
		humanoidRootPart.CFrame = targetPosition
	end

	local function filterMonstersByName(name)
		local monsterFolders = {game:GetService("Workspace").Monster.Mon, game:GetService("Workspace").Monster.Boss}
		local filteredMonsters = {}

		for _, folder in ipairs(monsterFolders) do
			for _, monster in ipairs(folder:GetChildren()) do
				if monster.Name == name and monster:IsA("Model") and monster:FindFirstChild("Humanoid") and monster.Humanoid.Health > 0 then
					table.insert(filteredMonsters, monster)
				end
			end
		end

		return filteredMonsters
	end
	
	-------------------Vitri Spawn khi ko co quai--------------

	local no_monster
	local questLvl
	local function updateNoMonster()
		print("_G.Settings.Teleselect".. _G.Settings.Teleselect)
		local teleselectLevel = tonumber(_G.Settings.monster_selected:match("%d+")) -- Lấy số Level từ chuỗi monster_selected
		print("teleselectLevel".. (teleselectLevel or ""))
		local questLevelPartName = "QuestLvl" .. (teleselectLevel or "") -- Tạo chuỗi tên QuestLvl tương ứng

		if _G.Settings.monster_selected == "Desert Thief [Lv. 3125]" then
			no_monster = game.Workspace.AllNPC.QuestLvl3100.CFrame + Vector3.new(0, 5, 0) -- Vị trí spawn với độ cao +5
			questLvl ="QuestLvl3100"
		elseif _G.Settings.monster_selected == "Anubis [Lv. 3150]" then
			no_monster = game.Workspace.AllNPC.QuestLvl3125.CFrame + Vector3.new(0, 5, 0) -- Vị trí spawn với độ cao +5
			questLvl ="QuestLvl3125"
		elseif _G.Settings.monster_selected == "Pharaoh [Lv. 3175]" then
			no_monster = game.Workspace.AllNPC.QuestLvl3150.CFrame + Vector3.new(0, 5, 0) -- Vị trí spawn với độ cao +5
			questLvl ="QuestLvl310"
		elseif _G.Settings.monster_selected == "Flame User [Lv. 3200]" then
			no_monster = game.Workspace.AllNPC.QuestLvl3175.CFrame + Vector3.new(0, 5, 0) -- Vị trí spawn với độ cao +5
			questLvl ="QuestLvl3175"
		elseif _G.Settings.monster_selected == "Skull Pirate [Lv. 3050]" then
			no_monster = game.Workspace.AllNPC.QuestLvl3025.CFrame + Vector3.new(0, 5, 0) -- Vị trí spawn với độ cao +5
			questLvl ="QuestLvl3"
		elseif _G.Settings.monster_selected == "Elite Skeleton [Lv. 3100]" then
			no_monster = game.Workspace.AllNPC.QuestLvl3075.CFrame + Vector3.new(0, 5, 0) -- Vị trí spawn với độ cao +5
			questLvl ="QuestLvl3075"
		elseif _G.Settings.monster_selected == "DarkBeard [Lv. 3475]" then --summon boss
			no_monster = game.Workspace.AllNPC.QuestLvl3475.CFrame + Vector3.new(0, 5, 0) -- Vị trí spawn với độ cao +5
			questLvl ="QuestLvl3475"
		elseif _G.Settings.monster_selected == "Light [Lv. 3575]" then
			no_monster = game.Workspace.AllNPC.QuestLvl3575.CFrame + Vector3.new(0, 5, 0) -- Vị trí spawn với độ cao +5
			questLvl ="QuestLvl3575"

		elseif _G.Settings.monster_selected == "Ice King [Lv. 3350]" then
			no_monster = game.Workspace.AllNPC.QuestLvl3350.CFrame + Vector3.new(0, 5, 0) -- Vị trí spawn với độ cao +5
			questLvl ="QuestLvl3350"

		elseif _G.Settings.monster_selected == "The Crimson [Lv. 3375]" then
			no_monster = game.Workspace.AllNPC.QuestLvl3375.CFrame + Vector3.new(0, 5, 0) -- Vị trí spawn với độ cao +5
			questLvl ="QuestLvl3375"
		elseif _G.Settings.monster_selected == "King Samurai [Lv. 3500]" then
			no_monster = game.Workspace.Island["A - Japan"]["King Samurai Spawn"].CFrame + Vector3.new(0, 5, 0) -- Vị trí spawn với độ cao +5
			

		else			------------------------------------Neu ko phai truong hop dac biet ke tren thi Kiem tra so trong ten roi doi chieu voi part tele. 			-- Kiểm tra và gán vị trí no_monster dựa trên tên QuestLvl
			print("monster ko dac biet")
			if game.Workspace.AllNPC:FindFirstChild(questLevelPartName) then
				no_monster = game.Workspace.AllNPC[questLevelPartName].CFrame + Vector3.new(0, 0, 5) -- Vị trí spawn với độ cao +5
				questLvl ="QuestLvl"..questLevelPartName
			else
				no_monster = nil
				questLvl = nil
			end
		end


	end
	print("monster update")
	-- Cập nhật giá trị của no_monster khi monster_selected thay đổi
	updateNoMonster()

	--================================================================

	---------------------------------------------------------------------

			------------=========================test
	x:AddDropdown(
		{Name = " ⭕ Choose Monster", Default = _G.Settings.monster_selected, Options = Monster, Callback = function(H)
			_G.Settings.monster_selected = H
			saveSettings()
		end}
	)
	x:AddDropdown(
		{Name = " ⭕ Choose Tele Mode", Default = _G.Settings.Teleselect, Options = Tele, Callback = function(H)
			_G.Settings.Teleselect = H
			saveSettings()
		end}
	)
	x:AddDropdown(
		{Name = " ⭕ Quest or No ?!?", Default = _G.Settings.quest, Options = {"No Quest","Quest"}, Callback = function(H)
			_G.Settings.quest = H
			saveSettings()
			if _G.Settings.quest == "Quest" then
				task.spawn(function()
					while _G.Settings.TeleON and _G.Settings.quest == "Quest" do
						if no_monster ~= nil and true then
							-- Lấy tên đầy đủ của QuestLvlxxxx từ no_monster

							if questLvl ~= nil then
								-- Lấy đối tượng QuestLvlxxxx từ workspace.AllNPC
								local questNPC = workspace.AllNPC:WaitForChild(questLvl)
								--print("questLvl "..questLvl)
								-- Gọi nhiệm vụ
								local args = {
									[1] = questNPC
								}
								game:GetService("ReplicatedStorage").Remotes.Functions:WaitForChild("CheckQuest"):InvokeServer(unpack(args))
								-- Bấm Accept-------------------------
								-- Lấy Gui
								-- Kiểm tra sự tồn tại của acceptButton
								local acceptButtonExists, acceptButton = pcall(function()
									return game.Players.LocalPlayer.PlayerGui[questLvl].Dialogue.Accept
								end)

								if acceptButtonExists then
									-- Truy cập acceptButton thành công
									wait(1)
									local function clickImageButton(button)
										local position = button.AbsolutePosition
										local size = button.AbsoluteSize

										-- Calculate the click position relative to the acceptButton
										local clickX = position.X + size.X/2
										local clickY = position.Y + size.Y/2

										-- Move the mouse cursor to the click position
										mousemoveabs(clickX, clickY)

										-- Simulate left mouse button click
										mouse1click()
										print("Clicked nut Accept")
									end

									clickImageButton(acceptButton)
									wait(0.5)
									clickImageButton(acceptButton)
									wait(5)
									-- OK CODE
								else
									acceptButton = nil
								end

							else
								wait(3)
							end
						end
					end -- end while

				end)
			end
		end}
	)

	--=============================================================================================--=============================================================================================
	
	local function teleportIfNoMonster()
		if no_monster ~= nil then
			teleportToTarget(no_monster)
		end
	end
	local monsterSelected
	local teleRunning = false -- Biến flag để kiểm tra trạng thái của vòng lặp TeleON
print("tạo nút Farm selected")
	x:AddToggle({
		Name = "Farm Selected",
		Default = _G.Settings.TeleON,
		Callback = function(H)
			_G.Settings.TeleON = H
			saveSettings()

			if _G.Settings.TeleON then
				task.spawn(function()
					while _G.Settings.TeleON do
						teleRunning = true

						if _G.Settings.Teleselect == Tele[1] then
							pcall(function()
								repeat
									local monsters = filterMonstersByName(_G.Settings.monster_selected)
											
									_G.Settings.target = false
									--print("Ko đánh....1 ")
											--saveSettings()
									
									if #monsters <= 0 then
										teleportIfNoMonster()
										_G.Settings.target = false
										--print("Ko đánh....do ko co muc tieu ")
										saveSettings()
										
										if _G.Settings.monster_selected ~= monsterSelected then
											monsterSelected = _G.Settings.monster_selected
											updateNoMonster()
											teleportIfNoMonster()
											
										end
										wait(3)
									else
										local targetMonster = monsters[1]
										local targetPosition = targetMonster.HumanoidRootPart.CFrame - targetMonster.HumanoidRootPart.CFrame.lookVector * 5
										teleportToTarget(targetPosition)

										-- Save monster if attacked
										_G.Settings.target = true
										--print("ATTACKKKKKKKKKKKKKKKKKKKKKK")
										--saveSettings()
										

										wait(0.01)
									end
								until not _G.Settings.TeleON or _G.Settings.Teleselect ~= Tele[1]

								teleRunning = false
							end)

						elseif _G.Settings.Teleselect == Tele[2] then
							-- Xử lý Tele 2
						elseif _G.Settings.Teleselect == Tele[3] then
							-- Xử lý Tele 3
						end
						wait(0.01)
					end

					teleRunning = false
				end)
			else
				teleRunning = false
			end
		end
	})

	
	y:AddLabel("Skill")
	y:AddToggle({
		Name = "Normal Attack (click)",
		Default = _G.Settings.NormalAttack,
		Callback = function(H)
			_G.Settings.NormalAttack = H
			saveSettings()

			if _G.Settings.NormalAttack then
				task.spawn(function()
					local LocalPlayer = game.Players.LocalPlayer
					local swordName = LocalPlayer.PlayerStats.SwordName.Value
					local meleeName = LocalPlayer.PlayerStats.FightingStyle.Value
					local devilFName = LocalPlayer.PlayerStats.DFName.Value

					local swName = "SW_" .. swordName .. "_M1"
					local fsName = "FS_" .. meleeName .. "_M1"
					local dfName = "DF_" .. devilFName .. "_M1"
					local character = LocalPlayer.Character
					local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")

					while _G.Settings.NormalAttack do
						if _G.Settings.target and humanoidRootPart then
							local targetCFrame = humanoidRootPart.CFrame * CFrame.new(0, 0, -10)
							--sw
							local args = {
								[1] = swName,
								[2] = {
									["MouseHit"] = targetCFrame,
									["Type"] = "Down"
								},
							}

							game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Functions"):WaitForChild("SkillAction"):InvokeServer(unpack(args))
							if _G.Settings.super_Attack then 
								--melee
								local args = {
									[1] = fsName
								}

								game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Functions"):WaitForChild("SkillAction"):InvokeServer(unpack(args))
								--df
								local args = {
									[1] = dfName,
									[2] = {
										["MouseHit"] = targetCFrame,
										["Type"] = "Down"
									},
								}

								game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Functions"):WaitForChild("SkillAction"):InvokeServer(unpack(args))
							end
						end
						wait() -- Đợi một khoảng thời gian trước khi gọi lại hàm
					end
				end)
			else
				--do nothing
			end
		end

	})


	y:AddToggle({
		Name = "Extra 3 in 1 Punch",
		Default = _G.Settings.super_Attack,
		Callback = function(H)
			_G.Settings.super_Attack = H
			saveSettings()
		end
	})


	local function sendSkillRequest(args)
		game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Functions"):WaitForChild("SkillAction"):InvokeServer(unpack(args))
	end

	local function sendSkillDown(weapon, button)
		local player = game.Players.LocalPlayer
		local character = player.Character or player.CharacterAdded:Wait()
		local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
		local direction = humanoidRootPart.CFrame.LookVector.Unit * 10
		local weaponName = nil

		if weapon == "SW" then
			weaponName = player.PlayerStats.SwordName.Value
		elseif weapon == "DF" then
			weaponName = player.PlayerStats.DFName.Value
		elseif weapon == "FS" then
			weaponName = player.PlayerStats.FightingStyle.Value
		end

		local swZ = weapon .. "_" .. weaponName .. "_" .. button

		local args = {
			[1] = swZ,
			[2] = {
				["MouseHit"] = humanoidRootPart.CFrame + direction,
				["Type"] = "Down"
			}
		}

		sendSkillRequest(args)
	end

	local function sendSkillUp(weapon, button)
		local player = game.Players.LocalPlayer
		local character = player.Character or player.CharacterAdded:Wait()
		local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
		local direction = humanoidRootPart.CFrame.LookVector.Unit * 10
		local weaponName = nil

		if weapon == "SW" then
			weaponName = player.PlayerStats.SwordName.Value
		elseif weapon == "DF" then
			weaponName = player.PlayerStats.DFName.Value
		elseif weapon == "FS" then
			weaponName = player.PlayerStats.FightingStyle.Value
		end

		local swZ = weapon .. "_" .. weaponName .. "_" .. button

		local args = {
			[1] = swZ,
			[2] = {
				["MouseHit"] = humanoidRootPart.CFrame + direction,
				["Type"] = "Up"
			}
		}

		sendSkillRequest(args)
	end
	y:AddLabel("SWORD - SKILL")
	local function createSwordSkillToggle(skillKey)
		y:AddToggle({
			Name = "Sword Skill " .. skillKey,
			Default = _G.Settings["SW" .. skillKey .. "Skill"],
			Callback = function(H)
				_G.Settings["SW" .. skillKey .. "Skill"] = H
				saveSettings()
				if H then
					task.spawn(function()
						while _G.Settings["SW" .. skillKey .. "Skill"] do
							if _G.Settings.target then
								task.spawn(function()
									sendSkillDown("SW", skillKey)
									task.wait(0.1)
									sendSkillUp("SW", skillKey)
									task.wait(0.1)
								end)
							end
							task.wait(math.random(0.5, 3))
						end
					end)
				end
			end
		})
	end

	local function createMeleeSkillToggle(skillKey)
		y:AddToggle({
			Name = "Melee Skill " .. skillKey,
			Default = _G.Settings["FS" .. skillKey .. "Skill"],
			Callback = function(H)
				_G.Settings["FS" .. skillKey .. "Skill"] = H
				saveSettings()
				if H then
					task.spawn(function()
						while _G.Settings["FS" .. skillKey .. "Skill"] do
							if _G.Settings.target then
								task.spawn(function()
									sendSkillDown("FS", skillKey)
									task.wait(0.1)
									sendSkillUp("FS", skillKey)
									task.wait(0.1)
								end)
							end
							task.wait(math.random(0.5, 3))
						end
					end)
				end
			end
		})
	end

	local function createDevilFruitSkillToggle(skillKey)
		y:AddToggle({
			Name = "DF Skill " .. skillKey,
			Default = _G.Settings["DF" .. skillKey .. "Skill"],
			Callback = function(H)
				_G.Settings["DF" .. skillKey .. "Skill"] = H
				saveSettings()
				if H then
					task.spawn(function()
						while _G.Settings["DF" .. skillKey .. "Skill"] do
							if _G.Settings.target then
								task.spawn(function()
									sendSkillDown("DF", skillKey)
									task.wait(0.1)
									sendSkillUp("DF", skillKey)
									task.wait(0.1)
								end)
							end
							task.wait(math.random(0.5, 3))
						end
					end)
				end
			end
		})
	end

	-- Gọi các hàm tạo skill toggle cho từng kỹ năng
	createSwordSkillToggle("Z")
	createSwordSkillToggle("X")
	y:AddLabel("-----------Fighting Style-----------")
	createMeleeSkillToggle("Z")
	createMeleeSkillToggle("X")
	createMeleeSkillToggle("C")
	createMeleeSkillToggle("V")
	y:AddLabel("-----DEVIL FRUIT------")
	createDevilFruitSkillToggle("Z")
	createDevilFruitSkillToggle("X")
	createDevilFruitSkillToggle("C")
	createDevilFruitSkillToggle("V")
	createDevilFruitSkillToggle("B")
	createDevilFruitSkillToggle("E")


	---------------------------Equip On
	z:AddToggle({
		Name = "Auto HAKI",
		Default = _G.Settings.Haki,
		Callback = function(H)
			_G.Settings.Haki = H
			saveSettings()

			task.spawn(function()
				while _G.Settings.Haki do
					task.wait(4)
					local playerName = game:GetService("Players").LocalPlayer.Name
					local hakiValue = Workspace.PlayerCharacters:WaitForChild(playerName).Haki.Value
					if hakiValue == 0 then
						game:GetService("Players").LocalPlayer.Character.Services.Client.Armament:FireServer()
					end
				end

				local playerName = game:GetService("Players").LocalPlayer.Name
				local hakiValue = Workspace.PlayerCharacters:WaitForChild(playerName).Haki.Value

				if hakiValue == 1 and _G.Settings.Haki == false then
					game:GetService("Players").LocalPlayer.Character.Services.Client.Armament:FireServer()
				end
			end)
		end
	})


	z:AddToggle({
		Name = "Auto Ken",
		Default = _G.Settings.Ken,
		Callback = function(H)
			_G.Settings.Ken = H
			saveSettings()

			task.spawn(function()
				while _G.Settings.Ken do
					task.wait(2)
					local playerName = game:GetService("Players").LocalPlayer.Name
					local player = game:GetService("Players").LocalPlayer
					if player.Character then
						local kenHakiValue = Workspace.PlayerCharacters:WaitForChild(playerName).KenHaki.Value
						local kenOpenValue = Workspace.PlayerCharacters:WaitForChild(playerName).KenOpen.Value

						if kenHakiValue >= 7 and not kenOpenValue then
							game:GetService("Players").LocalPlayer.Character.Services.Client.KenEvent:InvokeServer()
							print("DA Bat Ken ")
						end
					end
				end
			end)
		end
	})


--[[	z:AddDropdown({
		Name = "Equip Auto Weapon",
		Default = _G.Settings.equipauto,
		Options = {"Sword", "Fruit Power", "Combat"},
		Callback = function(H)
			_G.Settings.equipauto = H
			saveSettings()
			task.spawn(function()
				task.wait(4)
				local hotbar = game.CoreGui.RobloxGui.Backpack.Hotbar
				local children = hotbar:GetChildren()
				print("Chuẩn bị chọn vũ khí-----------------------------------------------------")
				for _, child in ipairs(children) do
					if child:IsA("TextButton") and child.ToolTip.Text == _G.Settings.equipauto and not child:FindFirstChild("Equipped") then
						child.Callback:Fire() -- Gọi hàm Callback của TextButton
						print("Đã chọn vũ khí---------------")
						break
					end
					print("Không tìm thấy vũ khí phù hợp ------------------------------------------------")
				end
			end)
		end
	})


]]

	A:AddButton({
		Name = "Change Sea 1<=>2",
		Icon = "click",
		Callback = function()
			--setclipboard(linkDONATE) --linkverse earning 
			u:MakeNotification({Name = "☣ AutoPlayer ☣", Content = "Link DONATE has coppied paste to your browser ", Time = 3})
			local args = {
				[1] = workspace:WaitForChild("AllNPC"):WaitForChild("Elite Pirate")
			}

			game.ReplicatedStorage.Remotes.Functions.CheckQuest:InvokeServer(unpack(args))
				print("Create GUI ")

		end

	}) 
	

	--end o day-------------------
end

