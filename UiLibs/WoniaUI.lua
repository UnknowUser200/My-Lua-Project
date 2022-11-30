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

local UI = game:GetObjects("rbxassetid://11697821577")[1]

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
    WindowConfig.Folder = WindowConfig.Folder or "WoniaUiConfigs"
    WindowConfig.File = WindowConfig.File or "WoniaUiConfigs.lua"

    -- Monstrum's Gui to Lua\n-- Version: 3.2

    -- Instances:

    local MainUi = Instance.new("Frame")
    local Shadow = Instance.new("Frame")
    local Image = Instance.new("ImageLabel")
    local Image_2 = Instance.new("ImageLabel")
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
    local ContainerFolder = Instance.new("Folder")
    local Menu = Instance.new("Frame")
    local Holder = Instance.new("Frame")
    local UIPadding = Instance.new("UIPadding")
    local UIListLayout_2 = Instance.new("UIListLayout")

    --Properties:

    MainUi.Name = "MainUi"
    MainUi.Parent = game.StarterGui.ScreenGui
    MainUi.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    MainUi.BackgroundTransparency = 1.000
    MainUi.BorderSizePixel = 0
    MainUi.Position = UDim2.new(0.255813956, 0, 0.253086418, 0)
    MainUi.Size = UDim2.new(0, 650, 0, 400)

    Shadow.Name = "Shadow"
    Shadow.Parent = MainUi
    Shadow.AnchorPoint = Vector2.new(0.5, 0.5)
    Shadow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Shadow.BackgroundTransparency = 1.000
    Shadow.BorderSizePixel = 0
    Shadow.Position = UDim2.new(0.5, 0, 0.5, 0)
    Shadow.Size = UDim2.new(1, 0, 1, 25)

    Image.Name = "Image"
    Image.Parent = Shadow
    Image.AnchorPoint = Vector2.new(0.5, 0.5)
    Image.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Image.BackgroundTransparency = 1.000
    Image.BorderSizePixel = 0
    Image.Position = UDim2.new(0.5, 0, 0.5, 0)
    Image.Size = UDim2.new(1.60000002, 0, 1.29999995, 0)
    Image.ZIndex = 7
    Image.Image = "rbxassetid://5587865193"
    Image.ImageColor3 = Color3.fromRGB(0, 0, 0)
    Image.ImageTransparency = 0.300

    Image_2.Name = "Image"
    Image_2.Parent = Shadow
    Image_2.AnchorPoint = Vector2.new(0.5, 0.5)
    Image_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Image_2.BackgroundTransparency = 1.000
    Image_2.BorderSizePixel = 0
    Image_2.Position = UDim2.new(0.5, 0, 0.5, -5)
    Image_2.Size = UDim2.new(1.20000005, 0, 1.10000002, 0)
    Image_2.ZIndex = 7
    Image_2.Image = "rbxassetid://5587865193"
    Image_2.ImageColor3 = Color3.fromRGB(0, 0, 0)

    MainFrame.Name = "MainFrame"
    MainFrame.Parent = MainUi
    MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    MainFrame.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
    MainFrame.ClipsDescendants = true
    MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    MainFrame.Size = UDim2.new(1, 0, 1, 0)

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

    ContainerFolder.Name = "ContainerFolder"
    ContainerFolder.Parent = MainFrame

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

    MainFrame.Parent = Wonia
    TopFrameTitle.Text = WindowConfig.Title
    MakeDraggable(MainFrame.TopBar, MainUi)

    CloseBtn.MouseEnter:Connect(function()
        TweenService:Create(Ico_2, TweenInfo.new(0.3, Enum.EasingStyle.Quint),
            { ImageColor3 = Color3.fromRGB(255, 0, 0) }):Play()
    end)

    CloseBtn.MouseLeave:Connect(function()
        TweenService:Create(Ico_2, TweenInfo.new(0.3, Enum.EasingStyle.Quint),
            { ImageColor3 = Color3.fromRGB(250, 250, 250) }):Play()
    end)

    TweenService:Create(MainUi, TweenInfo.new(0.3, Enum.EasingStyle.Quint), { UDim2.new(0, 257, 0, 42) }):Play()
    task.wait(0.4)
    TweenService:Create(MainUi, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { UDim2.new(0, 257, 0, 400) }):Play()
    task.wait(0.4)
    TweenService:Create(MainUi, TweenInfo.new(0.6, Enum.EasingStyle.Quint), { UDim2.new(0, 650, 0, 400) }):Play()

    local uitoggled = false

    MinimizeBtn.MouseButton1Click:Connect(function()
        if uitoggled == false then
            TweenService:Create(MainUi, TweenInfo.new(0.6, Enum.EasingStyle.Quint), { UDim2.new(0, 650, 0, 400) }):Play()
            task.wait(0.4)
            TweenService:Create(MainUi, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { UDim2.new(0, 257, 0, 400) }):Play()
            task.wait(0.4)
            TweenService:Create(MainUi, TweenInfo.new(0.3, Enum.EasingStyle.Quint), { UDim2.new(0, 257, 0, 42) }):Play()
            uitoggled = true
        else
            TweenService:Create(MainUi, TweenInfo.new(0.3, Enum.EasingStyle.Quint), { UDim2.new(0, 257, 0, 42) }):Play()
            task.wait(0.4)
            TweenService:Create(MainUi, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { UDim2.new(0, 257, 0, 400) }):Play()
            task.wait(0.4)
            TweenService:Create(MainUi, TweenInfo.new(0.6, Enum.EasingStyle.Quint), { UDim2.new(0, 650, 0, 400) }):Play()
            uitoggled = false
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

        TabBtn.Name = "TabBtn"
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
        TabBtn.TextTransparency = 1

        task.wait(1.1)
        TweenService:Create(Text, TweenInfo.new(0.2, Enum.EasingStyle.Quint), { TextTransparency = 0 }):Play()
        TweenService:Create(Icon, TweenInfo.new(0.2, Enum.EasingStyle.Quint), { ImageTransparency = 0 }):Play()

        local Container = Instance.new("ScrollingFrame")
        local UIListLayout = Instance.new("UIListLayout")
        local UIPadding = Instance.new("UIPadding")

        Container.Name = "Container"
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
        Container.BackgroundTransparency = 1

        UIListLayout.Parent = Container
        UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
        UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        UIListLayout.Padding = UDim.new(0, 12)

        UIPadding.Parent = Container
        UIPadding.PaddingBottom = UDim.new(0, 7)
        UIPadding.PaddingTop = UDim.new(0, 7)

        Container.Visible = false

        TabBtn.MouseButton1Click:Connect(
            function()
                for i, v in next, ContainerFolder:GetChildren() do
                    if v.Name == "Container" then
                        TweenService:Create(v, TweenInfo.new(.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            { BackgroundTransparency = 0 }):Play()
                        v.Visible = false
                    end
                    Container.Visible = true
                end
                for i, v in next, Holder:GetChildren() do
                    if v.Name == "TabBtn" then
                        TweenService:Create(v, TweenInfo.new(.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            { BackgroundTransparency = 1 }):Play()
                        TweenService:Create(v, TweenInfo.new(.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            { BackgroundTransparency = 0 }):Play()

                        TweenService:Create(v.Indecator,
                            TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            { BackgroundTransparency = 1 }):Play()
                        TweenService:Create(v.Indecator,
                            TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            { BackgroundTransparency = 0 }):Play()
                        TweenService:Create(v.Text, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            { TextColor3 = Color3.fromRGB(150, 150, 150) }):Play()
                        TweenService:Create(v.Text, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            { TextColor3 = Color3.fromRGB(255, 255, 255) }):Play()
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
                Paragraph.Parent = game.StarterGui.Elements
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

            return SectionHolder
        end

        return ContainerDrop
    end

    return tabhold
end

return Library
