local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Elemental Grind Game", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

local Tab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "Main"
})

Tab:AddParagraph("Info","Shows the element early")

Tab:AddButton({
	Name = "Spin v2",
	Callback = function()
	wait(0.001) 
		game:GetService("Players").LocalPlayer.Character:BreakJoints()
      		wait(0.001)
		game:GetService("ReplicatedStorage"):WaitForChild("Client"):WaitForChild("Spin"):InvokeServer()
		wait(0.001) 
		game:GetService("ReplicatedStorage"):WaitForChild("Client"):WaitForChild("Intro"):InvokeServer() 
  	end    
})

local Section = Tab:AddSection({
	Name = "Players"
})

Tab:AddButton({
	Name = "Toggle Esp",
	Callback = function()
	OrionLib:MakeNotification({
	Name = "Executed!",
	Content = "Press L key to toggle",
	Image = "rbxassetid://4483345998",
	Time = 5
})
      		local uis = game:GetService('UserInputService')
local highlightColor = Color3.fromRGB(255, 0, 0)
local isHighlighted = false

local function highlightPlayer(player)
  if not player then return end

  local highlight = Instance.new('Highlight')
  highlight.Parent = player.Character
  highlight.FillColor = highlightColor
  highlight.OutlineColor = highlightColor
end

uis.InputBegan:Connect(function(input)
  if input.KeyCode == Enum.KeyCode.L then
    isHighlighted = not isHighlighted

    if isHighlighted then
      for _, player in pairs(game.Players:GetPlayers()) do
        highlightPlayer(player)
      end
    else
      for _, player in pairs(game.Players:GetPlayers()) do
        if player.Character:FindFirstChild('Highlight') then
          player.Character['Highlight']:Destroy()
        end
      end
    end
  end
end)

  	end    
})