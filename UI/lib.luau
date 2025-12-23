-- Luau UI Library Base dengan Animasi Zoom Out & Glass Effect
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
    
    -- Main Frame (Window) dengan Glass Effect
    local mainFrame = Instance.new("Frame")
    mainFrame.Name = "MainWindow"
    mainFrame.Size = config.Size
    mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    mainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    mainFrame.BackgroundTransparency = 0.4
    mainFrame.BorderSizePixel = 0
    mainFrame.ClipsDescendants = true
    mainFrame.Parent = screenGui
    
    -- UICorner untuk rounded corners
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 12)
    corner.Parent = mainFrame
    
    -- Blur Effect hanya untuk UI (BackgroundBlur)
    local blurEffect = Instance.new("ImageLabel")
    blurEffect.Name = "BlurEffect"
    blurEffect.Size = UDim2.new(1, 0, 1, 0)
    blurEffect.Position = UDim2.new(0, 0, 0, 0)
    blurEffect.BackgroundTransparency = 1
    blurEffect.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
    blurEffect.ImageTransparency = 0.5
    blurEffect.ScaleType = Enum.ScaleType.Tile
    blurEffect.TileSize = UDim2.new(0, 128, 0, 128)
    blurEffect.ZIndex = 1
    blurEffect.Parent = mainFrame
    
    local blurCorner = Instance.new("UICorner")
    blurCorner.CornerRadius = UDim.new(0, 12)
    blurCorner.Parent = blurEffect
    
    -- Glass Effect Overlay (shimmer/shine effect)
    local glassOverlay = Instance.new("Frame")
    glassOverlay.Name = "GlassOverlay"
    glassOverlay.Size = UDim2.new(1, 0, 1, 0)
    glassOverlay.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    glassOverlay.BackgroundTransparency = 0.97
    glassOverlay.BorderSizePixel = 0
    glassOverlay.ZIndex = 2
    glassOverlay.Parent = mainFrame
    
    local glassCorner = Instance.new("UICorner")
    glassCorner.CornerRadius = UDim.new(0, 12)
    glassCorner.Parent = glassOverlay
    
    -- Gradient untuk glass effect yang lebih realistic
    local gradient = Instance.new("UIGradient")
    gradient.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.95),
        NumberSequenceKeypoint.new(0.5, 0.98),
        NumberSequenceKeypoint.new(1, 0.95)
    })
    gradient.Rotation = 45
    gradient.Parent = glassOverlay
    
    -- Border/Stroke untuk Glass effect
    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(255, 255, 255)
    stroke.Transparency = 0.7
    stroke.Thickness = 1.5
    stroke.Parent = mainFrame
    
    -- Shadow effect
    local shadowHolder = Instance.new("Frame")
    shadowHolder.Name = "ShadowHolder"
    shadowHolder.Size = UDim2.new(1, 50, 1, 50)
    shadowHolder.Position = UDim2.new(0, -25, 0, -25)
    shadowHolder.BackgroundTransparency = 1
    shadowHolder.ZIndex = 0
    shadowHolder.Parent = mainFrame
    
    local shadow = Instance.new("ImageLabel")
    shadow.Name = "Shadow"
    shadow.Size = UDim2.new(1, 0, 1, 0)
    shadow.BackgroundTransparency = 1
    shadow.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
    shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
    shadow.ImageTransparency = 0.5
    shadow.ScaleType = Enum.ScaleType.Slice
    shadow.SliceCenter = Rect.new(10, 10, 118, 118)
    shadow.Parent = shadowHolder
    
    -- Title Bar dengan Glass Effect
    local titleBar = Instance.new("Frame")
    titleBar.Name = "TitleBar"
    titleBar.Size = UDim2.new(1, 0, 0, 45)
    titleBar.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    titleBar.BackgroundTransparency = 0.3
    titleBar.BorderSizePixel = 0
    titleBar.ZIndex = 3
    titleBar.Parent = mainFrame
    
    local titleCorner = Instance.new("UICorner")
    titleCorner.CornerRadius = UDim.new(0, 12)
    titleCorner.Parent = titleBar
    
    local titleStroke = Instance.new("UIStroke")
    titleStroke.Color = Color3.fromRGB(255, 255, 255)
    titleStroke.Transparency = 0.85
    titleStroke.Thickness = 1
    titleStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    titleStroke.Parent = titleBar
    
    -- Mask untuk memotong bagian bawah title bar agar tidak rounded
    local titleMask = Instance.new("Frame")
    titleMask.Size = UDim2.new(1, 0, 0, 12)
    titleMask.Position = UDim2.new(0, 0, 1, -12)
    titleMask.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    titleMask.BackgroundTransparency = 0.3
    titleMask.BorderSizePixel = 0
    titleMask.ZIndex = 3
    titleMask.Parent = titleBar
    
    -- Animasi Zoom Out saat window muncul
    mainFrame.Size = UDim2.new(0, 0, 0, 0)
    mainFrame.BackgroundTransparency = 1
    glassOverlay.BackgroundTransparency = 1
    titleBar.BackgroundTransparency = 1
    titleMask.BackgroundTransparency = 1
    stroke.Transparency = 1
    titleStroke.Transparency = 1
    blurEffect.ImageTransparency = 1
    
    local tweenInfo = TweenInfo.new(
        config.AnimationDuration,
        Enum.EasingStyle.Back,
        Enum.EasingDirection.Out
    )
    
    local sizeTween = TweenService:Create(mainFrame, tweenInfo, {
        Size = config.Size
    })
    
    local transparencyTween = TweenService:Create(mainFrame, tweenInfo, {
        BackgroundTransparency = 0.4
    })
    
    local glassTween = TweenService:Create(glassOverlay, tweenInfo, {
        BackgroundTransparency = 0.97
    })
    
    local titleTween = TweenService:Create(titleBar, tweenInfo, {
        BackgroundTransparency = 0.3
    })
    
    local titleMaskTween = TweenService:Create(titleMask, tweenInfo, {
        BackgroundTransparency = 0.3
    })
    
    local strokeTween = TweenService:Create(stroke, tweenInfo, {
        Transparency = 0.7
    })
    
    local titleStrokeTween = TweenService:Create(titleStroke, tweenInfo, {
        Transparency = 0.85
    })
    
    local blurTween = TweenService:Create(blurEffect, tweenInfo, {
        ImageTransparency = 0.5
    })
    
    sizeTween:Play()
    transparencyTween:Play()
    glassTween:Play()
    titleTween:Play()
    titleMaskTween:Play()
    strokeTween:Play()
    titleStrokeTween:Play()
    blurTween:Play()
    
    -- Fungsi untuk menutup window dengan animasi
    function window:Close()
        local closeInfo = TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In)
        
        local closeSizeTween = TweenService:Create(mainFrame, closeInfo, {
            Size = UDim2.new(0, 0, 0, 0)
        })
        
        local closeTransparencyTween = TweenService:Create(mainFrame, closeInfo, {
            BackgroundTransparency = 1
        })
        
        local closeGlassTween = TweenService:Create(glassOverlay, closeInfo, {
            BackgroundTransparency = 1
        })
        
        local closeStrokeTween = TweenService:Create(stroke, closeInfo, {
            Transparency = 1
        })
        
        closeSizeTween:Play()
        closeTransparencyTween:Play()
        closeGlassTween:Play()
        closeStrokeTween:Play()
        
        closeSizeTween.Completed:Connect(function()
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
    
    return window
end

return UILibrary
