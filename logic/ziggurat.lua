#!/usr/bin/lua

dofile("logic/switch_bw_mosaic.lua")

local screen = player_getscreen(Player)
local switch = {}
switch[1] = screen_gettile(screen, 1, 5);
switch[2] = screen_gettile(screen, 3, 3);
switch[3] = screen_gettile(screen, 5, 5);
local file

for i=1,3 do
	file, switch[i] = string.match(switch[i], "(.*):mosaic_(.*)")
end

if switch[1] == "white" and switch[2] == "white" and switch[3] == "white" then
	screen_settile(screen, 3, 5, file..":crystal_6")
elseif switch[1] == "black" and switch[2] == "black" and switch[3] == "black" then
	screen_settile(screen, 3, 5, file..":crystal_2")
end

