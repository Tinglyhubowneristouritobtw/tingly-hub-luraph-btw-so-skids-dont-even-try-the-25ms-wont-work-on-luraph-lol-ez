local UserInputService = game:GetService("UserInputService")
local isMobile = UserInputService.TouchEnabled

-- Scaling Factor: 0.8 for mobile, 1 for PC
local scale = isMobile and 0.8 or 1

local sg = Instance.new("ScreenGui")
sg.Name = "TinglyGUI"
sg.ResetOnSpawn = false
sg.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local main = Instance.new("Frame")
-- Scaled Size and Position
main.Size = UDim2.new(0, 320 * scale, 0, 520 * scale)
main.Position = UDim2.new(0.5, 0, 0.5, 0)
main.AnchorPoint = Vector2.new(0.5, 0.5)
main.BackgroundColor3 = Color3.fromRGB(12, 12, 15)
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true
main.Parent = sg

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 20 * scale)
corner.Parent = main

local stroke = Instance.new("UIStroke")
stroke.Thickness = 3.5 * scale
stroke.Transparency = 0.1
stroke.Color = Color3.fromRGB(255, 0, 0)
stroke.Parent = main

local rgb = Instance.new("UIGradient")
rgb.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0,   Color3.fromRGB(255, 0,   0)),
    ColorSequenceKeypoint.new(0.2, Color3.fromRGB(255, 80,  0)),
    ColorSequenceKeypoint.new(0.4, Color3.fromRGB(255, 200, 0)),
    ColorSequenceKeypoint.new(0.6, Color3.fromRGB(80,  255, 0)),
    ColorSequenceKeypoint.new(0.8, Color3.fromRGB(0,   150, 255)),
    ColorSequenceKeypoint.new(1,   Color3.fromRGB(255, 0,   255))
}
rgb.Rotation = 0
rgb.Parent = stroke

game:GetService("RunService").Heartbeat:Connect(function()
    rgb.Rotation = (rgb.Rotation + 3) % 360
end)

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 70 * scale)
title.BackgroundTransparency = 1
title.Text = "Tingly GUI"
title.Font = Enum.Font.GothamBlack
title.TextSize = 42 * scale
title.TextStrokeTransparency = 0.5
title.TextStrokeColor3 = Color3.fromRGB(0,0,0)
title.Parent = main

game:GetService("RunService").Heartbeat:Connect(function()
    local t = tick() * 1.5
    title.TextColor3 = Color3.fromHSV((t % 1), 0.9, 1)
end)

local close = Instance.new("TextButton")
close.Size = UDim2.new(0, 45 * scale, 0, 45 * scale)
close.Position = UDim2.new(1, -55 * scale, 0, 12 * scale)
close.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
close.Text = "X"
close.TextColor3 = Color3.new(1,1,1)
close.Font = Enum.Font.GothamBold
close.TextSize = 28 * scale
close.Parent = main

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 14 * scale)
closeCorner.Parent = close

close.MouseButton1Click:Connect(function()
    sg:Destroy()
end)

local holder = Instance.new("Frame")
holder.Size = UDim2.new(1, -40 * scale, 1, -90 * scale)
holder.Position = UDim2.new(0, 20 * scale, 0, 80 * scale)
holder.BackgroundTransparency = 1
holder.Parent = main

local list = Instance.new("UIListLayout")
list.Padding = UDim.new(0, 12 * scale) -- Slightly tighter padding for mobile
list.HorizontalAlignment = Enum.HorizontalAlignment.Center
list.SortOrder = Enum.SortOrder.LayoutOrder
list.Parent = holder

local function btn(text, callback)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(1, 0, 0, 60 * scale) -- Scaled button height
    b.BackgroundColor3 = Color3.fromRGB(30, 0, 0)
    b.BorderSizePixel = 0
    b.Text = text
    b.TextColor3 = Color3.new(1, 0.9, 0.1)
    b.Font = Enum.Font.GothamBold
    b.TextSize = 18 * scale -- Scaled text
    b.Parent = holder
    
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 16 * scale)
    c.Parent = b
    
    local s = Instance.new("UIStroke")
    s.Thickness = 2 * scale
    s.Color = Color3.fromRGB(255, 80, 0)
    s.Transparency = 0.4
    s.Parent = b
    
    b.MouseEnter:Connect(function()
        game:GetService("TweenService"):Create(b, TweenInfo.new(0.18), {BackgroundColor3 = Color3.fromRGB(50, 0, 0)}):Play()
        game:GetService("TweenService"):Create(s, TweenInfo.new(0.18), {Transparency = 0, Color = Color3.fromRGB(255, 150, 0)}):Play()
    end)
    
    b.MouseLeave:Connect(function()
        game:GetService("TweenService"):Create(b, TweenInfo.new(0.18), {BackgroundColor3 = Color3.fromRGB(30, 0, 0)}):Play()
        game:GetService("TweenService"):Create(s, TweenInfo.new(0.18), {Transparency = 0.4, Color = Color3.fromRGB(255, 80, 0)}):Play()
    end)
    
    b.MouseButton1Click:Connect(function()
        local sound = Instance.new("Sound")
        sound.SoundId = "rbxassetid://6895079813"
        sound.Volume = 0.6
        sound.Parent = b
        sound:Play()
        game:GetService("Debris"):AddItem(sound, 2)
        
        callback()
    end)
end

-- Button list remains the same
btn("AUTOGRAB", function() loadstring(game:HttpGet("https://pastefy.app/ccflmKDp/raw"))() end)
btn("DUELS GUI", function() loadstring(game:HttpGet("https://pastefy.app/070r9ENL/raw"))() end)
btn("AUTOPLAY", function() loadstring(game:HttpGet("https://pastefy.app/lUUJYe63/raw"))() end)
btn("SEMI TP", function() loadstring(game:HttpGet("https://pastefy.app/A7TSVk92/raw"))() end)
btn("SPEED TOOL FOR DUELS", function() loadstring(game:HttpGet("https://pastefy.app/UlW7zkOz/raw"))() end)

btn("COPY DISCORD LINK", function()
    setclipboard("https://discord.gg/Ez4625uYAg")
end)
