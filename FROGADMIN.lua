



--███████╗██████╗░░█████╗░░██████╗░
--██╔════╝██╔══██╗██╔══██╗██╔════╝░
--█████╗░░██████╔╝██║░░██║██║░░██╗░
--██╔══╝░░██╔══██╗██║░░██║██║░░╚██╗
--██║░░░░░██║░░██║╚█████╔╝╚██████╔╝
--╚═╝░░░░░╚═╝░░╚═╝░╚════╝░░╚═════╝░

--░█████╗░██████╗░███╗░░░███╗██╗███╗░░██╗
--██╔══██╗██╔══██╗████╗░████║██║████╗░██║
--███████║██║░░██║██╔████╔██║██║██╔██╗██║
--██╔══██║██║░░██║██║╚██╔╝██║██║██║╚████║
--██║░░██║██████╔╝██║░╚═╝░██║██║██║░╚███║
--╚═╝░░╚═╝╚═════╝░╚═╝░░░░░╚═╝╚═╝╚═╝░░╚══╝

--███╗░░░███╗░█████╗░██████╗░███████╗  ██████╗░██╗░░░██╗
--████╗░████║██╔══██╗██╔══██╗██╔════╝  ██╔══██╗╚██╗░██╔╝
--██╔████╔██║███████║██║░░██║█████╗░░  ██████╦╝░╚████╔╝░
--██║╚██╔╝██║██╔══██║██║░░██║██╔══╝░░  ██╔══██╗░░╚██╔╝░░
--██║░╚═╝░██║██║░░██║██████╔╝███████╗  ██████╦╝░░░██║░░░
--╚═╝░░░░░╚═╝╚═╝░░╚═╝╚═════╝░╚══════╝  ╚═════╝░░░░╚═╝░░░

--██╗░░██╗██╗░░██╗░██████╗███████╗██╗░░░██╗████████╗██████╗░
--╚██╗██╔╝╚██╗██╔╝██╔════╝██╔════╝╚██╗░██╔╝╚══██╔══╝██╔══██╗
--░╚███╔╝░░╚███╔╝░╚█████╗░█████╗░░░╚████╔╝░░░░██║░░░██║░░██║
--░██╔██╗░░██╔██╗░░╚═══██╗██╔══╝░░░░╚██╔╝░░░░░██║░░░██║░░██║
--██╔╝╚██╗██╔╝╚██╗██████╔╝██║░░░░░░░░██║░░░░░░██║░░░██████╔╝
--╚═╝░░╚═╝╚═╝░░╚═╝╚═════╝░╚═╝░░░░░░░░╚═╝░░░░░░╚═╝░░░╚═════╝░

--██╗░░░██╗░█████╗░░░░███████╗
--██║░░░██║██╔══██╗░░░██╔════╝
--╚██╗░██╔╝██║░░██║░░░██████╗░
--░╚████╔╝░██║░░██║░░░╚════██╗
--░░╚██╔╝░░╚█████╔╝██╗██████╔╝
--░░░╚═╝░░░░╚════╝░╚═╝╚═════╝░

local StarterGui = game:GetService("StarterGui")

local notification = {
    Title = "Frog Admin",
    Text = "Type cmds to see all the commands!",
    Icon = "rbxassetid://1234567890" 
}


StarterGui:SetCore("SendNotification", notification)

local textBoxText = ""


local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game:GetService("CoreGui")
screenGui.ResetOnSpawn = false

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0.5, 0, 0.5, 0)
frame.Position = UDim2.new(0.25, 0, 0.25, 0)
frame.BackgroundTransparency = 0.5
frame.Parent = screenGui
frame.Visible = false
frame.ZIndex = 50


local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0.1, 0, 0.1, 0)
closeButton.Position = UDim2.new(0.9, 0, 0, 0)
closeButton.Text = "X"
closeButton.BackgroundColor3 = Color3.new(1, 0, 0)
closeButton.Parent = frame
closeButton.ZIndex = 51
closeButton.MouseButton1Click:Connect(function()
    
    frame.Visible = false
end)


local scrollingFrame = Instance.new("ScrollingFrame")
scrollingFrame.Size = UDim2.new(0.8, 0, 0.6, 0)
scrollingFrame.Position = UDim2.new(0.1, 0, 0.2, 0)
scrollingFrame.BackgroundTransparency = 0.5
scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
scrollingFrame.Parent = frame
scrollingFrame.ZIndex = 51


