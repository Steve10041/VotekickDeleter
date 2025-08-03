local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Button = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")
local UIGradient = Instance.new("UIGradient")

ScreenGui.Name = "KickDestroyerGUI"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

Frame.Name = "MainFrame"
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.Position = UDim2.new(0.4, 0, 0.4, 0)
Frame.Size = UDim2.new(0, 200, 0, 100)

UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = Frame

UIGradient.Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 80, 80)),
	ColorSequenceKeypoint.new(0.50, Color3.fromRGB(80, 80, 255)),
	ColorSequenceKeypoint.new(1.00, Color3.fromRGB(80, 255, 80))
}
UIGradient.Parent = Frame

Button.Name = "DeleteKickButton"
Button.Parent = Frame
Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Button.Position = UDim2.new(0.1, 0, 0.3, 0)
Button.Size = UDim2.new(0, 160, 0, 40)
Button.Font = Enum.Font.GothamBlack
Button.Text = "Borrar todo lo de Kick 🔥"
Button.TextColor3 = Color3.fromRGB(0, 0, 0)
Button.TextSize = 14

local btnCorner = Instance.new("UICorner")
btnCorner.CornerRadius = UDim.new(0, 8)
btnCorner.Parent = Button

-- ACCIÓN destructora
Button.MouseButton1Click:Connect(function()
	for _, obj in ipairs(game:GetDescendants()) do
		if obj.Name:find("Kick") then
			print("🧨 Eliminando: " .. obj:GetFullName())
			obj:Destroy()
		end
	end
	Button.Text = "Hecho 💥"
	wait(2)
	Button.Text = "Borrar todo lo de Kick 🔥"
end)
