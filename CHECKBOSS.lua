-- Gui to Lua
-- Version: 3.2

-- Instances:

local CheckingBoss = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local TextBox = Instance.new("TextBox")
local TextButton = Instance.new("TextButton")
local bmChecking = Instance.new("TextButton")
local hopServer = Instance.new("TextButton")
local closeGUI = Instance.new("TextButton")
local Rarechecking = Instance.new("TextLabel")
local Help = Instance.new("TextLabel")
local Logo = Instance.new("ImageButton")
local inputCode = Instance.new("TextButton")
local checkAll_2 = Instance.new("TextButton")
local gsChecking = Instance.new("TextButton")
local odenChecking = Instance.new("TextButton")
local HydraSKChecking = Instance.new("TextButton")

--Properties:

CheckingBoss.Name = "Checking Boss"
CheckingBoss.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
CheckingBoss.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Main.Name = "Main"
Main.Parent = CheckingBoss
Main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Main.BackgroundTransparency = 0.200
Main.Position = UDim2.new(0.0739130452, 0, 0.102608711, 0)
Main.Size = UDim2.new(0, 217, 0, 482)

TextBox.Parent = Main
TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextBox.BackgroundTransparency = 0.350
TextBox.Position = UDim2.new(0.0273291953, 0, 0.137873232, 0)
TextBox.Size = UDim2.new(0, 205, 0, 394)
TextBox.Font = Enum.Font.SourceSans
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(0, 0, 0)
TextBox.TextSize = 14.000

TextButton.Parent = Main
TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextButton.BackgroundTransparency = 0.060
TextButton.BorderSizePixel = 0
TextButton.Position = UDim2.new(-0.00253429497, 0, 0.00145417918, 0)
TextButton.Size = UDim2.new(0, 217, 0, 31)
TextButton.AutoButtonColor = false
TextButton.Font = Enum.Font.SourceSans
TextButton.Text = "HpxGames"
TextButton.TextColor3 = Color3.fromRGB(255, 1, 1)
TextButton.TextScaled = true
TextButton.TextSize = 14.000
TextButton.TextStrokeTransparency = 0.810
TextButton.TextWrapped = true

bmChecking.Name = "bmChecking"
bmChecking.Parent = Main
bmChecking.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
bmChecking.Position = UDim2.new(0.0920482576, 0, 0.236594439, 0)
bmChecking.Size = UDim2.new(0, 174, 0, 18)
bmChecking.Font = Enum.Font.SourceSans
bmChecking.Text = "Bigmom Status: NO"
bmChecking.TextColor3 = Color3.fromRGB(0, 0, 0)
bmChecking.TextSize = 14.000
bmChecking.TextStrokeTransparency = 0.900
bmChecking.MouseButton1Click:Connect(function()
    local targetPart = game.Workspace.Island["D - Loaf Island"]:FindFirstChild("Ms Mother")
    if targetPart then
        game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(targetPart.Position))

        -- Kiểm tra sự xuất hiện của Big Mom
        wait(2)
        local bossFolder = game.Workspace.Monster.Boss
        local bigMomBoss = bossFolder:FindFirstChild("MsMother [Lv. 7500]")
        if bigMomBoss then
            bmChecking.Text = "Bigmom Status: YES"
        else
            bmChecking.Text = "Bigmom Status: NO"
        end
    end
end)


hopServer.Name = "HOPSERVERLESS"
hopServer.Parent = Main
hopServer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
hopServer.Position = UDim2.new(0.0920482576, 0, 0.154231682, 0)
hopServer.Size = UDim2.new(0, 174, 0, 40)
hopServer.Font = Enum.Font.SourceSans
hopServer.Text = "NHAY SERVER IT NGUOI"
hopServer.TextColor3 = Color3.fromRGB(0, 0, 0)
hopServer.TextSize = 14.000
hopServer.TextStrokeTransparency = 0.900
hopServer.MouseButton1Click:Connect(function()
   --[SEVER HOP LESS]--
		local placeId = game.PlaceId
		local Servers = game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..placeId.."/servers/Public?sortOrder=Asc&limit=100"))
		
		local minPlayers = math.huge
		local targetServerId
		
		for i, server in ipairs(Servers.data) do
		    if server.playing < minPlayers then
		        minPlayers = server.playing
		        targetServerId = server.id
		    end
		end
		
		if targetServerId then
		    game:GetService("TeleportService"):TeleportToPlaceInstance(placeId, targetServerId)
		else
		    print("Không tìm thấy server phù hợp.")
		end