local textBox = Instance.new("TextBox")
textBox.Size = UDim2.new(1, 0, 1, 0)
textBox.Position = UDim2.new(0, 0, 0, 0)
textBox.Parent = scrollingFrame
textBox.MultiLine = true
textBox.TextEditable = false
textBox.ClearTextOnFocus = false
textBox.BackgroundTransparency = 0.5
textBox.TextSize = 20
textBox.Text = ""
textBox.ZIndex = 51


local clearButton = Instance.new("TextButton")
clearButton.Size = UDim2.new(0.2, 0, 0.1, 0)
clearButton.Position = UDim2.new(0.4, 0, 0.85, 0)
clearButton.Text = "Clear"
clearButton.Parent = frame
clearButton.ZIndex = 51
clearButton.MouseButton1Click:Connect(function()
    
    textBox.Text = ""
end)


local function handleLogMessage(message, messageType)
    
    textBox.Text = textBox.Text .. "[" .. os.date("%H:%M:%S") .. "] " .. message .. "\n\n"

    
    scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, textBox.TextBounds.Y)
end


game:GetService("LogService").MessageOut:Connect(handleLogMessage)



local textBox = Instance.new("TextBox")
textBox.Parent = screenGui
textBox.Size = UDim2.new(0.3, 0, 0.1, 0)
textBox.Position = UDim2.new(0.35, 0, 1.2, 0)
textBox.BackgroundColor3 = Color3.new(1, 1, 1)
textBox.PlaceholderText = "Type here..."
textBox.Text = textBoxText
textBox.ZIndex = 100


local toggleButton = Instance.new("TextButton")
toggleButton.Parent = screenGui
toggleButton.Size = UDim2.new(0.2, 0, 0.05, 0)
toggleButton.Position = UDim2.new(0.4, 0, 0.95, 0)
toggleButton.BackgroundColor3 = Color3.new(1, 1, 1)
toggleButton.TextColor3 = Color3.new(0, 0, 0)
toggleButton.Text = "Close / Open"
toggleButton.ZIndex = 100

local isTextBoxVisible = false


local function toggleTextBox()
    isTextBoxVisible = not isTextBoxVisible
    local targetPosition = isTextBoxVisible and UDim2.new(0.35, 0, 0.8, 0) or UDim2.new(0.35, 0, 1.2, 0)
    
    -- Tween the TextBox position
    local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local tween = game.TweenService:Create(textBox, tweenInfo, {Position = targetPosition})
    tween:Play()
end

toggleButton.MouseButton1Click:Connect(toggleTextBox)


--░█████╗░░█████╗░███╗░░░███╗███╗░░░███╗░█████╗░███╗░░██╗██████╗░░██████╗
--██╔══██╗██╔══██╗████╗░████║████╗░████║██╔══██╗████╗░██║██╔══██╗██╔════╝
--██║░░╚═╝██║░░██║██╔████╔██║██╔████╔██║███████║██╔██╗██║██║░░██║╚█████╗░
--██║░░██╗██║░░██║██║╚██╔╝██║██║╚██╔╝██║██╔══██║██║╚████║██║░░██║░╚═══██╗
--╚█████╔╝╚█████╔╝██║░╚═╝░██║██║░╚═╝░██║██║░░██║██║░╚███║██████╔╝██████╔╝
--░╚════╝░░╚════╝░╚═╝░░░░░╚═╝╚═╝░░░░░╚═╝╚═╝░░╚═╝╚═╝░░╚══╝╚═════╝░╚═════╝░

--███████╗░█████╗░██████╗░
--██╔════╝██╔══██╗██╔══██╗
--█████╗░░██║░░██║██████╔╝
--██╔══╝░░██║░░██║██╔══██╗
--██║░░░░░╚█████╔╝██║░░██║
--╚═╝░░░░░░╚════╝░╚═╝░░╚═╝

--████████╗███████╗██╗░░██╗████████╗██████╗░░█████╗░██╗░░██╗
--╚══██╔══╝██╔════╝╚██╗██╔╝╚══██╔══╝██╔══██╗██╔══██╗╚██╗██╔╝
--░░░██║░░░█████╗░░░╚███╔╝░░░░██║░░░██████╦╝██║░░██║░╚███╔╝░
--░░░██║░░░██╔══╝░░░██╔██╗░░░░██║░░░██╔══██╗██║░░██║░██╔██╗░
--░░░██║░░░███████╗██╔╝╚██╗░░░██║░░░██████╦╝╚█████╔╝██╔╝╚██╗
--░░░╚═╝░░░╚══════╝╚═╝░░╚═╝░░░╚═╝░░░╚═════╝░░╚════╝░╚═╝░░╚═╝

