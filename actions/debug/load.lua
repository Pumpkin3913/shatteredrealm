#!/usr/bin/lua

local zone = character_getzone(Character)
local filename = "saved_zone_"..zone..".txt"
if Arg then
	filename = Arg
end

local file, message = io.open(filename, "r")
if not file then
	character_message(Character, "/load command: " .. message)
else
	local w = zone_getwidth(zone)
	local h = zone_getheight(zone)

	for x=0,w-1 do
		for y=0,h-1 do
			local tile = file:read()
			place_setaspect(zone, x, y, tile)
		end
	end

	local message = "Screen '"..zone.."' loaded from file '"..filename.."'."
	info(message)
	character_message(Character, message)
	file:close()
end

