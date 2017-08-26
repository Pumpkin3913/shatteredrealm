#!/usr/bin/lua

local zone = player_getzone(Player)
local x = player_getx(Player)
local y = player_gety(Player)

local tile = place_getaspect(zone, x, y)
local file, id = string.match(tile, "(.*):(.*)")

if id == "mosaic_black" then
	place_setaspect(zone, x, y, file..":mosaic_white")
elseif id == "mosaic_white" then
	place_setaspect(zone, x, y, file..":mosaic_black")
end

