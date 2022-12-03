local lib = { RainbowColorValue = 0, HueSelectionPosition = 0 }
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local PresetColor = Color3.fromRGB(44, 120, 224)
local CloseBind = Enum.KeyCode.RightControl

local ui = Instance.new("ScreenGui")
ui.Name = "ui"
ui.Parent = game.CoreGui
ui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

coroutine.wrap(
    function()
        while wait() do
            lib.RainbowColorValue = lib.RainbowColorValue + 1 / 255
            lib.HueSelectionPosition = lib.HueSelectionPosition + 1

            if lib.RainbowColorValue >= 1 then
                lib.RainbowColorValue = 0
            end

            if lib.HueSelectionPosition == 80 then
                lib.HueSelectionPosition = 0
            end
        end
    end
)()

local WhitelistedMouse = {Enum.UserInputType.MouseButton1, Enum.UserInputType.MouseButton2,Enum.UserInputType.MouseButton3}
local BlacklistedKeys = {Enum.KeyCode.Unknown,Enum.KeyCode.W,Enum.KeyCode.A,Enum.KeyCode.S,Enum.KeyCode.D,Enum.KeyCode.Up,Enum.KeyCode.Left,Enum.KeyCode.Down,Enum.KeyCode.Right,Enum.KeyCode.Slash,Enum.KeyCode.Tab,Enum.KeyCode.Backspace,Enum.KeyCode.Escape}

local function CheckKey(tab, key)
	for i, v in next, tab do
		if v == key then
			return true
		end
	end
end

local function MakeDraggable(topbarobject, object)
    local Dragging = nil
    local DragInput = nil
    local DragStart = nil
    local StartPosition = nil

    local function Update(input)
        local Delta = input.Position - DragStart
        local pos =
        UDim2.new(
            StartPosition.X.Scale,
            StartPosition.X.Offset + Delta.X,
            StartPosition.Y.Scale,
            StartPosition.Y.Offset + Delta.Y
        )
        object.Position = pos
    end

    topbarobject.InputBegan:Connect(
        function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                Dragging = true
                DragStart = input.Position
                StartPosition = object.Position

                input.Changed:Connect(
                    function()
                        if input.UserInputState == Enum.UserInputState.End then
                            Dragging = false
                        end
                    end
                )
            end
        end
    )

    topbarobject.InputChanged:Connect(
        function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement or
                input.UserInputType == Enum.UserInputType.Touch
            then
                DragInput = input
            end
        end
    )

    UserInputService.InputChanged:Connect(
        function(input)
            if input == DragInput and Dragging then
                Update(input)
            end
        end
    )
end

local NotificationsHolder = Instance.new("Frame")
local UIListLayout = Instance.new("UIListLayout")
NotificationsHolder.Name = "NotificationsHolder"
NotificationsHolder.Parent = ui
NotificationsHolder.AnchorPoint = Vector2.new(1, 1)
NotificationsHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
NotificationsHolder.BackgroundTransparency = 1.000
NotificationsHolder.Position = UDim2.new(1, -25, 1, -25)
NotificationsHolder.Size = UDim2.new(0, 300, 1, -25)

UIListLayout.Parent = NotificationsHolder
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
UIListLayout.Padding = UDim.new(0, 5)

function lib:Notif(NotificationConfig)
    spawn(function()
        NotificationConfig.Name = NotificationConfig.Name or "Notification"
        NotificationConfig.Content = NotificationConfig.Content or "Test"
        NotificationConfig.Image = NotificationConfig.Image or "rbxassetid://4384403532"
        NotificationConfig.Time = NotificationConfig.Time or 15

        local Notify = Instance.new("Frame")
        local UICorner = Instance.new("UICorner")
        local UIPadding = Instance.new("UIPadding")
        local Icon = Instance.new("ImageLabel")
        local Label = Instance.new("TextLabel")
        local Title = Instance.new("TextLabel")


        Notify.Name = "Notify"
        Notify.Parent = NotificationsHolder
        Notify.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        Notify.Position = UDim2.new(0, 0, 0.870063722, 0)
        Notify.Size = UDim2.new(1, 0, 0, 0)
        Notify.AutomaticSize = Enum.AutomaticSize.Y

        UICorner.CornerRadius = UDim.new(0, 5)
        UICorner.Parent = Notify

        UIPadding.Parent = Notify
        UIPadding.PaddingBottom = UDim.new(0, 12)
        UIPadding.PaddingLeft = UDim.new(0, 12)
        UIPadding.PaddingRight = UDim.new(0, 12)
        UIPadding.PaddingTop = UDim.new(0, 12)

        Icon.Name = "Icon"
        Icon.Parent = Notify
        Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Icon.BackgroundTransparency = 1.000
        Icon.BorderSizePixel = 0
        Icon.Size = UDim2.new(0, 20, 0, 20)
        Icon.ImageColor3 = Color3.fromRGB(240, 240, 240)
        Icon.Image = NotificationConfig.Image

        Label.Name = "Label"
        Label.Parent = Notify
        Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Label.BackgroundTransparency = 1.000
        Label.BorderSizePixel = 0
        Label.Position = UDim2.new(0, 30, 0, 0)
        Label.Size = UDim2.new(1, -30, 0, 20)
        Label.Font = Enum.Font.Gotham
        Label.TextColor3 = Color3.fromRGB(76, 76, 76)
        Label.TextSize = 15.000
        Label.TextXAlignment = Enum.TextXAlignment.Left
        Label.Text = NotificationConfig.Name

        Title.Name = "Title"
        Title.Parent = Notify
        Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Title.BackgroundTransparency = 1.000
        Title.BorderSizePixel = 0
        Title.Position = UDim2.new(0, 0, 0, 25)
        Title.Size = UDim2.new(1, 0, 0, 0)
        Title.Font = Enum.Font.GothamBold
        Title.TextColor3 = Color3.fromRGB(200, 200, 200)
        Title.TextSize = 14.000
        Title.TextWrapped = true
        Title.TextXAlignment = Enum.TextXAlignment.Left
        Title.AutomaticSize = Enum.AutomaticSize.Y
        Title.Text = NotificationConfig.Content

        TweenService:Create(Notify, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { Position = UDim2.new(0, 0, 0, 0) }):
            Play()

        wait(NotificationConfig.Time - 0.88)
        TweenService:Create(Icon, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { ImageTransparency = 1 }):Play()
        TweenService:Create(Notify, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { BackgroundTransparency = 1 }):Play()
        TweenService:Create(Label, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { TextTransparency = 1 }):Play()
        TweenService:Create(Title, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { TextTransparency = 1 }):Play()
        wait(0.6)
        Notify:Destroy()
    end)
end

