local Library = {
    Flags = {},
    CurrentTab = {}
}

local Wonia = Instance.new("ScreenGui")
Wonia.Name = "Wonia Nigga Fuck Bitch Ur Ass Hole"
Wonia.Parent = game.CoreGui
Wonia.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local http = game:GetService("HttpService")

local WhitelistedMouse = { Enum.UserInputType.MouseButton1, Enum.UserInputType.MouseButton2,
    Enum.UserInputType.MouseButton3 }
local BlacklistedKeys = { Enum.KeyCode.Unknown, Enum.KeyCode.W, Enum.KeyCode.A, Enum.KeyCode.S, Enum.KeyCode.D,
    Enum.KeyCode.Up, Enum.KeyCode.Left, Enum.KeyCode.Down, Enum.KeyCode.Right, Enum.KeyCode.Slash, Enum.KeyCode.Tab,
    Enum.KeyCode.Backspace, Enum.KeyCode.Escape }

local function CheckKey(tab, key)
    for i, v in next, tab do
        if v == key then
            return true
        end
    end
end

function Ripple(Object)
    spawn(function()
        local Circle = Instance.new("ImageLabel")
        Circle.Parent = Object
        Circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Circle.BackgroundTransparency = 1.000
        Circle.ZIndex = 10
        Circle.Image = "rbxassetid://266543268"
        Circle.ImageColor3 = Color3.fromRGB(210, 210, 210)
        Circle.ImageTransparency = 0.8
        Circle.Position = UDim2.new(0, Mouse.X - Circle.AbsolutePosition.X, 0, Mouse.Y - Circle.AbsolutePosition.Y)
        local Size = Object.AbsoluteSize.X
        TweenService:Create(Circle, TweenInfo.new(0.5),
            { Position = UDim2.fromScale(math.clamp(Mouse.X - Object.AbsolutePosition.X, 0, Object.AbsoluteSize.X) /
                Object.AbsoluteSize.X, Object,
                math.clamp(Mouse.Y - Object.AbsolutePosition.Y, 0, Object.AbsoluteSize.Y) / Object.AbsoluteSize.Y) -
                UDim2.fromOffset(Size / 2, Size / 2), ImageTransparency = 1, Size = UDim2.fromOffset(Size, Size) }):Play()
        spawn(function()
            wait(0.5)
            Circle:Destroy()
        end)
    end)
end

local function MakeDraggable(topbarobject, object)
    pcall(function()
        local dragging, dragInput, mousePos, framePos = false
        topbarobject.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = true
                mousePos = input.Position
                framePos = object.Position

                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then
                        dragging = false
                    end
                end)
            end
        end)
        topbarobject.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement then
                dragInput = input
            end
        end)
        UserInputService.InputChanged:Connect(function(input)
            if input == dragInput and dragging then
                local delta     = input.Position - mousePos
                object.Position = UDim2.new(framePos.X.Scale, framePos.X.Offset + delta.X, framePos.Y.Scale,
                    framePos.Y.Offset + delta.Y)
            end
        end)
    end)
end

function Ripple(Object)
    spawn(function()
        local Circle = Instance.new("ImageLabel")
        Circle.Parent = Object
        Circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Circle.BackgroundTransparency = 1.000
        Circle.ZIndex = 10
        Circle.Image = "rbxassetid://266543268"
        Circle.ImageColor3 = Color3.fromRGB(210, 210, 210)
        Circle.ImageTransparency = 0.8
        Circle.Position = UDim2.new(0, Mouse.X - Circle.AbsolutePosition.X, 0, Mouse.Y - Circle.AbsolutePosition.Y)
        local Size = Object.AbsoluteSize.X
        TweenService:Create(Circle, TweenInfo.new(0.5),
            { Position = UDim2.fromScale(math.clamp(Mouse.X - Object.AbsolutePosition.X, 0, Object.AbsoluteSize.X) /
                Object.AbsoluteSize.X, Object,
                math.clamp(Mouse.Y - Object.AbsolutePosition.Y, 0, Object.AbsoluteSize.Y) / Object.AbsoluteSize.Y) -
                UDim2.fromOffset(Size / 2, Size / 2), ImageTransparency = 1, Size = UDim2.fromOffset(Size, Size) }):Play()
        spawn(function()
            wait(0.5)
            Circle:Destroy()
        end)
    end)
end

