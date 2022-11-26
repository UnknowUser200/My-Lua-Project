<p align="center">
  <img src="https://github.com/HoyoGey/My-Lua-Project/blob/main/asset/hababa.png?raw=true" width="380" height="100">
</p>	
<img src="https://raw.githubusercontent.com/matfantinel/matfantinel/master/waves.svg" width="100%" height="150">
<img src="https://media.discordapp.net/attachments/1036352264765448283/1040255090394673212/image.png" width="100%" height="100%">

# Info
Information on how to use this lib

pls join on officiall server discord: https://discord.gg/cn7HAncu55 <img src="https://cdn.discordapp.com/emojis/1038875387826020352.webp?size=96&quality=lossless" width="2%" height="2%">


## Eng

```lua
local key = loadstring(game:HttpGet("https://raw.githubusercontent.com/HoyoGey/My-Lua-Project/main/UiLibs/KeySysUiLib.lua"))()

key:MakeUI({
  Title = "Title",
  KeyLinkName = "name of link key after getkey/ which",
  DiscordID = "discord server ID like JEy2xbvv ending after discord.gg/",
  ScriptLink = "script link"
})
```

How find KeyLinkName
<img src="https://media.discordapp.net/attachments/1035523592630308927/1040630995684171878/image.png" width="100%" height="100%">

How find DiscordID
<img src="https://media.discordapp.net/attachments/1035523592630308927/1040631092761346068/image.png" width="100%" height="100%">

How to use ScriptLink
Add link on next script and add on ur script this code

```lua
local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()

local is_key_present = isfile("Ur Name Title.txt");
if is_key_present == true then
    local kery = readfile("Ur Name Title.txt");
    local onl_key = game:HttpGet("https://keysystem.ml/name?verify_key=" .. kery)
    if kery == onl_key then
        print("Executed script!");
        lib:MakeNotification({
            Name = "Successful!",
            Content = "Key Correct, Load script",
            Time = 5
        })
-- full script here:)
    end
else
    --wrong key
    lib:MakeNotification({
        Name = "Warning!",
        Content = "Wrong Key Pls Try Again",
        Image = "rbxassetid://10894994115",
        Time = 5
    })
end
```

Change Ur Name Title

well, the one you put the name on then you sweat like
Name.txt

<img src="https://user-images.githubusercontent.com/117149371/201360758-ed913710-2835-4970-a362-4e3f56b40b0f.png" width="100%" height="100%">


## Rus

```lua
local key = loadstring(game:HttpGet("https://raw.githubusercontent.com/HoyoGey/My-Lua-Project/main/UiLibs/KeySysUiLib.lua"))()

key:MakeUI({
  Title = "Заголовок",
  KeyLinkName = "название ключа ссылки после getkey/ котороя",
  DiscordID = "айдишник сервера дискор типо JEy2xbvv окончания после discord.gg/",
  ScriptLink = "ссылка на скрипт"
})
```

Как Использвать KeyLinkName
<img src="https://media.discordapp.net/attachments/1035523592630308927/1040630995684171878/image.png" width="100%" height="100%">

How find DiscordID
<img src="https://media.discordapp.net/attachments/1035523592630308927/1040631092761346068/image.png" width="100%" height="100%">

Как Использвать ScriptLink
Add link on next script and add on ur script this code

```lua
local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()

local is_key_present = isfile("Ur Name Title.txt");
if is_key_present == true then
    local kery = readfile("Ur Name Title.txt");
    local onl_key = game:HttpGet("https://keysystem.ml/name?verify_key=" .. kery)
    if kery == onl_key then
        print("Executed script!");
        lib:MakeNotification({
            Name = "Successful!",
            Content = "Key Correct, Load script",
            Time = 5
        })
-- full script here:)
    end
else
    loadstring(game:HttpGet("https://raw.githubusercontent.com/HoyoGey/CoconutHub/main/Main.lua"))()
    --wrong key
    lib:MakeNotification({
        Name = "Warning!",
        Content = "Wrong Key Pls Try Again",
        Image = "rbxassetid://10894994115",
        Time = 5
    })
end
```

Измения Имя в тайтл и добавь его вместо Ur Name Title

ну токой который ты поставил имя то и вспотваеш типо
Name.txt

<img src="https://user-images.githubusercontent.com/117149371/201360758-ed913710-2835-4970-a362-4e3f56b40b0f.png" width="100%" height="100%">