textBox.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        local text = textBox.Text:lower()
        if text == "shiftlock" then
            --  Shiftlock script
            local success, result = pcall(function()
                return loadstring(game:HttpGet('https://raw.githubusercontent.com/Unknownproootest/Permanent-Shift-Lock-Alt/alt/PermShiftlockAlt'))()
            end)
            
            if not success then
                warn("Failed to load the Shiftlock script: " .. result)
            end
            
        elseif text == "fly" then
            --  Fly script
            local success, result = pcall(function()
                return loadstring(game:HttpGet("https://scriptblox.com/raw/Universal-Script-I-Fly-gui-V3-I-6627"))()
            end)
            
            if not success then
                warn("Failed to load the Fly script: " .. result)
            end
            
        elseif text == "findplayer" then
 
    local notification = {
        Title = "Note",
        Text = "You can click the names on the scrollingframe",
        Icon = "rbxassetid://1234567890"
    }

   
    game:GetService("StarterGui"):SetCore("SendNotification", notification)

    --  Find Player script
    local success, result = pcall(function()
        return loadstring(game:HttpGet(('https://raw.githubusercontent.com/xxsfytd/JsskjwiasbsjdnebenIMTHEPLAYERLMAO/main/tilelelelelelele.lua')))()
    end)

    if not success then
        warn("Failed to load the script: " .. result)
    end
            
        elseif text == "highlight" then
           
            local highlightColor = Color3.fromRGB(255, 0, 0)
            local function highlightPlayer(player)
                if not player then return end
                local highlight = Instance.new('Highlight')
                highlight.Parent = player.Character
                highlight.FillColor = highlightColor
                highlight.OutlineColor = highlightColor
            end
            
            for _, player in pairs(game.Players:GetPlayers()) do
                highlightPlayer(player)
            end
            
        elseif text == "unhighlight" then
          
            for _, player in pairs(game.Players:GetPlayers()) do
                local character = player.Character
                if character then
                    for _, child in ipairs(character:GetChildren()) do
                        if child:IsA("Highlight") then
                            child:Destroy()
                        end
                    end
                end
            end
            
        elseif text == "killgui" then
            
            screenGui:Destroy()
            
        elseif text == "bodyfling" then
            
            local success, result = pcall(function()
                return loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe./main/Fling%20GUI"))()
            end)
            
            if not success then
                warn("Failed to load the Fling GUI script: " .. result)
            end
            
        elseif text == "invisible" then
            --  Invisible GUI script
            local success, result = pcall(function()
                return loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Invisible%20Gui'))()
            end)
            
            if not success then
                warn("Failed to load the Invisible GUI script: " .. result)
            end
            
        elseif text == "fetools" then
            --  Fe Tools script
            local success, result = pcall(function()
                return loadstring(game:HttpGet('https://pastefy.app/VYIAk3o1/raw', true))()
            end)
            
            if not success then
                warn("Failed to load the specified script: " .. result)
            end
            
            elseif text == "reset" then
    
    local character = game.Players.LocalPlayer.Character
    if character then
        for _, part in ipairs(character:GetChildren()) do
            if part:IsA("BasePart") then
                part:BreakJoints()
            end
        end
    else
        warn("Character not found.")
    end
    
elseif text == "rejoin" then
    
    local player = game.Players.LocalPlayer
    local placeId = game.PlaceId
    local TeleportService = game:GetService("TeleportService")

    TeleportService:Teleport(placeId, player)
    
elseif text == "show players" then

    local function ShowAllPlayers()
        local Players = game:GetService("Players")
        local LocalPlayer = Players.LocalPlayer

        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer then
                for _, part in ipairs(player.Character:GetDescendants()) do
                    if part:IsA("BasePart") or part:IsA("Decal") then
                        part.Transparency = 0
                    end
                end
            end
        end
    end

    ShowAllPlayers()
    
elseif text == "hide players" then
    
    local function HideAllPlayers()
        local Players = game:GetService("Players")
        local LocalPlayer = Players.LocalPlayer

        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer then
                for _, part in ipairs(player.Character:GetDescendants()) do
                    if part:IsA("BasePart") or part:IsA("Decal") then
                        part.Transparency = 1
                    end
                end
            end
        end
    end

    HideAllPlayers()
    
elseif text == "show prompts" then
local StarterGui = game:GetService("StarterGui")


local notification = {
    Title = "Note",
    Text = "All gamepasses and ugc are invisible",
    Icon = "rbxassetid://1234567890" 
}


