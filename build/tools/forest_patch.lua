#!/usr/bin/lua

local tileset, zone, lft, top, rgt, bot = ...

for x=lft,rgt do
	for y=top,bot do
		if (x+y)%2 == 0 then
			place_setaspect(zone, x, y, tileset..":trees_rgt")
		else
			place_setaspect(zone, x, y, tileset..":trees_lft")
		end
	end
end
