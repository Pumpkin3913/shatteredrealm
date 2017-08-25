#!/usr/bin/lua

-- Fetch args.
local crystal_zone, crystal_x, crystal_y = ...
local tile = zone_gettile(crystal_zone, crystal_x, crystal_y)
local tileset = string.match(tile, "(.*):.*")
zone_settile(crystal_zone, crystal_x, crystal_y, tileset..":crystal_2")

local n=1
local tag = zone_gettag(crystal_zone, crystal_x, crystal_y, "controlling_mosaic_"..n)
while tag ~= "" do
	local mosaic_zone, mosaic_x, mosaic_y = string.match(tag, "(.*)/(.*)-(.*)")
	zone_settile(mosaic_zone, mosaic_x, mosaic_y, tileset..":mosaic_black")
	n = n+1
	tag = zone_gettag(crystal_zone, crystal_x, crystal_y, "controlling_mosaic_"..n)
end