StarterGui:SetCore("SendNotification", notification)
    local COREGUI = game:GetService("CoreGui")


    if COREGUI:FindFirstChild("PurchasePrompt") then
       
        COREGUI.PurchasePrompt.Enabled = true
    end
    
elseif text == "hide prompts" then
local StarterGui = game:GetService("StarterGui")


local notification = {
    Title = "Note",
    Text = "All gamepasses and ugc are visible",
    Icon = "rbxassetid://1234567890" 
}


StarterGui:SetCore("SendNotification", notification)
    local COREGUI = game:GetService("CoreGui")

  
    if COREGUI:FindFirstChild("PurchasePrompt") then
       
        COREGUI.PurchasePrompt.Enabled = false
    end
    
elseif text:match("^keyboard %d+$") then
    local keyboardType = tonumber(text:match("(%d+)"))

    if keyboardType == 1 then
        --  first keyboard script
        local success, result = pcall(function()
            return loadstring(game:HttpGet("https://raw.githubusercontent.com/GGH52lan/GGH52lan/main/keyboard.txt"))()
        end)

        if not success then
            warn("Failed to load the first keyboard script: " .. result)
        end
    elseif keyboardType == 2 then
        --  second keyboard script
        local success, result = pcall(function()
            return loadstring(game:HttpGet("https://gist.githubusercontent.com/RedZenXYZ/4d80bfd70ee27000660e4bfa7509c667/raw/da903c570249ab3c0c1a74f3467260972c3d87e6/KeyBoard%2520From%2520Ohio%2520Fr%2520Fr"))()
        end)

        if not success then
            warn("Failed to load the second keyboard script: " .. result)
        end
    else
        warn("Invalid keyboard type input")
    end
    
elseif text:sub(1, 10) == "playmusic " then


local StarterGui = game:GetService("StarterGui")


local notification = {
    Title = "Note",
    Text = "Only u can hear it",
    Icon = "rbxassetid://1234567890" 
}


StarterGui:SetCore("SendNotification", notification)

    local musicId = text:sub(11)

  
    if musicId == "" or not tonumber(musicId) then
        warn("Invalid music ID.")
        return
    end

   
    local musicPlayer = game:GetService("SoundService"):FindFirstChild("MusicPlayer")
    if not musicPlayer then
        musicPlayer = Instance.new("Sound")
        musicPlayer.Name = "MusicPlayer"
        musicPlayer.Parent = game:GetService("SoundService")
    end

    musicPlayer.SoundId = "rbxassetid://" .. musicId
    musicPlayer:Play()
    
elseif text == "stopmusic" then
    
    local musicPlayer = game:GetService("SoundService"):FindFirstChild("MusicPlayer")

    
    if musicPlayer and musicPlayer.IsPlaying then
        musicPlayer:Stop()
    else
        warn("No music is currently playing.")
    end
    
elseif text == "nocdproxy" then

local notification = {
    Title = "Note",
    Text = "All of the proximity prompt are now no cd",
    Icon = "rbxassetid://1234567890" 
}


StarterGui:SetCore("SendNotification", notification)
    
    local function SetHoldDurationToZero()
        while true do
            for _, v in next, workspace:GetDescendants() do
                if v:IsA("ProximityPrompt") then
                    v.HoldDuration = 0
                end
            end
            wait(1) 
        end
    end

    
    coroutine.wrap(SetHoldDurationToZero)()
    
    elseif text == "chat hax" then
    --  Chat Hax script
    local success, result = pcall(function()
        return loadstring(game:HttpGet(('https://pastefy.app/zCFEwaYq/raw'), true))()
    end)
    
    if not success then
        warn("Failed to load the Chat Hax script: " .. result)
    end

    elseif text == "remote spy" then
    --  Remote Spy script
    local success, result = pcall(function()
        return loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/SimpleSpyV3/main.lua"))()
    end)

    if not success then
        warn("Failed to load the Remote Spy script: " .. result)
    end

elseif text:sub(1, 6) == "speed " then
    local speedValue = tonumber(text:sub(7)) 

 
    if speedValue then
        local localPlayer = game.Players.LocalPlayer

        
        local character = localPlayer.Character
        if character then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.WalkSpeed = speedValue
            end
        end
    else
        warn("Invalid speed value.")
    end

