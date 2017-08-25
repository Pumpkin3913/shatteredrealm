#!/usr/bin/lua

local tileset, zone, x_shift, y_shift, w, h = ...

for x=0,w-1 do
	zone_settile(zone, x_shift+x, y_shift+0, tileset..":roof_top")
	zone_settile(zone, x_shift+x, y_shift+1, tileset..":roof")
	zone_settile(zone, x_shift+x, y_shift+2, tileset..":roof_bot")
	for y=3,h-2 do
		zone_settile(zone, x_shift+x, y_shift+y, tileset..":wall")
	end
	zone_settile(zone, x_shift+x, y_shift+h-1, tileset..":wall_bot")
end
