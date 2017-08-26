#!/usr/bin/lua

-- Fetch args.
local crystal_zone, crystal_x, crystal_y = ...
local tile = place_getaspect(crystal_zone, crystal_x, crystal_y)
local tileset = string.match(tile, "(.*):.*")
place_setaspect(crystal_zone, crystal_x, crystal_y, tileset..":crystal_2")

local n=1
local tag = place_gettag(crystal_zone, crystal_x, crystal_y, "controlling_mosaic_"..n)
while tag ~= "" do
	local mosaic_zone, mosaic_x, mosaic_y = string.match(tag, "(.*)/(.*)-(.*)")
	place_setaspect(mosaic_zone, mosaic_x, mosaic_y, tileset..":mosaic_black")
	n = n+1
	tag = place_gettag(crystal_zone, crystal_x, crystal_y, "controlling_mosaic_"..n)
end

