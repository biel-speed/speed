local Players = game:GetService("Players")
local player = Players.LocalPlayer

local whitelistUrl = "https://raw.githubusercontent.com/biel-speed/speed/main/whitelist.txt"
local mainUrl = "https://raw.githubusercontent.com/biel-speed/speed/main/speed.lua"

local success, whitelistContent = pcall(function()
    return game:HttpGet(whitelistUrl)
end)

if not success then
    player:Kick("Failed to check whitelist")
    return
end

local isWhitelisted = false
for name in string.gmatch(whitelistContent, "[^\r\n]+") do
    if string.lower(string.gsub(name, "%s+", "")) == string.lower(player.Name) then
        isWhitelisted = true
        break
    end
end

if isWhitelisted then
    loadstring(game:HttpGet(mainUrl))()
else
    player:Kick("You are not whitelisted! Buy at discord.gg/uHyzCA9PEW")
end
