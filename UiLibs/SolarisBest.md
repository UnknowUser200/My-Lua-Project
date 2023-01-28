# yes
```
local SolarisLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/HoyoGey/My-Lua-Project/main/UiLibs/SolarisBest.lua"))('Sex')

local Window = SolarisLib:New({
    Title = "Solaris - <b>Slave Simulator</b>", -- Supported Rich Text
    FolderToSave = "SolarisCFG",
})

local Tab1 = Window:Tab("Tab 1")

local Section1 = Tab1:Section("Section")

Section1:Button({Name = "Negri", Callback = function() end})

Section1:Toggle({Name = "Negri", Default = false, Flag = "Toggle", Callback = function() end})

Section1:Slider({Name = "Negri", Minimum = 1, Maximum = 10, Default = 3, Increment = 2.5, Flag = "Flag", Callback = function() end})

Section1:Dropdown({Name = "Negri", List = {"123","456"}, Default = "", Flag = "ds", Callback = function() end})

Section1:MultiDropdown({Name = "Negri", List = {"123","456"}, Default = "", Flag = "fds", Callback = function() end})

Section1:Label("dsa", Color3.fromRGB(125,125,125))

Section1:Textbox({Name = "Negri", Dissaper = false, Callback = function() end})

Section1:Bind({Name = "Negri", Preset = Enum.KeyCode.RightControl, Hold = true, Flag = "cx", Callback = function() end})
```
