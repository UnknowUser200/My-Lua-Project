if not game:IsLoaded() then
	game.Loaded:wait()
end
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local Mouse = LocalPlayer:GetMouse()

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

local library = {}
local request = request or http_request or (identifyexecutor() == "Synapse X" and syn.request) or (http and http.request
	)
loadstring(request({ Url = "https://raw.githubusercontent.com/cypherdh/Script-Library/main/InstanceProtect",
	Method = "GET" }).Body)()
local UIS = game:GetService("UserInputService")
local TS = game:GetService("TweenService")
function library:CreateWindow(name, version, icon)
	name = name or "Name"
	version = version or "Version"
	icon = icon or math.random()
	local MyGui = Instance.new("ScreenGui")
	local Window = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local TitleBar = Instance.new("Frame")
	local Icon = Instance.new("ImageLabel")
	local MainTitle = Instance.new("TextLabel")
	local TitleUnderline = Instance.new("Frame")
	local UIGradient = Instance.new("UIGradient")
	local Bar = Instance.new("Frame")
	local Bar_2 = Instance.new("Frame")
	local Close = Instance.new("ImageButton")
	local Minimize = Instance.new("ImageButton")
	local _4pxShadow2px_2 = Instance.new("ImageLabel")

	local RandomString = ""
	for i = 1, math.random(3, 20) do
		RandomString = RandomString .. string.char(math.random(97, 122))
	end
	ProtectInstance(MyGui)
	ProtectInstance(Window)

	MyGui.Name = RandomString
	MyGui.Parent = cloneref(game:GetService("CoreGui"))
	MyGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	Window.Name = "Window"
	Window.Parent = MyGui
	Window.BackgroundColor3 = Color3.fromRGB(49, 49, 59)
	Window.Position = UDim2.new(0.5, -300, 0.600000024, -200)
	Window.Size = UDim2.new(0, 0, 0, 0)
	Window.ClipsDescendants = true

	UICorner.CornerRadius = UDim.new(0, 4)
	UICorner.Parent = Window

	TitleBar.Name = "TitleBar"
	TitleBar.Parent = Window
	TitleBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TitleBar.BackgroundTransparency = 1.000
	TitleBar.Size = UDim2.new(1, 0, 0, 30)

	Icon.Name = "Icon"
	Icon.Parent = TitleBar
	Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Icon.BackgroundTransparency = 1.000
	Icon.Position = UDim2.new(0, 6, 0, 6)
	Icon.Size = UDim2.new(0, 18, 0, 18)
	Icon.Image = "rbxassetid://" .. icon
	Icon.ImageColor3 = Color3.fromRGB(135, 255, 135)

	MainTitle.Name = "Title"
	MainTitle.Parent = TitleBar
	MainTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	MainTitle.BackgroundTransparency = 1.000
	MainTitle.Position = UDim2.new(0, 30, 0, 1)
	MainTitle.Size = UDim2.new(1, -30, 1, 0)
	MainTitle.Font = Enum.Font.Gotham
	MainTitle.Text = name .. " | " .. version --"Title | Version"
	MainTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
	MainTitle.TextSize = 12.000
	MainTitle.TextXAlignment = Enum.TextXAlignment.Left

	TitleUnderline.Name = "TitleUnderline"
	TitleUnderline.Parent = TitleBar
	TitleUnderline.BackgroundColor3 = Color3.fromRGB(135, 255, 135)
	TitleUnderline.BorderSizePixel = 0
	TitleUnderline.Position = UDim2.new(0, 0, 1, 0)
	TitleUnderline.Size = UDim2.new(1, 0, 0, 1)

	UIGradient.Parent = TitleUnderline

	Bar.Name = "Bar"
	Bar.Parent = TitleUnderline
	Bar.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Bar.BackgroundTransparency = 0.750
	Bar.BorderSizePixel = 0
	Bar.Position = UDim2.new(0, 6, 0, 0)
	Bar.Size = UDim2.new(0, 18, 1, 0)

	Bar_2.Name = "Bar"
	Bar_2.Parent = TitleUnderline
	Bar_2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Bar_2.BackgroundTransparency = 0.750
	Bar_2.BorderSizePixel = 0
	Bar_2.Position = UDim2.new(1, -24, 0, 0)
	Bar_2.Size = UDim2.new(0, 18, 1, 0)

	Close.Name = "Close"
	Close.Parent = TitleBar
	Close.BackgroundTransparency = 1
	Close.Position = UDim2.new(0.953333378, 0, 0.0666666627, 0)
	Close.Size = UDim2.new(0, 25, 0, 25)
	Close.ZIndex = 2
	Close.Image = "rbxassetid://3926305904"
	Close.ImageRectOffset = Vector2.new(284, 4)
	Close.ImageRectSize = Vector2.new(24, 24)

	Minimize.Name = "Minimize"
	Minimize.Parent = TitleBar
	Minimize.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Minimize.BackgroundTransparency = 1
	Minimize.Position = UDim2.new(0.953, -24, -0.2, 6)
	Minimize.Size = UDim2.new(0, 26, 0, 30)
	Minimize.Image = "http://www.roblox.com/asset/?id=6035067836"

	_4pxShadow2px_2.Name = "4pxShadow(2px)"
	_4pxShadow2px_2.Parent = Window
	_4pxShadow2px_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	_4pxShadow2px_2.BackgroundTransparency = 1.000
	_4pxShadow2px_2.Position = UDim2.new(0, -15, 0, -15)
	_4pxShadow2px_2.Selectable = true
	_4pxShadow2px_2.Size = UDim2.new(1, 30, 1, 30)
	_4pxShadow2px_2.Image = "http://www.roblox.com/asset/?id=5761504593"
	_4pxShadow2px_2.ImageColor3 = Color3.fromRGB(49, 49, 59)
	_4pxShadow2px_2.ImageTransparency = 0.300
	_4pxShadow2px_2.ScaleType = Enum.ScaleType.Slice
	_4pxShadow2px_2.SliceCenter = Rect.new(17, 17, 283, 283)

	Close.MouseButton1Click:Connect(function()
		TS:Create(Window, TweenInfo.new(0.5), { Size = UDim2.new(0, 600, 0, 0) }):Play()
		repeat
			wait()
		until Window.Size == UDim2.new(0, 600, 0, 0)
		wait(0.1)
		TS:Create(Window, TweenInfo.new(0.5), { Size = UDim2.new(0, 0, 0, 0) }):Play()
		repeat
			wait()
		until Window.Size == UDim2.new(0, 0, 0, 0)
		MyGui:Remove()
	end)

	Minimize.MouseButton1Click:Connect(function()
		if not MinimizeGui then
			MinimizeGui = true
			if Window.Size == UDim2.new(0, 600, 0, 400) then
				TS:Create(Window, TweenInfo.new(0.25), { Size = UDim2.new(0, 600, 0, 32) }):Play()
				repeat wait() until Window.Size == UDim2.new(0, 600, 0, 32)
				if Page and Page.Visible == true then
					Page.Visible = false
				end
				if Tabs and Tabs.Visible == true then
					Tabs.Visible = false
				end
			end
		else
			MinimizeGui = false
			if Window.Size == UDim2.new(0, 600, 0, 32) then
				if Page and Page.Visible == true then
					Page.Visible = false
				end
				if Tabs and Tabs.Visible == true then
					Tabs.Visible = false
				end
				TS:Create(Window, TweenInfo.new(0.25), { Size = UDim2.new(0, 600, 0, 400) }):Play()
			end
		end
	end)

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

	MakeDraggable(TitleBar, Window)

	TS:Create(Window, TweenInfo.new(0.5), { Size = UDim2.new(0, 600, 0, 0) }):Play()
	repeat wait() until Window.Size == UDim2.new(0, 600, 0, 0)
	wait(0.1)
	TS:Create(Window, TweenInfo.new(0.5), { Size = UDim2.new(0, 600, 0, 400) }):Play()

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

	--end
	local tabs = {}

	function tabs:CreateTab(name)
		name = name or "Section 1"
		--Create Tab
		local Tabs = Instance.new("Frame")
		local UICorner_2 = Instance.new("UICorner")
		local SectionLabel = Instance.new("TextLabel")
		local UIListLayout = Instance.new("UIListLayout")
		--local PageButton = Instance.new("TextButton") --LATER
		local Indicator = Instance.new("Frame")

		Tabs.Name = "Tabs"
		Tabs.Parent = Window
		Tabs.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
		Tabs.Position = UDim2.new(0, 5, 0, 36)
		Tabs.Size = UDim2.new(0, 140, 1, -41)

		UICorner_2.CornerRadius = UDim.new(0, 4)
		UICorner_2.Parent = Tabs

		SectionLabel.Name = "SectionLabel"
		SectionLabel.Parent = Tabs
		SectionLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		SectionLabel.BackgroundTransparency = 1.000
		SectionLabel.Position = UDim2.new(0, 7, 0, 0)
		SectionLabel.Size = UDim2.new(1, -7, 0, 30)
		SectionLabel.Font = Enum.Font.GothamBlack
		SectionLabel.Text = name --"Section 1"
		SectionLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		SectionLabel.TextSize = 12.000
		SectionLabel.TextXAlignment = Enum.TextXAlignment.Left

		UIListLayout.Parent = Tabs
		UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

		--LATER
		--[[PageButton.Name = "PageButton"
		PageButton.Parent = Tabs
		PageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		PageButton.BackgroundTransparency = 1.000
		PageButton.Size = UDim2.new(1, -14, 0, 20)
		PageButton.Font = Enum.Font.Gotham
		PageButton.Text = "Page 1"
		PageButton.TextColor3 = Color3.fromRGB(255, 255, 255)
		PageButton.TextSize = 12.000
		PageButton.TextXAlignment = Enum.TextXAlignment.Left]]

		Indicator.Name = "Indicator"
		Indicator.Parent = Tabs
		Indicator.BackgroundColor3 = Color3.fromRGB(135, 255, 135)
		Indicator.BorderSizePixel = 0
		Indicator.BackgroundTransparency = 1
		Indicator.Position = UDim2.new(0, -14, 0, 4)
		Indicator.Size = UDim2.new(0, 2, 1, -8)
		Indicator.Visible = false
		--end
		local mytabbuttons = {}
		function mytabbuttons:CreateFrame(name)
			name = name or "Page 1"
			--Creating Page

			local Page = Instance.new("ScrollingFrame")
			local UICorner_3 = Instance.new("UICorner")
			local UIListLayout_2 = Instance.new("UIListLayout")
			local UIPadding = Instance.new("UIPadding")
			local SearchBar = Instance.new("Frame")
			local UICorner_4 = Instance.new("UICorner")
			local SearchIcon = Instance.new("ImageLabel")
			local Bar_3 = Instance.new("Frame")
			local SearchBox = Instance.new("TextBox")
			local Section = Instance.new("Frame")
			local UICorner_5 = Instance.new("UICorner")
			local SectionContainer = Instance.new("Frame")

			local Header = Instance.new("Frame")
			local UICorner_23 = Instance.new("UICorner")
			local UIGradient_2 = Instance.new("UIGradient")
			local _4pxShadow2px_2 = Instance.new("ImageLabel")


			Page.Name = "Page"
			Page.Parent = Window
			Page.Active = true
			Page.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
			Page.BorderColor3 = Color3.fromRGB(27, 42, 53)
			Page.BorderSizePixel = 0
			Page.Position = UDim2.new(0, 150, 0, 36)
			Page.Size = UDim2.new(1, -155, 1, -41)
			Page.ScrollBarThickness = 5
			Page.ScrollBarImageColor3 = Color3.fromRGB(135, 255, 135)
			Page.AutomaticCanvasSize = "Y"
			Page.Visible = false

			UICorner_3.CornerRadius = UDim.new(0, 4)
			UICorner_3.Parent = Page

			UIListLayout_2.Parent = Page
			UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
			UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout_2.Padding = UDim.new(0, 4)

			UIPadding.Parent = Page
			UIPadding.PaddingBottom = UDim.new(0, 4)
			UIPadding.PaddingLeft = UDim.new(0, 4)
			UIPadding.PaddingRight = UDim.new(0, 4)
			UIPadding.PaddingTop = UDim.new(0, 4)

			SearchBar.Name = "SearchBar"
			SearchBar.Parent = Page
			SearchBar.BackgroundColor3 = Color3.fromRGB(30, 30, 36)
			SearchBar.Size = UDim2.new(1, 0, 0, 30)

			UICorner_4.CornerRadius = UDim.new(0, 4)
			UICorner_4.Parent = SearchBar

			SearchIcon.Name = "SearchIcon"
			SearchIcon.Parent = SearchBar
			SearchIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			SearchIcon.BackgroundTransparency = 1.000
			SearchIcon.Position = UDim2.new(0, 6, 0, 6)
			SearchIcon.Size = UDim2.new(0, 18, 0, 18)
			SearchIcon.Image = "rbxassetid://10045418551"
			SearchIcon.ImageColor3 = Color3.fromRGB(135, 255, 135)

			Bar_3.Name = "Bar"
			Bar_3.Parent = SearchBar
			Bar_3.BackgroundColor3 = Color3.fromRGB(135, 255, 135)
			Bar_3.Position = UDim2.new(0, 30, 0, 10)
			Bar_3.Size = UDim2.new(0, 1, 1, -20)

			SearchBox.Name = "SearchBox"
			SearchBox.Parent = SearchBar
			SearchBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			SearchBox.BackgroundTransparency = 1.000
			SearchBox.Position = UDim2.new(0, 40, 0, 1)
			SearchBox.Size = UDim2.new(1, -40, 1, 0)
			SearchBox.Font = Enum.Font.Gotham
			SearchBox.PlaceholderColor3 = Color3.fromRGB(227, 225, 228)
			SearchBox.PlaceholderText = "Search Here"
			SearchBox.Text = ""
			SearchBox.TextColor3 = Color3.fromRGB(227, 225, 228)
			SearchBox.TextSize = 12.000
			SearchBox.TextXAlignment = Enum.TextXAlignment.Left

			Section.Name = "Section"
			Section.Parent = Page
			Section.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Section.BackgroundTransparency = 1.000
			Section.BorderSizePixel = 0
			Section.Position = UDim2.new(0.0170000363, 0, 0.0968660116, 0)
			Section.Size = UDim2.new(0.966000021, 0, 0.159766689, 117)

			UICorner_5.CornerRadius = UDim.new(0, 4)
			UICorner_5.Parent = Section

			SectionContainer.Name = "SectionContainer"
			SectionContainer.Parent = Section
			SectionContainer.BackgroundColor3 = Color3.fromRGB(30, 30, 36)
			SectionContainer.BorderSizePixel = 0
			SectionContainer.ClipsDescendants = true
			SectionContainer.Position = UDim2.new(0, 0, 1.25310734e-07, 0)
			SectionContainer.Size = UDim2.new(1, 0, 1.0033654, -1)
			SectionContainer.ZIndex = 2
			SectionContainer.AutomaticSize = Enum.AutomaticSize.Y

			Header.Name = "Header"
			Header.Parent = Section
			Header.BackgroundColor3 = Color3.fromRGB(135, 255, 135)
			Header.BorderSizePixel = 0
			Header.Size = UDim2.new(1, 0, 0, 8)

			UICorner_23.CornerRadius = UDim.new(0, 4)
			UICorner_23.Parent = Header

			UIGradient_2.Transparency = NumberSequence.new { NumberSequenceKeypoint.new(0.00, 0.75),
				NumberSequenceKeypoint.new(0.50, 0.00), NumberSequenceKeypoint.new(1.00, 0.75) }
			UIGradient_2.Parent = Header

			local UIPadding_2 = Instance.new("UIPadding")
			local UIListLayout_3 = Instance.new("UIListLayout")
			local UICorner_8 = Instance.new("UICorner")

			UIPadding_2.Parent = SectionContainer
			UIPadding_2.PaddingBottom = UDim.new(0, 4)
			UIPadding_2.PaddingLeft = UDim.new(0, 4)
			UIPadding_2.PaddingRight = UDim.new(0, 4)
			UIPadding_2.PaddingTop = UDim.new(0, 4)

			UIListLayout_3.Archivable = false
			UIListLayout_3.Parent = SectionContainer
			UIListLayout_3.HorizontalAlignment = Enum.HorizontalAlignment.Center
			UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout_3.Padding = UDim.new(0, 4)

			UICorner_8.CornerRadius = UDim.new(0, 4)
			UICorner_8.Parent = SectionContainer
			--End

			function UpdateResults()
				local search = string.lower(SearchBox.Text)
				for i, v in pairs(SectionContainer:GetChildren()) do
					if v:IsA("Frame") then
						if search ~= "" then
							if v.Name == "Button" then
								local item = string.lower(v.ButtonText.Text)
								if string.find(item, search) then
									v.Visible = true
								else
									v.Visible = false
								end
							elseif v.Name == "Label" then
								local item = string.lower(v.LabelContent.Text)
								if string.find(item, search) then
									v.Visible = true
								else
									v.Visible = false
								end
							elseif v.Name == "SliderMain" then
								local item = string.lower(v.SliderText.Text)
								if string.find(item, search) then
									v.Visible = true
								else
									v.Visible = false
								end
							elseif v.Name == "TextboxFrame" then
								local item = string.lower(v.Title.Text)
								if string.find(item, search) then
									v.Visible = true
								else
									v.Visible = false
								end
							elseif v.Name == "BindFrame" then
								local item = string.lower(v.Title.Text)
								if string.find(item, search) then
									v.Visible = true
								else
									v.Visible = false
								end
							elseif v.Name == "ToggleMain" then
								local item = string.lower(v.ToggleText.Text)
								if string.find(item, search) then
									v.Visible = true
								else
									v.Visible = false
								end
							end
						else
							v.Visible = true
						end
					end
				end
			end

			SearchBox.Changed:Connect(UpdateResults)

			local PageButton = Instance.new("TextButton")
			PageButton.Name = "PageButton"
			PageButton.Parent = Tabs
			PageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			PageButton.BackgroundTransparency = 1.000
			PageButton.Size = UDim2.new(1, -14, 0, 20)
			PageButton.Font = Enum.Font.Gotham
			PageButton.Text = name
			PageButton.TextColor3 = Color3.fromRGB(255, 255, 255)
			PageButton.TextSize = 12.000
			PageButton.TextTransparency = 0.5
			PageButton.TextXAlignment = Enum.TextXAlignment.Left

			PageButton.MouseButton1Down:Connect(function()
				if Indicator.Visible == false then
					Indicator.Visible = true
				end
				TS:Create(Indicator, TweenInfo.new(0.5), { BackgroundTransparency = 1 }):Play()
				wait()
				TS:Create(Indicator, TweenInfo.new(0.5), { BackgroundTransparency = 0 }):Play()
				for i, v in next, Tabs:GetChildren() do
					if v:IsA("TextButton") and v.Name == "PageButton" then
						TS:Create(v, TweenInfo.new(0.5), { TextTransparency = 0.5 }):Play()
					end
				end
				wait()
				TS:Create(PageButton, TweenInfo.new(0.5), { TextTransparency = 0 }):Play()
				Indicator.Parent = PageButton

				for i, v in pairs(Window:GetChildren()) do
					if v:IsA("ScrollingFrame") and v.Name ~= "Tabs" and v.Name ~= "TitleBar" and v.Name ~= "UICorner" then
						v.Visible = false
					end
				end

				Page.Visible = true
			end)

			local pagebuttons = {}

			function pagebuttons:Button(text, callback)
				local Holding = false
				local Button = game:GetObjects("rbxassetid://6937142338")[1]
				Button.Parent = SectionContainer
				Button.Name = text .. "element"
				Button.ButtonText.Text = text
				Button.ClipsDescendants = true
				Button.BackgroundColor3 = Holding and Color3.fromRGB(43, 43, 48) or Color3.fromRGB(40, 40, 48)
				Button.ButtonText.TextColor3 = Color3.fromRGB(255, 255, 255)

				Button.MouseButton1Click:Connect(function()
					callback()
					Ripple(Button)
				end)
				Button.MouseEnter:Connect(function()
					Holding = true
				end)
				Button.MouseLeave:Connect(function()
					Holding = false
				end)

			end

			function pagebuttons:Toggle(text, def, callback)
				local Toggle, ToggleMain = { Value = false }, game:GetObjects("rbxassetid://6963155498")[1]
				ToggleMain.Parent = SectionContainer
				ToggleMain.ToggleText.Text = text
				ToggleMain.Name = text .. "element"
				ToggleMain.ToggleFrame.ToggleToggled.BackgroundColor3 = Toggle.Value and Color3.fromRGB(135, 255, 135) or
					Color3.fromRGB(40, 40, 48)
				ToggleMain.ToggleFrame.BackgroundColor3 = Toggle.Value and Color3.fromRGB(44, 44, 48) or Color3.fromRGB(40, 40, 48)
				ToggleMain.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
				ToggleMain.ToggleText.TextColor3 = Color3.fromRGB(255, 255, 255)

				function Toggle:Set(value)
					Toggle.Value = value
					TweenService:Create(ToggleMain.ToggleFrame.ToggleToggled.ToggleIco,
						TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { ImageTransparency = Toggle.Value and 0 or 1 })
						:Play()
					TweenService:Create(ToggleMain.ToggleFrame.ToggleToggled.ToggleIco,
						TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{ Size = Toggle.Value and UDim2.new(1, -2, 1, -2) or UDim2.new(1, -6, 1, -6) }):Play()
					return callback(Toggle.Value)
				end

				ToggleMain.MouseButton1Click:Connect(function()
					Toggle.Value = not Toggle.Value
					Toggle:Set(Toggle.Value)
				end)

				Toggle:Set(def)
				return Toggle
			end

			function pagebuttons:Slider(text, min, max, start, inc, callback)
				local Slider, SliderMain = { Value = start }, game:GetObjects("rbxassetid://6967573727")[1]
				SliderMain.Parent = SectionContainer
				SliderMain.SliderText.Text = text
				SliderMain.Name = text .. "element"
				local dragging = false

				SliderMain.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
				SliderMain.SliderFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 36)
				SliderMain.SliderFrame.SliderCurrentFrame.BackgroundColor3 = Color3.fromRGB(135, 255, 135)
				SliderMain.SliderText.TextColor3 = Color3.fromRGB(255, 255, 255)
				SliderMain.SliderVal.TextColor3 = Color3.fromRGB(215, 215, 215)

				local function move(Input)
					local XSize = math.clamp((Input.Position.X - SliderMain.SliderFrame.AbsolutePosition.X) /
						SliderMain.SliderFrame.AbsoluteSize.X, 0, 1)
					local Increment = inc and (max / ((max - min) / (inc * 4))) or (max >= 50 and max / ((max - min) / 4)) or
						(max >= 25 and max / ((max - min) / 2)) or (max / (max - min))
					local SizeRounded = UDim2.new((math.round(XSize * ((max / Increment) * 4)) / ((max / Increment) * 4)), 0, 1, 0)
					TweenService:Create(SliderMain.SliderFrame.SliderCurrentFrame,
						TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Size = SizeRounded }):Play()
					local Val = math.round((((SizeRounded.X.Scale * max) / max) * (max - min) + min) * 20) / 20
					SliderMain.SliderVal.Text = tostring(Val)
					Slider.Value = Val
					callback(Slider.Value)
				end

				SliderMain.SliderFrame.InputBegan:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = true end end)
				SliderMain.SliderFrame.InputEnded:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end end)
				game:GetService("UserInputService").InputChanged:Connect(function(input) if dragging and
						input.UserInputType == Enum.UserInputType.MouseMovement then move(input) end
				end)

				function Slider:Set(val)
					local a = tostring(val and (val / max) * (max - min) + min) or 0
					SliderMain.SliderVal.Text = tostring(a)
					SliderMain.SliderFrame.SliderCurrentFrame.Size = UDim2.new((val or 0) / max, 0, 1, 0)
					Slider.Value = val
					return callback(Slider.Value)
				end

				Slider:Set(start)
				return Slider
			end

			function pagebuttons:Dropdown(text, list, def, callback)
				local Dropdown, DropMain, OptionPreset = { Value = nil, Toggled = false, Options = list },
					game:GetObjects("rbxassetid://7027964359")[1], game:GetObjects("rbxassetid://7021432326")[1]
				DropMain.Parent = SectionContainer
				DropMain.Btn.Title.Text = text
				DropMain.Name = text .. "element"


				local function ToggleDrop()
					Dropdown.Toggled = not Dropdown.Toggled
					DropMain.Holder.Size = Dropdown.Toggled and UDim2.new(1, 0, 0, 6 + DropMain.Holder.Layout.AbsoluteContentSize.Y) or
						UDim2.new(1, 0, 0, 0)
					TweenService:Create(DropMain, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{ Size = Dropdown.Toggled and UDim2.new(1, 0, 0, 38 + DropMain.Holder.Layout.AbsoluteContentSize.Y) or
							UDim2.new(1, 0, 0, 32) }):Play()
					TweenService:Create(DropMain.Btn.Ico, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{ Rotation = Dropdown.Toggled and 180 or 0 }):Play()
					DropMain.Holder.Visible = Dropdown.Toggled
				end

				local function AddOptions(opts)
					for _, option in pairs(opts) do
						local Option = OptionPreset:Clone()
						Option.Parent = DropMain.Holder
						Option.ItemText.Text = option
						Option.ClipsDescendants = true

						Option.MouseButton1Click:Connect(function()
							Dropdown.Value = option
							DropMain.Btn.Title.Text = text .. " - " .. option
							Ripple(Option)
							return callback(Dropdown.Value)
						end)

						spawn(function()
							while wait() do
								Option.BackgroundColor3 = Color3.fromRGB(30, 30, 36)
								DropMain.Btn.Title.TextColor3 = Color3.fromRGB(255, 255, 255)
							end
						end)
					end
				end

				function Dropdown:Refresh(opts, del)
					if del then
						for _, v in pairs(DropMain.Holder:GetChildren()) do
							if v:IsA "TextButton" then
								v:Destroy()
								DropMain.Holder.Size = Dropdown.Toggled and UDim2.new(1, 0, 0, 6 + DropMain.Holder.Layout.AbsoluteContentSize.Y)
									or UDim2.new(1, 0, 0, 0)
								DropMain.Size = Dropdown.Toggled and UDim2.new(1, 0, 0, 38 + DropMain.Holder.Layout.AbsoluteContentSize.Y) or
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

				spawn(function()
					while wait() do
						DropMain.Btn.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
						DropMain.Btn.Title.TextColor3 = Color3.fromRGB(255, 255, 255)
						DropMain.Btn.Ico.ImageColor3 = Color3.fromRGB(255, 255, 255)
					end
				end)

				Dropdown:Refresh(list, false)
				Dropdown:Set(def)
				return Dropdown
			end

			function pagebuttons:MultiDropdown(text, list, def, callback)
				local Dropdown, DropMain, OptionPreset = { Value = {}, Toggled = false, Options = list },
					game:GetObjects("rbxassetid://7027964359")[1], game:GetObjects("rbxassetid://7021432326")[1]
				DropMain.Parent = SectionContainer
				DropMain.Btn.Title.Text = text
				DropMain.Name = text .. "element"


				local function ToggleDrop()
					Dropdown.Toggled = not Dropdown.Toggled
					DropMain.Holder.Size = Dropdown.Toggled and UDim2.new(1, 0, 0, 6 + DropMain.Holder.Layout.AbsoluteContentSize.Y) or
						UDim2.new(1, 0, 0, 0)
					TweenService:Create(DropMain, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{ Size = Dropdown.Toggled and UDim2.new(1, 0, 0, 38 + DropMain.Holder.Layout.AbsoluteContentSize.Y) or
							UDim2.new(1, 0, 0, 32) }):Play()
					TweenService:Create(DropMain.Btn.Ico, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{ Rotation = Dropdown.Toggled and 180 or 0 }):Play()
					DropMain.Holder.Visible = Dropdown.Toggled
				end

				local function AddOptions(opts)
					for _, option in pairs(opts) do
						local Option = OptionPreset:Clone()
						Option.Parent = DropMain.Holder
						Option.ItemText.Text = option
						Option.ClipsDescendants = true

						Option.MouseButton1Click:Connect(function()
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
						end)
						Option.BackgroundColor3 = Color3.fromRGB(30, 30, 36)
						DropMain.Btn.Title.TextColor3 = Color3.fromRGB(255, 255, 255)
					end
				end

				function Dropdown:Refresh(opts, del)
					if del then
						for _, v in pairs(DropMain.Holder:GetChildren()) do
							if v:IsA "TextButton" then
								v:Destroy()
								DropMain.Holder.Size = Dropdown.Toggled and UDim2.new(1, 0, 0, 6 + DropMain.Holder.Layout.AbsoluteContentSize.Y)
									or UDim2.new(1, 0, 0, 0)
								DropMain.Size = Dropdown.Toggled and UDim2.new(1, 0, 0, 38 + DropMain.Holder.Layout.AbsoluteContentSize.Y) or
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
					DropMain.Btn.Title.Text = text .. " - " .. table.concat(Dropdown.Value, ", ")
					return callback(Dropdown.Value)
				end

				spawn(function()
					while wait() do
						DropMain.Btn.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
						DropMain.Btn.Title.TextColor3 = Color3.fromRGB(255, 255, 255)
						DropMain.Btn.Ico.ImageColor3 = Color3.fromRGB(255, 255, 255)
					end
				end)

				Dropdown:Refresh(list, false)
				Dropdown:Set(def)
				return Dropdown
			end

			function pagebuttons:Colorpicker(text, preset, callback)
				local ColorH, ColorS, ColorV = 1, 1, 1
				local ColorPicker, ColorPreset, DragPreset = { Value = preset, Toggled = false },
					game:GetObjects("rbxassetid://7329998014")[1]
				ColorPreset.Hue.Visible, ColorPreset.Color.Visible = ColorPicker.Toggled, ColorPicker.Toggled
				ColorPreset.Parent = SectionContainer
				ColorPreset.Btn.Colorpicker.Text = text
				ColorPreset.Name = text .. "element"
				ColorPreset.Btn.Box.BackgroundColor3 = preset
				ColorPreset.Hue.HueGradient.Color = ColorSequence.new { ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 4)),
					ColorSequenceKeypoint.new(0.20, Color3.fromRGB(234, 255, 0)),
					ColorSequenceKeypoint.new(0.40, Color3.fromRGB(21, 255, 0)),
					ColorSequenceKeypoint.new(0.60, Color3.fromRGB(0, 255, 255)),
					ColorSequenceKeypoint.new(0.80, Color3.fromRGB(0, 17, 255)),
					ColorSequenceKeypoint.new(0.90, Color3.fromRGB(255, 0, 251)),
					ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 4)) }
				local Color = ColorPreset.Color
				local Hue = ColorPreset.Hue
				local HueSelection = ColorPreset.Hue.HueSelection
				local ColorSelection = ColorPreset.Color.ColorSelection

				ColorPreset.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
				ColorPreset.Btn.Colorpicker.TextColor3 = Color3.fromRGB(255, 255, 255)

				function UpdateColorPicker()
					ColorPreset.Btn.Box.BackgroundColor3 = Color3.fromHSV(ColorH, ColorS, ColorV)
					Color.BackgroundColor3 = Color3.fromHSV(ColorH, 1, 1)
					pcall(callback, ColorPreset.Btn.Box.BackgroundColor3)
				end

				ColorPreset.Btn.MouseButton1Click:Connect(function()
					ColorPicker.Toggled = not ColorPicker.Toggled
					TweenService:Create(ColorPreset, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{ Size = ColorPicker.Toggled and UDim2.new(1, 0, 0, 120) or UDim2.new(1, 0, 0, 32) }):Play()
					ColorPreset.Hue.Visible, ColorPreset.Color.Visible = ColorPicker.Toggled, ColorPicker.Toggled
				end)

				ColorH = 1 -
					(math.clamp(HueSelection.AbsolutePosition.Y - Hue.AbsolutePosition.Y, 0, Hue.AbsoluteSize.Y) / Hue.AbsoluteSize.Y)
				ColorS = (
					math.clamp(ColorSelection.AbsolutePosition.X - Color.AbsolutePosition.X, 0, Color.AbsoluteSize.X) /
						Color.AbsoluteSize.X)
				ColorV = 1 -
					(
					math.clamp(ColorSelection.AbsolutePosition.Y - Color.AbsolutePosition.Y, 0, Color.AbsoluteSize.Y) /
						Color.AbsoluteSize.Y)

				ColorPreset.Btn.Box.BackgroundColor3 = preset
				Color.BackgroundColor3 = preset
				pcall(callback, ColorPreset.Btn.Box.BackgroundColor3)

				Color.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						if ColorInput then
							ColorInput:Disconnect()
						end
						ColorInput = RunService.RenderStepped:Connect(function()
							local ColorX = (math.clamp(Mouse.X - Color.AbsolutePosition.X, 0, Color.AbsoluteSize.X) / Color.AbsoluteSize.X)
							local ColorY = (math.clamp(Mouse.Y - Color.AbsolutePosition.Y, 0, Color.AbsoluteSize.Y) / Color.AbsoluteSize.Y)
							ColorSelection.Position = UDim2.new(ColorX, 0, ColorY, 0)
							ColorS = ColorX
							ColorV = 1 - ColorY
							UpdateColorPicker()
						end)
					end
				end)

				Color.InputEnded:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						if ColorInput then
							ColorInput:Disconnect()
						end
					end
				end)

				Hue.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						if HueInput then
							HueInput:Disconnect()
						end

						HueInput = RunService.RenderStepped:Connect(function()
							local HueY = (math.clamp(Mouse.Y - Hue.AbsolutePosition.Y, 0, Hue.AbsoluteSize.Y) / Hue.AbsoluteSize.Y)

							HueSelection.Position = UDim2.new(0.48, 0, HueY, 0)
							ColorH = 1 - HueY

							UpdateColorPicker(true)
						end)
					end
				end)

				Hue.InputEnded:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						if HueInput then
							HueInput:Disconnect()
						end
					end
				end)

				return ColorPicker
			end

			function pagebuttons:Textbox(text, disappear, callback)
				local Textbox, TextboxFrame = {}, game:GetObjects("rbxassetid://7147292392")[1]
				TextboxFrame.Parent = SectionContainer
				TextboxFrame.Title.Text = text
				TextboxFrame.Name = text .. "element"
				TextboxFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
				TextboxFrame.Title.TextColor3 = Color3.fromRGB(255, 255, 255)
				TextboxFrame.Box.BackgroundColor3 = Color3.fromRGB(30, 30, 36)
				TextboxFrame.Box.TextColor3 = Color3.fromRGB(200, 200, 200)

				TextboxFrame.Box.Changed:Connect(function()
					TextboxFrame.Box.Size = UDim2.new(0, TextboxFrame.Box.TextBounds.X + 16, 0, 22)
				end)
				TextboxFrame.Box.PlaceholderText = "                  "

				TextboxFrame.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						TextboxFrame.Box:CaptureFocus()
					end
				end)


				TextboxFrame.Box.FocusLost:Connect(function()
					local txt = TextboxFrame.Box.Text
					if disappear then
						TextboxFrame.Box.Text = ""
					end
					return callback(txt)
				end)

				UserInputService.InputBegan:Connect(function(input)
					if input.KeyCode == Enum.KeyCode.Escape and TextboxFrame.Box:IsFocused() then
						TextboxFrame.Box:ReleaseFocus()
					end
				end)

				return Textbox
			end

			function pagebuttons:Bind(text, preset, holdmode, callback)
				local Bind, BindFrame = { Value, Binding = false, Holding = false }, game:GetObjects("rbxassetid://7126874744")[1]
				BindFrame.Parent = SectionContainer
				BindFrame.Title.Text = text
				BindFrame.Name = text .. "element"
				BindFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
				BindFrame.Title.TextColor3 = Color3.fromRGB(255, 255, 255)
				BindFrame.BText.TextColor3 = Color3.fromRGB(200, 200, 200)

				BindFrame.InputEnded:Connect(function(Input)
					if Input.UserInputType == Enum.UserInputType.MouseButton1 then
						if Bind.Binding then return end
						Bind.Binding = true
						BindFrame.BText.Text = "..."
					end
				end)

				UserInputService.InputBegan:Connect(function(Input)
					if UserInputService:GetFocusedTextBox() then return end
					if (Input.KeyCode.Name == Bind.Value or Input.UserInputType.Name == Bind.Value) and not Bind.Binding then
						if holdmode then
							Holding = true
							callback(Holding)
						else
							callback()
						end
					elseif Bind.Binding then
						local Key
						pcall(function()
							if not CheckKey(BlacklistedKeys, Input.KeyCode) then
								Key = Input.KeyCode
							end
						end)
						pcall(function()
							if CheckKey(WhitelistedMouse, Input.UserInputType) and not Key then
								Key = Input.UserInputType
							end
						end)
						Key = Key or Bind.Value
						Bind:Set(Key)
					end
				end)

				UserInputService.InputEnded:Connect(function(Input)
					if Input.KeyCode.Name == Bind.Value or Input.UserInputType.Name == Bind.Value then
						if holdmode and Holding then
							Holding = false
							callback(Holding)
						end
					end
				end)

				function Bind:Set(key)
					self.Binding = false
					self.Value = key or self.Value
					self.Value = self.Value.Name or self.Value
					BindFrame.BText.Text = self.Value
				end

				Bind:Set(preset)
				return Bind
			end

			function pagebuttons:CreateLabel(name)
				name = name or "Label"
				local UpdateLabel2 = {}
				local Label = Instance.new("Frame")
				local UICorner_16 = Instance.new("UICorner")
				local _4pxShadow2px = Instance.new("ImageLabel")
				local LabelContent = Instance.new("TextLabel")


				Label.Name = "Label"
				Label.Parent = SectionContainer
				Label.BackgroundColor3 = Color3.fromRGB(135, 255, 135)
				Label.BackgroundTransparency = 0.500
				Label.Size = UDim2.new(1, 0, 0, 24)

				UICorner_16.CornerRadius = UDim.new(0, 4)
				UICorner_16.Parent = Label

				_4pxShadow2px.Name = "4pxShadow(2px)"
				_4pxShadow2px.Parent = Label
				_4pxShadow2px.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				_4pxShadow2px.BackgroundTransparency = 1.000
				_4pxShadow2px.Position = UDim2.new(0, -15, 0, -15)
				_4pxShadow2px.Selectable = true
				_4pxShadow2px.Size = UDim2.new(1, 30, 1, 30)
				_4pxShadow2px.Image = "http://www.roblox.com/asset/?id=5761504593"
				_4pxShadow2px.ImageColor3 = Color3.fromRGB(135, 255, 135)
				_4pxShadow2px.ImageTransparency = 0.700
				_4pxShadow2px.ScaleType = Enum.ScaleType.Slice
				_4pxShadow2px.SliceCenter = Rect.new(17, 17, 283, 283)

				LabelContent.Name = "LabelContent"
				LabelContent.Parent = Label
				LabelContent.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				LabelContent.BackgroundTransparency = 1.000
				LabelContent.Position = UDim2.new(0, 7, 0, 0)
				LabelContent.Size = UDim2.new(1, -7, 1, 0)
				LabelContent.Font = Enum.Font.Gotham
				LabelContent.TextColor3 = Color3.fromRGB(255, 255, 255)
				LabelContent.Text = name
				LabelContent.TextSize = 12.000
				LabelContent.TextXAlignment = Enum.TextXAlignment.Left
				function UpdateLabel2:UpdateLabel(name)
					LabelContent.Text = name
				end

				return UpdateLabel2
			end

			return pagebuttons

		end

		return mytabbuttons
	end

	return tabs
end

return library
