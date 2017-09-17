#!/usr/bin/lua

local zone = character_getzone(Character)
local filename = "saved_zone_"..zone..".txt"
if Arg then
	filename = Arg
end

local file, message = io.open(filename, "w")
if not file then
	character_message(Character, "/save command: " .. message)
else
	local w = zone_getwidth(zone)
	local h = zone_getheight(zone)

	for x=0,w-1 do
		for y=0,h-1 do
			file:write(place_getaspect(zone,x,y) .. "\n")
		end
	end

	local message = "Screen '"..zone.."' saved to file '"..filename.."'."
	info(message)
	character_message(Character, message)
	file:close()
end

