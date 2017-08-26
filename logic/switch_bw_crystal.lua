#!/usr/bin/lua

-- Fetch args.
local crystal_zone, crystal_x, crystal_y = ...

-- Change stepped-on mosaic's color.
dofile("logic/switch_bw_mosaic.lua")

local switch = {}

local n=1
local tag = place_gettag(crystal_zone, crystal_x, crystal_y, "controlling_mosaic_"..n)
while tag ~= "" do
	local mosaic_zone, mosaic_x, mosaic_y = string.match(tag, "(.*)/(.*)-(.*)")
	table.insert(switch, place_getaspect(mosaic_zone, mosaic_x, mosaic_y))
	n = n+1
	tag = place_gettag(crystal_zone, crystal_x, crystal_y, "controlling_mosaic_"..n)
end

local file
local all_white = true
local all_black = true

for i=1,#switch do
	local color
	file, color = string.match(switch[i], "(.*):mosaic_(.*)")

	if color ~= "white" then
		all_white = false;
	end

	if color ~= "black" then
		all_black = false;
	end
end

if all_white == true then
	place_setaspect(crystal_zone, crystal_x, crystal_y, file..":crystal_6")
end

if all_black == true then
	place_setaspect(crystal_zone, crystal_x, crystal_y, file..":crystal_2")
end

