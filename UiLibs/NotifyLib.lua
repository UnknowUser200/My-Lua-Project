-- 11449025131
local NotificationHolder = Instance.new("ScreenGui")
NotificationHolder.Name = "notiHolder"
NotificationHolder.Parent = game.CoreGui
NotificationHolder.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local http = game:GetService("HttpService")

local NotificationFrame = game:GetObjects("rbxassetid://11504353766")[1]
NotificationFrame.ZIndex = 4
NotificationFrame.Parent = NotificationHolder
script = NotificationFrame.NotifScript
local Notify = loadstring(NotificationFrame.NotifScript.Source)()
script = oldScript

local NotifyLib = {}

function NotifyLib:Notification(title, desc, time)
    Notify:New(title,desc,time)
end   
return NotifyLib