end)


closeGUI.Name = "closeGUI"
closeGUI.Parent = Main
closeGUI.BackgroundColor3 = Color3.fromRGB(255, 170, 0)
closeGUI.BackgroundTransparency = 0.800
closeGUI.BorderColor3 = Color3.fromRGB(255, 0, 4)
closeGUI.BorderSizePixel = 0
closeGUI.Position = UDim2.new(0.810333431, 0, 0.0056605991, 0)
closeGUI.Size = UDim2.new(0, 35, 0, 25)
closeGUI.Font = Enum.Font.Unknown
closeGUI.Text = "X"
closeGUI.TextColor3 = Color3.fromRGB(0, 0, 0)
closeGUI.TextSize = 32.000

Rarechecking.Name = "Rarechecking"
Rarechecking.Parent = Main
Rarechecking.BackgroundColor3 = Color3.fromRGB(208, 255, 0)
Rarechecking.BackgroundTransparency = 0.700
Rarechecking.BorderSizePixel = 0
Rarechecking.Position = UDim2.new(0.0273291953, 0, 0.862706482, 0)
Rarechecking.Size = UDim2.new(0, 205, 0, 45)
Rarechecking.Font = Enum.Font.SourceSans
Rarechecking.Text = "No found any BOSS on this the server"
Rarechecking.TextColor3 = Color3.fromRGB(255, 0, 0)
Rarechecking.TextSize = 14.000

Help.Name = "Help"
Help.Parent = Main
Help.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Help.BackgroundTransparency = 1.000
Help.BorderSizePixel = 0
Help.Position = UDim2.new(0.032111831, 0, 0.0833773762, 0)
Help.Size = UDim2.new(0, 198, 0, 20)
Help.Font = Enum.Font.SourceSans
Help.Text = "Check Boss for King Legacy"
Help.TextColor3 = Color3.fromRGB(0, 0, 0)
Help.TextSize = 14.000

Logo.Name = "Logo"
Logo.Parent = Main
Logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Logo.BorderSizePixel = 0
Logo.Position = UDim2.new(0.0552995391, 0, 0.00145417918, 0)
Logo.Size = UDim2.new(0, 34, 0, 30)
Logo.Image = "rbxassetid://12915051392"

inputCode.Name = "inputCode"
inputCode.Parent = Main
inputCode.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
inputCode.Position = UDim2.new(0.0599078313, 0, 0.814344466, 0)
inputCode.Size = UDim2.new(0, 191, 0, 15)
inputCode.Font = Enum.Font.SourceSans
inputCode.Text = "Hop Server Nhiều"
inputCode.TextColor3 = Color3.fromRGB(0, 0, 0)
inputCode.TextSize = 14.000
inputCode.TextStrokeTransparency = 0.900
inputCode.MouseButton1Click:Connect(function()
    local target1Players = 10
    local placeId = game.PlaceId

    local success, Servers = pcall(function()
        return game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..placeId.."/servers/Public?sortOrder=Asc&limit=100"))
    end)

    if success then
        local target1ServerId
        local closestPlayerCountDiff = math.huge
        
        for i, server in ipairs(Servers.data) do
            if server.playing == target1Players then
                target1ServerId = server.id
                break
            else
                local playerCountDiff = math.abs(server.playing - target1Players)
                if playerCountDiff < closestPlayerCountDiff then
                    closestPlayerCountDiff = playerCountDiff
                    target1ServerId = server.id
                end
            end
        end
        
        if target1ServerId then
            game:GetService("TeleportService"):TeleportToPlaceInstance(placeId, target1ServerId)
        else
            print("Không tìm thấy server phù hợp.")
        end
    else
        print("Lỗi khi truy cập danh sách máy chủ.")
    end
end)


checkAll_2.Name = "checkAll"
checkAll_2.Parent = Main
checkAll_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
checkAll_2.BorderColor3 = Color3.fromRGB(53, 0, 0)
checkAll_2.Position = UDim2.new(0.179605857, 0, 0.423906118, 0)
checkAll_2.Size = UDim2.new(0, 139, 0, 31)
checkAll_2.Font = Enum.Font.SourceSans
checkAll_2.Text = "Try Tele and Checking All"
checkAll_2.TextColor3 = Color3.fromRGB(0, 0, 0)
checkAll_2.TextSize = 14.000
checkAll_2.TextStrokeColor3 = Color3.fromRGB(255, 0, 0)
checkAll_2.TextStrokeTransparency = 0.690