elseif text:sub(1, 5) == "jump " then
    local jumpValue = tonumber(text:sub(6))

    
    if jumpValue then
        local localPlayer = game.Players.LocalPlayer

        
        local character = localPlayer.Character
        if character then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.JumpPower = jumpValue
            end
        end
    else
        warn("Invalid jump power value.")
    end
    
    elseif text == "executor" then
    --  Executor script
    local success, result = pcall(function()
        return loadstring(game:HttpGet(('https://raw.githubusercontent.com/xxsfytd/CccccccExecutorForAdminnnnn/main/CccccccExecutorForAdminnnnn')))()
    end)

    if not success then
        warn("Failed to load the script: " .. result)
    end
    
    elseif text:match("^emote %d$") then
    local emoteNumber = tonumber(text:match("(%d)"))

    if emoteNumber == 1 then
        -- Emote 1 script
        local success, result = pcall(function()
            return loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FEmotesGui/main/FEmotesGui.lua", true))()
        end)

        if not success then
            warn("Failed to load Emote 1 script: " .. result)
        end
    elseif emoteNumber == 2 then
        -- Emote 2 script
        local success, result = pcall(function()
            return loadstring(game:HttpGet(('https://pastebin.com/raw/Rx4Qqicd')))()
        end)

        if not success then
            warn("Failed to load Emote 2 script: " .. result)
        end
    else
        warn("Invalid emote number. Use 'emote 1' or 'emote 2'.")
    end
    
    elseif text == "leave" then
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer


    LocalPlayer:Kick("You left the game 😱😱")
    
    elseif text:match("^teleportgame %d+$") then
    local gameId = tonumber(text:match("(%d+)"))

    if gameId then
        game:GetService("TeleportService"):Teleport(gameId)
    else
        warn("Invalid game ID input")
    end
    
    elseif text == "illusion" then
    --  Illusion script
    local success, result = pcall(function()
        return loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe/main/obf_11l7Y131YqJjZ31QmV5L8pI23V02b3191sEg26E75472Wl78Vi8870jRv5txZyL1.lua.txt"))()
    end)

    if not success then
        warn("Failed to load the Illusion script: " .. result)
    end
    
    elseif text == "audiologger" then
    --  Audio Logger script
    local success, result = pcall(function()
        return loadstring(game:HttpGet(('https://raw.githubusercontent.com/infyiff/backup/main/audiologger.lua'), true))()
    end)

    if not success then
        warn("Failed to load the Audio Logger script: " .. result)
    end
    
    elseif text == "flashback" then
    --  Flashback script
    local success, result = pcall(function()
        return loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe./main/L"))()
    end)

    if not success then
        warn("Failed to load the Flashback script: " .. result)
    end
    
    elseif text == "smooth camera" then
    --  Smooth Camera script
    local success, result = pcall(function()
        return loadstring(game:HttpGet("https://scriptblox.com/raw/Universal-Script-Smooth-3rd-Person-Camera-7413"))()
    end)

    if not success then
        warn("Failed to load the Smooth Camera script: " .. result)
    end
    
    elseif text == "anti void" then
    --  Anti Void script
    local success, result = pcall(function()
        return loadstring(game:HttpGet("https://raw.githubusercontent.com/zephyr10101/AntiFall/main/Script"))()
    end)

    if not success then
        warn("Failed to load the Anti Void script: " .. result)
    end
    
    elseif text == "anti afk" then
    --  Anti AFK script
    local success, result = pcall(function()
        return loadstring(game:HttpGet(('https://raw.githubusercontent.com/RTrade/Voidz/main/AntiAFK.lua'), true))()
    end)

    if not success then
        warn("Failed to load the Anti AFK script: " .. result)
    end
    
    elseif text == "dex" then
    getgenv().Key = "Bash"
    --  DEX script
    local success, result = pcall(function()
        return loadstring(game:HttpGet("https://raw.githubusercontent.com/Hosvile/Refinement/main/MC%3AIY%20Dex", true))()
    end)

    if not success then
        warn("Failed to load the DEX script: " .. result)
    end
    
    elseif text == "translator" then
    --  Chat Translator script
    local success, result = pcall(function()
        return loadstring(game:HttpGet("https://scriptblox.com/raw/CHAT-TRANSLATOR_749"))()
    end)

    if not success then
        warn("Failed to load the Chat Translator script: " .. result)
    end
    
    elseif text == "tptool" then
    --  Teleport Tool script
    local success, result = pcall(function()
        return loadstring(game:HttpGet("https://scriptblox.com/raw/Universal-Script-teleport-tool-7571"))()
    end)

    if not success then
        warn("Failed to load the Teleport Tool script: " .. result)
    end
    
    elseif text == "chat log" then
    --  Chat Logs script
    local success, result = pcall(function()
        return loadstring(game:HttpGet("https://scriptblox.com/raw/Universal-Script-Chat-logs-1646"))()
    end)

    if not success then
        warn("Failed to load the Chat Logs script: " .. result)
    end
    
    elseif text == "console" then
    
    frame.Visible = true
    
    elseif text == "click to fling" then
    --  Click to Fling script
    local success, result = pcall(function()
        return loadstring(game:HttpGet(('https://raw.githubusercontent.com/0Ben1/fe/main/obf_5wpM7bBcOPspmX7lQ3m75SrYNWqxZ858ai3tJdEAId6jSI05IOUB224FQ0VSAswH.lua.txt'), true))()
    end)

    if not success then
        warn("Failed to load the Click to Fling script: " .. result)
    end
    
    elseif text == "noclip" then
    --  NoClip script
    local success, result = pcall(function()
        return loadstring(game:HttpGet(('https://pastebin.com/raw/6T4skKuj')))()
    end)

    if not success then
        warn("Failed to load the NoClip script: " .. result)
    end
    
    elseif text == "vfly" then
    --  VFly script
    local success, result = pcall(function()
        return loadstring(game:HttpGet("https://pastebin.com/raw/MHE1cbWF"))()
    end)

    if not success then
        warn("Failed to load the VFly script: " .. result)
    end
    
    elseif text == "sit" then
    
    local character = game.Players.LocalPlayer.Character
    if character then
        
        local humanoid = character:FindFirstChild("Humanoid")
        if humanoid then
        
            humanoid.Sit = true
        end
    end
    
    elseif text == "locatormp" then
    
