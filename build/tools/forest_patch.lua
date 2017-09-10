#!/usr/bin/lua

local tileset, zone, lft, top, rgt, bot, n = ...
if not n then n = 0 end

for x=lft,rgt do
	for y=top,bot do
		if (x+y)%2 == n then
			place_setaspect(zone, x, y, tileset..":trees_rgt")
		else
			place_setaspect(zone, x, y, tileset..":trees_lft")
		end
	end
end
