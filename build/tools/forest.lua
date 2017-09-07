#!/usr/bin/lua

local tileset, zone, lft, top, rgt, bot = ...

local L = math.max(0, lft)
local T = math.max(0, top)
local R = math.min(zone_getwidth(zone)-1, rgt)
local B = math.min(zone_getheight(zone)-1, bot)

for x=L,R do
	for y=T,B do
		local tile_even = ""
		local tile_odd  = ""

		if y == top then
			if x < rgt then tile_odd  = "tree_toplft" end
			if x > lft then tile_even = "tree_toprgt" end
		elseif y == bot then
			if x > lft then tile_odd  = "tree_botrgt" end
			if x < rgt then tile_even = "tree_botlft" end
		elseif x == lft then
			tile_odd  = "tree_toplft"
			tile_even = "tree_botlft"
		elseif x == rgt then
			tile_odd  = "tree_botrgt"
			tile_even = "tree_toprgt"
		else
			tile_odd  = "trees_lft"
			tile_even = "trees_rgt"
		end

		if (x+y)%2 == 0 then
			if tile_even ~= "" then place_setaspect(zone, x, y, tileset..":"..tile_even) end
		else
			if tile_odd  ~= "" then place_setaspect(zone, x, y, tileset..":"..tile_odd) end
		end
	end
end