local StarterGui = game:GetService("StarterGui")


local notification = {
    Title = "Note",
    Text = "You can click the names on the scrollingframe",
    Icon = "rbxassetid://1234567890" 
}


StarterGui:SetCore("SendNotification", notification)
    --  LocatorMP script
    local success, result = pcall(function()
        return loadstring(game:HttpGet(('https://raw.githubusercontent.com/xxsfytd/HahahahahahahahaDONTSKIDTHIS/main/untitledjejwkabsjsjwjw.lua')))()
    end)

    if not success then
        warn("Failed to load the LocatorMP script: " .. result)
    end
    
    elseif text == "serverhop" then
    
        
local StarterGui = game:GetService("StarterGui")


local notification = {
    Title = "bye",
    Text = "Serverhopping bye bye",
    Icon = "rbxassetid://1234567890" 
}


StarterGui:SetCore("SendNotification", notification)
    print("Executing serverhop command...")

    
    local servers = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/".. game.PlaceId.. "/servers/Public?sortOrder=Asc&limit=100"))

    
    local randomServer = servers.data[math.random(1, table.getn(servers.data))]

    
    game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, randomServer.id)
    
    elseif text == "sniper" then
    --  Sniper script
    local success, result = pcall(function()
        return loadstring(game:HttpGet(('https://raw.githubusercontent.com/JustAP1ayer/PlayerHubOther/main/PlayerHubIngameUgcLimitedsV2.lua')))()
    end)

    if not success then
        warn("Failed to load the Sniper script: " .. result)
    end
    
    elseif text == "backdoor" then
    --  Backdoor script
    local success, result = pcall(function()
        return loadstring(game:HttpGet("https://raw.githubusercontent.com/iK4oS/backdoor.exe/v8/src/main.lua"))();
    end)

    if not success then
        warn("Failed to load the Backdoor script: " .. result)
    end
    
    elseif text == "f3x" then
    --  F3x script
    local success, result = pcall(function()
        return loadstring(game:GetObjects("rbxassetid://6695644299")[1].Source)()
    end)

    if not success then
        warn("Failed to load the F3x script: " .. result)
    end
    
    elseif text == "touchinterests" then
    --  Touchinterests script
    local success, result = pcall(function()
        return loadstring(game:HttpGet(('https://raw.githubusercontent.com/xxsfytd/JBEKSBSSJIEBSKSNDNDTHETOUCHINTERESTSHAHAHAHAA/main/touchinterestststststststs.lua')))()
    end)

    if not success then
        warn("Failed to load the Touchinterests script: " .. result)
    end 
    
    elseif text == "r6" then
    --  R6 Anim script
    local success, result = pcall(function()
        return loadstring(game:HttpGet(('https://raw.githubusercontent.com/Imagnir/r6_anims_for_r15/main/r6_anims.lua'),true))()
    end)

    if not success then
        warn("Failed to load the r6 anim script: " .. result)
    end 
    
    elseif text == "hitbox expander" then
    --  R6 Anim script
    local success, result = pcall(function()
        return loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/RobloxScripts/main/HitboxExpander.lua"))()
    end)

    if not success then
        warn("Failed to load the r6 anim script: " .. result)
    end 
    
    elseif text == "server browser" then
    --  R6 Anim script
    local success, result = pcall(function()
        return loadstring(game:HttpGet(('https://rawscripts.net/raw/Server-Browser_80')))()
    end)

    if not success then
        warn("Failed to load the r6 anim script: " .. result)
    end 
    
    
    
   