gsChecking.Name = "gsChecking"
gsChecking.Parent = Main
gsChecking.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
gsChecking.Position = UDim2.new(0.0920482576, 0, 0.315432608, 0)
gsChecking.Size = UDim2.new(0, 174, 0, 18)
gsChecking.Font = Enum.Font.SourceSans
gsChecking.Text = "GhostShip Status: NO"
gsChecking.TextColor3 = Color3.fromRGB(0, 0, 0)
gsChecking.TextSize = 14.000
gsChecking.TextStrokeTransparency = 0.900
gsChecking.MouseButton1Click:Connect(function()
    local ghostMonster = game.Workspace.GhostMonster:FindFirstChild("Ghost Ship")
    if ghostMonster!= nil and ghostMonster then
        local targetPart = ghostMonster:FindFirstChild("HumanoidRootPart")
        if targetPart then
            game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(targetPart.Position))
            gsChecking.Text = "GhostShip Status: YES"
        else
            gsChecking.Text = "GhostShip Status: NO"
        end
    else
        gsChecking.Text = "GhostShip Status: NO"
    end
end)




odenChecking.Name = "odenChecking"
odenChecking.Parent = Main
odenChecking.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
odenChecking.Position = UDim2.new(0.0920482576, 0, 0.276013523, 0)
odenChecking.Size = UDim2.new(0, 174, 0, 18)
odenChecking.Font = Enum.Font.SourceSans
odenChecking.Text = "Oden Status : NO"
odenChecking.TextColor3 = Color3.fromRGB(0, 0, 0)
odenChecking.TextSize = 14.000
odenChecking.TextStrokeTransparency = 0.900
odenChecking.MouseButton1Click:Connect(function()
    local targetPart = game.Workspace.Island["A - Japan"]["King Samurai Spawn"]
    if targetPart then
        game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(targetPart.Position))

        -- Kiểm tra sự xuất hiện của Boss Oden
        wait(2)
        local bossFolder = game.Workspace.Monster.Boss
        local odenBoss = bossFolder:FindFirstChild("King Samurai [Lv. 3500]")
        if odenBoss then
            odenChecking.Text = "Oden Status : YES"
        else
            odenChecking.Text = "Oden Status : NO"
        end
    end
end)



HydraSKChecking.Name = "HydraSKChecking"
HydraSKChecking.Parent = Main
HydraSKChecking.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HydraSKChecking.Position = UDim2.new(0.0920482576, 0, 0.352777004, 0)
HydraSKChecking.Size = UDim2.new(0, 174, 0, 18)
HydraSKChecking.Font = Enum.Font.SourceSans
HydraSKChecking.Text = "Hydra Sea King Status: NO"
HydraSKChecking.TextColor3 = Color3.fromRGB(0, 0, 0)
HydraSKChecking.TextSize = 14.000
HydraSKChecking.TextStrokeTransparency = 0.900
HydraSKChecking.MouseButton1Click:Connect(function()
    local targetPart = nil
    local islandModels = game.Workspace.Island:GetChildren()
    for _, model in ipairs(islandModels) do
        if model:IsA("Model") and model.Name ~= "Board" and model.Name ~= "Mirror Room" and model.Name ~= "G - Skull Pirate Island" and model.Name ~= "F - Soldier Head Quater" and model.Name ~= "E - Shred Endangering" and model.Name ~= "D - Loaf Island" and model.Name ~= "C - Desert" and model.Name ~= "B - Skull Island" and model.Name ~= "A - Japan" and model.Name ~= "H - Fiore" then
            targetPart = model:FindFirstChildWhichIsA("BasePart")
            break
        end
    end
    if targetPart then
        local newCFrame = CFrame.new(targetPart.Position.X, targetPart.Position.Y + 1000, targetPart.Position.Z)
        game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(newCFrame)
        HydraSKChecking.Text = "Hydra Sea King Status: YES"
    else
        HydraSKChecking.Text = "Hydra Sea King Status: NO"
    end
end)




local isBossChecked = false -- Biến để theo dõi trạng thái đã kiểm tra hay chưa

