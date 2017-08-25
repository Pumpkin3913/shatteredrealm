#!/usr/bin/lua

local zone = player_getzone(Player)
local x = player_getx(Player)
local y = player_gety(Player)

local tile = zone_gettile(zone, x, y)
local file, id = string.match(tile, "(.*):(.*)")

if id == "mosaic_black" then
	zone_settile(zone, x, y, file..":mosaic_white")
elseif id == "mosaic_white" then
	zone_settile(zone, x, y, file..":mosaic_black")
end

