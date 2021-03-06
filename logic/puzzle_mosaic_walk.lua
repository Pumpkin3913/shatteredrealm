#!/usr/bin/lua

local zone = character_getzone(Character)
local x = character_getx(Character)
local y = character_gety(Character)

local file, tile = string.match(place_getaspect(zone, x, y), "(.*):(.*)")

if tile == "mosaic_black" then
	place_setaspect(zone, x, y, file..":mosaic_white")
elseif tile == "mosaic_white" then
	place_setaspect(zone, x, y, file..":mosaic_black")
end

local master_zone, master_x, master_y = string.match(place_gettag(zone, x, y, "puzzle_master"), "(.*)/(.*)-(.*)")
if master_zone and master_zone ~= "" then
	loadfile("logic/puzzle_mosaic_check.lua")(master_zone, master_x, master_y)
end
