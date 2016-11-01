#!/usr/bin/lua

local screen = player_getscreen(Player)
local x = player_getx(Player)
local y = player_gety(Player)

if Arg == "north" then
	y = y-1
elseif Arg == "south" then
	y = y+1
elseif Arg == "east" then
	x = x-1
elseif Arg == "west" then
	x = x+1
end

local text = screen_gettag(screen, x, y, "text")

if text == "" then
	player_message(Player, "There is nothing written here.")
else
	player_message(Player, text)
end