--░█████╗░███╗░░░███╗██████╗░░██████╗
--██╔══██╗████╗░████║██╔══██╗██╔════╝
--██║░░╚═╝██╔████╔██║██║░░██║╚█████╗░
--██║░░██╗██║╚██╔╝██║██║░░██║░╚═══██╗
--╚█████╔╝██║░╚═╝░██║██████╔╝██████╔╝
--░╚════╝░╚═╝░░░░░╚═╝╚═════╝░╚═════╝░
    

    elseif text == "cmds" then
   
    local screenGui = Instance.new("ScreenGui")
    screenGui.Parent = game:GetService("CoreGui")

    
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 1, 0)
    frame.BackgroundColor3 = Color3.new(0, 0, 0)
    frame.BackgroundTransparency = 0.5 
    frame.Parent = screenGui
    frame.ZIndex = 101

    
    local closeButton = Instance.new("TextButton")
    closeButton.Text = "X"
    closeButton.Size = UDim2.new(0, 50, 0, 50) 
    closeButton.Position = UDim2.new(1, -50, 0, 0)
    closeButton.Parent = frame
    closeButton.ZIndex = 102

    
    closeButton.MouseButton1Click:Connect(function()
        frame:Destroy()
    end)

   
    local scrollingFrame = Instance.new("ScrollingFrame")
    scrollingFrame.Size = UDim2.new(0.8, 0, 0.8, 0)
    scrollingFrame.Position = UDim2.new(0.1, 0, 0.1, 0)
    scrollingFrame.BackgroundColor3 = Color3.new(1, 1, 1) 
    scrollingFrame.BackgroundTransparency = 0.5 
    scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 10000)
    scrollingFrame.Parent = frame
    scrollingFrame.ZIndex = 102

    
    local searchBox = Instance.new("TextBox")
    searchBox.PlaceholderText = "Search..."
    searchBox.Size = UDim2.new(0.6, 0, 0, 30) 
    searchBox.Position = UDim2.new(0.2, 0, 0, 0)
    searchBox.Parent = frame
    searchBox.ZIndex = 102

    
    local searchButton = Instance.new("TextButton")
    searchButton.Text = "Search"
    searchButton.Size = UDim2.new(0, 80, 0, 30) 
    searchButton.Position = UDim2.new(0.8, 0, 0, 0)
    searchButton.Parent = frame
    searchButton.ZIndex = 102

    
    searchButton.MouseButton1Click:Connect(function()
        local searchText = searchBox.Text:lower()
        local yOffset = 50 
        for _, child in ipairs(scrollingFrame:GetChildren()) do
            if child:IsA("TextLabel") then
                local labelText = child.Text:lower()
                if string.find(labelText, searchText) then
                    child.Position = UDim2.new(0, 0, 0, yOffset)
                    yOffset = yOffset + 30
                    child.Visible = true
                else
                    child.Visible = false
                end
            end
        end
    end)

    -- List of commands aughhhhh
    local commands = {
        "Playmusic (music id)",
        "Stopmusic (stops musics)",
        "Rejoin",
        "Hide players",
        "Show players",
        "Nocdproxy (remove proxymityprompt cd)",
        "Killgui (destroys the script)",
        "Bodyfling (gui)",
        "Invisible (gui)",
        "Fetools",
        "Highlight",
        "Unhighlight",
        "Findplayer (gui)",
        "Shiftlock (permanent)",
        "Chat hax (gui)",
        "Reset (breakjoints)",
        "Remote spy (gui)", 
        "Keyboard (choices :1, 2:)",
        "Hide prompts", 
        "Show prompts", 
        "Speed (value)", 
        "Jump (value)", 
        "Executor (gui)", 
        "Emote (choices :1, 2:)", 
        "Leave", 
        "Teleportgame (game id)", 
        "Illusion (gui)", 
        "Audiologger (gui)", 
        "Flashback (gui)", 
        "Smooth camera", 
        "Anti fall", 
        "Anti afk", 
        "Dex (gui)", 
        "Translator", 
        "Tptool", 
        "Console (gui)", 
        "Click to fling (gui)", 
        "Noclip (gui)", 
        "Vfly (gui)", 
        "Chat log (gui)", 
        "Sit", 
        "Locatormp (gui)", 
        "Serverhop", 
        "Fly (gui)", 
        "Sniper (gui)", 
        "Backdoor (gui)", 
        "F3x (Visual)", 
        "Touchinterests (gui)", 
        "R6", 
        "Hitbox Expander"
    }
    
    
