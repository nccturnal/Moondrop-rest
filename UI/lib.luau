local MoondropLib = {}
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
function MoondropLib:CreateWindow()
    local Window = {}
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "MoondropHub"
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.Parent = game.CoreGui
    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Size = UDim2.new(0, 0, 0, 0)
    MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    MainFrame.BackgroundColor3 = Color3.fromHex("#18181b")
    MainFrame.BorderSizePixel = 0
    MainFrame.Parent = ScreenGui
    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 20)
    Corner.Parent = MainFrame
    local Border = Instance.new("UIStroke")
    Border.Color = Color3.fromRGB(107, 45, 232)
    Border.Thickness = 2
    Border.Parent = MainFrame
    local Gradient = Instance.new("UIGradient")
    Gradient.Color = ColorSequence.new {
        ColorSequenceKeypoint.new(0, Color3.fromRGB(10, 20, 40)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 35, 60))
    }
    Gradient.Rotation = 45
    Gradient.Parent = MainFrame
    local TopLabel1 = Instance.new("TextLabel")
    TopLabel1.Name = "TopLabel1"
    TopLabel1.Size = UDim2.new(0, 200, 0, 30)
    TopLabel1.Position = UDim2.new(0, 15, 0, 10)
    TopLabel1.BackgroundTransparency = 1
    TopLabel1.Text = "MOONDROP"
    TopLabel1.TextColor3 = Color3.fromRGB(200, 200, 200)
    TopLabel1.Font = Enum.Font.GothamBold
    TopLabel1.TextSize = 14
    TopLabel1.TextXAlignment = Enum.TextXAlignment.Left
    TopLabel1.Parent = MainFrame
    local TopLabel2 = Instance.new("TextLabel")
    TopLabel2.Name = "TopLabel2"
    TopLabel2.Size = UDim2.new(0, 200, 0, 30)
    TopLabel2.Position = UDim2.new(0, 98, 0, 10)
    TopLabel2.BackgroundTransparency = 1
    TopLabel2.Text = "HUB"
    TopLabel2.TextColor3 = Color3.fromRGB(150, 100, 255)
    TopLabel2.Font = Enum.Font.GothamBold
    TopLabel2.TextSize = 14
    TopLabel2.TextXAlignment = Enum.TextXAlignment.Left
    TopLabel2.Parent = MainFrame
    local TitleGlow1 = Instance.new("TextLabel")
    TitleGlow1.Name = "TitleGlow1"
    TitleGlow1.Size = UDim2.new(1, 0, 0, 60)
    TitleGlow1.Position = UDim2.new(0, 2, 0, 102)
    TitleGlow1.BackgroundTransparency = 1
    TitleGlow1.Text = "MOONDROP"
    TitleGlow1.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleGlow1.Font = Enum.Font.GothamBold
    TitleGlow1.TextSize = 40
    TitleGlow1.TextTransparency = 0.7
    TitleGlow1.Parent = MainFrame
    local TitleGlow2 = Instance.new("TextLabel")
    TitleGlow2.Name = "TitleGlow2"
    TitleGlow2.Size = UDim2.new(1, 0, 0, 60)
    TitleGlow2.Position = UDim2.new(0, 0, 0, 100)
    TitleGlow2.BackgroundTransparency = 1
    TitleGlow2.Text = "MOONDROP"
    TitleGlow2.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleGlow2.Font = Enum.Font.GothamBold
    TitleGlow2.TextSize = 40
    TitleGlow2.TextTransparency = 0.5
    TitleGlow2.Parent = MainFrame
    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Name = "TitleLabel"
    TitleLabel.Size = UDim2.new(1, 0, 0, 60)
    TitleLabel.Position = UDim2.new(0, 0, 0, 100)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Text = "MOONDROP"
    TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.TextSize = 40
    TitleLabel.Parent = MainFrame
    local KeyLabel = Instance.new("TextLabel")
    KeyLabel.Name = "KeyLabel"
    KeyLabel.Size = UDim2.new(0, 250, 0, 20)
    KeyLabel.Position = UDim2.new(0.5, -125, 0, 210)
    KeyLabel.BackgroundTransparency = 1
    KeyLabel.Text = "LICENSE KEY"
    KeyLabel.TextColor3 = Color3.fromRGB(100, 100, 120)
    KeyLabel.Font = Enum.Font.Gotham
    KeyLabel.TextSize = 12
    KeyLabel.TextXAlignment = Enum.TextXAlignment.Left
    KeyLabel.Parent = MainFrame
    local KeyBox = Instance.new("TextBox")
    KeyBox.Name = "KeyBox"
    KeyBox.Size = UDim2.new(0, 250, 0, 40)
    KeyBox.Position = UDim2.new(0.5, -125, 0, 240)
    KeyBox.BackgroundColor3 = Color3.fromRGB(25, 35, 55)
    KeyBox.BorderSizePixel = 0
    KeyBox.Text = ""
    KeyBox.PlaceholderText = "Enter your key..."
    KeyBox.PlaceholderColor3 = Color3.fromRGB(100, 100, 120)
    KeyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    KeyBox.Font = Enum.Font.Gotham
    KeyBox.TextSize = 14
    KeyBox.Parent = MainFrame
    local KeyCorner = Instance.new("UICorner")
    KeyCorner.CornerRadius = UDim.new(0, 5)
    KeyCorner.Parent = KeyBox
    local SignInButton = Instance.new("TextButton")
    SignInButton.Name = "SignInButton"
    SignInButton.Size = UDim2.new(0, 250, 0, 40)
    SignInButton.Position = UDim2.new(0.5, -125, 0, 295)
    SignInButton.BackgroundColor3 = Color3.fromRGB(150, 100, 255)
    SignInButton.BorderSizePixel = 0
    SignInButton.Text = "Sign in"
    SignInButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    SignInButton.Font = Enum.Font.GothamBold
    SignInButton.TextSize = 14
    SignInButton.AutoButtonColor = false
    SignInButton.Parent = MainFrame
    local ButtonCorner = Instance.new("UICorner")
    ButtonCorner.CornerRadius = UDim.new(0, 5)
    ButtonCorner.Parent = SignInButton
    SignInButton.MouseEnter:Connect(function()
        TweenService:Create(SignInButton, TweenInfo.new(0.2), {
            BackgroundColor3 = Color3.fromRGB(170, 120, 255)
        }):Play()
    end)
    SignInButton.MouseLeave:Connect(function()
        TweenService:Create(SignInButton, TweenInfo.new(0.2), {
            BackgroundColor3 = Color3.fromRGB(150, 100, 255)
        }):Play()
    end)
    local MadeByLabel = Instance.new("TextLabel")
    MadeByLabel.Size = UDim2.new(0, 200, 0, 20)
    MadeByLabel.Position = UDim2.new(1, -210, 1, -25)
    MadeByLabel.BackgroundTransparency = 1
    MadeByLabel.Text = "Developer : gerr"
    MadeByLabel.TextColor3 = Color3.fromRGB(120, 120, 140)
    MadeByLabel.Font = Enum.Font.Gotham
    MadeByLabel.TextSize = 11
    MadeByLabel.TextXAlignment = Enum.TextXAlignment.Right
    MadeByLabel.Parent = MainFrame
    local IntroSound = Instance.new("Sound")
    IntroSound.SoundId = "rbxassetid://89448608302300"
    IntroSound.Volume = 0.5
    IntroSound.Parent = ScreenGui
    IntroSound:Play()
    TweenService:Create(MainFrame, TweenInfo.new(
        0.6,
        Enum.EasingStyle.Back,
        Enum.EasingDirection.Out
    ), {
        Size = UDim2.new(0, 600, 0, 400)
    }):Play()
    local dragging, dragStart, startPos
    MainFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = MainFrame.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            MainFrame.Position = UDim2.new(
                startPos.X.Scale, startPos.X.Offset + delta.X,
                startPos.Y.Scale, startPos.Y.Offset + delta.Y
            )
        end
    end)
    local function CreateGameSelectionUI()
        local SelectGameLabel = Instance.new("TextLabel")
        SelectGameLabel.Name = "SelectGameLabel"
        SelectGameLabel.Size = UDim2.new(0, 280, 0, 30)
        SelectGameLabel.Position = UDim2.new(0, 20, 0, 60)
        SelectGameLabel.BackgroundTransparency = 1
        SelectGameLabel.Text = "Select a game"
        SelectGameLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
        SelectGameLabel.Font = Enum.Font.GothamBold
        SelectGameLabel.TextSize = 16
        SelectGameLabel.TextXAlignment = Enum.TextXAlignment.Left
        SelectGameLabel.Visible = false
        SelectGameLabel.Parent = MainFrame
        local GamesFrame = Instance.new("ScrollingFrame")
        GamesFrame.Name = "GamesFrame"
        GamesFrame.Size = UDim2.new(0, 280, 0, 280)
        GamesFrame.Position = UDim2.new(0, 20, 0, 95)
        GamesFrame.BackgroundColor3 = Color3.fromRGB(20, 25, 35)
        GamesFrame.BorderSizePixel = 0
        GamesFrame.ScrollBarThickness = 6
        GamesFrame.ScrollBarImageColor3 = Color3.fromRGB(150, 100, 255)
        GamesFrame.Visible = false
        GamesFrame.Parent = MainFrame
        local GamesFrameCorner = Instance.new("UICorner")
        GamesFrameCorner.CornerRadius = UDim.new(0, 10)
        GamesFrameCorner.Parent = GamesFrame
        _G.MoondropGamesLayout = Instance.new("UIListLayout")
        local GamesLayout = _G.MoondropGamesLayout
        GamesLayout.Padding = UDim.new(0, 10)
        GamesLayout.SortOrder = Enum.SortOrder.LayoutOrder
        GamesLayout.Parent = GamesFrame
        local GamesPadding = Instance.new("UIPadding")
        GamesPadding.PaddingTop = UDim.new(0, 10)
        GamesPadding.PaddingBottom = UDim.new(0, 10)
        GamesPadding.PaddingLeft = UDim.new(0, 10)
        GamesPadding.PaddingRight = UDim.new(0, 10)
        GamesPadding.Parent = GamesFrame
        local LoadButton = Instance.new("TextButton")
        LoadButton.Name = "LoadButton"
        LoadButton.Size = UDim2.new(0, 260, 0, 45)
        LoadButton.Position = UDim2.new(0, 320, 0, 95)
        LoadButton.BackgroundColor3 = Color3.fromRGB(150, 100, 255)
        LoadButton.BorderSizePixel = 0
        LoadButton.Text = "Load"
        LoadButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        LoadButton.Font = Enum.Font.GothamBold
        LoadButton.TextSize = 16
        LoadButton.AutoButtonColor = false
        LoadButton.Visible = false
        LoadButton.Parent = MainFrame
        local LoadButtonCorner = Instance.new("UICorner")
        LoadButtonCorner.CornerRadius = UDim.new(0, 8)
        LoadButtonCorner.Parent = LoadButton
        LoadButton.MouseEnter:Connect(function()
            TweenService:Create(LoadButton, TweenInfo.new(0.2), {
                BackgroundColor3 = Color3.fromRGB(170, 120, 255)
            }):Play()
        end)
        LoadButton.MouseLeave:Connect(function()
            TweenService:Create(LoadButton, TweenInfo.new(0.2), {
                BackgroundColor3 = Color3.fromRGB(150, 100, 255)
            }):Play()
        end)
        return SelectGameLabel, GamesFrame, LoadButton
    end
    local NotificationHolder = Instance.new("Frame")
    NotificationHolder.Size = UDim2.new(0, 300, 1, -20)
    NotificationHolder.Position = UDim2.new(1, -310, 0, 10)
    NotificationHolder.BackgroundTransparency = 1
    NotificationHolder.Parent = MainFrame
    local NotifLayout = Instance.new("UIListLayout")
    NotifLayout.Padding = UDim.new(0, 10)
    NotifLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
    NotifLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
    NotifLayout.Parent = NotificationHolder
    local function Notify(text, notifType)
        notifType = notifType or "info"
        local colors = {
            success = Color3.fromRGB(120, 255, 170),
            error   = Color3.fromRGB(255, 120, 120),
            info    = Color3.fromRGB(170, 170, 255)
        }
        local notif = Instance.new("Frame")
        notif.Size = UDim2.new(1, 0, 0, 45)
        notif.BackgroundColor3 = Color3.fromRGB(30, 35, 45)
        notif.BackgroundTransparency = 0
        notif.BorderSizePixel = 0
        notif.Parent = NotificationHolder
        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 8)
        corner.Parent = notif
        local stroke = Instance.new("UIStroke")
        stroke.Color = colors[notifType]
        stroke.Transparency = 0.3
        stroke.Parent = notif
        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(1, -20, 1, 0)
        label.Position = UDim2.new(0, 10, 0, 0)
        label.BackgroundTransparency = 1
        label.TextWrapped = true
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.Text = text
        label.Font = Enum.Font.Gotham
        label.TextSize = 13
        label.TextColor3 = Color3.fromRGB(255, 255, 255)
        label.Parent = notif
        notif.BackgroundTransparency = 1
        label.TextTransparency = 1
        stroke.Transparency = 1
        TweenService:Create(notif, TweenInfo.new(0.25), {
            BackgroundTransparency = 0
        }):Play()
        TweenService:Create(label, TweenInfo.new(0.25), {
            TextTransparency = 0
        }):Play()
        TweenService:Create(stroke, TweenInfo.new(0.25), {
            Transparency = 0.3
        }):Play()
        task.delay(3, function()
            TweenService:Create(notif, TweenInfo.new(0.25), {
                BackgroundTransparency = 1
            }):Play()
            TweenService:Create(label, TweenInfo.new(0.25), {
                TextTransparency = 1
            }):Play()
            TweenService:Create(stroke, TweenInfo.new(0.25), {
                Transparency = 1
            }):Play()
            task.wait(0.3)
            notif:Destroy()
        end)
    end
    local SelectGameLabel, GamesFrame, LoadButton = CreateGameSelectionUI()
    function Window:SetKey(key)
        SignInButton.MouseButton1Click:Connect(function()
            if KeyBox.Text == key then
                local t = TweenInfo.new(0.3)
                TweenService:Create(TitleGlow1, t, { TextTransparency = 1 }):Play()
                TweenService:Create(TitleGlow2, t, { TextTransparency = 1 }):Play()
                TweenService:Create(TitleLabel, t, { TextTransparency = 1 }):Play()
                TweenService:Create(KeyLabel, t, { TextTransparency = 1 }):Play()
                TweenService:Create(KeyBox, t, { TextTransparency = 1, BackgroundTransparency = 1 }):Play()
                TweenService:Create(SignInButton, t, { TextTransparency = 1, BackgroundTransparency = 1 }):Play()
                task.wait(0.3)
                KeyLabel.Visible = false
                KeyBox.Visible = false
                SignInButton.Visible = false
                TitleGlow1.Visible = false
                TitleGlow2.Visible = false
                TitleLabel.Visible = false
                SelectGameLabel.Visible = true
                GamesFrame.Visible = true
                LoadButton.Visible = true
                SelectGameLabel.TextTransparency = 1
                LoadButton.TextTransparency = 1
                LoadButton.BackgroundTransparency = 1
                TweenService:Create(SelectGameLabel, t, { TextTransparency = 0 }):Play()
                TweenService:Create(LoadButton, t, { TextTransparency = 0, BackgroundTransparency = 0 }):Play()
            else
                for _ = 1, 3 do
                    MainFrame.Position += UDim2.new(0, 10, 0, 0)
                    task.wait(0.05)
                    MainFrame.Position -= UDim2.new(0, 20, 0, 0)
                    task.wait(0.05)
                    MainFrame.Position += UDim2.new(0, 10, 0, 0)
                end
            end
        end)
    end
    function Window:AddGame(gameName, gameId, imageId, scriptUrl)
        local isSelected = false
        local GameButton = Instance.new("TextButton")
        GameButton.Name = gameName
        GameButton.Size = UDim2.new(1, -20, 0, 80)
        GameButton.BackgroundColor3 = Color3.fromRGB(30, 35, 45)
        GameButton.BorderSizePixel = 0
        GameButton.Text = ""
        GameButton.AutoButtonColor = false
        GameButton.Parent = GamesFrame
        local GameCorner = Instance.new("UICorner")
        GameCorner.CornerRadius = UDim.new(0, 8)
        GameCorner.Parent = GameButton
        local GameImage = Instance.new("ImageLabel")
        GameImage.Size = UDim2.new(0, 70, 0, 70)
        GameImage.Position = UDim2.new(0, 5, 0, 5)
        GameImage.BackgroundColor3 = Color3.fromRGB(40, 45, 55)
        GameImage.BorderSizePixel = 0
        GameImage.Image = imageId or "rbxasset://textures/ui/GuiImagePlaceholder.png"
        GameImage.ScaleType = Enum.ScaleType.Fit
        GameImage.Parent = GameButton
        local ImageCorner = Instance.new("UICorner")
        ImageCorner.CornerRadius = UDim.new(0, 6)
        ImageCorner.Parent = GameImage
        local GameNameLabel = Instance.new("TextLabel")
        GameNameLabel.Size = UDim2.new(1, -85, 1, 0)
        GameNameLabel.Position = UDim2.new(0, 85, 0, 0)
        GameNameLabel.BackgroundTransparency = 1
        GameNameLabel.Text = gameName
        GameNameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        GameNameLabel.Font = Enum.Font.GothamBold
        GameNameLabel.TextSize = 14
        GameNameLabel.TextXAlignment = Enum.TextXAlignment.Left
        GameNameLabel.Parent = GameButton
        GameButton:SetAttribute("ScriptUrl", scriptUrl or "")
        GameButton:SetAttribute("Selected", false)
        GameButton.MouseEnter:Connect(function()
            if not GameButton:GetAttribute("LocalSelected") then
                TweenService:Create(GameButton, TweenInfo.new(0.2), {
                    BackgroundColor3 = Color3.fromRGB(40, 45, 55)
                }):Play()
            end
        end)
        GameButton.MouseLeave:Connect(function()
            if not GameButton:GetAttribute("LocalSelected") then
                TweenService:Create(GameButton, TweenInfo.new(0.2), {
                    BackgroundColor3 = Color3.fromRGB(30, 35, 45)
                }):Play()
            end
        end)
        GameButton.MouseButton1Click:Connect(function()
            for _, child in ipairs(GamesFrame:GetChildren()) do
                if child:IsA("TextButton") then
                    child:SetAttribute("Selected", false)
                    child.BackgroundColor3 = Color3.fromRGB(30, 35, 45)
                    child:SetAttribute("LocalSelected", false)
                end
            end
            isSelected = true
            GameButton:SetAttribute("Selected", true)
            GameButton:SetAttribute("LocalSelected", true)
            GameButton.BackgroundColor3 = Color3.fromRGB(150, 100, 255)
        end)
        task.wait() 
        GamesFrame.CanvasSize = UDim2.new(
            0, 0,
            0, _G.MoondropGamesLayout.AbsoluteContentSize.Y + 20
        )
    end
    LoadButton.MouseButton1Click:Connect(function()
        local selectedGame = nil
        for _, child in ipairs(GamesFrame:GetChildren()) do
            if child:IsA("TextButton") and child:GetAttribute("Selected") then
                selectedGame = child
                break
            end
        end
        if selectedGame then
            local scriptUrl = selectedGame:GetAttribute("ScriptUrl")
            if scriptUrl and scriptUrl ~= "" then
                Notify("Loading " .. selectedGame.Name .. "...", "info")
                local success, err = pcall(function()
                    loadstring(game:HttpGet(scriptUrl))()
                end)
                if success then
                    Notify(selectedGame.Name .. " loaded successfully!", "success")
                    ScreenGui:Destroy()
                else
                    Notify(
                        "Failed to load " .. selectedGame.Name .. ": " .. tostring(err),
                        "error"
                    )
                end
            else
                Notify("No script URL provided for " .. selectedGame.Name, "error")
            end
        else
            Notify("Please select a game first!", "error")
        end
    end)
    return Window
end
return MoondropLib
