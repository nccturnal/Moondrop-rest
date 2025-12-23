-- Luau UI Library Base dengan Animasi Zoom Out & Acrylic Blur
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local UILibrary = {}
UILibrary.__index = UILibrary

-- Fungsi untuk membuat window baru
function UILibrary:CreateWindow(config)
    local window = {}
    
    -- Konfigurasi default
    config = config or {}
    config.Title = config.Title or "UI Window"
    config.Size = config.Size or UDim2.new(0, 500, 0, 400)
    config.AnimationDuration = config.AnimationDuration or 0.5
    
    -- Buat ScreenGui
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "UILibrary"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = PlayerGui
    
    -- Main Frame (Window) dengan Acrylic Blur
    local mainFrame = Instance.new("Frame")
    mainFrame.Name = "MainWindow"
    mainFrame.Size = config.Size
    mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
    mainFrame.BackgroundTransparency = 0.3 -- Semi-transparent untuk blur effect
    mainFrame.BorderSizePixel = 0
    mainFrame.ClipsDescendants = false
    mainFrame.Parent = screenGui
    
    -- Blur Effect untuk Acrylic look
    local blur = Instance.new("BlurEffect")
    blur.Size = 24
    blur.Parent = game.Lighting
    
    -- UICorner untuk rounded corners
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 12)
    corner.Parent = mainFrame
    
    -- Glass/Acrylic Effect Overlay
    local glassEffect = Instance.new("Frame")
    glassEffect.Name = "GlassEffect"
    glassEffect.Size = UDim2.new(1, 0, 1, 0)
    glassEffect.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    glassEffect.BackgroundTransparency = 0.95
    glassEffect.BorderSizePixel = 0
    glassEffect.ZIndex = 2
    glassEffect.Parent = mainFrame
    
    local glassCorner = Instance.new("UICorner")
    glassCorner.CornerRadius = UDim.new(0, 12)
    glassCorner.Parent = glassEffect
    
    -- Border/Stroke untuk Acrylic effect
    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(255, 255, 255)
    stroke.Transparency = 0.85
    stroke.Thickness = 1.5
    stroke.Parent = mainFrame
    
    -- Shadow effect
    local shadow = Instance.new("ImageLabel")
    shadow.Name = "Shadow"
    shadow.Size = UDim2.new(1, 40, 1, 40)
    shadow.Position = UDim2.new(0, -20, 0, -20)
    shadow.BackgroundTransparency = 1
    shadow.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
    shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
    shadow.ImageTransparency = 0.7
    shadow.ScaleType = Enum.ScaleType.Slice
    shadow.SliceCenter = Rect.new(10, 10, 118, 118)
    shadow.ZIndex = -1
    shadow.Parent = mainFrame
    
    -- Title Bar dengan Acrylic Blur
    local titleBar = Instance.new("Frame")
    titleBar.Name = "TitleBar"
    titleBar.Size = UDim2.new(1, 0, 0, 45)
    titleBar.BackgroundColor3 = Color3.fromRGB(35, 35, 50)
    titleBar.BackgroundTransparency = 0.2
    titleBar.BorderSizePixel = 0
    titleBar.ZIndex = 3
    titleBar.Parent = mainFrame
    
    local titleCorner = Instance.new("UICorner")
    titleCorner.CornerRadius = UDim.new(0, 12)
    titleCorner.Parent = titleBar
    
    local titleStroke = Instance.new("UIStroke")
    titleStroke.Color = Color3.fromRGB(255, 255, 255)
    titleStroke.Transparency = 0.9
    titleStroke.Thickness = 1
    titleStroke.Parent = titleBar
    
    -- Mask untuk memotong bagian bawah title bar agar tidak rounded
    local titleMask = Instance.new("Frame")
    titleMask.Size = UDim2.new(1, 0, 0, 10)
    titleMask.Position = UDim2.new(0, 0, 1, -10)
    titleMask.BackgroundColor3 = Color3.fromRGB(35, 35, 50)
    titleMask.BackgroundTransparency = 0.2
    titleMask.BorderSizePixel = 0
    titleMask.ZIndex = 3
    titleMask.Parent = titleBar
    
    -- Animasi Zoom Out saat window muncul
    mainFrame.Size = UDim2.new(0, 0, 0, 0)
    mainFrame.BackgroundTransparency = 1
    glassEffect.BackgroundTransparency = 1
    titleBar.BackgroundTransparency = 1
    titleMask.BackgroundTransparency = 1
    stroke.Transparency = 1
    titleStroke.Transparency = 1
    
    local tweenInfo = TweenInfo.new(
        config.AnimationDuration,
        Enum.EasingStyle.Back,
        Enum.EasingDirection.Out
    )
    
    local sizeTween = TweenService:Create(mainFrame, tweenInfo, {
        Size = config.Size
    })
    
    local transparencyTween = TweenService:Create(mainFrame, tweenInfo, {
        BackgroundTransparency = 0.3
    })
    
    local glassTween = TweenService:Create(glassEffect, tweenInfo, {
        BackgroundTransparency = 0.95
    })
    
    local titleTween = TweenService:Create(titleBar, tweenInfo, {
        BackgroundTransparency = 0.2
    })
    
    local titleMaskTween = TweenService:Create(titleMask, tweenInfo, {
        BackgroundTransparency = 0.2
    })
    
    local strokeTween = TweenService:Create(stroke, tweenInfo, {
        Transparency = 0.85
    })
    
    local titleStrokeTween = TweenService:Create(titleStroke, tweenInfo, {
        Transparency = 0.9
    })
    
    sizeTween:Play()
    transparencyTween:Play()
    glassTween:Play()
    titleTween:Play()
    titleMaskTween:Play()
    strokeTween:Play()
    titleStrokeTween:Play()
    
    -- Fungsi untuk menutup window dengan animasi
    function window:Close()
        local closeInfo = TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In)
        
        local closeSizeTween = TweenService:Create(mainFrame, closeInfo, {
            Size = UDim2.new(0, 0, 0, 0)
        })
        
        local closeTransparencyTween = TweenService:Create(mainFrame, closeInfo, {
            BackgroundTransparency = 1
        })
        
        closeSizeTween:Play()
        closeTransparencyTween:Play()
        
        closeSizeTween.Completed:Connect(function()
            blur:Destroy()
            screenGui:Destroy()
        end)
    end
    
    -- Drag functionality
    local dragging, dragInput, dragStart, startPos
    
    titleBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = mainFrame.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    
    titleBar.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)
    
    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            mainFrame.Position = UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset + delta.Y
            )
        end
    end)
    
    window.ScreenGui = screenGui
    window.MainFrame = mainFrame
    window.TitleBar = titleBar
    window.Blur = blur
    
    return window
end

return UILibrary
