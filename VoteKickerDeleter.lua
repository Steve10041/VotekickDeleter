local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local RunService = game:GetService("RunService")

-- Nombres clave para detectar módulos
local keywords = {"InitiateVoteKick", "VoteKick"}

-- Función para eliminar módulos con nombres que contienen las keywords
local function eliminarModulos()
    for _, obj in pairs(game:GetDescendants()) do
        if obj:IsA("ModuleScript") then
            for _, keyword in pairs(keywords) do
                if string.find(obj.Name, keyword) then
                    print("Eliminando módulo: "..obj.Name)
                    obj:Destroy()
                end
            end
        end
    end
end

-- Ejecutar al inicio
eliminarModulos()

-- Ejecutar constantemente para eliminar nuevos módulos que aparezcan
RunService.Heartbeat:Connect(function()
    eliminarModulos()
end)

-- Crear GUI para control manual
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "AntiVoteKickGui"
screenGui.Parent = PlayerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 220, 0, 100)
frame.Position = UDim2.new(0.5, -110, 0.8, 0)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
frame.Parent = screenGui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 15)
corner.Parent = frame

local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 200, 0, 50)
button.Position = UDim2.new(0, 10, 0, 25)
button.Text = "Eliminar módulos VoteKick"
button.BackgroundColor3 = Color3.fromRGB(255, 70, 70)
button.TextColor3 = Color3.new(1, 1, 1)
button.Parent = frame

local btnCorner = Instance.new("UICorner")
btnCorner.CornerRadius = UDim.new(0, 12)
btnCorner.Parent = button

local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 120, 120)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 40, 40)),
}
gradient.Parent = button

button.MouseButton1Click:Connect(function()
    eliminarModulos()
    print("Módulos VoteKick eliminados manualmente.")
end)
