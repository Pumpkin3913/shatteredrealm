#!/usr/bin/lua

local screen = player_getscreen(Player)
local filename = "saved_screen_"..screen..".txt"
if Arg then
	filename = Arg
end

local file, message = io.open(filename, "r")
if not file then
	player_message(Player, "/load command: " .. message)
else
	local w = screen_getwidth(screen)
	local h = screen_getheight(screen)

	for x=0,w-1 do
		for y=0,h-1 do
			local tile = file:read()
			screen_settile(screen, x, y, tile)
		end
	end

	local message = "Screen '"..screen.."' loaded from file '"..filename.."'."
	verbose(message)
	player_message(Player, message)
	file:close()
end

