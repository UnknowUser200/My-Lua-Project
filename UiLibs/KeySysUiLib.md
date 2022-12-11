<p align="center">
  <img src="https://github.com/HoyoGey/My-Lua-Project/blob/main/asset/hababa.png?raw=true" width="380" height="100">
</p>	
<img src="https://raw.githubusercontent.com/matfantinel/matfantinel/master/waves.svg" width="100%" height="150">
<img src="https://media.discordapp.net/attachments/1036352264765448283/1040255090394673212/image.png" width="100%" height="100%">

# Info
Key Ui Lib Documentation

Join our discord server https://discord.gg/cn7HAncu55 <img src="https://cdn.discordapp.com/emojis/1038875387826020352.webp?size=96&quality=lossless" width="2%" height="2%">


## English

This is the part you will need to use via ur loader or anything.

```lua
local key = loadstring(game:HttpGet("https://raw.githubusercontent.com/HoyoGey/My-Lua-Project/main/UiLibs/KeySysUiLib.lua"))()
key:MakeUI({
  Title = "Ur Title", --// dont need to explain
  KeyLinkName = "CocoNigga", --// the link u chose thru the bot.
  DiscordLink = "discord.gg/123123123", --// replace the numbers by your discord invite
  ScriptLink = "link" --// this is where u put the raw link to ur source
  FileKey = "Sex.lua" --// you will need to match this in the source version.
})
```

Use the name u choosed thru the discord bot for your key system.
<img src="https://media.discordapp.net/attachments/1035523592630308927/1040630995684171878/image.png" width="100%" height="100%">

How to use ScriptLink
Add link on next script and add on ur script this code

This is the part you will need to use via your source.

```lua
local notif = loadstring(game:HttpGet("https://raw.githubusercontent.com/HoyoGey/My-Lua-Project/main/UiLibs/NotifyLib.lua"))()

local is_key_present = isfile("Sex.lua"); --// you will need to match this with the "filekey" name via the other part.
if is_key_present == true then
    local kery = readfile("Sex.lua"); --// same for here
    local onl_key = game:HttpGet("https://keysystem.ml/name?verify_key=" .. kery) --// Replace "name" by the name u chose via the bot
    if kery == onl_key then
        print("Executed script!");
        notif:Notification("successful", "Key Valid", 5)

--// source here
    end

else
    --// wrong key
    notif:Notification("Wrong", "Key InValid", 5)
end
```