table.sort(commands)

local commandYOffset = 10
    for _, command in ipairs(commands) do
        local textLabel = Instance.new("TextLabel")
        textLabel.Text = command
        textLabel.Size = UDim2.new(1, 0, 0, 20) 
        textLabel.Position = UDim2.new(0, 0, 0, commandYOffset)
        textLabel.BackgroundColor3 = Color3.new(1, 1, 1) 
        textLabel.BackgroundTransparency = 0.5 
        textLabel.Parent = scrollingFrame
        textLabel.ZIndex = 103

        commandYOffset = commandYOffset + 30
    end

        end
        textBoxText = textBox.Text
    end
end)




wait(1) 

local commands = {
    "Hitbox Expander", 
    
}

table.sort(commands)

local formattedCommands = ""
for _, command in ipairs(commands) do
    formattedCommands = formattedCommands .. "Added - " .. command .. "\n"
end

local TweenService = game:GetService("TweenService")


local gui = Instance.new("ScreenGui")
gui.Parent = game:GetService("CoreGui")
gui.ResetOnSpawn = false


local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 200) -- Set the size of the frame
frame.Position = UDim2.new(0.5, 0, 0.5, 0) -- Set the position of the frame
frame.AnchorPoint = Vector2.new(0.5, 0.5) -- Set the anchor point to the center
frame.BackgroundColor3 = Color3.new(1, 1, 1) -- Set the background color to white
frame.BorderColor3 = Color3.new(0, 0, 0) -- Set the border color to black
frame.BorderSizePixel = 2 -- Set the border size to 2 pixels
frame.Parent = gui
frame.ZIndex = 200



local targetSize = UDim2.new(0, 300, 0, 200)


frame.Size = UDim2.new(0, 100, 0, 100)


local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0)
local sizeTween = TweenService:Create(frame, tweenInfo, {Size = targetSize})


sizeTween:Play()


local titleLabel = Instance.new("TextLabel")
titleLabel.Text = "Update Log"
titleLabel.TextSize = 24
titleLabel.Size = UDim2.new(1, 0, 0, 30)
titleLabel.BackgroundColor3 = Color3.new(1, 1, 1)
titleLabel.BorderColor3 = Color3.new(0, 0, 0)
titleLabel.BorderSizePixel = 2
titleLabel.Parent = frame
titleLabel.ZIndex = 201


local scrollingFrame = Instance.new("ScrollingFrame")
scrollingFrame.Size = UDim2.new(1, 0, 1, -30)
scrollingFrame.Position = UDim2.new(0, 0, 0, 30)
scrollingFrame.BackgroundTransparency = 1 
scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 200) 
scrollingFrame.Parent = frame
scrollingFrame.ZIndex = 201


local textLabel = Instance.new("TextLabel")
textLabel.Text = formattedCommands
textLabel.TextSize = 15
textLabel.TextWrapped = true
textLabel.TextXAlignment = Enum.TextXAlignment.Left
textLabel.TextYAlignment = Enum.TextYAlignment.Top
textLabel.Size = UDim2.new(1, 0, 1, 0)
textLabel.BackgroundTransparency = 1
textLabel.Parent = scrollingFrame
textLabel.ZIndex = 202


local closeButton = Instance.new("TextButton")
closeButton.Name = "X"
closeButton.Text = "X"
closeButton.TextSize = 20
closeButton.Size = UDim2.new(0, 30, 0, 30) 
closeButton.Position = UDim2.new(1, -30, 0, 0)
closeButton.TextColor3 = Color3.new(1, 0, 0)
closeButton.BackgroundColor3 = Color3.new(1, 1, 1)
closeButton.BorderColor3 = Color3.new(0, 0, 0) 
closeButton.BorderSizePixel = 2
closeButton.Parent = frame
closeButton.ZIndex = 201


local function closeGui()
    local targetSize = UDim2.new(0, 0, 0, 0) 
    local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0) -- Tween for 0.5 seconds with Quad easing

    local sizeTween = TweenService:Create(frame, tweenInfo, {Size = targetSize})
    sizeTween:Play()

    sizeTween.Completed:Connect(function()
        gui:Destroy()
    end)
end


closeButton.MouseButton1Click:Connect(closeGui)