-- Hàm để kiểm tra và cập nhật trạng thái cho tất cả 4 Boss
local function checkAllBosses()
    -- Kiểm tra và cập nhật trạng thái cho Bigmom
    local bigmomTargetPart = game.Workspace.Island["D - Loaf Island"]:FindFirstChild("Ms Mother")
    if bigmomTargetPart then
        game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(bigmomTargetPart.Position))
        wait(2) -- Chờ 2 giây
        local bigmomBoss = game.Workspace.Monster.Boss:FindFirstChild("MsMother [Lv. 7500]")
        if bigmomBoss then
            bmChecking.Text = "Bigmom Status: YES"
        end
    end
    
    -- Kiểm tra và cập nhật trạng thái cho Oden
    local odenTargetPart = game.Workspace.Island["A - Japan"]["King Samurai Spawn"]
    if odenTargetPart then
        game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(odenTargetPart.Position))
        wait(2) -- Chờ 2 giây
        local odenBoss = game.Workspace.Monster.Boss:FindFirstChild("King Samurai [Lv. 3500]")
        if odenBoss then
            odenChecking.Text = "Oden Status: YES"
        end
    end
    
   
    
    -- Kiểm tra và cập nhật trạng thái cho Hydra Sea King
    local targetPart = nil
    local islandModels = game.Workspace.Island:GetChildren()
    for _, model in ipairs(islandModels) do
        if model:IsA("Model") and model.Name ~= "Mirror Room" and model.Name ~= "Board" and model.Name ~= "G - Skull Pirate Island" and model.Name ~= "F - Soldier Head Quater" and model.Name ~= "E - Shred Endangering" and model.Name ~= "D - Loaf Island" and model.Name ~= "C - Desert" and model.Name ~= "B - Skull Island" and model.Name ~= "A - Japan" and model.Name ~= "H - Fiore" then
            targetPart = model:FindFirstChildWhichIsA("BasePart")
            break
        end
    end
    if targetPart then
        local newCFrame = CFrame.new(targetPart.Position.X, targetPart.Position.Y + 800, targetPart.Position.Z)
        game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(newCFrame)
        HydraSKChecking.Text = "Hydra Sea King Status: YES"
    end
     -- Kiểm tra và cập nhật trạng thái cho Ghost Ship
    -- Kiểm tra và cập nhật trạng thái cho Ghost Ship
local ghostMonster = game.Workspace.GhostMonster
if ghostMonster and ghostMonster:FindFirstChild("Ghost Ship") then
    local gsTargetPart = ghostMonster["Ghost Ship"]:FindFirstChild("HumanoidRootPart")
    if gsTargetPart then
        gsChecking.Text = "GhostShip Status: YES"
    end
end


    
    isBossChecked = true -- Đã kiểm tra xong
end


-- Xử lý sự kiện khi CharacterAdded (game load hoàn thành)
game.Players.LocalPlayer.CharacterAdded:Connect(function()
    if not isBossChecked then
        checkAllBosses() -- Thực hiện kiểm tra và cập nhật trạng thái Boss lần đầu
        
        -- Kiểm tra nếu không có Boss nào được tìm thấy
        if bmChecking.Text == "Bigmom Status: NO" and odenChecking.Text == "Oden Status: NO" and gsChecking.Text == "GhostShip Status: NO" and HydraSKChecking.Text == "Hydra Sea King Status: NO" then
            -- Đợi 20 giây
            for i = 1, 20 do
                wait(1)
                print("Đang chờ...", i)
            end
            
            changeServer() -- Gọi hàm đổi server sau khi đợi 20 giây
        end
    end
end)

-- Xử lý sự kiện khi nhấn vào nút checkAll_2 để kiểm tra lại
checkAll_2.MouseButton1Click:Connect(function()
    checkAllBosses() -- Thực hiện kiểm tra và cập nhật trạng thái Boss
end)


-- Hàm kiểm tra Hydra Sea King
local function checkHydraSK(lineLabel)
    local bossFolder = game.Workspace.Monster:FindFirstChild("Boss")
    if bossFolder and (bossFolder:FindFirstChild("Hydra") or bossFolder:FindFirstChild("Sea King")) then
        lineLabel.Text = "Hydra Sea King Status: YES"
    else
        lineLabel.Text = "Hydra Sea King Status: NO"
    end
end


-- Xử lý sự kiện khi nút "Close GUI" được nhấn
closeGUI.MouseButton1Click:Connect(function()
    CheckingBoss:Destroy() -- Xóa ScreenGui để tắt GUI
end)
-- make the frame draggable
	local UserInputService = game:GetService("UserInputService")
	local dragging
	local dragInput
	local dragStart
	local startPos
	local function update(input)
		local delta = input.Position - dragStart
		Main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
	Main.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = Main.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	Main.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)
