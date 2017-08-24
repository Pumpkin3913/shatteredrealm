#!/usr/bin/lua

-- Fetch args.
local crystal_screen, crystal_x, crystal_y = ...
local tile = screen_gettile(crystal_screen, crystal_x, crystal_y)
local tileset = string.match(tile, "(.*):.*")
screen_settile(crystal_screen, crystal_x, crystal_y, tileset..":crystal_2")

local n=1
local tag = screen_gettag(crystal_screen, crystal_x, crystal_y, "controlling_mosaic_"..n)
while tag ~= "" do
	local mosaic_screen, mosaic_x, mosaic_y = string.match(tag, "(.*)/(.*)-(.*)")
	screen_settile(mosaic_screen, mosaic_x, mosaic_y, tileset..":mosaic_black")
	n = n+1
	tag = screen_gettag(crystal_screen, crystal_x, crystal_y, "controlling_mosaic_"..n)
end

