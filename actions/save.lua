#!/usr/bin/lua

local screen = player_getscreen(Player)
local filename = "saved_screen_"..screen..".txt"
if Arg then
	filename = Arg
end

local file, message = io.open(filename, "w")
if not file then
	player_message(Player, "/save command: " .. message)
else
	local w = screen_getwidth(screen)
	local h = screen_getheight(screen)

	for x=0,w-1 do
		for y=0,h-1 do
			file:write(screen_gettile(screen,x,y) .. "\n")
		end
	end

	local message = "Screen '"..screen.."' saved to file '"..filename.."'."
	verbose(message)
	player_message(Player, message)
	file:close()
end