function lib:Window(text, preset, closebind)
    CloseBind = closebind or Enum.KeyCode.RightControl
    PresetColor = preset or Color3.fromRGB(44, 120, 224)
    fs = false
    local Main = Instance.new("Frame")
    local TabHold = Instance.new("Frame")
    local TabHoldLayout = Instance.new("UIListLayout")
    local Title = Instance.new("TextLabel")
    local TabFolder = Instance.new("Folder")
    local DragFrame = Instance.new("Frame")

    Main.Name = "Main"
    Main.Parent = ui
    Main.AnchorPoint = Vector2.new(0.5, 0.5)
    Main.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Main.BorderSizePixel = 0
    Main.Position = UDim2.new(0.5, 0, 0.5, 0)
    Main.Size = UDim2.new(0, 0, 0, 0)
    Main.ClipsDescendants = true
    Main.Visible = true

    TabHold.Name = "TabHold"
    TabHold.Parent = Main
    TabHold.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TabHold.BackgroundTransparency = 1.000
    TabHold.Position = UDim2.new(0.0339285731, 0, 0.147335425, 0)
    TabHold.Size = UDim2.new(0, 107, 0, 254)

    TabHoldLayout.Name = "TabHoldLayout"
    TabHoldLayout.Parent = TabHold
    TabHoldLayout.SortOrder = Enum.SortOrder.LayoutOrder
    TabHoldLayout.Padding = UDim.new(0, 11)

    Title.Name = "Title"
    Title.Parent = Main
    Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Title.BackgroundTransparency = 1.000
    Title.Position = UDim2.new(0.0339285731, 0, 0.0564263314, 0)
    Title.Size = UDim2.new(0, 200, 0, 23)
    Title.Font = Enum.Font.GothamSemibold
    Title.Text = text
    Title.TextColor3 = Color3.fromRGB(68, 68, 68)
    Title.TextSize = 12.000
    Title.TextXAlignment = Enum.TextXAlignment.Left

    DragFrame.Name = "DragFrame"
    DragFrame.Parent = Main
    DragFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    DragFrame.BackgroundTransparency = 1.000
    DragFrame.Size = UDim2.new(0, 560, 0, 41)

    local HideFrame = Instance.new("Frame")

    HideFrame.Name = "Main"
    HideFrame.Parent = Main
    HideFrame.BackgroundColor3 = PresetColor
    HideFrame.BorderSizePixel = 0
    HideFrame.ClipsDescendants = true
    HideFrame.Position = UDim2.new(0, 0, 0, 0)
    HideFrame.Size = UDim2.new(1, 0, 1, 0)
    HideFrame.ZIndex = 100
    TweenService:Create(HideFrame, TweenInfo.new(0.5), { BackgroundTransparency = 0 }):Play()
    wait(0.5)
    TweenService:Create(HideFrame, TweenInfo.new(0.3), { BackgroundTransparency = 1 }):Play()

    Main:TweenSize(UDim2.new(0, 560, 0, 319), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .6, true)

    MakeDraggable(DragFrame, Main)

    local uitoggled = false
    UserInputService.InputBegan:Connect(
        function(io, p)
            if io.KeyCode == CloseBind then
                if uitoggled == false then
                    TweenService:Create(HideFrame, TweenInfo.new(0.5), { BackgroundTransparency = 0 }):Play()
                    uitoggled = true
                    wait(0.5)
                    Main.Visible = false
                else
                    Main.Visible = true
                    TweenService:Create(HideFrame, TweenInfo.new(0.3), { BackgroundTransparency = 1 }):Play()
                    uitoggled = false
                end
            end
        end
    )

    TabFolder.Name = "TabFolder"
    TabFolder.Parent = Main

    function lib:ChangePresetColor(toch)
        PresetColor = toch
    end

    function lib:Modal(texttitle, textdesc, textbtn)
        local NotificationHold = Instance.new("TextButton")
        local NotificationFrame = Instance.new("Frame")
        local OkayBtn = Instance.new("TextButton")
        local OkayBtnCorner = Instance.new("UICorner")
        local OkayBtnTitle = Instance.new("TextLabel")
        local NotificationTitle = Instance.new("TextLabel")
        local NotificationDesc = Instance.new("TextLabel")

        NotificationHold.Name = "NotificationHold"
        NotificationHold.Parent = Main
        NotificationHold.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        NotificationHold.BackgroundTransparency = 1.000
        NotificationHold.BorderSizePixel = 0
        NotificationHold.Size = UDim2.new(0, 560, 0, 319)
        NotificationHold.AutoButtonColor = false
        NotificationHold.Font = Enum.Font.SourceSans
        NotificationHold.Text = ""
        NotificationHold.TextColor3 = Color3.fromRGB(0, 0, 0)
        NotificationHold.TextSize = 14.000

        TweenService:Create(
            NotificationHold,
            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            { BackgroundTransparency = 0.7 }
        ):Play()
        wait(0.4)

        NotificationFrame.Name = "NotificationFrame"
        NotificationFrame.Parent = NotificationHold
        NotificationFrame.AnchorPoint = Vector2.new(0.5, 0.5)
        NotificationFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        NotificationFrame.BorderSizePixel = 0
        NotificationFrame.Size = UDim2.new(0, 164, 0, 193)
        NotificationFrame.ClipsDescendants = true
        NotificationFrame.Position = UDim2.new(0.3, 0, 0.5, 0)

        NotificationFrame:TweenPosition(UDim2.new(0.3, 0, 0.5, 0), "Out", "Quad", 0.3, true)

        OkayBtn.Name = "OkayBtn"
        OkayBtn.Parent = NotificationFrame
        OkayBtn.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
        OkayBtn.Position = UDim2.new(0.0609756112, 0, 0.720207274, 0)
        OkayBtn.Size = UDim2.new(0, 144, 0, 42)
        OkayBtn.AutoButtonColor = false
        OkayBtn.Font = Enum.Font.SourceSans
        OkayBtn.Text = ""
        OkayBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
        OkayBtn.TextSize = 14.000

        OkayBtnCorner.CornerRadius = UDim.new(0, 5)
        OkayBtnCorner.Name = "OkayBtnCorner"
        OkayBtnCorner.Parent = OkayBtn

        OkayBtnTitle.Name = "OkayBtnTitle"
        OkayBtnTitle.Parent = OkayBtn
        OkayBtnTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        OkayBtnTitle.BackgroundTransparency = 1.000
        OkayBtnTitle.Position = UDim2.new(0.0763888881, 0, 0, 0)
        OkayBtnTitle.Size = UDim2.new(0, 181, 0, 42)
        OkayBtnTitle.Font = Enum.Font.Gotham
        OkayBtnTitle.Text = textbtn
        OkayBtnTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
        OkayBtnTitle.TextSize = 14.000
        OkayBtnTitle.TextXAlignment = Enum.TextXAlignment.Left

        NotificationTitle.Name = "NotificationTitle"
        NotificationTitle.Parent = NotificationFrame
        NotificationTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        NotificationTitle.BackgroundTransparency = 1.000
        NotificationTitle.Position = UDim2.new(0.0670731738, 0, 0.0829015523, 0)
        NotificationTitle.Size = UDim2.new(0, 143, 0, 26)
        NotificationTitle.Font = Enum.Font.Gotham
        NotificationTitle.Text = texttitle
        NotificationTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
        NotificationTitle.TextSize = 18.000
        NotificationTitle.TextXAlignment = Enum.TextXAlignment.Left

        NotificationDesc.Name = "NotificationDesc"
        NotificationDesc.Parent = NotificationFrame
        NotificationDesc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        NotificationDesc.BackgroundTransparency = 1.000
        NotificationDesc.Position = UDim2.new(0.0670000017, 0, 0.218999997, 0)
        NotificationDesc.Size = UDim2.new(0, 143, 0, 91)
        NotificationDesc.Font = Enum.Font.Gotham
        NotificationDesc.Text = textdesc
        NotificationDesc.TextColor3 = Color3.fromRGB(255, 255, 255)
        NotificationDesc.TextSize = 15.000
        NotificationDesc.TextWrapped = true
        NotificationDesc.TextXAlignment = Enum.TextXAlignment.Left
        NotificationDesc.TextYAlignment = Enum.TextYAlignment.Top

        OkayBtn.MouseEnter:Connect(
            function()
                TweenService:Create(
                    OkayBtn,
                    TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    { BackgroundColor3 = PresetColor }
                ):Play()
            end
        )

        OkayBtn.MouseLeave:Connect(
            function()
                TweenService:Create(
                    OkayBtn,
                    TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    { BackgroundColor3 = Color3.fromRGB(34, 34, 34) }
                ):Play()
            end
        )

        OkayBtn.MouseButton1Click:Connect(
            function()
                NotificationFrame:TweenSize(
                    UDim2.new(0, 0, 0, 0),
                    Enum.EasingDirection.Out,
                    Enum.EasingStyle.Quart,
                    .6,
                    true
                )

                wait(0.4)

                TweenService:Create(
                    NotificationHold,
                    TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    { BackgroundTransparency = 1 }
                ):Play()

                wait(.3)

                NotificationHold:Destroy()
            end
        )
    end

    local tabhold = {}
    function tabhold:Tab(text)
        local TabBtn = Instance.new("TextButton")
        local TabTitle = Instance.new("TextLabel")
        local TabBtnIndicator = Instance.new("Frame")
        local TabBtnIndicatorCorner = Instance.new("UICorner")

        TabBtn.Name = "TabBtn"
        TabBtn.Parent = TabHold
        TabBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TabBtn.BackgroundTransparency = 1.000
        TabBtn.Size = UDim2.new(0, 107, 0, 21)
        TabBtn.Font = Enum.Font.SourceSans
        TabBtn.Text = ""
        TabBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
        TabBtn.TextSize = 14.000

        TabTitle.Name = "TabTitle"
        TabTitle.Parent = TabBtn
        TabTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TabTitle.BackgroundTransparency = 1.000
        TabTitle.Size = UDim2.new(0, 107, 0, 21)
        TabTitle.Font = Enum.Font.Gotham
        TabTitle.Text = text
        TabTitle.TextColor3 = Color3.fromRGB(150, 150, 150)
        TabTitle.TextSize = 14.000
        TabTitle.TextXAlignment = Enum.TextXAlignment.Left

        TabBtnIndicator.Name = "TabBtnIndicator"
        TabBtnIndicator.Parent = TabBtn
        TabBtnIndicator.BackgroundColor3 = PresetColor
        TabBtnIndicator.BorderSizePixel = 0
        TabBtnIndicator.Position = UDim2.new(0, 0, 1, 0)
        TabBtnIndicator.Size = UDim2.new(0, 0, 0, 2)

        TabBtnIndicatorCorner.Name = "TabBtnIndicatorCorner"
        TabBtnIndicatorCorner.Parent = TabBtnIndicator

        coroutine.wrap(
            function()
                while wait() do
                    TabBtnIndicator.BackgroundColor3 = PresetColor
                end
            end
        )()

        local Tab = Instance.new("ScrollingFrame")
        local TabLayout = Instance.new("UIListLayout")

        Tab.Name = "Tab"
        Tab.Parent = TabFolder
        Tab.Active = true
        Tab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Tab.BackgroundTransparency = 1.000
        Tab.BorderSizePixel = 0
        Tab.Position = UDim2.new(0.31400001, 0, 0.147, 0)
        Tab.Size = UDim2.new(0, 373, 0, 254)
        Tab.CanvasSize = UDim2.new(0, 0, 0, 0)
        Tab.ScrollBarThickness = 3
        Tab.Visible = false

        TabLayout.Name = "TabLayout"
        TabLayout.Parent = Tab
        TabLayout.SortOrder = Enum.SortOrder.LayoutOrder
        TabLayout.Padding = UDim.new(0, 6)

        if fs == false then
            fs = true
            TabBtnIndicator.Size = UDim2.new(0, 13, 0, 2)
            TabTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
            Tab.Visible = true
        end

        spawn(function()
            while wait() do
                Tab.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)
            end
        end)

        Tab.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)

        TabBtn.MouseButton1Click:Connect(
            function()
                for i, v in next, TabFolder:GetChildren() do
                    if v.Name == "Tab" then
                        v.Visible = false
                    end
                    Tab.Visible = true
                end
                for i, v in next, TabHold:GetChildren() do
                    if v.Name == "TabBtn" then
                        v.TabBtnIndicator:TweenSize(
                            UDim2.new(0, 0, 0, 2),
                            Enum.EasingDirection.Out,
                            Enum.EasingStyle.Quart,
                            .2,
                            true
                        )
                        TabBtnIndicator:TweenSize(
                            UDim2.new(0, 13, 0, 2),
                            Enum.EasingDirection.Out,
                            Enum.EasingStyle.Quart,
                            .2,
                            true
                        )
                        TweenService:Create(
                            v.TabTitle,
                            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            { TextColor3 = Color3.fromRGB(150, 150, 150) }
                        ):Play()
                        TweenService:Create(
                            TabTitle,
                            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            { TextColor3 = Color3.fromRGB(255, 255, 255) }
                        ):Play()
                    end
                end
            end
        )
        local tabcontent = {}
        function tabcontent:Button(text, callback)
            local Button = Instance.new("TextButton")
            local ButtonCorner = Instance.new("UICorner")
            local ButtonTitle = Instance.new("TextLabel")

            Button.Name = "Button"
            Button.Parent = Tab
            Button.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
            Button.Size = UDim2.new(0, 363, 0, 42)
            Button.AutoButtonColor = false
            Button.Font = Enum.Font.SourceSans
            Button.Text = ""
            Button.TextColor3 = Color3.fromRGB(0, 0, 0)
            Button.TextSize = 14.000

            ButtonCorner.CornerRadius = UDim.new(0, 5)
            ButtonCorner.Name = "ButtonCorner"
            ButtonCorner.Parent = Button

            ButtonTitle.Name = "ButtonTitle"
            ButtonTitle.Parent = Button
            ButtonTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ButtonTitle.BackgroundTransparency = 1.000
            ButtonTitle.Position = UDim2.new(0.0358126722, 0, 0, 0)
            ButtonTitle.Size = UDim2.new(0, 187, 0, 42)
            ButtonTitle.Font = Enum.Font.Gotham
            ButtonTitle.Text = text
            ButtonTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
            ButtonTitle.TextSize = 14.000
            ButtonTitle.TextXAlignment = Enum.TextXAlignment.Left

            Button.MouseEnter:Connect(
                function()
                    TweenService:Create(
                        Button,
                        TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        { BackgroundColor3 = PresetColor }
                    ):Play()
                end
            )

            Button.MouseLeave:Connect(
                function()
                    TweenService:Create(
                        Button,
                        TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        { BackgroundColor3 = Color3.fromRGB(34, 34, 34) }
                    ):Play()
                end
            )

            Button.MouseButton1Click:Connect(
                function()
                    pcall(callback)
                end
            )

            Tab.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)
        end

        function tabcontent:Toggle(text, default, callback)
            local toggled = false

            local Toggle = Instance.new("TextButton")
            local ToggleCorner = Instance.new("UICorner")
            local ToggleTitle = Instance.new("TextLabel")
            local FrameToggle1 = Instance.new("Frame")
            local FrameToggle1Corner = Instance.new("UICorner")
            local FrameToggle2 = Instance.new("Frame")
            local FrameToggle2Corner = Instance.new("UICorner")
            local FrameToggle3 = Instance.new("Frame")
            local FrameToggle3Corner = Instance.new("UICorner")
            local FrameToggleCircle = Instance.new("Frame")
            local FrameToggleCircleCorner = Instance.new("UICorner")

            Toggle.Name = "Toggle"
            Toggle.Parent = Tab
            Toggle.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
            Toggle.Position = UDim2.new(0.215625003, 0, 0.446271926, 0)
            Toggle.Size = UDim2.new(0, 363, 0, 42)
            Toggle.AutoButtonColor = false
            Toggle.Font = Enum.Font.SourceSans
            Toggle.Text = ""
            Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
            Toggle.TextSize = 14.000

            ToggleCorner.CornerRadius = UDim.new(0, 5)
            ToggleCorner.Name = "ToggleCorner"
            ToggleCorner.Parent = Toggle

            ToggleTitle.Name = "ToggleTitle"
            ToggleTitle.Parent = Toggle
            ToggleTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ToggleTitle.BackgroundTransparency = 1.000
            ToggleTitle.Position = UDim2.new(0.0358126722, 0, 0, 0)
            ToggleTitle.Size = UDim2.new(0, 187, 0, 42)
            ToggleTitle.Font = Enum.Font.Gotham
            ToggleTitle.Text = text
            ToggleTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
            ToggleTitle.TextSize = 14.000
            ToggleTitle.TextXAlignment = Enum.TextXAlignment.Left

            FrameToggle1.Name = "FrameToggle1"
            FrameToggle1.Parent = Toggle
            FrameToggle1.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
            FrameToggle1.Position = UDim2.new(0.859504104, 0, 0.285714298, 0)
            FrameToggle1.Size = UDim2.new(0, 37, 0, 18)

            FrameToggle1Corner.Name = "FrameToggle1Corner"
            FrameToggle1Corner.Parent = FrameToggle1

            FrameToggle2.Name = "FrameToggle2"
            FrameToggle2.Parent = FrameToggle1
            FrameToggle2.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
            FrameToggle2.Position = UDim2.new(0.0489999987, 0, 0.0930000022, 0)
            FrameToggle2.Size = UDim2.new(0, 33, 0, 14)

            FrameToggle2Corner.Name = "FrameToggle2Corner"
            FrameToggle2Corner.Parent = FrameToggle2

            FrameToggle3.Name = "FrameToggle3"
            FrameToggle3.Parent = FrameToggle1
            FrameToggle3.BackgroundColor3 = PresetColor
            FrameToggle3.BackgroundTransparency = 1.000
            FrameToggle3.Size = UDim2.new(0, 37, 0, 18)

            FrameToggle3Corner.Name = "FrameToggle3Corner"
            FrameToggle3Corner.Parent = FrameToggle3

            FrameToggleCircle.Name = "FrameToggleCircle"
            FrameToggleCircle.Parent = FrameToggle1
            FrameToggleCircle.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
            FrameToggleCircle.Position = UDim2.new(0.127000004, 0, 0.222000003, 0)
            FrameToggleCircle.Size = UDim2.new(0, 10, 0, 10)

            FrameToggleCircleCorner.Name = "FrameToggleCircleCorner"
            FrameToggleCircleCorner.Parent = FrameToggleCircle

            coroutine.wrap(
                function()
                    while wait() do
                        FrameToggle3.BackgroundColor3 = PresetColor
                    end
                end
            )()

            Toggle.MouseButton1Click:Connect(
                function()
                    if toggled == false then
                        TweenService:Create(
                            Toggle,
                            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            { BackgroundColor3 = Color3.fromRGB(37, 37, 37) }
                        ):Play()
                        TweenService:Create(
                            FrameToggle1,
                            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            { BackgroundTransparency = 1 }
                        ):Play()
                        TweenService:Create(
                            FrameToggle2,
                            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            { BackgroundTransparency = 1 }
                        ):Play()
                        TweenService:Create(
                            FrameToggle3,
                            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            { BackgroundTransparency = 0 }
                        ):Play()
                        TweenService:Create(
                            FrameToggleCircle,
                            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            { BackgroundColor3 = Color3.fromRGB(255, 255, 255) }
                        ):Play()
                        FrameToggleCircle:TweenPosition(
                            UDim2.new(0.587, 0, 0.222000003, 0),
                            Enum.EasingDirection.Out,
                            Enum.EasingStyle.Quart,
                            .2,
                            true
                        )
                    else
                        TweenService:Create(
                            Toggle,
                            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            { BackgroundColor3 = Color3.fromRGB(34, 34, 34) }
                        ):Play()
                        TweenService:Create(
                            FrameToggle1,
                            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            { BackgroundTransparency = 0 }
                        ):Play()
                        TweenService:Create(
                            FrameToggle2,
                            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            { BackgroundTransparency = 0 }
                        ):Play()
                        TweenService:Create(
                            FrameToggle3,
                            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            { BackgroundTransparency = 1 }
                        ):Play()
                        TweenService:Create(
                            FrameToggleCircle,
                            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            { BackgroundColor3 = Color3.fromRGB(50, 50, 50) }
                        ):Play()
                        FrameToggleCircle:TweenPosition(
                            UDim2.new(0.127000004, 0, 0.222000003, 0),
                            Enum.EasingDirection.Out,
                            Enum.EasingStyle.Quart,
                            .2,
                            true
                        )
                    end
                    toggled = not toggled
                    pcall(callback, toggled)
                end
            )

            if default == true then
                TweenService:Create(
                    Toggle,
                    TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    { BackgroundColor3 = Color3.fromRGB(37, 37, 37) }
                ):Play()
                TweenService:Create(
                    FrameToggle1,
                    TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    { BackgroundTransparency = 1 }
                ):Play()
                TweenService:Create(
                    FrameToggle2,
                    TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    { BackgroundTransparency = 1 }
                ):Play()
                TweenService:Create(
                    FrameToggle3,
                    TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    { BackgroundTransparency = 0 }
                ):Play()
                TweenService:Create(
                    FrameToggleCircle,
                    TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    { BackgroundColor3 = Color3.fromRGB(255, 255, 255) }
                ):Play()
                FrameToggleCircle:TweenPosition(
                    UDim2.new(0.587, 0, 0.222000003, 0),
                    Enum.EasingDirection.Out,
                    Enum.EasingStyle.Quart,
                    .2,
                    true
                )
                toggled = not toggled
            end

            local Toggle = {}

            function Toggle:Set(def)
                default = def
                toggled = def

                if toggled == false then
                    TweenService:Create(
                        Toggle,
                        TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        { BackgroundColor3 = Color3.fromRGB(37, 37, 37) }
                    ):Play()
                    TweenService:Create(
                        FrameToggle1,
                        TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        { BackgroundTransparency = 1 }
                    ):Play()
                    TweenService:Create(
                        FrameToggle2,
                        TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        { BackgroundTransparency = 1 }
                    ):Play()
                    TweenService:Create(
                        FrameToggle3,
                        TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        { BackgroundTransparency = 0 }
                    ):Play()
                    TweenService:Create(
                        FrameToggleCircle,
                        TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        { BackgroundColor3 = Color3.fromRGB(255, 255, 255) }
                    ):Play()
                    FrameToggleCircle:TweenPosition(
                        UDim2.new(0.587, 0, 0.222000003, 0),
                        Enum.EasingDirection.Out,
                        Enum.EasingStyle.Quart,
                        .2,
                        true
                    )
                else
                    TweenService:Create(
                        Toggle,
                        TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        { BackgroundColor3 = Color3.fromRGB(34, 34, 34) }
                    ):Play()
                    TweenService:Create(
                        FrameToggle1,
                        TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        { BackgroundTransparency = 0 }
                    ):Play()
                    TweenService:Create(
                        FrameToggle2,
                        TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        { BackgroundTransparency = 0 }
                    ):Play()
                    TweenService:Create(
                        FrameToggle3,
                        TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        { BackgroundTransparency = 1 }
                    ):Play()
                    TweenService:Create(
                        FrameToggleCircle,
                        TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        { BackgroundColor3 = Color3.fromRGB(50, 50, 50) }
                    ):Play()
                    FrameToggleCircle:TweenPosition(
                        UDim2.new(0.127000004, 0, 0.222000003, 0),
                        Enum.EasingDirection.Out,
                        Enum.EasingStyle.Quart,
                        .2,
                        true
                    )
                end
            end

            Tab.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)

            return Toggle
        end

        function tabcontent:Slider(text, min, max, start, callback)
            local Slider = Instance.new("TextButton")
            local SliderCorner = Instance.new("UICorner")
            local SliderTitle = Instance.new("TextLabel")
            local SliderValue = Instance.new("TextLabel")
            local SlideFrame = Instance.new("Frame")
            local CurrentValueFrame = Instance.new("Frame")
            local SlideCircle = Instance.new("ImageButton")

            Slider.Name = "Slider"
            Slider.Parent = Tab
            Slider.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
            Slider.Position = UDim2.new(-0.48035714, 0, -0.570532918, 0)
            Slider.Size = UDim2.new(0, 363, 0, 60)
            Slider.AutoButtonColor = false
            Slider.Font = Enum.Font.SourceSans
            Slider.Text = ""
            Slider.TextColor3 = Color3.fromRGB(0, 0, 0)
            Slider.TextSize = 14.000

            SliderCorner.CornerRadius = UDim.new(0, 5)
            SliderCorner.Name = "SliderCorner"
            SliderCorner.Parent = Slider

            SliderTitle.Name = "SliderTitle"
            SliderTitle.Parent = Slider
            SliderTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            SliderTitle.BackgroundTransparency = 1.000
            SliderTitle.Position = UDim2.new(0.0358126722, 0, 0, 0)
            SliderTitle.Size = UDim2.new(0, 187, 0, 42)
            SliderTitle.Font = Enum.Font.Gotham
            SliderTitle.Text = text
            SliderTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
            SliderTitle.TextSize = 14.000
            SliderTitle.TextXAlignment = Enum.TextXAlignment.Left

            SliderValue.Name = "SliderValue"
            SliderValue.Parent = Slider
            SliderValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            SliderValue.BackgroundTransparency = 1.000
            SliderValue.Position = UDim2.new(0.0358126722, 0, 0, 0)
            SliderValue.Size = UDim2.new(0, 335, 0, 42)
            SliderValue.Font = Enum.Font.Gotham
            SliderValue.Text = tostring(start and math.floor((start / max) * (max - min) + min) or 0)
            SliderValue.TextColor3 = Color3.fromRGB(255, 255, 255)
            SliderValue.TextSize = 14.000
            SliderValue.TextXAlignment = Enum.TextXAlignment.Right

            SlideFrame.Name = "SlideFrame"
            SlideFrame.Parent = Slider
            SlideFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
            SlideFrame.BorderSizePixel = 0
            SlideFrame.Position = UDim2.new(0.0342647657, 0, 0.686091602, 0)
            SlideFrame.Size = UDim2.new(0, 335, 0, 3)

            CurrentValueFrame.Name = "CurrentValueFrame"
            CurrentValueFrame.Parent = SlideFrame
            CurrentValueFrame.BackgroundColor3 = PresetColor
            CurrentValueFrame.BorderSizePixel = 0
            CurrentValueFrame.Size = UDim2.new((start or 0) / max, 0, 0, 3)

            SlideCircle.Name = "SlideCircle"
            SlideCircle.Parent = SlideFrame
            SlideCircle.BackgroundColor3 = PresetColor
            SlideCircle.BackgroundTransparency = 1.000
            SlideCircle.Position = UDim2.new((start or 0) / max, -6, -1.30499995, 0)
            SlideCircle.Size = UDim2.new(0, 11, 0, 11)
            SlideCircle.Image = "rbxassetid://3570695787"
            SlideCircle.ImageColor3 = PresetColor

            coroutine.wrap(
                function()
                    while wait() do
                        CurrentValueFrame.BackgroundColor3 = PresetColor
                        SlideCircle.ImageColor3 = PresetColor
                    end
                end
            )()

            local Slider = {}
            local dragging = false

            local function move(Input)
                local pos =
                UDim2.new(
                math.clamp((Input.Position.X - SlideFrame.AbsolutePosition.X) / SlideFrame.AbsoluteSize.X, 0, 1),
                -6,
                -1.30499995,
                0
                )
                local XSize = math.clamp((Input.Position.X - SlideCircle.AbsolutePosition.X) /
                    SlideCircle.AbsoluteSize.X, 0, 1)
                local Increment = inc and (max / ((max - min) / (inc * 4))) or
                    (max >= 50 and max / ((max - min) / 4)) or
                    (max >= 25 and max / ((max - min) / 2)) or (max / (max - min))
                local SizeRounded = UDim2.new((math.round(XSize * ((max / Increment) * 4)) / ((max / Increment) * 4)
                    ), 0
                    , 1, 0)
                TweenService:Create(CurrentValueFrame,
                    TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Size = SizeRounded }):
                    Play()
                local Val = math.round((((SizeRounded.X.Scale * max) / max) * (max - min) + min) * 20) / 20
                SlideCircle:TweenPosition(pos, "Out", "Sine", 0.1, true)
                SliderValue.Text = tostring(Val)
                Slider.Value = Val
                callback(Slider.Value)
            end

            SlideCircle.InputBegan:Connect(function(input) if input.UserInputType ==
                    Enum.UserInputType.MouseButton1 then dragging = true end
            end)
            SlideCircle.InputEnded:Connect(function(input) if input.UserInputType ==
                    Enum.UserInputType.MouseButton1 then dragging = false end
            end)
            game:GetService("UserInputService").InputChanged:Connect(function(input) if dragging and
                    input.UserInputType == Enum.UserInputType.MouseMovement then move(input) end
            end)

            function Slider:Set(val)
                local a = tostring(val and (val / max) * (max - min) + min) or 0
                SliderValue.Text = tostring(a)
                CurrentValueFrame.Size = UDim2.new((val or 0) / max, 0, 1, 0)
                Slider.Value = val
                return callback(Slider.Value)
            end

            Tab.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)

            return Slider
        end

        function tabcontent:Dropdown(text, list, def, callback)
            local Dropdown, DropMain, OptionPreset =
            { Value = nil, Toggled = false, Options = list },
                game:GetObjects("rbxassetid://7027964359")[1],
                game:GetObjects("rbxassetid://7021432326")[1]
            DropMain.Parent = Tab
            DropMain.Btn.Title.Text = text
            DropMain.Name = "Dropdown"
            Dropdown.BackgroundTransparency = 0
            Dropdown.BackgroundColor3 = 34, 34, 34

            local function ToggleDrop()
                Dropdown.Toggled = not Dropdown.Toggled
                DropMain.Holder.Size =
                Dropdown.Toggled and UDim2.new(0, 363, 0, 6 + DropMain.Holder.Layout.AbsoluteContentSize.Y) or
                    UDim2.new(0, 363, 0, 0)
                TweenService:Create(
                    DropMain,
                    TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {
                        Size = Dropdown.Toggled and
                            UDim2.new(0, 363, 0, 38 + DropMain.Holder.Layout.AbsoluteContentSize.Y) or
                            UDim2.new(0, 363, 0, 32)
                    }
                ):Play()
                TweenService:Create(
                    DropMain.Btn.Ico,
                    TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    { Rotation = Dropdown.Toggled and 180 or 0 }
                ):Play()
                DropMain.Holder.Visible = Dropdown.Toggled
            end

            local function AddOptions(opts)
                for _, option in pairs(opts) do
                    local Option = OptionPreset:Clone()
                    Option.Parent = DropMain.Holder
                    Option.ItemText.Text = option
                    Option.ClipsDescendants = true

                    Option.MouseButton1Click:Connect(
                        function()
                            Dropdown.Value = option
                            DropMain.Btn.Title.Text = text .. " - " .. option
                            Ripple(Option)
                            return callback(Dropdown.Value)
                        end
                    )

                    spawn(
                        function()
                            while wait() do
                                Option.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
                                DropMain.Btn.Title.TextColor3 = Color3.fromRGB(155, 155, 155)
                            end
                        end
                    )
                end
            end

            function Dropdown:Refresh(opts, del)
                if del then
                    for _, v in pairs(DropMain.Holder:GetChildren()) do
                        if v:IsA "TextButton" then
                            v:Destroy()
                            DropMain.Holder.Size =
                            Dropdown.Toggled and
                                UDim2.new(0, 363, 0, 6 + DropMain.Holder.Layout.AbsoluteContentSize.Y) or
                                UDim2.new(0, 363, 0, 0)
                            DropMain.Size =
                            Dropdown.Toggled and
                                UDim2.new(0, 363, 0, 38 + DropMain.Holder.Layout.AbsoluteContentSize.Y) or
                                UDim2.new(0, 363, 0, 32)
                        end
                    end
                end
                AddOptions(opts)
            end

            DropMain.Btn.MouseButton1Click:Connect(
                function()
                    ToggleDrop()
                end
            )

            function Dropdown:Set(val)
                Dropdown.Value = val
                DropMain.Btn.Title.Text = text .. " - " .. val
                return callback(Dropdown.Value)
            end

            spawn(
                function()
                    while wait() do
                        DropMain.Btn.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
                        DropMain.Btn.Ico.ImageColor3 = Color3.fromRGB(255, 255, 255)
                    end
                end
            )

            Dropdown:Refresh(list, false)
            Dropdown:Set(def)

            return Dropdown
        end

        function tabcontent:MultiDropdown(text, list, def, flag, callback)
            local Dropdown, DropMain, OptionPreset =
            { Value = {}, Toggled = false, Options = list },
                game:GetObjects("rbxassetid://7027964359")[1],
                game:GetObjects("rbxassetid://7021432326")[1]
            DropMain.Parent = Tab
            DropMain.Btn.Title.Text = text
            DropMain.Name = text .. "element"
            Dropdown.BackgroundTransparency = 0
            Dropdown.BackgroundColor3 = 34, 34, 34

            local function ToggleDrop()
                Dropdown.Toggled = not Dropdown.Toggled
                DropMain.Holder.Size =
                Dropdown.Toggled and UDim2.new(0, 363, 0, 6 + DropMain.Holder.Layout.AbsoluteContentSize.Y) or
                    UDim2.new(0, 363, 0, 0)
                TweenService:Create(
                    DropMain,
                    TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {
                        Size = Dropdown.Toggled and
                            UDim2.new(0, 363, 0, 38 + DropMain.Holder.Layout.AbsoluteContentSize.Y) or
                            UDim2.new(0, 363, 0, 32)
                    }
                ):Play()
                TweenService:Create(
                    DropMain.Btn.Ico,
                    TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    { Rotation = Dropdown.Toggled and 180 or 0 }
                ):Play()
                DropMain.Holder.Visible = Dropdown.Toggled
            end

            local function AddOptions(opts)
                for _, option in pairs(opts) do
                    local Option = OptionPreset:Clone()
                    Option.Parent = DropMain.Holder
                    Option.ItemText.Text = option
                    Option.ClipsDescendants = true

                    Option.MouseButton1Click:Connect(
                        function()
                            if table.find(Dropdown.Value, option) then
                                table.remove(Dropdown.Value, table.find(Dropdown.Value, option))
                                DropMain.Btn.Title.Text = text .. " - " .. table.concat(Dropdown.Value, ", ")
                                callback(Dropdown.Value)
                            else
                                table.insert(Dropdown.Value, option)
                                DropMain.Btn.Title.Text = text .. " - " .. table.concat(Dropdown.Value, ", ")
                                callback(Dropdown.Value)
                            end
                            Ripple(Option)
                        end
                    )


                    Option.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
                    DropMain.Btn.Title.TextColor3 = Color3.fromRGB(155, 155, 155)

                end
            end

            function Dropdown:Refresh(opts, del)
                if del then
                    for _, v in pairs(DropMain.Holder:GetChildren()) do
                        if v:IsA "TextButton" then
                            v:Destroy()
                            DropMain.Holder.Size =
                            Dropdown.Toggled and
                                UDim2.new(0, 363, 0, 6 + DropMain.Holder.Layout.AbsoluteContentSize.Y) or
                                UDim2.new(0, 363, 0, 0)
                            DropMain.Size =
                            Dropdown.Toggled and
                                UDim2.new(0, 363, 0, 38 + DropMain.Holder.Layout.AbsoluteContentSize.Y) or
                                UDim2.new(0, 363, 0, 32)
                        end
                    end
                end
                AddOptions(opts)
            end

            DropMain.Btn.MouseButton1Click:Connect(
                function()
                    ToggleDrop()
                end
            )

            function Dropdown:Set(val)
                Dropdown.Value = val
                DropMain.Btn.Title.Text = text .. " - " .. table.concat(Dropdown.Value, ", ")
                return callback(Dropdown.Value)
            end

            DropMain.Btn.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
            DropMain.Btn.Ico.ImageColor3 = Color3.fromRGB(255, 255, 255)

            Dropdown:Refresh(list, false)
            return Dropdown
        end

        function tabcontent:Colorpicker(text, preset, callback)
            local ColorPickerToggled = false
            local OldToggleColor = Color3.fromRGB(0, 0, 0)
            local OldColor = Color3.fromRGB(0, 0, 0)
            local OldColorSelectionPosition = nil
            local OldHueSelectionPosition = nil
            local ColorH, ColorS, ColorV = 1, 1, 1
            local RainbowColorPicker = false
            local ColorPickerInput = nil
            local ColorInput = nil
            local HueInput = nil

            local Colorpicker = Instance.new("Frame")
            local ColorpickerCorner = Instance.new("UICorner")
            local ColorpickerTitle = Instance.new("TextLabel")
            local BoxColor = Instance.new("Frame")
            local BoxColorCorner = Instance.new("UICorner")
            local ConfirmBtn = Instance.new("TextButton")
            local ConfirmBtnCorner = Instance.new("UICorner")
            local ConfirmBtnTitle = Instance.new("TextLabel")
            local ColorpickerBtn = Instance.new("TextButton")
            local RainbowToggle = Instance.new("TextButton")
            local RainbowToggleCorner = Instance.new("UICorner")
            local RainbowToggleTitle = Instance.new("TextLabel")
            local FrameRainbowToggle1 = Instance.new("Frame")
            local FrameRainbowToggle1Corner = Instance.new("UICorner")
            local FrameRainbowToggle2 = Instance.new("Frame")
            local FrameRainbowToggle2_2 = Instance.new("UICorner")
            local FrameRainbowToggle3 = Instance.new("Frame")
            local FrameToggle3 = Instance.new("UICorner")
            local FrameRainbowToggleCircle = Instance.new("Frame")
            local FrameRainbowToggleCircleCorner = Instance.new("UICorner")
            local Color = Instance.new("ImageLabel")
            local ColorCorner = Instance.new("UICorner")
            local ColorSelection = Instance.new("ImageLabel")
            local Hue = Instance.new("ImageLabel")
            local HueCorner = Instance.new("UICorner")
            local HueGradient = Instance.new("UIGradient")
            local HueSelection = Instance.new("ImageLabel")

            Colorpicker.Name = "Colorpicker"
            Colorpicker.Parent = Tab
            Colorpicker.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
            Colorpicker.ClipsDescendants = true
            Colorpicker.Position = UDim2.new(-0.541071415, 0, -0.532915354, 0)
            Colorpicker.Size = UDim2.new(0, 363, 0, 42)

            ColorpickerCorner.CornerRadius = UDim.new(0, 5)
            ColorpickerCorner.Name = "ColorpickerCorner"
            ColorpickerCorner.Parent = Colorpicker

            ColorpickerTitle.Name = "ColorpickerTitle"
            ColorpickerTitle.Parent = Colorpicker
            ColorpickerTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ColorpickerTitle.BackgroundTransparency = 1.000
            ColorpickerTitle.Position = UDim2.new(0.0358126722, 0, 0, 0)
            ColorpickerTitle.Size = UDim2.new(0, 187, 0, 42)
            ColorpickerTitle.Font = Enum.Font.Gotham
            ColorpickerTitle.Text = text
            ColorpickerTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
            ColorpickerTitle.TextSize = 14.000
            ColorpickerTitle.TextXAlignment = Enum.TextXAlignment.Left

            BoxColor.Name = "BoxColor"
            BoxColor.Parent = ColorpickerTitle
            BoxColor.BackgroundColor3 = Color3.fromRGB(255, 0, 4)
            BoxColor.Position = UDim2.new(1.60427809, 0, 0.214285716, 0)
            BoxColor.Size = UDim2.new(0, 41, 0, 23)

            BoxColorCorner.CornerRadius = UDim.new(0, 5)
            BoxColorCorner.Name = "BoxColorCorner"
            BoxColorCorner.Parent = BoxColor

            ConfirmBtn.Name = "ConfirmBtn"
            ConfirmBtn.Parent = ColorpickerTitle
            ConfirmBtn.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
            ConfirmBtn.Position = UDim2.new(1.25814295, 0, 1.09037197, 0)
            ConfirmBtn.Size = UDim2.new(0, 105, 0, 32)
            ConfirmBtn.AutoButtonColor = false
            ConfirmBtn.Font = Enum.Font.SourceSans
            ConfirmBtn.Text = ""
            ConfirmBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
            ConfirmBtn.TextSize = 14.000

            ConfirmBtnCorner.CornerRadius = UDim.new(0, 5)
            ConfirmBtnCorner.Name = "ConfirmBtnCorner"
            ConfirmBtnCorner.Parent = ConfirmBtn

            ConfirmBtnTitle.Name = "ConfirmBtnTitle"
            ConfirmBtnTitle.Parent = ConfirmBtn
            ConfirmBtnTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ConfirmBtnTitle.BackgroundTransparency = 1.000
            ConfirmBtnTitle.Size = UDim2.new(0, 33, 0, 32)
            ConfirmBtnTitle.Font = Enum.Font.Gotham
            ConfirmBtnTitle.Text = "Confirm"
            ConfirmBtnTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
            ConfirmBtnTitle.TextSize = 14.000
            ConfirmBtnTitle.TextXAlignment = Enum.TextXAlignment.Left

            ColorpickerBtn.Name = "ColorpickerBtn"
            ColorpickerBtn.Parent = ColorpickerTitle
            ColorpickerBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ColorpickerBtn.BackgroundTransparency = 1.000
            ColorpickerBtn.Size = UDim2.new(0, 363, 0, 42)
            ColorpickerBtn.Font = Enum.Font.SourceSans
            ColorpickerBtn.Text = ""
            ColorpickerBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
            ColorpickerBtn.TextSize = 14.000

            RainbowToggle.Name = "RainbowToggle"
            RainbowToggle.Parent = ColorpickerTitle
            RainbowToggle.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
            RainbowToggle.Position = UDim2.new(1.26349044, 0, 2.12684202, 0)
            RainbowToggle.Size = UDim2.new(0, 104, 0, 32)
            RainbowToggle.AutoButtonColor = false
            RainbowToggle.Font = Enum.Font.SourceSans
            RainbowToggle.Text = ""
            RainbowToggle.TextColor3 = Color3.fromRGB(0, 0, 0)
            RainbowToggle.TextSize = 14.000

            RainbowToggleCorner.CornerRadius = UDim.new(0, 5)
            RainbowToggleCorner.Name = "RainbowToggleCorner"
            RainbowToggleCorner.Parent = RainbowToggle

            RainbowToggleTitle.Name = "RainbowToggleTitle"
            RainbowToggleTitle.Parent = RainbowToggle
            RainbowToggleTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            RainbowToggleTitle.BackgroundTransparency = 1.000
            RainbowToggleTitle.Size = UDim2.new(0, 33, 0, 32)
            RainbowToggleTitle.Font = Enum.Font.Gotham
            RainbowToggleTitle.Text = "Rainbow"
            RainbowToggleTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
            RainbowToggleTitle.TextSize = 14.000
            RainbowToggleTitle.TextXAlignment = Enum.TextXAlignment.Left

            FrameRainbowToggle1.Name = "FrameRainbowToggle1"
            FrameRainbowToggle1.Parent = RainbowToggle
            FrameRainbowToggle1.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
            FrameRainbowToggle1.Position = UDim2.new(0.649999976, 0, 0.186000004, 0)
            FrameRainbowToggle1.Size = UDim2.new(0, 37, 0, 18)

            FrameRainbowToggle1Corner.Name = "FrameRainbowToggle1Corner"
            FrameRainbowToggle1Corner.Parent = FrameRainbowToggle1

            FrameRainbowToggle2.Name = "FrameRainbowToggle2"
            FrameRainbowToggle2.Parent = FrameRainbowToggle1
            FrameRainbowToggle2.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
            FrameRainbowToggle2.Position = UDim2.new(0.0590000004, 0, 0.112999998, 0)
            FrameRainbowToggle2.Size = UDim2.new(0, 33, 0, 14)

            FrameRainbowToggle2_2.Name = "FrameRainbowToggle2"
            FrameRainbowToggle2_2.Parent = FrameRainbowToggle2

            FrameRainbowToggle3.Name = "FrameRainbowToggle3"
            FrameRainbowToggle3.Parent = FrameRainbowToggle1
            FrameRainbowToggle3.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
            FrameRainbowToggle3.BackgroundTransparency = 1.000
            FrameRainbowToggle3.Size = UDim2.new(0, 37, 0, 18)

            FrameToggle3.Name = "FrameToggle3"
            FrameToggle3.Parent = FrameRainbowToggle3

            FrameRainbowToggleCircle.Name = "FrameRainbowToggleCircle"
            FrameRainbowToggleCircle.Parent = FrameRainbowToggle1
            FrameRainbowToggleCircle.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
            FrameRainbowToggleCircle.Position = UDim2.new(0.127000004, 0, 0.222000003, 0)
            FrameRainbowToggleCircle.Size = UDim2.new(0, 10, 0, 10)

            FrameRainbowToggleCircleCorner.Name = "FrameRainbowToggleCircleCorner"
            FrameRainbowToggleCircleCorner.Parent = FrameRainbowToggleCircle

            Color.Name = "Color"
            Color.Parent = ColorpickerTitle
            Color.BackgroundColor3 = Color3.fromRGB(255, 0, 4)
            Color.Position = UDim2.new(0, 0, 0, 42)
            Color.Size = UDim2.new(0, 194, 0, 80)
            Color.ZIndex = 10
            Color.Image = "rbxassetid://4155801252"

            ColorCorner.CornerRadius = UDim.new(0, 3)
            ColorCorner.Name = "ColorCorner"
            ColorCorner.Parent = Color

            ColorSelection.Name = "ColorSelection"
            ColorSelection.Parent = Color
            ColorSelection.AnchorPoint = Vector2.new(0.5, 0.5)
            ColorSelection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ColorSelection.BackgroundTransparency = 1.000
            ColorSelection.Position = UDim2.new(preset and select(3, Color3.toHSV(preset)))
            ColorSelection.Size = UDim2.new(0, 18, 0, 18)
            ColorSelection.Image = "http://www.roblox.com/asset/?id=4805639000"
            ColorSelection.ScaleType = Enum.ScaleType.Fit
            ColorSelection.Visible = false

            Hue.Name = "Hue"
            Hue.Parent = ColorpickerTitle
            Hue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Hue.Position = UDim2.new(0, 202, 0, 42)
            Hue.Size = UDim2.new(0, 25, 0, 80)

            HueCorner.CornerRadius = UDim.new(0, 3)
            HueCorner.Name = "HueCorner"
            HueCorner.Parent = Hue

            HueGradient.Color =
            ColorSequence.new {
                ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 4)),
                ColorSequenceKeypoint.new(0.20, Color3.fromRGB(234, 255, 0)),
                ColorSequenceKeypoint.new(0.40, Color3.fromRGB(21, 255, 0)),
                ColorSequenceKeypoint.new(0.60, Color3.fromRGB(0, 255, 255)),
                ColorSequenceKeypoint.new(0.80, Color3.fromRGB(0, 17, 255)),
                ColorSequenceKeypoint.new(0.90, Color3.fromRGB(255, 0, 251)),
                ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 4))
            }
            HueGradient.Rotation = 270
            HueGradient.Name = "HueGradient"
            HueGradient.Parent = Hue

            HueSelection.Name = "HueSelection"
            HueSelection.Parent = Hue
            HueSelection.AnchorPoint = Vector2.new(0.5, 0.5)
            HueSelection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            HueSelection.BackgroundTransparency = 1.000
            HueSelection.Position = UDim2.new(0.48, 0, 1 - select(1, Color3.toHSV(preset)))
            HueSelection.Size = UDim2.new(0, 18, 0, 18)
            HueSelection.Image = "http://www.roblox.com/asset/?id=4805639000"
            HueSelection.Visible = false

            coroutine.wrap(
                function()
                    while wait() do
                        FrameRainbowToggle3.BackgroundColor3 = PresetColor
                    end
                end
            )()

            ColorpickerBtn.MouseButton1Click:Connect(
                function()
                    if ColorPickerToggled == false then
                        ColorSelection.Visible = true
                        HueSelection.Visible = true
                        Colorpicker:TweenSize(
                            UDim2.new(0, 363, 0, 132),
                            Enum.EasingDirection.Out,
                            Enum.EasingStyle.Quart,
                            .2,
                            true
                        )
                        wait(.2)
                        Tab.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)
                    else
                        ColorSelection.Visible = false
                        HueSelection.Visible = false
                        Colorpicker:TweenSize(
                            UDim2.new(0, 363, 0, 42),
                            Enum.EasingDirection.Out,
                            Enum.EasingStyle.Quart,
                            .2,
                            true
                        )
                        wait(.2)
                        Tab.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)
                    end
                    ColorPickerToggled = not ColorPickerToggled
                end
            )

            local function UpdateColorPicker(nope)
                BoxColor.BackgroundColor3 = Color3.fromHSV(ColorH, ColorS, ColorV)
                Color.BackgroundColor3 = Color3.fromHSV(ColorH, 1, 1)

                pcall(callback, BoxColor.BackgroundColor3)
            end

            ColorH =
            1 -
                (math.clamp(HueSelection.AbsolutePosition.Y - Hue.AbsolutePosition.Y, 0, Hue.AbsoluteSize.Y) /
                    Hue.AbsoluteSize.Y)
            ColorS =
            (math.clamp(ColorSelection.AbsolutePosition.X - Color.AbsolutePosition.X, 0, Color.AbsoluteSize.X) /
                Color.AbsoluteSize.X)
            ColorV =
            1 -
                (math.clamp(ColorSelection.AbsolutePosition.Y - Color.AbsolutePosition.Y, 0, Color.AbsoluteSize.Y) /
                    Color.AbsoluteSize.Y)

            BoxColor.BackgroundColor3 = preset
            Color.BackgroundColor3 = preset
            pcall(callback, BoxColor.BackgroundColor3)

            Color.InputBegan:Connect(
                function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        if RainbowColorPicker then
                            return
                        end

                        if ColorInput then
                            ColorInput:Disconnect()
                        end

                        ColorInput =
                        RunService.RenderStepped:Connect(
                            function()
                                local ColorX =
                                (math.clamp(Mouse.X - Color.AbsolutePosition.X, 0, Color.AbsoluteSize.X) /
                                    Color.AbsoluteSize.X)
                                local ColorY =
                                (math.clamp(Mouse.Y - Color.AbsolutePosition.Y, 0, Color.AbsoluteSize.Y) /
                                    Color.AbsoluteSize.Y)

                                ColorSelection.Position = UDim2.new(ColorX, 0, ColorY, 0)
                                ColorS = ColorX
                                ColorV = 1 - ColorY

                                UpdateColorPicker(true)
                            end
                        )
                    end
                end
            )

            Color.InputEnded:Connect(
                function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        if ColorInput then
                            ColorInput:Disconnect()
                        end
                    end
                end
            )

            Hue.InputBegan:Connect(
                function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        if RainbowColorPicker then
                            return
                        end

                        if HueInput then
                            HueInput:Disconnect()
                        end

                        HueInput =
                        RunService.RenderStepped:Connect(
                            function()
                                local HueY =
                                (math.clamp(Mouse.Y - Hue.AbsolutePosition.Y, 0, Hue.AbsoluteSize.Y) /
                                    Hue.AbsoluteSize.Y)

                                HueSelection.Position = UDim2.new(0.48, 0, HueY, 0)
                                ColorH = 1 - HueY

                                UpdateColorPicker(true)
                            end
                        )
                    end
                end
            )

            Hue.InputEnded:Connect(
                function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        if HueInput then
                            HueInput:Disconnect()
                        end
                    end
                end
            )

            RainbowToggle.MouseButton1Down:Connect(
                function()
                    RainbowColorPicker = not RainbowColorPicker

                    if ColorInput then
                        ColorInput:Disconnect()
                    end

                    if HueInput then
                        HueInput:Disconnect()
                    end

                    if RainbowColorPicker then
                        TweenService:Create(
                            FrameRainbowToggle1,
                            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            { BackgroundTransparency = 1 }
                        ):Play()
                        TweenService:Create(
                            FrameRainbowToggle2,
                            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            { BackgroundTransparency = 1 }
                        ):Play()
                        TweenService:Create(
                            FrameRainbowToggle3,
                            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            { BackgroundTransparency = 0 }
                        ):Play()
                        TweenService:Create(
                            FrameRainbowToggleCircle,
                            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            { BackgroundColor3 = Color3.fromRGB(255, 255, 255) }
                        ):Play()
                        FrameRainbowToggleCircle:TweenPosition(
                            UDim2.new(0.587, 0, 0.222000003, 0),
                            Enum.EasingDirection.Out,
                            Enum.EasingStyle.Quart,
                            .2,
                            true
                        )

                        OldToggleColor = BoxColor.BackgroundColor3
                        OldColor = Color.BackgroundColor3
                        OldColorSelectionPosition = ColorSelection.Position
                        OldHueSelectionPosition = HueSelection.Position

                        while RainbowColorPicker do
                            BoxColor.BackgroundColor3 = Color3.fromHSV(lib.RainbowColorValue, 1, 1)
                            Color.BackgroundColor3 = Color3.fromHSV(lib.RainbowColorValue, 1, 1)

                            ColorSelection.Position = UDim2.new(1, 0, 0, 0)
                            HueSelection.Position = UDim2.new(0.48, 0, 0, lib.HueSelectionPosition)

                            pcall(callback, BoxColor.BackgroundColor3)
                            wait()
                        end
                    elseif not RainbowColorPicker then
                        TweenService:Create(
                            FrameRainbowToggle1,
                            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            { BackgroundTransparency = 0 }
                        ):Play()
                        TweenService:Create(
                            FrameRainbowToggle2,
                            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            { BackgroundTransparency = 0 }
                        ):Play()
                        TweenService:Create(
                            FrameRainbowToggle3,
                            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            { BackgroundTransparency = 1 }
                        ):Play()
                        TweenService:Create(
                            FrameRainbowToggleCircle,
                            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            { BackgroundColor3 = Color3.fromRGB(50, 50, 50) }
                        ):Play()
                        FrameRainbowToggleCircle:TweenPosition(
                            UDim2.new(0.127000004, 0, 0.222000003, 0),
                            Enum.EasingDirection.Out,
                            Enum.EasingStyle.Quart,
                            .2,
                            true
                        )

                        BoxColor.BackgroundColor3 = OldToggleColor
                        Color.BackgroundColor3 = OldColor

                        ColorSelection.Position = OldColorSelectionPosition
                        HueSelection.Position = OldHueSelectionPosition

                        pcall(callback, BoxColor.BackgroundColor3)
                    end
                end
            )

            ConfirmBtn.MouseButton1Click:Connect(
                function()
                    ColorSelection.Visible = false
                    HueSelection.Visible = false
                    Colorpicker:TweenSize(
                        UDim2.new(0, 363, 0, 42),
                        Enum.EasingDirection.Out,
                        Enum.EasingStyle.Quart,
                        .2,
                        true
                    )
                    wait(.2)
                    Tab.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)
                end
            )
            Tab.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)
        end

        function tabcontent:Label(text, color)
            local Label = Instance.new("TextButton")
            local LabelCorner = Instance.new("UICorner")
            local LabelTitle = Instance.new("TextLabel")

            Label.Name = "Button"
            Label.Parent = Tab
            Label.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
            Label.Size = UDim2.new(0, 363, 0, 42)
            Label.AutoButtonColor = false
            Label.Font = Enum.Font.SourceSans
            Label.Text = ""
            Label.TextColor3 = Color3.fromRGB(0, 0, 0)
            Label.TextSize = 14.000

            LabelCorner.CornerRadius = UDim.new(0, 5)
            LabelCorner.Name = "ButtonCorner"
            LabelCorner.Parent = Label

            LabelTitle.Name = "ButtonTitle"
            LabelTitle.Parent = Label
            LabelTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            LabelTitle.BackgroundTransparency = 1.000
            LabelTitle.Position = UDim2.new(0.0358126722, 0, 0, 0)
            LabelTitle.Size = UDim2.new(0, 187, 0, 42)
            LabelTitle.Font = Enum.Font.Gotham
            LabelTitle.Text = text
            LabelTitle.TextColor3 = color
            LabelTitle.TextSize = 14.000
            LabelTitle.TextXAlignment = Enum.TextXAlignment.Left

            local LabelFuns = {}

            function LabelFuns:Set(newtext, newcolor)
                LabelTitle.Text = newtext
                LabelTitle.TextColor3 = newcolor
            end

            Tab.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)

            return LabelFuns
        end

        function tabcontent:Textbox(text, disapper, callback)
            local Textbox = Instance.new("Frame")
            local TextboxCorner = Instance.new("UICorner")
            local TextboxTitle = Instance.new("TextLabel")
            local TextboxFrame = Instance.new("Frame")
            local TextboxFrameCorner = Instance.new("UICorner")
            local TextBox = Instance.new("TextBox")

            Textbox.Name = "Textbox"
            Textbox.Parent = Tab
            Textbox.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
            Textbox.ClipsDescendants = true
            Textbox.Position = UDim2.new(-0.541071415, 0, -0.532915354, 0)
            Textbox.Size = UDim2.new(0, 363, 0, 42)

            TextboxCorner.CornerRadius = UDim.new(0, 5)
            TextboxCorner.Name = "TextboxCorner"
            TextboxCorner.Parent = Textbox

            TextboxTitle.Name = "TextboxTitle"
            TextboxTitle.Parent = Textbox
            TextboxTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextboxTitle.BackgroundTransparency = 1.000
            TextboxTitle.Position = UDim2.new(0.0358126722, 0, 0, 0)
            TextboxTitle.Size = UDim2.new(0, 187, 0, 42)
            TextboxTitle.Font = Enum.Font.Gotham
            TextboxTitle.Text = text
            TextboxTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextboxTitle.TextSize = 14.000
            TextboxTitle.TextXAlignment = Enum.TextXAlignment.Left

            TextboxFrame.Name = "TextboxFrame"
            TextboxFrame.Parent = TextboxTitle
            TextboxFrame.BackgroundColor3 = Color3.fromRGB(37, 37, 37)
            TextboxFrame.Position = UDim2.new(1.28877008, 0, 0.214285716, 0)
            TextboxFrame.Size = UDim2.new(0, 100, 0, 23)

            TextboxFrameCorner.CornerRadius = UDim.new(0, 5)
            TextboxFrameCorner.Name = "TextboxFrameCorner"
            TextboxFrameCorner.Parent = TextboxFrame

            TextBox.Parent = TextboxFrame
            TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextBox.BackgroundTransparency = 1.000
            TextBox.Size = UDim2.new(0, 100, 0, 23)
            TextBox.Font = Enum.Font.Gotham
            TextBox.Text = ""
            TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextBox.TextSize = 14.000

            TextBox.Changed:Connect(function()
                TextBox.Size = UDim2.new(0, TextBox.TextBounds.X + 16, 0, 23)
            end)

            TextboxFrame.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    TextBox:CaptureFocus()
                end
            end)

			TextBox.FocusLost:Connect(
                function(ep)
                    if ep then
                        if #TextBox.Text > 0 then
                            pcall(callback, TextBox.Text)
                            if disapper then
                                TextBox.Text = ""
                            end
                        end
                    end
                end
            )

            UserInputService.InputBegan:Connect(function(input)
                if input.KeyCode == Enum.KeyCode.Escape and TextBox:IsFocused() then
                    TextBox:ReleaseFocus()
                end
            end)
            Tab.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)
        end

        function tabcontent:Bind(text, preset, holdmode, callback)
            local Bind = Instance.new("TextButton")
            local BindCorner = Instance.new("UICorner")
            local BindTitle = Instance.new("TextLabel")
            local BindText = Instance.new("TextLabel")

            Bind.Name = "Bind"
            Bind.Parent = Tab
            Bind.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
            Bind.Size = UDim2.new(0, 363, 0, 42)
            Bind.AutoButtonColor = false
            Bind.Font = Enum.Font.SourceSans
            Bind.Text = ""
            Bind.TextColor3 = Color3.fromRGB(0, 0, 0)
            Bind.TextSize = 14.000

            BindCorner.CornerRadius = UDim.new(0, 5)
            BindCorner.Name = "BindCorner"
            BindCorner.Parent = Bind

            BindTitle.Name = "BindTitle"
            BindTitle.Parent = Bind
            BindTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            BindTitle.BackgroundTransparency = 1.000
            BindTitle.Position = UDim2.new(0.0358126722, 0, 0, 0)
            BindTitle.Size = UDim2.new(0, 187, 0, 42)
            BindTitle.Font = Enum.Font.Gotham
            BindTitle.Text = text
            BindTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
            BindTitle.TextSize = 14.000
            BindTitle.TextXAlignment = Enum.TextXAlignment.Left

            BindText.Name = "BindText"
            BindText.Parent = Bind
            BindText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            BindText.BackgroundTransparency = 1.000
            BindText.Position = UDim2.new(0.0358126722, 0, 0, 0)
            BindText.Size = UDim2.new(0, 337, 0, 42)
            BindText.Font = Enum.Font.Gotham
            BindText.TextColor3 = Color3.fromRGB(255, 255, 255)
            BindText.TextSize = 14.000
            BindText.TextXAlignment = Enum.TextXAlignment.Right

            Tab.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)

            local Bind = { Value, Binding = false, Holding = false }

            Bind.InputEnded:Connect(
                function(Input)
                    if Input.UserInputType == Enum.UserInputType.MouseButton1 then
                        if Bind.Binding then
                            return
                        end
                        Bind.Binding = true
                        BindText.Text = "Waiting for input"
                    end
                end
            )

            UserInputService.InputBegan:Connect(
                function(Input)
                    if UserInputService:GetFocusedTextBox() then
                        return
                    end
                    if (Input.KeyCode.Name == Bind.Value or Input.UserInputType.Name == Bind.Value) and
                        not Bind.Binding
                    then
                        if holdmode then
                            Holding = true
                            callback(Holding)
                        else
                            callback()
                        end
                    elseif Bind.Binding then
                        local Key
                        pcall(
                            function()
                                if not CheckKey(BlacklistedKeys, Input.KeyCode) then
                                    Key = Input.KeyCode
                                end
                            end
                        )
                        pcall(
                            function()
                                if CheckKey(WhitelistedMouse, Input.UserInputType) and not Key then
                                    Key = Input.UserInputType
                                end
                            end
                        )
                        Key = Key or Bind.Value
                        Bind:Set(Key)
                    end
                end
            )

            UserInputService.InputEnded:Connect(
                function(Input)
                    if Input.KeyCode.Name == Bind.Value or Input.UserInputType.Name == Bind.Value then
                        if holdmode and Holding then
                            Holding = false
                            callback(Holding)
                        end
                    end
                end
            )

            function Bind:Set(key)
                self.Binding = false
                self.Value = key or self.Value
                self.Value = self.Value.Name or self.Value
                BindText.Text = self.Value
            end

            Bind:Set(preset)
            return Bind
        end

        local SectionPreset = game:GetObjects("rbxassetid://7121846230")[1]

        local SectionHold = {}
        function SectionHold:Section(text)
            local Section = SectionPreset:Clone()
            Section.Parent = Tab
            Section.SectionTitle.Text = text

            spawn(function()
                while wait(0.1) do
                    Section.SectionTitle.TextColor3 = Color3.fromRGB(200, 200, 200)
                    Section.Size = UDim2.new(0.9, 0, 0, Section.UIListLayout.AbsoluteContentSize.Y)
                end
            end)

            local SectionContent = {}
            function SectionContent:Button(text, callback)
                local Button = Instance.new("TextButton")
                local ButtonCorner = Instance.new("UICorner")
                local ButtonTitle = Instance.new("TextLabel")

                Button.Name = "Button"
                Button.Parent = Section
                Button.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
                Button.Size = UDim2.new(0, 363, 0, 42)
                Button.AutoButtonColor = false
                Button.Font = Enum.Font.SourceSans
                Button.Text = ""
                Button.TextColor3 = Color3.fromRGB(0, 0, 0)
                Button.TextSize = 14.000

                ButtonCorner.CornerRadius = UDim.new(0, 5)
                ButtonCorner.Name = "ButtonCorner"
                ButtonCorner.Parent = Button

                ButtonTitle.Name = "ButtonTitle"
                ButtonTitle.Parent = Button
                ButtonTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ButtonTitle.BackgroundTransparency = 1.000
                ButtonTitle.Position = UDim2.new(0.0358126722, 0, 0, 0)
                ButtonTitle.Size = UDim2.new(0, 187, 0, 42)
                ButtonTitle.Font = Enum.Font.Gotham
                ButtonTitle.Text = text
                ButtonTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
                ButtonTitle.TextSize = 14.000
                ButtonTitle.TextXAlignment = Enum.TextXAlignment.Left

                Button.MouseEnter:Connect(
                    function()
                        TweenService:Create(
                            Button,
                            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            { BackgroundColor3 = PresetColor }
                        ):Play()
                    end
                )

                Button.MouseLeave:Connect(
                    function()
                        TweenService:Create(
                            Button,
                            TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            { BackgroundColor3 = Color3.fromRGB(34, 34, 34) }
                        ):Play()
                    end
                )

                Button.MouseButton1Click:Connect(
                    function()
                        pcall(callback)
                    end
                )

                Tab.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)
            end

            function SectionContent:Toggle(text, default, callback)
                local toggled = false

                local Toggle = Instance.new("TextButton")
                local ToggleCorner = Instance.new("UICorner")
                local ToggleTitle = Instance.new("TextLabel")
                local FrameToggle1 = Instance.new("Frame")
                local FrameToggle1Corner = Instance.new("UICorner")
                local FrameToggle2 = Instance.new("Frame")
                local FrameToggle2Corner = Instance.new("UICorner")
                local FrameToggle3 = Instance.new("Frame")
                local FrameToggle3Corner = Instance.new("UICorner")
                local FrameToggleCircle = Instance.new("Frame")
                local FrameToggleCircleCorner = Instance.new("UICorner")

                Toggle.Name = "Toggle"
                Toggle.Parent = Section
                Toggle.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
                Toggle.Position = UDim2.new(0.215625003, 0, 0.446271926, 0)
                Toggle.Size = UDim2.new(0, 363, 0, 42)
                Toggle.AutoButtonColor = false
                Toggle.Font = Enum.Font.SourceSans
                Toggle.Text = ""
                Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
                Toggle.TextSize = 14.000

                ToggleCorner.CornerRadius = UDim.new(0, 5)
                ToggleCorner.Name = "ToggleCorner"
                ToggleCorner.Parent = Toggle

                ToggleTitle.Name = "ToggleTitle"
                ToggleTitle.Parent = Toggle
                ToggleTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ToggleTitle.BackgroundTransparency = 1.000
                ToggleTitle.Position = UDim2.new(0.0358126722, 0, 0, 0)
                ToggleTitle.Size = UDim2.new(0, 187, 0, 42)
                ToggleTitle.Font = Enum.Font.Gotham
                ToggleTitle.Text = text
                ToggleTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
                ToggleTitle.TextSize = 14.000
                ToggleTitle.TextXAlignment = Enum.TextXAlignment.Left

                FrameToggle1.Name = "FrameToggle1"
                FrameToggle1.Parent = Toggle
                FrameToggle1.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
                FrameToggle1.Position = UDim2.new(0.859504104, 0, 0.285714298, 0)
                FrameToggle1.Size = UDim2.new(0, 37, 0, 18)

                FrameToggle1Corner.Name = "FrameToggle1Corner"
                FrameToggle1Corner.Parent = FrameToggle1

                FrameToggle2.Name = "FrameToggle2"
                FrameToggle2.Parent = FrameToggle1
                FrameToggle2.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
                FrameToggle2.Position = UDim2.new(0.0489999987, 0, 0.0930000022, 0)
                FrameToggle2.Size = UDim2.new(0, 33, 0, 14)

                FrameToggle2Corner.Name = "FrameToggle2Corner"
                FrameToggle2Corner.Parent = FrameToggle2

                FrameToggle3.Name = "FrameToggle3"
                FrameToggle3.Parent = FrameToggle1
                FrameToggle3.BackgroundColor3 = PresetColor
                FrameToggle3.BackgroundTransparency = 1.000
                FrameToggle3.Size = UDim2.new(0, 37, 0, 18)

                FrameToggle3Corner.Name = "FrameToggle3Corner"
                FrameToggle3Corner.Parent = FrameToggle3

                FrameToggleCircle.Name = "FrameToggleCircle"
                FrameToggleCircle.Parent = FrameToggle1
                FrameToggleCircle.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
                FrameToggleCircle.Position = UDim2.new(0.127000004, 0, 0.222000003, 0)
                FrameToggleCircle.Size = UDim2.new(0, 10, 0, 10)

                FrameToggleCircleCorner.Name = "FrameToggleCircleCorner"
                FrameToggleCircleCorner.Parent = FrameToggleCircle

                coroutine.wrap(
                    function()
                        while wait() do
                            FrameToggle3.BackgroundColor3 = PresetColor
                        end
                    end
                )()

                Toggle.MouseButton1Click:Connect(
                    function()
                        if toggled == false then
                            TweenService:Create(
                                Toggle,
                                TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                { BackgroundColor3 = Color3.fromRGB(37, 37, 37) }
                            ):Play()
                            TweenService:Create(
                                FrameToggle1,
                                TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                { BackgroundTransparency = 1 }
                            ):Play()
                            TweenService:Create(
                                FrameToggle2,
                                TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                { BackgroundTransparency = 1 }
                            ):Play()
                            TweenService:Create(
                                FrameToggle3,
                                TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                { BackgroundTransparency = 0 }
                            ):Play()
                            TweenService:Create(
                                FrameToggleCircle,
                                TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                { BackgroundColor3 = Color3.fromRGB(255, 255, 255) }
                            ):Play()
                            FrameToggleCircle:TweenPosition(
                                UDim2.new(0.587, 0, 0.222000003, 0),
                                Enum.EasingDirection.Out,
                                Enum.EasingStyle.Quart,
                                .2,
                                true
                            )
                        else
                            TweenService:Create(
                                Toggle,
                                TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                { BackgroundColor3 = Color3.fromRGB(34, 34, 34) }
                            ):Play()
                            TweenService:Create(
                                FrameToggle1,
                                TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                { BackgroundTransparency = 0 }
                            ):Play()
                            TweenService:Create(
                                FrameToggle2,
                                TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                { BackgroundTransparency = 0 }
                            ):Play()
                            TweenService:Create(
                                FrameToggle3,
                                TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                { BackgroundTransparency = 1 }
                            ):Play()
                            TweenService:Create(
                                FrameToggleCircle,
                                TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                { BackgroundColor3 = Color3.fromRGB(50, 50, 50) }
                            ):Play()
                            FrameToggleCircle:TweenPosition(
                                UDim2.new(0.127000004, 0, 0.222000003, 0),
                                Enum.EasingDirection.Out,
                                Enum.EasingStyle.Quart,
                                .2,
                                true
                            )
                        end
                        toggled = not toggled
                        pcall(callback, toggled)
                    end
                )

                if default == true then
                    TweenService:Create(
                        Toggle,
                        TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        { BackgroundColor3 = Color3.fromRGB(37, 37, 37) }
                    ):Play()
                    TweenService:Create(
                        FrameToggle1,
                        TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        { BackgroundTransparency = 1 }
                    ):Play()
                    TweenService:Create(
                        FrameToggle2,
                        TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        { BackgroundTransparency = 1 }
                    ):Play()
                    TweenService:Create(
                        FrameToggle3,
                        TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        { BackgroundTransparency = 0 }
                    ):Play()
                    TweenService:Create(
                        FrameToggleCircle,
                        TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        { BackgroundColor3 = Color3.fromRGB(255, 255, 255) }
                    ):Play()
                    FrameToggleCircle:TweenPosition(
                        UDim2.new(0.587, 0, 0.222000003, 0),
                        Enum.EasingDirection.Out,
                        Enum.EasingStyle.Quart,
                        .2,
                        true
                    )
                    toggled = not toggled
                end

                local Toggle = {}

                function Toggle:Set(def)
                    default = def
                    toggled = def

                    if toggled == false then
                        TweenService:Create(
                            Toggle,
                            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            { BackgroundColor3 = Color3.fromRGB(37, 37, 37) }
                        ):Play()
                        TweenService:Create(
                            FrameToggle1,
                            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            { BackgroundTransparency = 1 }
                        ):Play()
                        TweenService:Create(
                            FrameToggle2,
                            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            { BackgroundTransparency = 1 }
                        ):Play()
                        TweenService:Create(
                            FrameToggle3,
                            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            { BackgroundTransparency = 0 }
                        ):Play()
                        TweenService:Create(
                            FrameToggleCircle,
                            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            { BackgroundColor3 = Color3.fromRGB(255, 255, 255) }
                        ):Play()
                        FrameToggleCircle:TweenPosition(
                            UDim2.new(0.587, 0, 0.222000003, 0),
                            Enum.EasingDirection.Out,
                            Enum.EasingStyle.Quart,
                            .2,
                            true
                        )
                    else
                        TweenService:Create(
                            Toggle,
                            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            { BackgroundColor3 = Color3.fromRGB(34, 34, 34) }
                        ):Play()
                        TweenService:Create(
                            FrameToggle1,
                            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            { BackgroundTransparency = 0 }
                        ):Play()
                        TweenService:Create(
                            FrameToggle2,
                            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            { BackgroundTransparency = 0 }
                        ):Play()
                        TweenService:Create(
                            FrameToggle3,
                            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            { BackgroundTransparency = 1 }
                        ):Play()
                        TweenService:Create(
                            FrameToggleCircle,
                            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            { BackgroundColor3 = Color3.fromRGB(50, 50, 50) }
                        ):Play()
                        FrameToggleCircle:TweenPosition(
                            UDim2.new(0.127000004, 0, 0.222000003, 0),
                            Enum.EasingDirection.Out,
                            Enum.EasingStyle.Quart,
                            .2,
                            true
                        )
                    end
                end

                Tab.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)

                return Toggle
            end

            function SectionContent:Slider(text, min, max, start, inc, callback)
                local Slider = Instance.new("TextButton")
                local SliderCorner = Instance.new("UICorner")
                local SliderTitle = Instance.new("TextLabel")
                local SliderValue = Instance.new("TextLabel")
                local SlideFrame = Instance.new("Frame")
                local CurrentValueFrame = Instance.new("Frame")
                local SlideCircle = Instance.new("ImageButton")

                Slider.Name = "Slider"
                Slider.Parent = Section
                Slider.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
                Slider.Position = UDim2.new(-0.48035714, 0, -0.570532918, 0)
                Slider.Size = UDim2.new(0, 363, 0, 60)
                Slider.AutoButtonColor = false
                Slider.Font = Enum.Font.SourceSans
                Slider.Text = ""
                Slider.TextColor3 = Color3.fromRGB(0, 0, 0)
                Slider.TextSize = 14.000

                SliderCorner.CornerRadius = UDim.new(0, 5)
                SliderCorner.Name = "SliderCorner"
                SliderCorner.Parent = Slider

                SliderTitle.Name = "SliderTitle"
                SliderTitle.Parent = Slider
                SliderTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                SliderTitle.BackgroundTransparency = 1.000
                SliderTitle.Position = UDim2.new(0.0358126722, 0, 0, 0)
                SliderTitle.Size = UDim2.new(0, 187, 0, 42)
                SliderTitle.Font = Enum.Font.Gotham
                SliderTitle.Text = text
                SliderTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
                SliderTitle.TextSize = 14.000
                SliderTitle.TextXAlignment = Enum.TextXAlignment.Left

                SliderValue.Name = "SliderValue"
                SliderValue.Parent = Slider
                SliderValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                SliderValue.BackgroundTransparency = 1.000
                SliderValue.Position = UDim2.new(0.0358126722, 0, 0, 0)
                SliderValue.Size = UDim2.new(0, 335, 0, 42)
                SliderValue.Font = Enum.Font.Gotham
                SliderValue.Text = tostring(start and math.floor((start / max) * (max - min) + min) or 0)
                SliderValue.TextColor3 = Color3.fromRGB(255, 255, 255)
                SliderValue.TextSize = 14.000
                SliderValue.TextXAlignment = Enum.TextXAlignment.Right

                SlideFrame.Name = "SlideFrame"
                SlideFrame.Parent = Slider
                SlideFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
                SlideFrame.BorderSizePixel = 0
                SlideFrame.Position = UDim2.new(0.0342647657, 0, 0.686091602, 0)
                SlideFrame.Size = UDim2.new(0, 335, 0, 3)

                CurrentValueFrame.Name = "CurrentValueFrame"
                CurrentValueFrame.Parent = SlideFrame
                CurrentValueFrame.BackgroundColor3 = PresetColor
                CurrentValueFrame.BorderSizePixel = 0
                CurrentValueFrame.Size = UDim2.new((start or 0) / max, 0, 0, 3)

                SlideCircle.Name = "SlideCircle"
                SlideCircle.Parent = SlideFrame
                SlideCircle.BackgroundColor3 = PresetColor
                SlideCircle.BackgroundTransparency = 1.000
                SlideCircle.Position = UDim2.new((start or 0) / max, -6, -1.30499995, 0)
                SlideCircle.Size = UDim2.new(0, 11, 0, 11)
                SlideCircle.Image = "rbxassetid://3570695787"
                SlideCircle.ImageColor3 = PresetColor

                coroutine.wrap(
                    function()
                        while wait() do
                            CurrentValueFrame.BackgroundColor3 = PresetColor
                            SlideCircle.ImageColor3 = PresetColor
                        end
                    end
                )()

                local Slider = {}
                local dragging = false

                local function move(Input)
                    local pos =
                    UDim2.new(
                    math.clamp((Input.Position.X - SlideFrame.AbsolutePosition.X) / SlideFrame.AbsoluteSize.X, 0, 1),, 0, 1, 0)
                    local XSize = math.clamp((Input.Position.X - SlideCircle.AbsolutePosition.X) /
                        SlideCircle.AbsoluteSize.X, 0, 1)
                    local Increment = inc and (max / ((max - min) / (inc * 4))) or
                        (max >= 50 and max / ((max - min) / 4)) or
                        (max >= 25 and max / ((max - min) / 2)) or (max / (max - min))
                    local SizeRounded = UDim2.new((math.round(XSize * ((max / Increment) * 4)) / ((max / Increment) * 4)
                        ), 0
                        , 1, 0)
                    TweenService:Create(CurrentValueFrame,
                        TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Size = SizeRounded }):
                        Play()
                    local Val = math.round((((SizeRounded.X.Scale * max) / max) * (max - min) + min) * 20) / 20
                    spawn(function()
                    	while wait() do
                    		SlideCircle:TweenPosition(pos, "Out", "Sine", 0.1, true)
                    	end
                    end)
                    SliderValue.Text = tostring(Val)
                    Slider.Value = Val
                    callback(Slider.Value)
                end

                SlideCircle.InputBegan:Connect(function(input) if input.UserInputType ==
                        Enum.UserInputType.MouseButton1 then dragging = true end
                end)
                SlideCircle.InputEnded:Connect(function(input) if input.UserInputType ==
                        Enum.UserInputType.MouseButton1 then dragging = false end
                end)
                game:GetService("UserInputService").InputChanged:Connect(function(input) if dragging and
                        input.UserInputType == Enum.UserInputType.MouseMovement then move(input) end
                end)

                function Slider:Set(val)
                    local a = tostring(val and (val / max) * (max - min) + min) or 0
                    SliderValue.Text = tostring(a)
                    CurrentValueFrame.Size = UDim2.new((val or 0) / max, 0, 1, 0)
                    Slider.Value = val
                    return callback(Slider.Value)
                end

                Tab.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)

                return Slider
            end

            function SectionContent:Dropdown(text, list, def, callback)
                local Dropdown, DropMain, OptionPreset =
                { Value = nil, Toggled = false, Options = list },
                    game:GetObjects("rbxassetid://7027964359")[1],
                    game:GetObjects("rbxassetid://7021432326")[1]
                DropMain.Parent = Section
                DropMain.Btn.Title.Text = text
                DropMain.Name = "Dropdown"
                Dropdown.BackgroundTransparency = 0
                Dropdown.BackgroundColor3 = 34, 34, 34
    
                local function ToggleDrop()
                    Dropdown.Toggled = not Dropdown.Toggled
                    DropMain.Holder.Size =
                    Dropdown.Toggled and UDim2.new(0, 363, 0, 6 + DropMain.Holder.Layout.AbsoluteContentSize.Y) or
                        UDim2.new(0, 363, 0, 0)
                    TweenService:Create(
                        DropMain,
                        TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {
                            Size = Dropdown.Toggled and
                                UDim2.new(0, 363, 0, 38 + DropMain.Holder.Layout.AbsoluteContentSize.Y) or
                                UDim2.new(0, 363, 0, 32)
                        }
                    ):Play()
                    TweenService:Create(
                        DropMain.Btn.Ico,
                        TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        { Rotation = Dropdown.Toggled and 180 or 0 }
                    ):Play()
                    DropMain.Holder.Visible = Dropdown.Toggled
                end
    
                local function AddOptions(opts)
                    for _, option in pairs(opts) do
                        local Option = OptionPreset:Clone()
                        Option.Parent = DropMain.Holder
                        Option.ItemText.Text = option
                        Option.ClipsDescendants = true
    
                        Option.MouseButton1Click:Connect(
                            function()
                                Dropdown.Value = option
                                DropMain.Btn.Title.Text = text .. " - " .. option
                                Ripple(Option)
                                return callback(Dropdown.Value)
                            end
                        )
    
                        spawn(
                            function()
                                while wait() do
                                    Option.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
                                    DropMain.Btn.Title.TextColor3 = Color3.fromRGB(155, 155, 155)
                                end
                            end
                        )
                    end
                end
    
                function Dropdown:Refresh(opts, del)
                    if del then
                        for _, v in pairs(DropMain.Holder:GetChildren()) do
                            if v:IsA "TextButton" then
                                v:Destroy()
                                DropMain.Holder.Size =
                                Dropdown.Toggled and
                                    UDim2.new(0, 363, 0, 6 + DropMain.Holder.Layout.AbsoluteContentSize.Y) or
                                    UDim2.new(0, 363, 0, 0)
                                DropMain.Size =
                                Dropdown.Toggled and
                                    UDim2.new(0, 363, 0, 38 + DropMain.Holder.Layout.AbsoluteContentSize.Y) or
                                    UDim2.new(0, 363, 0, 32)
                            end
                        end
                    end
                    AddOptions(opts)
                end
    
                DropMain.Btn.MouseButton1Click:Connect(
                    function()
                        ToggleDrop()
                    end
                )
    
                function Dropdown:Set(val)
                    Dropdown.Value = val
                    DropMain.Btn.Title.Text = text .. " - " .. val
                    return callback(Dropdown.Value)
                end
    
                spawn(
                    function()
                        while wait() do
                            DropMain.Btn.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
                            DropMain.Btn.Ico.ImageColor3 = Color3.fromRGB(255, 255, 255)
                        end
                    end
                )
    
                Dropdown:Refresh(list, false)
                Dropdown:Set(def)
    
                return Dropdown
            end
    
            function SectionContent:MultiDropdown(text, list, def, flag, callback)
                local Dropdown, DropMain, OptionPreset =
                { Value = {}, Toggled = false, Options = list },
                    game:GetObjects("rbxassetid://7027964359")[1],
                    game:GetObjects("rbxassetid://7021432326")[1]
                DropMain.Parent = Section
                DropMain.Btn.Title.Text = text
                DropMain.Name = text .. "element"
                Dropdown.BackgroundTransparency = 0
                Dropdown.BackgroundColor3 = 34, 34, 34
    
                local function ToggleDrop()
                    Dropdown.Toggled = not Dropdown.Toggled
                    DropMain.Holder.Size =
                    Dropdown.Toggled and UDim2.new(0, 363, 0, 6 + DropMain.Holder.Layout.AbsoluteContentSize.Y) or
                        UDim2.new(0, 363, 0, 0)
                    TweenService:Create(
                        DropMain,
                        TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {
                            Size = Dropdown.Toggled and
                                UDim2.new(0, 363, 0, 38 + DropMain.Holder.Layout.AbsoluteContentSize.Y) or
                                UDim2.new(0, 363, 0, 32)
                        }
                    ):Play()
                    TweenService:Create(
                        DropMain.Btn.Ico,
                        TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        { Rotation = Dropdown.Toggled and 180 or 0 }
                    ):Play()
                    DropMain.Holder.Visible = Dropdown.Toggled
                end
    
                local function AddOptions(opts)
                    for _, option in pairs(opts) do
                        local Option = OptionPreset:Clone()
                        Option.Parent = DropMain.Holder
                        Option.ItemText.Text = option
                        Option.ClipsDescendants = true
    
                        Option.MouseButton1Click:Connect(
                            function()
                                if table.find(Dropdown.Value, option) then
                                    table.remove(Dropdown.Value, table.find(Dropdown.Value, option))
                                    DropMain.Btn.Title.Text = text .. " - " .. table.concat(Dropdown.Value, ", ")
                                    callback(Dropdown.Value)
                                else
                                    table.insert(Dropdown.Value, option)
                                    DropMain.Btn.Title.Text = text .. " - " .. table.concat(Dropdown.Value, ", ")
                                    callback(Dropdown.Value)
                                end
                                Ripple(Option)
                            end
                        )
    
    
                        Option.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
                        DropMain.Btn.Title.TextColor3 = Color3.fromRGB(155, 155, 155)
    
                    end
                end
    
                function Dropdown:Refresh(opts, del)
                    if del then
                        for _, v in pairs(DropMain.Holder:GetChildren()) do
                            if v:IsA "TextButton" then
                                v:Destroy()
                                DropMain.Holder.Size =
                                Dropdown.Toggled and
                                    UDim2.new(0, 363, 0, 6 + DropMain.Holder.Layout.AbsoluteContentSize.Y) or
                                    UDim2.new(0, 363, 0, 0)
                                DropMain.Size =
                                Dropdown.Toggled and
                                    UDim2.new(0, 363, 0, 38 + DropMain.Holder.Layout.AbsoluteContentSize.Y) or
                                    UDim2.new(0, 363, 0, 32)
                            end
                        end
                    end
                    AddOptions(opts)
                end
    
                DropMain.Btn.MouseButton1Click:Connect(
                    function()
                        ToggleDrop()
                    end
                )
    
                function Dropdown:Set(val)
                    Dropdown.Value = val
                    DropMain.Btn.Title.Text = text .. " - " .. table.concat(Dropdown.Value, ", ")
                    return callback(Dropdown.Value)
                end
    
                DropMain.Btn.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
                DropMain.Btn.Ico.ImageColor3 = Color3.fromRGB(255, 255, 255)
    
                Dropdown:Refresh(list, false)
                return Dropdown
            end

            function SectionContent:Colorpicker(text, preset, callback)
                local ColorPickerToggled = false
                local OldToggleColor = Color3.fromRGB(0, 0, 0)
                local OldColor = Color3.fromRGB(0, 0, 0)
                local OldColorSelectionPosition = nil
                local OldHueSelectionPosition = nil
                local ColorH, ColorS, ColorV = 1, 1, 1
                local RainbowColorPicker = false
                local ColorPickerInput = nil
                local ColorInput = nil
                local HueInput = nil

                local Colorpicker = Instance.new("Frame")
                local ColorpickerCorner = Instance.new("UICorner")
                local ColorpickerTitle = Instance.new("TextLabel")
                local BoxColor = Instance.new("Frame")
                local BoxColorCorner = Instance.new("UICorner")
                local ConfirmBtn = Instance.new("TextButton")
                local ConfirmBtnCorner = Instance.new("UICorner")
                local ConfirmBtnTitle = Instance.new("TextLabel")
                local ColorpickerBtn = Instance.new("TextButton")
                local RainbowToggle = Instance.new("TextButton")
                local RainbowToggleCorner = Instance.new("UICorner")
                local RainbowToggleTitle = Instance.new("TextLabel")
                local FrameRainbowToggle1 = Instance.new("Frame")
                local FrameRainbowToggle1Corner = Instance.new("UICorner")
                local FrameRainbowToggle2 = Instance.new("Frame")
                local FrameRainbowToggle2_2 = Instance.new("UICorner")
                local FrameRainbowToggle3 = Instance.new("Frame")
                local FrameToggle3 = Instance.new("UICorner")
                local FrameRainbowToggleCircle = Instance.new("Frame")
                local FrameRainbowToggleCircleCorner = Instance.new("UICorner")
                local Color = Instance.new("ImageLabel")
                local ColorCorner = Instance.new("UICorner")
                local ColorSelection = Instance.new("ImageLabel")
                local Hue = Instance.new("ImageLabel")
                local HueCorner = Instance.new("UICorner")
                local HueGradient = Instance.new("UIGradient")
                local HueSelection = Instance.new("ImageLabel")

                Colorpicker.Name = "Colorpicker"
                Colorpicker.Parent = Section
                Colorpicker.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
                Colorpicker.ClipsDescendants = true
                Colorpicker.Position = UDim2.new(-0.541071415, 0, -0.532915354, 0)
                Colorpicker.Size = UDim2.new(0, 363, 0, 42)

                ColorpickerCorner.CornerRadius = UDim.new(0, 5)
                ColorpickerCorner.Name = "ColorpickerCorner"
                ColorpickerCorner.Parent = Colorpicker

                ColorpickerTitle.Name = "ColorpickerTitle"
                ColorpickerTitle.Parent = Colorpicker
                ColorpickerTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ColorpickerTitle.BackgroundTransparency = 1.000
                ColorpickerTitle.Position = UDim2.new(0.0358126722, 0, 0, 0)
                ColorpickerTitle.Size = UDim2.new(0, 187, 0, 42)
                ColorpickerTitle.Font = Enum.Font.Gotham
                ColorpickerTitle.Text = text
                ColorpickerTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
                ColorpickerTitle.TextSize = 14.000
                ColorpickerTitle.TextXAlignment = Enum.TextXAlignment.Left

                BoxColor.Name = "BoxColor"
                BoxColor.Parent = ColorpickerTitle
                BoxColor.BackgroundColor3 = Color3.fromRGB(255, 0, 4)
                BoxColor.Position = UDim2.new(1.60427809, 0, 0.214285716, 0)
                BoxColor.Size = UDim2.new(0, 41, 0, 23)

                BoxColorCorner.CornerRadius = UDim.new(0, 5)
                BoxColorCorner.Name = "BoxColorCorner"
                BoxColorCorner.Parent = BoxColor

                ConfirmBtn.Name = "ConfirmBtn"
                ConfirmBtn.Parent = ColorpickerTitle
                ConfirmBtn.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
                ConfirmBtn.Position = UDim2.new(1.25814295, 0, 1.09037197, 0)
                ConfirmBtn.Size = UDim2.new(0, 105, 0, 32)
                ConfirmBtn.AutoButtonColor = false
                ConfirmBtn.Font = Enum.Font.SourceSans
                ConfirmBtn.Text = ""
                ConfirmBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
                ConfirmBtn.TextSize = 14.000

                ConfirmBtnCorner.CornerRadius = UDim.new(0, 5)
                ConfirmBtnCorner.Name = "ConfirmBtnCorner"
                ConfirmBtnCorner.Parent = ConfirmBtn

                ConfirmBtnTitle.Name = "ConfirmBtnTitle"
                ConfirmBtnTitle.Parent = ConfirmBtn
                ConfirmBtnTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ConfirmBtnTitle.BackgroundTransparency = 1.000
                ConfirmBtnTitle.Size = UDim2.new(0, 33, 0, 32)
                ConfirmBtnTitle.Font = Enum.Font.Gotham
                ConfirmBtnTitle.Text = "Confirm"
                ConfirmBtnTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
                ConfirmBtnTitle.TextSize = 14.000
                ConfirmBtnTitle.TextXAlignment = Enum.TextXAlignment.Left

                ColorpickerBtn.Name = "ColorpickerBtn"
                ColorpickerBtn.Parent = ColorpickerTitle
                ColorpickerBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ColorpickerBtn.BackgroundTransparency = 1.000
                ColorpickerBtn.Size = UDim2.new(0, 363, 0, 42)
                ColorpickerBtn.Font = Enum.Font.SourceSans
                ColorpickerBtn.Text = ""
                ColorpickerBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
                ColorpickerBtn.TextSize = 14.000

                RainbowToggle.Name = "RainbowToggle"
                RainbowToggle.Parent = ColorpickerTitle
                RainbowToggle.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
                RainbowToggle.Position = UDim2.new(1.26349044, 0, 2.12684202, 0)
                RainbowToggle.Size = UDim2.new(0, 104, 0, 32)
                RainbowToggle.AutoButtonColor = false
                RainbowToggle.Font = Enum.Font.SourceSans
                RainbowToggle.Text = ""
                RainbowToggle.TextColor3 = Color3.fromRGB(0, 0, 0)
                RainbowToggle.TextSize = 14.000

                RainbowToggleCorner.CornerRadius = UDim.new(0, 5)
                RainbowToggleCorner.Name = "RainbowToggleCorner"
                RainbowToggleCorner.Parent = RainbowToggle

                RainbowToggleTitle.Name = "RainbowToggleTitle"
                RainbowToggleTitle.Parent = RainbowToggle
                RainbowToggleTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                RainbowToggleTitle.BackgroundTransparency = 1.000
                RainbowToggleTitle.Size = UDim2.new(0, 33, 0, 32)
                RainbowToggleTitle.Font = Enum.Font.Gotham
                RainbowToggleTitle.Text = "Rainbow"
                RainbowToggleTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
                RainbowToggleTitle.TextSize = 14.000
                RainbowToggleTitle.TextXAlignment = Enum.TextXAlignment.Left

                FrameRainbowToggle1.Name = "FrameRainbowToggle1"
                FrameRainbowToggle1.Parent = RainbowToggle
                FrameRainbowToggle1.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
                FrameRainbowToggle1.Position = UDim2.new(0.649999976, 0, 0.186000004, 0)
                FrameRainbowToggle1.Size = UDim2.new(0, 37, 0, 18)

                FrameRainbowToggle1Corner.Name = "FrameRainbowToggle1Corner"
                FrameRainbowToggle1Corner.Parent = FrameRainbowToggle1

                FrameRainbowToggle2.Name = "FrameRainbowToggle2"
                FrameRainbowToggle2.Parent = FrameRainbowToggle1
                FrameRainbowToggle2.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
                FrameRainbowToggle2.Position = UDim2.new(0.0590000004, 0, 0.112999998, 0)
                FrameRainbowToggle2.Size = UDim2.new(0, 33, 0, 14)

                FrameRainbowToggle2_2.Name = "FrameRainbowToggle2"
                FrameRainbowToggle2_2.Parent = FrameRainbowToggle2

                FrameRainbowToggle3.Name = "FrameRainbowToggle3"
                FrameRainbowToggle3.Parent = FrameRainbowToggle1
                FrameRainbowToggle3.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
                FrameRainbowToggle3.BackgroundTransparency = 1.000
                FrameRainbowToggle3.Size = UDim2.new(0, 37, 0, 18)

                FrameToggle3.Name = "FrameToggle3"
                FrameToggle3.Parent = FrameRainbowToggle3

                FrameRainbowToggleCircle.Name = "FrameRainbowToggleCircle"
                FrameRainbowToggleCircle.Parent = FrameRainbowToggle1
                FrameRainbowToggleCircle.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
                FrameRainbowToggleCircle.Position = UDim2.new(0.127000004, 0, 0.222000003, 0)
                FrameRainbowToggleCircle.Size = UDim2.new(0, 10, 0, 10)

                FrameRainbowToggleCircleCorner.Name = "FrameRainbowToggleCircleCorner"
                FrameRainbowToggleCircleCorner.Parent = FrameRainbowToggleCircle

                Color.Name = "Color"
                Color.Parent = ColorpickerTitle
                Color.BackgroundColor3 = Color3.fromRGB(255, 0, 4)
                Color.Position = UDim2.new(0, 0, 0, 42)
                Color.Size = UDim2.new(0, 194, 0, 80)
                Color.ZIndex = 10
                Color.Image = "rbxassetid://4155801252"

                ColorCorner.CornerRadius = UDim.new(0, 3)
                ColorCorner.Name = "ColorCorner"
                ColorCorner.Parent = Color

                ColorSelection.Name = "ColorSelection"
                ColorSelection.Parent = Color
                ColorSelection.AnchorPoint = Vector2.new(0.5, 0.5)
                ColorSelection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ColorSelection.BackgroundTransparency = 1.000
                ColorSelection.Position = UDim2.new(preset and select(3, Color3.toHSV(preset)))
                ColorSelection.Size = UDim2.new(0, 18, 0, 18)
                ColorSelection.Image = "http://www.roblox.com/asset/?id=4805639000"
                ColorSelection.ScaleType = Enum.ScaleType.Fit
                ColorSelection.Visible = false

                Hue.Name = "Hue"
                Hue.Parent = ColorpickerTitle
                Hue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Hue.Position = UDim2.new(0, 202, 0, 42)
                Hue.Size = UDim2.new(0, 25, 0, 80)

                HueCorner.CornerRadius = UDim.new(0, 3)
                HueCorner.Name = "HueCorner"
                HueCorner.Parent = Hue

                HueGradient.Color =
                ColorSequence.new {
                    ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 4)),
                    ColorSequenceKeypoint.new(0.20, Color3.fromRGB(234, 255, 0)),
                    ColorSequenceKeypoint.new(0.40, Color3.fromRGB(21, 255, 0)),
                    ColorSequenceKeypoint.new(0.60, Color3.fromRGB(0, 255, 255)),
                    ColorSequenceKeypoint.new(0.80, Color3.fromRGB(0, 17, 255)),
                    ColorSequenceKeypoint.new(0.90, Color3.fromRGB(255, 0, 251)),
                    ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 4))
                }
                HueGradient.Rotation = 270
                HueGradient.Name = "HueGradient"
                HueGradient.Parent = Hue

                HueSelection.Name = "HueSelection"
                HueSelection.Parent = Hue
                HueSelection.AnchorPoint = Vector2.new(0.5, 0.5)
                HueSelection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                HueSelection.BackgroundTransparency = 1.000
                HueSelection.Position = UDim2.new(0.48, 0, 1 - select(1, Color3.toHSV(preset)))
                HueSelection.Size = UDim2.new(0, 18, 0, 18)
                HueSelection.Image = "http://www.roblox.com/asset/?id=4805639000"
                HueSelection.Visible = false

                coroutine.wrap(
                    function()
                        while wait() do
                            FrameRainbowToggle3.BackgroundColor3 = PresetColor
                        end
                    end
                )()

                ColorpickerBtn.MouseButton1Click:Connect(
                    function()
                        if ColorPickerToggled == false then
                            ColorSelection.Visible = true
                            HueSelection.Visible = true
                            Colorpicker:TweenSize(
                                UDim2.new(0, 363, 0, 132),
                                Enum.EasingDirection.Out,
                                Enum.EasingStyle.Quart,
                                .2,
                                true
                            )
                            wait(.2)
                            Tab.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)
                        else
                            ColorSelection.Visible = false
                            HueSelection.Visible = false
                            Colorpicker:TweenSize(
                                UDim2.new(0, 363, 0, 42),
                                Enum.EasingDirection.Out,
                                Enum.EasingStyle.Quart,
                                .2,
                                true
                            )
                            wait(.2)
                            Tab.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)
                        end
                        ColorPickerToggled = not ColorPickerToggled
                    end
                )

                local function UpdateColorPicker(nope)
                    BoxColor.BackgroundColor3 = Color3.fromHSV(ColorH, ColorS, ColorV)
                    Color.BackgroundColor3 = Color3.fromHSV(ColorH, 1, 1)

                    pcall(callback, BoxColor.BackgroundColor3)
                end

                ColorH =
                1 -
                    (math.clamp(HueSelection.AbsolutePosition.Y - Hue.AbsolutePosition.Y, 0, Hue.AbsoluteSize.Y) /
                        Hue.AbsoluteSize.Y)
                ColorS =
                (math.clamp(ColorSelection.AbsolutePosition.X - Color.AbsolutePosition.X, 0, Color.AbsoluteSize.X) /
                    Color.AbsoluteSize.X)
                ColorV =
                1 -
                    (
                    math.clamp(ColorSelection.AbsolutePosition.Y - Color.AbsolutePosition.Y, 0, Color.AbsoluteSize.Y) /
                        Color.AbsoluteSize.Y)

                BoxColor.BackgroundColor3 = preset
                Color.BackgroundColor3 = preset
                pcall(callback, BoxColor.BackgroundColor3)

                Color.InputBegan:Connect(
                    function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            if RainbowColorPicker then
                                return
                            end

                            if ColorInput then
                                ColorInput:Disconnect()
                            end

                            ColorInput =
                            RunService.RenderStepped:Connect(
                                function()
                                    local ColorX =
                                    (math.clamp(Mouse.X - Color.AbsolutePosition.X, 0, Color.AbsoluteSize.X) /
                                        Color.AbsoluteSize.X)
                                    local ColorY =
                                    (math.clamp(Mouse.Y - Color.AbsolutePosition.Y, 0, Color.AbsoluteSize.Y) /
                                        Color.AbsoluteSize.Y)

                                    ColorSelection.Position = UDim2.new(ColorX, 0, ColorY, 0)
                                    ColorS = ColorX
                                    ColorV = 1 - ColorY

                                    UpdateColorPicker(true)
                                end
                            )
                        end
                    end
                )

                Color.InputEnded:Connect(
                    function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            if ColorInput then
                                ColorInput:Disconnect()
                            end
                        end
                    end
                )

                Hue.InputBegan:Connect(
                    function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            if RainbowColorPicker then
                                return
                            end

                            if HueInput then
                                HueInput:Disconnect()
                            end

                            HueInput =
                            RunService.RenderStepped:Connect(
                                function()
                                    local HueY =
                                    (math.clamp(Mouse.Y - Hue.AbsolutePosition.Y, 0, Hue.AbsoluteSize.Y) /
                                        Hue.AbsoluteSize.Y)

                                    HueSelection.Position = UDim2.new(0.48, 0, HueY, 0)
                                    ColorH = 1 - HueY

                                    UpdateColorPicker(true)
                                end
                            )
                        end
                    end
                )

                Hue.InputEnded:Connect(
                    function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            if HueInput then
                                HueInput:Disconnect()
                            end
                        end
                    end
                )

                RainbowToggle.MouseButton1Down:Connect(
                    function()
                        RainbowColorPicker = not RainbowColorPicker

                        if ColorInput then
                            ColorInput:Disconnect()
                        end

                        if HueInput then
                            HueInput:Disconnect()
                        end

                        if RainbowColorPicker then
                            TweenService:Create(
                                FrameRainbowToggle1,
                                TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                { BackgroundTransparency = 1 }
                            ):Play()
                            TweenService:Create(
                                FrameRainbowToggle2,
                                TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                { BackgroundTransparency = 1 }
                            ):Play()
                            TweenService:Create(
                                FrameRainbowToggle3,
                                TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                { BackgroundTransparency = 0 }
                            ):Play()
                            TweenService:Create(
                                FrameRainbowToggleCircle,
                                TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                { BackgroundColor3 = Color3.fromRGB(255, 255, 255) }
                            ):Play()
                            FrameRainbowToggleCircle:TweenPosition(
                                UDim2.new(0.587, 0, 0.222000003, 0),
                                Enum.EasingDirection.Out,
                                Enum.EasingStyle.Quart,
                                .2,
                                true
                            )

                            OldToggleColor = BoxColor.BackgroundColor3
                            OldColor = Color.BackgroundColor3
                            OldColorSelectionPosition = ColorSelection.Position
                            OldHueSelectionPosition = HueSelection.Position

                            while RainbowColorPicker do
                                BoxColor.BackgroundColor3 = Color3.fromHSV(lib.RainbowColorValue, 1, 1)
                                Color.BackgroundColor3 = Color3.fromHSV(lib.RainbowColorValue, 1, 1)

                                ColorSelection.Position = UDim2.new(1, 0, 0, 0)
                                HueSelection.Position = UDim2.new(0.48, 0, 0, lib.HueSelectionPosition)

                                pcall(callback, BoxColor.BackgroundColor3)
                                wait()
                            end
                        elseif not RainbowColorPicker then
                            TweenService:Create(
                                FrameRainbowToggle1,
                                TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                { BackgroundTransparency = 0 }
                            ):Play()
                            TweenService:Create(
                                FrameRainbowToggle2,
                                TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                { BackgroundTransparency = 0 }
                            ):Play()
                            TweenService:Create(
                                FrameRainbowToggle3,
                                TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                { BackgroundTransparency = 1 }
                            ):Play()
                            TweenService:Create(
                                FrameRainbowToggleCircle,
                                TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                { BackgroundColor3 = Color3.fromRGB(50, 50, 50) }
                            ):Play()
                            FrameRainbowToggleCircle:TweenPosition(
                                UDim2.new(0.127000004, 0, 0.222000003, 0),
                                Enum.EasingDirection.Out,
                                Enum.EasingStyle.Quart,
                                .2,
                                true
                            )

                            BoxColor.BackgroundColor3 = OldToggleColor
                            Color.BackgroundColor3 = OldColor

                            ColorSelection.Position = OldColorSelectionPosition
                            HueSelection.Position = OldHueSelectionPosition

                            pcall(callback, BoxColor.BackgroundColor3)
                        end
                    end
                )

                ConfirmBtn.MouseButton1Click:Connect(
                    function()
                        ColorSelection.Visible = false
                        HueSelection.Visible = false
                        Colorpicker:TweenSize(
                            UDim2.new(0, 363, 0, 42),
                            Enum.EasingDirection.Out,
                            Enum.EasingStyle.Quart,
                            .2,
                            true
                        )
                        wait(.2)
                        Tab.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)
                    end
                )
                Tab.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)
            end

            function SectionContent:Label(text, color)
                local Label = Instance.new("TextButton")
                local LabelCorner = Instance.new("UICorner")
                local LabelTitle = Instance.new("TextLabel")

                Label.Name = "Button"
                Label.Parent = Section
                Label.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
                Label.Size = UDim2.new(0, 363, 0, 42)
                Label.AutoButtonColor = false
                Label.Font = Enum.Font.SourceSans
                Label.Text = ""
                Label.TextColor3 = Color3.fromRGB(0, 0, 0)
                Label.TextSize = 14.000

                LabelCorner.CornerRadius = UDim.new(0, 5)
                LabelCorner.Name = "ButtonCorner"
                LabelCorner.Parent = Label

                LabelTitle.Name = "ButtonTitle"
                LabelTitle.Parent = Label
                LabelTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                LabelTitle.BackgroundTransparency = 1.000
                LabelTitle.Position = UDim2.new(0.0358126722, 0, 0, 0)
                LabelTitle.Size = UDim2.new(0, 187, 0, 42)
                LabelTitle.Font = Enum.Font.Gotham
                LabelTitle.Text = text
                LabelTitle.TextColor3 = color
                LabelTitle.TextSize = 14.000
                LabelTitle.TextXAlignment = Enum.TextXAlignment.Left

                local LabelFuns = {}

                function LabelFuns:Set(newtext, newcolor)
                    LabelTitle.Text = newtext
                    LabelTitle.TextColor3 = newcolor
                end

                Tab.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)

                return LabelFuns
            end

            function SectionContent:Textbox(text, disapper, callback)
                local Textbox = Instance.new("Frame")
                local TextboxCorner = Instance.new("UICorner")
                local TextboxTitle = Instance.new("TextLabel")
                local TextboxFrame = Instance.new("Frame")
                local TextboxFrameCorner = Instance.new("UICorner")
                local TextBox = Instance.new("TextBox")

                Textbox.Name = "Textbox"
                Textbox.Parent = Section
                Textbox.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
                Textbox.ClipsDescendants = true
                Textbox.Position = UDim2.new(-0.541071415, 0, -0.532915354, 0)
                Textbox.Size = UDim2.new(0, 363, 0, 42)

                TextboxCorner.CornerRadius = UDim.new(0, 5)
                TextboxCorner.Name = "TextboxCorner"
                TextboxCorner.Parent = Textbox

                TextboxTitle.Name = "TextboxTitle"
                TextboxTitle.Parent = Textbox
                TextboxTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                TextboxTitle.BackgroundTransparency = 1.000
                TextboxTitle.Position = UDim2.new(0.0358126722, 0, 0, 0)
                TextboxTitle.Size = UDim2.new(0, 187, 0, 42)
                TextboxTitle.Font = Enum.Font.Gotham
                TextboxTitle.Text = text
                TextboxTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
                TextboxTitle.TextSize = 14.000
                TextboxTitle.TextXAlignment = Enum.TextXAlignment.Left

                TextboxFrame.Name = "TextboxFrame"
                TextboxFrame.Parent = TextboxTitle
                TextboxFrame.BackgroundColor3 = Color3.fromRGB(37, 37, 37)
                TextboxFrame.Position = UDim2.new(1.28877008, 0, 0.214285716, 0)
                TextboxFrame.Size = UDim2.new(0, 100, 0, 23)

                TextboxFrameCorner.CornerRadius = UDim.new(0, 5)
                TextboxFrameCorner.Name = "TextboxFrameCorner"
                TextboxFrameCorner.Parent = TextboxFrame

                TextBox.Parent = TextboxFrame
                TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                TextBox.BackgroundTransparency = 1.000
                TextBox.Size = UDim2.new(0, 100, 0, 23)
                TextBox.Font = Enum.Font.Gotham
                TextBox.Text = ""
                TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
                TextBox.TextSize = 14.000

                TextBox.Changed:Connect(function()
                    TextBox.Size = UDim2.new(0, TextBox.TextBounds.X + 16, 0, 23)
                end)

                TextboxFrame.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        TextBox:CaptureFocus()
                    end
                end)

				TextBox.FocusLost:Connect(
                function(ep)
                    if ep then
                        if #TextBox.Text > 0 then
                            pcall(callback, TextBox.Text)
                            if disapper then
                                TextBox.Text = ""
                            end
                        end
                    end
                end)

                UserInputService.InputBegan:Connect(function(input)
                    if input.KeyCode == Enum.KeyCode.Escape and TextBox:IsFocused() then
                        TextBox:ReleaseFocus()
                    end
                end)
                Tab.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)
            end

            function SectionContent:Bind(text, preset, holdmode, callback)
                local Bind = Instance.new("TextButton")
                local BindCorner = Instance.new("UICorner")
                local BindTitle = Instance.new("TextLabel")
                local BindText = Instance.new("TextLabel")

                Bind.Name = "Bind"
                Bind.Parent = Section
                Bind.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
                Bind.Size = UDim2.new(0, 363, 0, 42)
                Bind.AutoButtonColor = false
                Bind.Font = Enum.Font.SourceSans
                Bind.Text = ""
                Bind.TextColor3 = Color3.fromRGB(0, 0, 0)
                Bind.TextSize = 14.000

                BindCorner.CornerRadius = UDim.new(0, 5)
                BindCorner.Name = "BindCorner"
                BindCorner.Parent = Bind

                BindTitle.Name = "BindTitle"
                BindTitle.Parent = Bind
                BindTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                BindTitle.BackgroundTransparency = 1.000
                BindTitle.Position = UDim2.new(0.0358126722, 0, 0, 0)
                BindTitle.Size = UDim2.new(0, 187, 0, 42)
                BindTitle.Font = Enum.Font.Gotham
                BindTitle.Text = text
                BindTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
                BindTitle.TextSize = 14.000
                BindTitle.TextXAlignment = Enum.TextXAlignment.Left

                BindText.Name = "BindText"
                BindText.Parent = Bind
                BindText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                BindText.BackgroundTransparency = 1.000
                BindText.Position = UDim2.new(0.0358126722, 0, 0, 0)
                BindText.Size = UDim2.new(0, 337, 0, 42)
                BindText.Font = Enum.Font.Gotham
                BindText.TextColor3 = Color3.fromRGB(255, 255, 255)
                BindText.TextSize = 14.000
                BindText.TextXAlignment = Enum.TextXAlignment.Right

                Tab.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)

                local Bind = { Value, Binding = false, Holding = false }

                Bind.InputEnded:Connect(
                    function(Input)
                        if Input.UserInputType == Enum.UserInputType.MouseButton1 then
                            if Bind.Binding then
                                return
                            end
                            Bind.Binding = true
                            BindText.Text = "Waiting for input"
                        end
                    end
                )

                UserInputService.InputBegan:Connect(
                    function(Input)
                        if UserInputService:GetFocusedTextBox() then
                            return
                        end
                        if (Input.KeyCode.Name == Bind.Value or Input.UserInputType.Name == Bind.Value) and
                            not Bind.Binding
                        then
                            if holdmode then
                                Holding = true
                                callback(Holding)
                            else
                                callback()
                            end
                        elseif Bind.Binding then
                            local Key
                            pcall(
                                function()
                                    if not CheckKey(BlacklistedKeys, Input.KeyCode) then
                                        Key = Input.KeyCode
                                    end
                                end
                            )
                            pcall(
                                function()
                                    if CheckKey(WhitelistedMouse, Input.UserInputType) and not Key then
                                        Key = Input.UserInputType
                                    end
                                end
                            )
                            Key = Key or Bind.Value
                            Bind:Set(Key)
                        end
                    end
                )

                UserInputService.InputEnded:Connect(
                    function(Input)
                        if Input.KeyCode.Name == Bind.Value or Input.UserInputType.Name == Bind.Value then
                            if holdmode and Holding then
                                Holding = false
                                callback(Holding)
                            end
                        end
                    end
                )

                function Bind:Set(key)
                    self.Binding = false
                    self.Value = key or self.Value
                    self.Value = self.Value.Name or self.Value
                    BindText.Text = self.Value
                end

                Bind:Set(preset)
                return Bind
            end

            return SectionHold
        end

        return tabcontent
    end

    return tabhold
end

return lib