function Library:Window(WindowConfig)
    WindowConfig.Title = WindowConfig.Title or "WoniaUi Cool"

    fs = false

    local MainFrame = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local TopBar = Instance.new("ImageLabel")
    local TopFrameTitle = Instance.new("TextLabel")
    local ButtonHolder = Instance.new("Frame")
    local UIListLayout = Instance.new("UIListLayout")
    local MinimizeBtn = Instance.new("TextButton")
    local Ico = Instance.new("ImageLabel")
    local CloseBtn = Instance.new("TextButton")
    local Ico_2 = Instance.new("ImageLabel")
    local Menu = Instance.new("Frame")
    local Holder = Instance.new("Frame")
    local UIPadding = Instance.new("UIPadding")
    local UIListLayout_2 = Instance.new("UIListLayout")
    local HideFrame = Instance.new("Frame")

    MainFrame.Name = "MainFrame"
    MainFrame.Parent = Wonia
    MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    MainFrame.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
    MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    MainFrame.Size = UDim2.new(0, 650, 0, 400)

    UICorner.CornerRadius = UDim.new(0, 6)
    UICorner.Parent = MainFrame

    TopBar.Name = "TopBar"
    TopBar.Parent = MainFrame
    TopBar.BackgroundColor3 = Color3.fromRGB(248, 248, 248)
    TopBar.BackgroundTransparency = 1.000
    TopBar.BorderSizePixel = 0
    TopBar.Size = UDim2.new(1, 0, 0, 40)
    TopBar.ZIndex = 3
    TopBar.Image = "rbxassetid://6276641225"
    TopBar.ImageColor3 = Color3.fromRGB(32, 32, 32)
    TopBar.ScaleType = Enum.ScaleType.Slice
    TopBar.SliceCenter = Rect.new(256, 256, 256, 256)
    TopBar.SliceScale = 0.022

    TopFrameTitle.Name = "TopFrameTitle"
    TopFrameTitle.Parent = TopBar
    TopFrameTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TopFrameTitle.BackgroundTransparency = 1.000
    TopFrameTitle.Position = UDim2.new(0, 9, 0, 0)
    TopFrameTitle.Size = UDim2.new(1.03692305, -33, 1, 0)
    TopFrameTitle.Font = Enum.Font.Gotham
    TopFrameTitle.Text = "Yaya This Windows11"
    TopFrameTitle.TextColor3 = Color3.fromRGB(240, 240, 240)
    TopFrameTitle.TextSize = 14.000
    TopFrameTitle.TextXAlignment = Enum.TextXAlignment.Left

    ButtonHolder.Name = "ButtonHolder"
    ButtonHolder.Parent = TopBar
    ButtonHolder.AnchorPoint = Vector2.new(1, 0)
    ButtonHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ButtonHolder.BackgroundTransparency = 1.000
    ButtonHolder.Position = UDim2.new(1, 0, 0, 0)
    ButtonHolder.Size = UDim2.new(-0.0615384616, 120, 1, 0)

    UIListLayout.Parent = ButtonHolder
    UIListLayout.FillDirection = Enum.FillDirection.Horizontal
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

    MinimizeBtn.Name = "MinimizeBtn"
    MinimizeBtn.Parent = ButtonHolder
    MinimizeBtn.AnchorPoint = Vector2.new(1, 0.5)
    MinimizeBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    MinimizeBtn.BackgroundTransparency = 1.000
    MinimizeBtn.LayoutOrder = 3
    MinimizeBtn.Position = UDim2.new(1, 0, 0.5, 0)
    MinimizeBtn.Size = UDim2.new(0, 38, 0, 38)
    MinimizeBtn.Font = Enum.Font.SourceSans
    MinimizeBtn.Text = ""
    MinimizeBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
    MinimizeBtn.TextSize = 14.000

    Ico.Name = "Ico"
    Ico.Parent = MinimizeBtn
    Ico.AnchorPoint = Vector2.new(0.5, 0.5)
    Ico.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Ico.BackgroundTransparency = 1.000
    Ico.Position = UDim2.new(0.5, 0, 0.5, 0)
    Ico.Size = UDim2.new(0, 22, 0, 22)
    Ico.Image = "rbxassetid://3926307971"
    Ico.ImageRectOffset = Vector2.new(884, 284)
    Ico.ImageRectSize = Vector2.new(36, 36)
    Ico.ImageTransparency = 0.400

    CloseBtn.Name = "CloseBtn"
    CloseBtn.Parent = ButtonHolder
    CloseBtn.AnchorPoint = Vector2.new(1, 0.5)
    CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    CloseBtn.BackgroundTransparency = 1.000
    CloseBtn.LayoutOrder = 3
    CloseBtn.Position = UDim2.new(1, 0, 0.5, 0)
    CloseBtn.Size = UDim2.new(0, 38, 0, 38)
    CloseBtn.Font = Enum.Font.SourceSans
    CloseBtn.Text = ""
    CloseBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
    CloseBtn.TextSize = 14.000

    Ico_2.Name = "Ico"
    Ico_2.Parent = CloseBtn
    Ico_2.AnchorPoint = Vector2.new(0.5, 0.5)
    Ico_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Ico_2.BackgroundTransparency = 1.000
    Ico_2.Position = UDim2.new(0.5, 0, 0.5, 0)
    Ico_2.Size = UDim2.new(0, 20, 0, 20)
    Ico_2.Image = "http://www.roblox.com/asset/?id=6031094678"
    Ico_2.ImageTransparency = 0.400
    Ico_2.ImageColor3 = Color3.fromRGB(255, 255, 255)

    Menu.Name = "Menu"
    Menu.Parent = MainFrame
    Menu.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
    Menu.BorderColor3 = Color3.fromRGB(175, 175, 175)
    Menu.BorderSizePixel = 0
    Menu.Position = UDim2.new(0, 0, 0.100000001, 0)
    Menu.Size = UDim2.new(0.338461548, 0, 0.899999976, 0)
    Menu.ZIndex = 99

    Holder.Name = "Holder"
    Holder.Parent = Menu
    Holder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Holder.BackgroundTransparency = 1.000
    Holder.BorderColor3 = Color3.fromRGB(27, 42, 53)
    Holder.Size = UDim2.new(1, 0, 1.11111116, -40)
    Holder.ZIndex = 2

    UIPadding.Parent = Holder
    UIPadding.PaddingTop = UDim.new(0, 7)

    UIListLayout_2.Parent = Holder
    UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
    UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder

    HideFrame.Name = "Main"
    HideFrame.Parent = MainFrame
    HideFrame.BackgroundColor3 = Color3.fromRGB(78, 99, 199)
    HideFrame.BorderSizePixel = 0
    HideFrame.ClipsDescendants = true
    HideFrame.Position = UDim2.new(0, 0, 0, 0)
    HideFrame.Size = UDim2.new(1, 0, 1, 0)
    HideFrame.ZIndex = 100
    TweenService:Create(HideFrame, TweenInfo.new(0.5), { BackgroundTransparency = 0 }):Play()
    wait(0.5)
    TweenService:Create(HideFrame, TweenInfo.new(0.3), { BackgroundTransparency = 1 }):Play()

    local MinimizedUI = Instance.new("Frame")
    local ButtonHoldernn = Instance.new("Frame")
    local UIListLayoutBB = Instance.new("UIListLayout")
    local MinimizeBtnMM = Instance.new("TextButton")
    local Ico4 = Instance.new("ImageLabel")
    local CloseBtnNN = Instance.new("TextButton")
    local Ico_3 = Instance.new("ImageLabel")
    local Text45 = Instance.new("TextLabel")
    local UICornerMM = Instance.new("UICorner")

    MinimizedUI.Name = "MinimizedUI"
    MinimizedUI.Parent = Wonia
    MinimizedUI.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
    MinimizedUI.Position = UDim2.new(0, 110, 0, 5)
    MinimizedUI.Size = UDim2.new(0, 246, 0, 40)
    MinimizedUI.Visible = false

    ButtonHoldernn.Name = "ButtonHolder"
    ButtonHoldernn.Parent = MinimizedUI
    ButtonHoldernn.AnchorPoint = Vector2.new(1, 0)
    ButtonHoldernn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ButtonHoldernn.BackgroundTransparency = 1.000
    ButtonHoldernn.Position = UDim2.new(1, 0, 0, 0)
    ButtonHoldernn.Size = UDim2.new(-0.175359592, 120, 1, 0)

    UIListLayoutBB.Parent = ButtonHoldernn
    UIListLayoutBB.FillDirection = Enum.FillDirection.Horizontal
    UIListLayoutBB.SortOrder = Enum.SortOrder.LayoutOrder

    MinimizeBtnMM.Name = "MinimizeBtn"
    MinimizeBtnMM.Parent = ButtonHoldernn
    MinimizeBtnMM.AnchorPoint = Vector2.new(1, 0.5)
    MinimizeBtnMM.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    MinimizeBtnMM.BackgroundTransparency = 1.000
    MinimizeBtnMM.LayoutOrder = 3
    MinimizeBtnMM.Position = UDim2.new(1, 0, 0.5, 0)
    MinimizeBtnMM.Size = UDim2.new(0, 38, 0, 38)
    MinimizeBtnMM.Font = Enum.Font.SourceSans
    MinimizeBtnMM.Text = ""
    MinimizeBtnMM.TextColor3 = Color3.fromRGB(0, 0, 0)
    MinimizeBtnMM.TextSize = 14.000

    Ico4.Name = "Ico"
    Ico4.Parent = MinimizeBtnMM
    Ico4.AnchorPoint = Vector2.new(0.5, 0.5)
    Ico4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Ico4.BackgroundTransparency = 1.000
    Ico4.Position = UDim2.new(0.5, 0, 0.5, 0)
    Ico4.Size = UDim2.new(0, 22, 0, 22)
    Ico4.Image = "rbxassetid://3926305904"
    Ico4.ImageRectOffset = Vector2.new(684, 724)
    Ico4.ImageRectSize = Vector2.new(36, 36)
    Ico4.ImageTransparency = 0.400

    CloseBtnNN.Name = "CloseBtn"
    CloseBtnNN.Parent = ButtonHoldernn
    CloseBtnNN.AnchorPoint = Vector2.new(1, 0.5)
    CloseBtnNN.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    CloseBtnNN.BackgroundTransparency = 1.000
    CloseBtnNN.LayoutOrder = 3
    CloseBtnNN.Position = UDim2.new(1, 0, 0.5, 0)
    CloseBtnNN.Size = UDim2.new(0, 38, 0, 38)
    CloseBtnNN.Font = Enum.Font.SourceSans
    CloseBtnNN.Text = ""
    CloseBtnNN.TextColor3 = Color3.fromRGB(0, 0, 0)
    CloseBtnNN.TextSize = 14.000

    Ico_3.Name = "Ico"
    Ico_3.Parent = CloseBtnNN
    Ico_3.AnchorPoint = Vector2.new(0.5, 0.5)
    Ico_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Ico_3.BackgroundTransparency = 1.000
    Ico_3.Position = UDim2.new(0.5, 0, 0.5, 0)
    Ico_3.Size = UDim2.new(0, 20, 0, 20)
    Ico_3.Image = "http://www.roblox.com/asset/?id=6031094678"
    Ico_3.ImageTransparency = 0.400

    Text45.Name = "Text"
    Text45.Parent = MinimizedUI
    Text45.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Text45.BackgroundTransparency = 1.000
    Text45.Position = UDim2.new(0, 9, 0, 0)
    Text45.Size = UDim2.new(0.781000018, -33, 1, 0)
    Text45.Font = Enum.Font.Gotham
    Text45.Text = "Yaya This Windows11"
    Text45.TextColor3 = Color3.fromRGB(255, 255, 255)
    Text45.TextSize = 14.000
    Text45.TextXAlignment = Enum.TextXAlignment.Left

    UICornerMM.CornerRadius = UDim.new(0, 6)
    UICornerMM.Parent = MinimizedUI

    MainFrame.Parent = Wonia
    TopFrameTitle.Text = WindowConfig.Title
    MakeDraggable(TopBar, MainFrame)

    CloseBtn.MouseEnter:Connect(function()
        TweenService:Create(Ico_2, TweenInfo.new(0.3, Enum.EasingStyle.Quint),
            { ImageColor3 = Color3.fromRGB(255, 0, 0) }):Play()
    end)

    CloseBtn.MouseLeave:Connect(function()
        TweenService:Create(Ico_2, TweenInfo.new(0.3, Enum.EasingStyle.Quint),
            { ImageColor3 = Color3.fromRGB(250, 250, 250) }):Play()
    end)

    local uitoggled = false

    local LastPosition = MainFrame.Position

    MinimizeBtn.MouseButton1Click:Connect(function()
        uitoggled = not uitoggled
        if uitoggled then
            LastPosition = MainFrame.Position
            task.wait(0.2)
            MinimizedUI.Visible = true
            MinimizeBtn:TweenSize(UDim2.new(0, 264, 0, 40), 0.2)

            MainUi:TweenPosition(UDim2.new(0.25, 0, -1.5, 0), "In", "Quint", 0.5, true)
            TweenService:Create(HideFrame, TweenInfo.new(0.15), { BackgroundTransparency = 0 }):Play()
            TweenService:Create(Text45, TweenInfo.new(0.10), { BackgroundTransparency = 0 }):Play()
            TweenService:Create(Ico_3, TweenInfo.new(0.3), { ImageTransparency = 0 }):Play()
            TweenService:Create(Ico4, TweenInfo.new(0.3), { ImageTransparency = 0 }):Play()
            task.wait(0.3)
            ButtonHoldernn.Visible = false
            MinimizeBtn:TweenSize(UDim2.new(0, 264, 0, 40), 0.2)
            task.wait(0.2)
            MinimizedUI.Visible = false
            uitoggled = false
        else
            MainUi:TweenPosition(LastPosition, "Out", "Quint", 0.5, true)
            task.wait(0.2)
            ButtonHoldernn.Visible = true
            TweenService:Create(HideFrame, TweenInfo.new(0.15), { BackgroundTransparency = 1 }):Play()
            TweenService:Create(Text45, TweenInfo.new(0.3), { BackgroundTransparency = 1 }):Play()
            TweenService:Create(Ico_3, TweenInfo.new(0.3), { ImageTransparency = 1 }):Play()
            TweenService:Create(Ico4, TweenInfo.new(0.3), { ImageTransparency = 1 }):Play()
            task.wait(0.3)
            ButtonHoldernn.Visible = false
            MinimizeBtn:TweenSize(UDim2.new(0, 0, 0, 40), 0.2)
            task.wait(0.2)
            MinimizedUI.Visible = false
            uitoggled = true
        end
    end)

    local tabhold = {}
    function tabhold:Tab(TabConfig)
        TabConfig.Text = TabConfig.Text or "WoniaUi Tabs"
        TabConfig.Icon = TabConfig.Icon or ""

        local TabBtn = Instance.new("TextButton")
        local UICorner = Instance.new("UICorner")
        local Indecator = Instance.new("Frame")
        local UIPadding = Instance.new("UIPadding")
        local Icon = Instance.new("ImageLabel")
        local Text = Instance.new("TextLabel")

        TabBtn.Name = TabConfig.Text
        TabBtn.Parent = Holder
        TabBtn.BackgroundColor3 = Color3.fromRGB(44, 45, 44)
        TabBtn.BorderSizePixel = 0
        TabBtn.Position = UDim2.new(0.0227272734, 0, 0, 0)
        TabBtn.Size = UDim2.new(0, 210, 0, 35)
        TabBtn.AutoButtonColor = false
        TabBtn.Font = Enum.Font.SourceSans
        TabBtn.Text = ""
        TabBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
        TabBtn.TextSize = 14.000
        TabBtn.BackgroundTransparency = 1

        UICorner.CornerRadius = UDim.new(0, 4)
        UICorner.Parent = TabBtn

        Indecator.Name = "Indecator"
        Indecator.Parent = TabBtn
        Indecator.AnchorPoint = Vector2.new(0, 0.5)
        Indecator.BackgroundColor3 = Color3.fromRGB(78, 99, 199)
        Indecator.BorderColor3 = Color3.fromRGB(27, 42, 53)
        Indecator.BorderSizePixel = 0
        Indecator.Position = UDim2.new(0, 0, 0.5, 0)
        Indecator.Size = UDim2.new(0, 3, 0, 15)
        Indecator.BackgroundTransparency = 1

        UIPadding.Parent = TabBtn
        UIPadding.PaddingLeft = UDim.new(0, 2)

        Icon.Name = "Icon"
        Icon.Parent = TabBtn
        Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Icon.BackgroundTransparency = 1.000
        Icon.BorderSizePixel = 0
        Icon.Position = UDim2.new(0, 10, 0, 5)
        Icon.Size = UDim2.new(0, 25, 0, 25)
        Icon.Image = "http://www.roblox.com/asset/?id=10955379800"
        Icon.ImageTransparency = 1

        Text.Name = "Text"
        Text.Parent = TabBtn
        Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Text.BackgroundTransparency = 1.000
        Text.Position = UDim2.new(0.211538464, 0, 0, 0)
        Text.Size = UDim2.new(0, 164, 0, 35)
        Text.Font = Enum.Font.Gotham
        Text.Text = TabConfig.Text
        Text.TextColor3 = Color3.fromRGB(150, 150, 150)
        Text.TextSize = 14.000
        Text.TextXAlignment = Enum.TextXAlignment.Left
        Text.TextTransparency = 1

        task.wait(0.1)
        TweenService:Create(Indecator,TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{ BackgroundTransparency = 1 }):Play()
        TweenService:Create(Indecator,TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{ BackgroundTransparency = 1 }):Play()
        TweenService:Create(Text, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{ TextColor3 = Color3.fromRGB(150, 150, 150) }):Play()

        local Container = Instance.new("ScrollingFrame")
        local UIListLayout = Instance.new("UIListLayout")
        local UIPadding = Instance.new("UIPadding")

        local ContainerFolder = Instance.new("Folder")
        ContainerFolder.Name = "ContainerFolder"
        ContainerFolder.Parent = MainFrame

        Container.Name = "Tab"
        Container.Parent = ContainerFolder
        Container.Active = true
        Container.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
        Container.BackgroundTransparency = 1.000
        Container.BorderSizePixel = 0
        Container.Position = UDim2.new(0, 220, 0, 42)
        Container.Selectable = false
        Container.Size = UDim2.new(0.661538363, 0, 1, -42)
        Container.ScrollBarImageColor3 = Color3.fromRGB(80, 80, 80)
        Container.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
        Container.CanvasSize = UDim2.new(0, 0, 0, 0)
        Container.ScrollBarThickness = 4
        Container.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
        Container.Visible = false

        UIListLayout.Parent = Container
        UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
        UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        UIListLayout.Padding = UDim.new(0, 12)

        UIPadding.Parent = Container
        UIPadding.PaddingBottom = UDim.new(0, 7)
        UIPadding.PaddingTop = UDim.new(0, 7)

        if fs == false then
            fs = true
            Indecator.BackgroundTransparency = 0
            Text.TextColor3 = Color3.fromRGB(255, 255, 255)
            Container.Visible = true
        end

        TabBtn.MouseButton1Click:Connect(
            function()
                for i, v in next, ContainerFolder:GetChildren() do
                    if v.Name == "Tab" then
                        v.Visible = false
                    end
                    Container.Visible = true
                end
                for i, v in next, Holder:GetChildren() do
                    if v.Name == "TabBtn" then
                        TweenService:Create(v.Indecator, TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{ BackgroundTransparency = 1 }):Play()
                        TweenService:Create(Indecator, TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{ BackgroundTransparency = 0 }):Play()

                        TweenService:Create(v.TabBtn, TweenInfo.new(.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{ BackgroundTransparency = 1 }):Play()
                        TweenService:Create(TabBtn, TweenInfo.new(.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{ BackgroundTransparency = 0 }):Play()

                        TweenService:Create(v.Text, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{ TextColor3 = Color3.fromRGB(150, 150, 150) }):Play()
                        TweenService:Create(Text, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{ TextColor3 = Color3.fromRGB(255, 255, 255) }):Play()

                    end
                end
            end
        )

        local ContainerDrop = {}
        function ContainerDrop:Section(SectionConfig)
            SectionConfig.Title = SectionConfig.Title or "Title Section"
            SectionConfig.Description = SectionConfig.Description or "Description"

            Holding = false

            local Section = Instance.new("Frame")
            local Btn = Instance.new("TextButton")
            local Title = Instance.new("TextLabel")
            local Desc = Instance.new("TextLabel")
            local chevron_right = Instance.new("ImageButton")
            local UICorner = Instance.new("UICorner")
            local HolderDrop = Instance.new("Frame")
            local UIListLayout = Instance.new("UIListLayout")
            local UIPadding = Instance.new("UIPadding")
            local UIListLayout_2 = Instance.new("UIListLayout")

            Section.Name = "Section"
            Section.Parent = Container
            Section.BackgroundColor3 = Color3.fromRGB(43, 42, 43)
            Section.BorderSizePixel = 0
            Section.Position = UDim2.new(0.0104651181, 0, 0, 0)
            Section.Size = UDim2.new(0, 421, 0, 40)
            Section.AutomaticSize = Enum.AutomaticSize.Y

            Btn.Name = "Btn"
            Btn.Parent = Section
            Btn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Btn.BackgroundTransparency = 1.000
            Btn.Size = UDim2.new(0, 421, 0, 40)
            Btn.Font = Enum.Font.SourceSans
            Btn.Text = ""
            Btn.TextColor3 = Color3.fromRGB(0, 0, 0)
            Btn.TextSize = 14.000

            Title.Name = "Title"
            Title.Parent = Btn
            Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Title.BackgroundTransparency = 1.000
            Title.BorderSizePixel = 0
            Title.Position = UDim2.new(0.0237529688, 0, 0, 3)
            Title.Size = UDim2.new(0, 365, 0, 22)
            Title.Font = Enum.Font.Gotham
            Title.Text = SectionConfig.Title
            Title.TextColor3 = Color3.fromRGB(240, 240, 239)
            Title.TextSize = 13.000
            Title.TextXAlignment = Enum.TextXAlignment.Left

            Desc.Name = "Desc"
            Desc.Parent = Btn
            Desc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Desc.BackgroundTransparency = 1.000
            Desc.BorderSizePixel = 0
            Desc.Position = UDim2.new(0.0237529688, 0, 0.550000012, 3)
            Desc.Size = UDim2.new(0, 365, 0, 8)
            Desc.Font = Enum.Font.Gotham
            Desc.Text = SectionConfig.Description
            Desc.TextColor3 = Color3.fromRGB(199, 199, 198)
            Desc.TextSize = 12.000
            Desc.TextXAlignment = Enum.TextXAlignment.Left

            chevron_right.Name = "chevron_right"
            chevron_right.Parent = Btn
            chevron_right.AnchorPoint = Vector2.new(1, 0.5)
            chevron_right.BackgroundTransparency = 1.000
            chevron_right.Position = UDim2.new(0.872921586, 45, 0.5, 0)
            chevron_right.Size = UDim2.new(0, 25, 0, 25)
            chevron_right.ZIndex = 2
            chevron_right.Image = "rbxassetid://3926305904"
            chevron_right.ImageColor3 = Color3.fromRGB(199, 199, 198)
            chevron_right.ImageRectOffset = Vector2.new(924, 884)
            chevron_right.ImageRectSize = Vector2.new(36, 36)

            UICorner.CornerRadius = UDim.new(0, 4)
            UICorner.Parent = Section

            HolderDrop.Name = "HolderDrop"
            HolderDrop.Parent = Section
            HolderDrop.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            HolderDrop.BackgroundTransparency = 1.000
            HolderDrop.Position = UDim2.new(0, 0, 0.145770773, 0)
            HolderDrop.Size = UDim2.new(0, 421, 0, 0)
            HolderDrop.Visible = false

            UIListLayout.Parent = HolderDrop
            UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
            UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
            UIListLayout.Padding = UDim.new(0, 7)

            UIPadding.Parent = HolderDrop
            UIPadding.PaddingBottom = UDim.new(0, 5)
            UIPadding.PaddingLeft = UDim.new(0, 7)
            UIPadding.PaddingRight = UDim.new(0, 7)
            UIPadding.PaddingTop = UDim.new(0, 5)

            UIListLayout_2.Parent = Section
            UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder

            Btn.MouseButton1Click:Connect(function()
                if uitoggled == false then
                    TweenService:Create(chevron_right,
                        TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Rotation = 120 }):Play()
                    HolderDrop.Visible = false
                    Section.Size = UDim2.new(0, 421, 0, 40)
                    uitoggled = true
                else
                    TweenService:Create(chevron_right,
                        TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Rotation = 0 }):Play()
                    HolderDrop.Visible = true
                    uitoggled = false
                end
            end)
            local SectionHolder = {}
            function SectionHolder:Button(text, callback)
                text = text or "Button"
                callback = callback or function() end

                local Button = Instance.new("TextButton")
                local UICorner = Instance.new("UICorner")
                local Glow = Instance.new("ImageLabel")
                local ButtonText = Instance.new("TextLabel")

                Button.Name = "Button"
                Button.Parent = HolderDrop
                Button.BackgroundColor3 = Color3.fromRGB(36, 35, 36)
                Button.Size = UDim2.new(1, 0, 0, 32)
                Button.AutoButtonColor = false
                Button.Font = Enum.Font.SourceSans
                Button.TextColor3 = Color3.fromRGB(0, 0, 0)
                Button.TextSize = 14.000
                Button.TextTransparency = 1.000
                Button.TextXAlignment = Enum.TextXAlignment.Left

                UICorner.CornerRadius = UDim.new(0, 4)
                UICorner.Parent = Button

                Glow.Name = "Glow"
                Glow.Parent = Button
                Glow.AnchorPoint = Vector2.new(0.5, 0.5)
                Glow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Glow.BackgroundTransparency = 1.000
                Glow.BorderSizePixel = 0
                Glow.Position = UDim2.new(0.5, 0, 0.5, 0)
                Glow.Size = UDim2.new(1, 30, 1, 30)
                Glow.ZIndex = 0
                Glow.Image = "rbxassetid://4996891970"
                Glow.ImageColor3 = Color3.fromRGB(10, 10, 10)
                Glow.ImageTransparency = 0.860
                Glow.ScaleType = Enum.ScaleType.Slice
                Glow.SliceCenter = Rect.new(20, 20, 280, 280)

                ButtonText.Name = "ButtonText"
                ButtonText.Parent = Button
                ButtonText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ButtonText.BackgroundTransparency = 1.000
                ButtonText.Position = UDim2.new(0, 10, 0, 0)
                ButtonText.Size = UDim2.new(1, -10, 1, 0)
                ButtonText.Font = Enum.Font.Gotham
                ButtonText.Text = text
                ButtonText.TextColor3 = Color3.fromRGB(255, 255, 255)
                ButtonText.TextSize = 14.000
                ButtonText.TextXAlignment = Enum.TextXAlignment.Left

                Button.MouseButton1Click:Connect(function()
                    callback()
                    Ripple(Button)
                end)
                Button.MouseEnter:Connect(function()
                    TweenService:Create(Button, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        { BackgroundColor3 = Color3.fromRGB(26, 25, 26) }):Play()
                end)
                Button.MouseLeave:Connect(function()
                    TweenService:Create(Button, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        { BackgroundColor3 = Color3.fromRGB(36, 35, 36) }):Play()
                end)
            end

            function SectionHolder:Poragraph(text, desc)
                text = text or "Title"
                desc = desc or "sdhuadhdkjasgkfgkasgfkhas"

                local Paragraph = Instance.new("Frame")
                local Desc = Instance.new("TextLabel")
                local Title = Instance.new("TextLabel")
                local UICorner = Instance.new("UICorner")

                Paragraph.Name = "Paragraph"
                Paragraph.Parent = HolderDrop
                Paragraph.BackgroundColor3 = Color3.fromRGB(36, 35, 36)
                Paragraph.BorderSizePixel = 0
                Paragraph.Position = UDim2.new(-0.00364963501, 0, 0.33144477, 0)
                Paragraph.Size = UDim2.new(1, 0, 0, 47)

                Desc.Name = "Desc"
                Desc.Parent = Paragraph
                Desc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Desc.BackgroundTransparency = 1.000
                Desc.Position = UDim2.new(0.0217391308, 0, 0.490028381, 2)
                Desc.Size = UDim2.new(0, 399, 0, 17)
                Desc.Font = Enum.Font.Gotham
                Desc.TextColor3 = Color3.fromRGB(179, 179, 179)
                Desc.TextSize = 12.000
                Desc.Text = desc
                Desc.TextXAlignment = Enum.TextXAlignment.Left

                Title.Name = "Title"
                Title.Parent = Paragraph
                Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Title.BackgroundTransparency = 1.000
                Title.BorderSizePixel = 0
                Title.Position = UDim2.new(0.0241545886, 0, 0.200000003, -1)
                Title.Size = UDim2.new(0, 404, 0, 15)
                Title.Font = Enum.Font.Gotham
                Title.Text = text
                Title.TextColor3 = Color3.fromRGB(236, 236, 236)
                Title.TextSize = 14.000
                Title.TextXAlignment = Enum.TextXAlignment.Left

                UICorner.CornerRadius = UDim.new(0, 4)
                UICorner.Parent = Paragraph
            end

            function SectionHolder:Label(text, color)
                text = text or "label"
                color = color or Color3.fromRGB(255, 255, 255)

                local LabelSet = {}

                local Label = Instance.new("Frame")
                local Title = Instance.new("TextLabel")
                local UICorner = Instance.new("UICorner")

                Label.Name = "Label"
                Label.Parent = HolderDrop
                Label.BackgroundColor3 = Color3.fromRGB(36, 35, 36)
                Label.ClipsDescendants = true
                Label.Size = UDim2.new(1, 0, 0, 32)

                Title.Name = "Title"
                Title.Parent = Label
                Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Title.BackgroundTransparency = 1.000
                Title.Position = UDim2.new(0, 10, 0, 0)
                Title.Selectable = true
                Title.Size = UDim2.new(0, 1, 0, 32)
                Title.Font = Enum.Font.Gotham
                Title.Text = text
                Title.TextColor3 = color
                Title.TextSize = 14.000
                Title.TextXAlignment = Enum.TextXAlignment.Left

                UICorner.CornerRadius = UDim.new(0, 4)
                UICorner.Parent = Label

                function LabelSet:UpdLabel(textnew, colornew)
                    Title.Text = text
                    Title.TextColor3 = color
                end

                return LabelSet
            end

            function SectionHolder:Toggle(ToggleConfig)
                ToggleConfig.Text = ToggleConfig.Text or "Toggle"
                ToggleConfig.Default = ToggleConfig.Default or false
                ToggleConfig.Callback = ToggleConfig.Callback or function() end

                local Toggle = Instance.new("TextButton")
                local UICorner = Instance.new("UICorner")
                local ToggleFrame = Instance.new("Frame")
                local UICorner_2 = Instance.new("UICorner")
                local ToggleToggled = Instance.new("Frame")
                local UICorner_3 = Instance.new("UICorner")
                local ToggleIco = Instance.new("ImageLabel")
                local Glow = Instance.new("ImageLabel")
                local Text = Instance.new("TextLabel")

                Toggle.Name = "Toggle"
                Toggle.Parent = HolderDrop
                Toggle.BackgroundColor3 = Color3.fromRGB(36, 35, 36)
                Toggle.BorderColor3 = Color3.fromRGB(27, 42, 53)
                Toggle.Size = UDim2.new(1, 0, 0, 40)
                Toggle.AutoButtonColor = false
                Toggle.Font = Enum.Font.SourceSans
                Toggle.Text = ""
                Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
                Toggle.TextSize = 14.000

                UICorner.CornerRadius = UDim.new(0, 4)
                UICorner.Parent = Toggle

                ToggleFrame.Name = "ToggleFrame"
                ToggleFrame.Parent = Toggle
                ToggleFrame.AnchorPoint = Vector2.new(0, 0.5)
                ToggleFrame.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
                ToggleFrame.BackgroundTransparency = 0.700
                ToggleFrame.Position = UDim2.new(0, 9, 0.5, 0)
                ToggleFrame.Size = UDim2.new(0, 20, 0, 20)

                UICorner_2.CornerRadius = UDim.new(0, 4)
                UICorner_2.Parent = ToggleFrame

                ToggleToggled.Name = "ToggleToggled"
                ToggleToggled.Parent = ToggleFrame
                ToggleToggled.AnchorPoint = Vector2.new(0.5, 0.5)
                ToggleToggled.BackgroundColor3 = Color3.fromRGB(36, 35, 36)
                ToggleToggled.Position = UDim2.new(0.5, 0, 0.5, 0)
                ToggleToggled.Size = UDim2.new(1, -2, 1, -2)

                UICorner_3.CornerRadius = UDim.new(0, 4)
                UICorner_3.Parent = ToggleToggled

                ToggleIco.Name = "ToggleIco"
                ToggleIco.Parent = ToggleToggled
                ToggleIco.AnchorPoint = Vector2.new(0.5, 0.5)
                ToggleIco.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ToggleIco.BackgroundTransparency = 1.000
                ToggleIco.Position = UDim2.new(0.5, 0, 0.5, 0)
                ToggleIco.Size = UDim2.new(1, -2, 1, -2)
                ToggleIco.Image = "http://www.roblox.com/asset/?id=6031094667"
                ToggleIco.ImageColor3 = Color3.fromRGB(36, 35, 36)
                ToggleIco.ImageTransparency = 1.000

                Glow.Name = "Glow"
                Glow.Parent = Toggle
                Glow.AnchorPoint = Vector2.new(0.5, 0.5)
                Glow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Glow.BackgroundTransparency = 1.000
                Glow.BorderSizePixel = 0
                Glow.Position = UDim2.new(0.5, 0, 0.5, 0)
                Glow.Size = UDim2.new(1, 30, 1, 30)
                Glow.ZIndex = 0
                Glow.Image = "rbxassetid://4996891970"
                Glow.ImageColor3 = Color3.fromRGB(10, 10, 10)
                Glow.ImageTransparency = 0.860
                Glow.ScaleType = Enum.ScaleType.Slice
                Glow.SliceCenter = Rect.new(20, 20, 280, 280)

                Text.Name = "Text"
                Text.Parent = Toggle
                Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Text.BackgroundTransparency = 1.000
                Text.BorderSizePixel = 0
                Text.Position = UDim2.new(0.0938013047, 0, -0.075000003, 3)
                Text.Size = UDim2.new(0, 370, 0, 40)
                Text.Font = Enum.Font.Gotham
                Text.Text = ToggleConfig.Text
                Text.TextColor3 = Color3.fromRGB(240, 240, 239)
                Text.TextSize = 13.000
                Text.TextXAlignment = Enum.TextXAlignment.Left

                local Toggle = { Value = false }

                function Toggle:Set(value)
                    Toggle.Value = value
                    TweenService:Create(ToggleIco, TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        { ImageTransparency = Toggle.Value and 0 or 1 }):Play()
                    TweenService:Create(ToggleIco, TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        { Size = Toggle.Value and UDim2.new(1, -2, 1, -2) or UDim2.new(1, -6, 1, -6) }):Play()
                    return ToggleConfig.Callback(Toggle.Value)
                end

                Toggle.MouseButton1Click:Connect(function()
                    Toggle.Value = not Toggle.Value
                    Toggle:Set(Toggle.Value)

                    if Toggle.Value == true then
                        Toggle.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                    else
                        Toggle.BackgroundColor3 = Color3.fromRGB(36, 35, 36)
                    end
                end)

                Toggle:Set(ToggleConfig.Default)

                return Toggle
            end

            function SectionHolder:Slider(SliderConfig)
                SliderConfig.Text = SliderConfig.Text or "Slider"
                SliderConfig.Minimum = SliderConfig.Minimum or 0
                SliderConfig.Maximum = SliderConfig.Maximum or 10
                SliderConfig.Increment = SliderConfig.Increment or 1
                SliderConfig.Start = SliderConfig.Start or 5
                SliderConfig.Callback = SliderConfig.Callback or function() end

                local Slider = Instance.new("Frame")
                local UICorner = Instance.new("UICorner")
                local SliderText = Instance.new("TextLabel")
                local SliderVal = Instance.new("TextLabel")
                local SliderFrame = Instance.new("Frame")
                local SliderFrameCorner = Instance.new("UICorner")
                local SliderCurrentFrame = Instance.new("Frame")
                local SliderCurrentFrameCorner = Instance.new("UICorner")

                Slider.Name = "Slider"
                Slider.Parent = game.StarterGui.Elements
                Slider.BackgroundColor3 = Color3.fromRGB(36, 35, 36)
                Slider.Size = UDim2.new(1, 0, 0, 44)

                UICorner.CornerRadius = UDim.new(0, 4)
                UICorner.Parent = Slider

                SliderText.Name = "SliderText"
                SliderText.Parent = Slider
                SliderText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                SliderText.BackgroundTransparency = 1.000
                SliderText.Position = UDim2.new(0, 10, 0, 0)
                SliderText.Size = UDim2.new(0, 1, 0, 32)
                SliderText.Font = Enum.Font.Gotham
                SliderText.Text = "Toggle"
                SliderText.TextColor3 = Color3.fromRGB(255, 255, 255)
                SliderText.TextSize = 14.000
                SliderText.TextXAlignment = Enum.TextXAlignment.Left

                SliderVal.Name = "SliderVal"
                SliderVal.Parent = Slider
                SliderVal.AnchorPoint = Vector2.new(1, 0)
                SliderVal.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                SliderVal.BackgroundTransparency = 1.000
                SliderVal.Position = UDim2.new(1, -10, 0, 0)
                SliderVal.Size = UDim2.new(0, 1, 0, 32)
                SliderVal.Font = Enum.Font.Gotham
                SliderVal.Text = "10"
                SliderVal.TextColor3 = Color3.fromRGB(255, 255, 255)
                SliderVal.TextSize = 14.000
                SliderVal.TextXAlignment = Enum.TextXAlignment.Right

                SliderFrame.Name = "SliderFrame"
                SliderFrame.Parent = Slider
                SliderFrame.AnchorPoint = Vector2.new(0.5, 0)
                SliderFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                SliderFrame.Position = UDim2.new(0.5, 0, 0, 31)
                SliderFrame.Size = UDim2.new(1, -20, 0, 5)

                SliderFrameCorner.CornerRadius = UDim.new(0, 4)
                SliderFrameCorner.Name = "SliderFrameCorner"
                SliderFrameCorner.Parent = SliderFrame

                SliderCurrentFrame.Name = "SliderCurrentFrame"
                SliderCurrentFrame.Parent = SliderFrame
                SliderCurrentFrame.BackgroundColor3 = Color3.fromRGB(8, 0, 255)
                SliderCurrentFrame.BorderSizePixel = 0
                SliderCurrentFrame.Size = UDim2.new(0, 0, 1, 0)

                SliderCurrentFrameCorner.CornerRadius = UDim.new(0, 4)
                SliderCurrentFrameCorner.Name = "SliderCurrentFrameCorner"
                SliderCurrentFrameCorner.Parent = SliderCurrentFrame

                local Slider = { Value = SliderConfig.Start }

                local dragging = false

                local function move(Input)
                    local XSize = math.clamp((Input.Position.X - SliderFrame.AbsolutePosition.X) /
                        SliderFrame.AbsoluteSize.X, 0, 1)
                    local Increment = SliderConfig.Increment and
                        (
                        SliderConfig.Maximum /
                            ((SliderConfig.Maximum - SliderConfig.Minimum) / (SliderConfig.Increment * 4))) or
                        (
                        SliderConfig.Maximum >= 50 and
                            SliderConfig.Maximum / ((SliderConfig.Maximum - SliderConfig.Minimum) / 4)) or
                        (
                        SliderConfig.Maximum >= 25 and
                            SliderConfig.Maximum / ((SliderConfig.Maximum - SliderConfig.Minimum) / 2)) or
                        (SliderConfig.Maximum / (SliderConfig.Maximum - SliderConfig.Minimum))
                    local SizeRounded = UDim2.new((
                        math.round(XSize * ((SliderConfig.Maximum / Increment) * 4)) /
                            ((SliderConfig.Maximum / Increment) * 4)), 0, 1, 0)
                    TweenService:Create(SliderCurrentFrame,
                        TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Size = SizeRounded }):
                        Play()
                    local Val = math.round((
                        ((SizeRounded.X.Scale * SliderConfig.Maximum) / SliderConfig.Maximum) *
                            (SliderConfig.Maximum - SliderConfig.Minimum) + SliderConfig.Minimum) * 20) / 20
                    SliderVal.Text = tostring(Val)
                    Slider.Value = Val
                    SliderConfig.Callback(Slider.Value)
                end

                SliderFrame.InputBegan:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = true end end)
                SliderFrame.InputEnded:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end end)
                game:GetService("UserInputService").InputChanged:Connect(function(input) if dragging and
                        input.UserInputType == Enum.UserInputType.MouseMovement then move(input) end
                end)

                function Slider:Set(val)
                    local a = tostring(val and
                        (val / SliderConfig.Maximum) * (SliderConfig.Maximum - SliderConfig.Minimum) +
                        SliderConfig.Minimum) or 0
                    SliderVal.Text = tostring(a)
                    SliderCurrentFrame.Size = UDim2.new((val or 0) / SliderConfig.Maximum, 0, 1, 0)
                    Slider.Value = val
                    return SliderConfig.Callback(Slider.Value)
                end

                Slider:Set(SliderConfig.Start)

                return Slider
            end

            function SectionHolder:Dropdown(DropdownConfig)
                DropdownConfig.Text = DropdownConfig.Text or "Dropdown"
                DropdownConfig.List = DropdownConfig.List or {}
                DropdownConfig.Default = DropdownConfig.Default or ""
                DropdownConfig.Callback = DropdownConfig.Callback or function() end

                local Dropdown = Instance.new("Frame")
                local Holder = Instance.new("Frame")
                local Layout = Instance.new("UIListLayout")
                local UIPadding = Instance.new("UIPadding")
                local Item = Instance.new("TextButton")
                local ItemText = Instance.new("TextLabel")
                local UICorner = Instance.new("UICorner")
                local Btn = Instance.new("TextButton")
                local Title = Instance.new("TextLabel")
                local Ico = Instance.new("ImageLabel")
                local UICorner_2 = Instance.new("UICorner")

                Dropdown.Name = "Dropdown"
                Dropdown.Parent = game.StarterGui.ScreenGui.MainUi.MainFrame.ContainerFolder.Container
                Dropdown.BackgroundColor3 = Color3.fromRGB(36, 35, 36)
                Dropdown.BorderSizePixel = 0
                Dropdown.ClipsDescendants = true
                Dropdown.Size = UDim2.new(1, 0, 0, 32)

                Holder.Name = "Holder"
                Holder.Parent = Dropdown
                Holder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Holder.BackgroundTransparency = 1.000
                Holder.ClipsDescendants = true
                Holder.Position = UDim2.new(0, 0, 0, 32)
                Holder.Size = UDim2.new(1, 0, -1, 32)
                Holder.Visible = false

                Layout.Name = "Layout"
                Layout.Parent = Holder
                Layout.SortOrder = Enum.SortOrder.LayoutOrder
                Layout.Padding = UDim.new(0, 4)

                UIPadding.Parent = Holder
                UIPadding.PaddingTop = UDim.new(0, 6)
                UIPadding.PaddingBottom = UDim.new(0, 6)

                Btn.Name = "Btn"
                Btn.Parent = Dropdown
                Btn.BackgroundColor3 = Color3.fromRGB(36, 35, 36)
                Btn.Size = UDim2.new(1, 0, 0, 32)
                Btn.AutoButtonColor = false
                Btn.Font = Enum.Font.SourceSans
                Btn.Text = ""
                Btn.TextColor3 = Color3.fromRGB(0, 0, 0)
                Btn.TextSize = 14.000

                Title.Name = "Title"
                Title.Parent = Btn
                Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Title.BackgroundTransparency = 1.000
                Title.Position = UDim2.new(0, 10, 0, 0)
                Title.Selectable = true
                Title.Size = UDim2.new(0, 1, 0, 32)
                Title.Font = Enum.Font.Gotham
                Title.Text = DropdownConfig.Text
                Title.TextColor3 = Color3.fromRGB(255, 255, 255)
                Title.TextSize = 14.000
                Title.TextXAlignment = Enum.TextXAlignment.Left

                Ico.Name = "Ico"
                Ico.Parent = Btn
                Ico.AnchorPoint = Vector2.new(1, 0.5)
                Ico.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Ico.BackgroundTransparency = 1.000
                Ico.Position = UDim2.new(1, -10, 0.5, 0)
                Ico.Size = UDim2.new(0, 20, 1, -12)
                Ico.Image = "http://www.roblox.com/asset/?id=6034818379"
                Ico.ImageTransparency = 0.400

                UICorner_2.CornerRadius = UDim.new(0, 4)
                UICorner_2.Parent = Btn

                local Dropdown = { Value = nil, Toggled = false, Options = DropdownConfig.List }

                local function ToggleDrop()
                    Dropdown.Toggled = not Dropdown.Toggled
                    Holder.Size = Dropdown.Toggled and UDim2.new(1, 0, 0, 6 + Holder.Layout.AbsoluteContentSize.Y) or
                        UDim2.new(1, 0, 0, 0)
                    TweenService:Create(DropMain, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        { Size = Dropdown.Toggled and UDim2.new(1, 0, 0, 38 + Holder.Layout.AbsoluteContentSize.Y) or
                            UDim2.new(1, 0, 0, 32) }):Play()
                    TweenService:Create(Ico, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        { Rotation = Dropdown.Toggled and 180 or 0 }):Play()
                    DropMain.Holder.Visible = Dropdown.Toggled
                end

                local function AddOptions(opts)
                    for _, option in pairs(opts) do
                        Item.Name = "Item"
                        Item.Parent = Holder
                        Item.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
                        Item.Size = UDim2.new(1, 0, 0.0564258248, 22)
                        Item.AutoButtonColor = false
                        Item.Font = Enum.Font.Gotham
                        Item.Text = ""
                        Item.TextColor3 = Color3.fromRGB(255, 255, 255)
                        Item.TextSize = 14.000
                        Item.TextTransparency = 0.400
                        Item.TextXAlignment = Enum.TextXAlignment.Left
                        Item.ClipsDescendants = true

                        ItemText.Name = "ItemText"
                        ItemText.Parent = Item
                        ItemText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        ItemText.BackgroundTransparency = 1.000
                        ItemText.Position = UDim2.new(0, 5, 0, 0)
                        ItemText.Size = UDim2.new(0, 1, 1, 0)
                        ItemText.Font = Enum.Font.Gotham
                        ItemText.Text = option
                        ItemText.TextColor3 = Color3.fromRGB(255, 255, 255)
                        ItemText.TextSize = 13.000
                        ItemText.TextTransparency = 0.400
                        ItemText.TextXAlignment = Enum.TextXAlignment.Left

                        Item.MouseButton1Click:Connect(function()
                            Dropdown.Value = option
                            Title.Text = text .. " - " .. option
                            Ripple(Option)
                            return callback(Dropdown.Value)
                        end)
                    end
                end

                function Dropdown:Refresh(opts, del)
                    if del then
                        for _, v in pairs(Holder:GetChildren()) do
                            if v:IsA "TextButton" then
                                v:Destroy()
                                Holder.Size = Dropdown.Toggled and UDim2.new(1, 0, 0,
                                    6 + Holder.Layout.AbsoluteContentSize.Y) or UDim2.new(1, 0, 0, 0)
                                DropMain.Size = Dropdown.Toggled and
                                    UDim2.new(1, 0, 0, 38 + Holder.Layout.AbsoluteContentSize.Y) or
                                    UDim2.new(1, 0, 0, 32)
                            end
                        end
                    end
                    AddOptions(opts)
                end

                DropMain.Btn.MouseButton1Click:Connect(function()
                    ToggleDrop()
                end)

                function Dropdown:Set(val)
                    Dropdown.Value = val
                    DropMain.Btn.Title.Text = text .. " - " .. val
                    return callback(Dropdown.Value)
                end

                Dropdown:Refresh(DropdownConfig.List, false)
                Dropdown:Set(DropdownConfig.Default)
            end

            return SectionHolder
        end

        return ContainerDrop
    end

    return tabhold
end

return Library
