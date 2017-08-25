#!/usr/bin/lua

local zone = player_getzone(Player)
local filename = "saved_zone_"..zone..".txt"
if Arg then
	filename = Arg
end

local file, message = io.open(filename, "w")
if not file then
	player_message(Player, "/save command: " .. message)
else
	local w = zone_getwidth(zone)
	local h = zone_getheight(zone)

	for x=0,w-1 do
		for y=0,h-1 do
			file:write(zone_gettile(zone,x,y) .. "\n")
		end
	end

	local message = "Screen '"..zone.."' saved to file '"..filename.."'."
	verbose(message)
	player_message(Player, message)
	file:close()
end

