#!/usr/bin/lua

local tileset, zone, x_shift, y_shift, w, h = ...

for x=0,w-1 do
	place_setaspect(zone, x_shift+x, y_shift+0, tileset..":roof_top")
	place_setaspect(zone, x_shift+x, y_shift+1, tileset..":roof")
	place_setaspect(zone, x_shift+x, y_shift+2, tileset..":roof_bot")
	for y=3,h-2 do
		place_setaspect(zone, x_shift+x, y_shift+y, tileset..":wall")
	end
	place_setaspect(zone, x_shift+x, y_shift+h-1, tileset..":wall_bot")
end
