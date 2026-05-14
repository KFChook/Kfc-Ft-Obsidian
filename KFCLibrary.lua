local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/deividcomsono/Obsidian/main/Library.lua"))()
local ThemeManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/deividcomsono/Obsidian/main/addons/ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/deividcomsono/Obsidian/main/addons/SaveManager.lua"))()

local Window = Library:CreateWindow({
    Title = "KFCHook",
    Footer = "",
    Icon = 74960388970280,
    NotifySide = "Right",
    ShowCustomCursor = true,
})

local Tabs = {
    Main = Window:AddTab("Main", "swords"),
    Player = Window:AddTab("Player", "user"),
    Esp = Window:AddTab("Esp", "eye"),
    Settings = Window:AddTab("Settings", "settings")
}

local MainGroup = Tabs.Main:AddLeftGroupbox("Main Features")
local PlayerGroup = Tabs.Player:AddLeftGroupbox("Player Settings")
local EspGroup = Tabs.Esp:AddLeftGroupbox("ESP Settings")
local SettingsGroup = Tabs.Settings:AddLeftGroupbox("Settings")
local ConfigGroup = Tabs.Settings:AddRightGroupbox("Configuration")

-- Settings tab setup
SettingsGroup:AddLabel("Menu bind"):AddKeyPicker("MenuKeybind", { Default = "RightShift", NoUI = true, Text = "Menu keybind" })
Library.ToggleKeybind = Library.Options.MenuKeybind

ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)

SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({ "MenuKeybind" })

ThemeManager:SetFolder("KFC")
SaveManager:SetFolder("KFC/Hook")

SaveManager:BuildConfigSection(Tabs.Settings)
ThemeManager:ApplyToTab(Tabs.Settings)

SaveManager:LoadAutoloadConfig()
