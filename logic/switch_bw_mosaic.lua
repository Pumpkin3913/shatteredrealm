#!/usr/bin/lua

local screen = player_getscreen(Player)
local x = player_getx(Player)
local y = player_gety(Player)

local tile = screen_gettile(screen, x, y)
local file, id = string.match(tile, "(.*):(.*)")

if id == "mosaic_black" then
	screen_settile(screen, x, y, file..":mosaic_white")
elseif id == "mosaic_white" then
	screen_settile(screen, x, y, file..":mosaic_black")
end

