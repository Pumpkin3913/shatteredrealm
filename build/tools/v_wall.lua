#!/usr/bin/lua

local tileset, screen, x_shift, y_shift, w, h = ...

for y=0,h-1 do
	screen_settile(screen, x_shift, y_shift+y, tileset..":roof_lft")
	for x=0,w-2 do
		screen_settile(screen, x_shift+1, y_shift+y, tileset..":roof")
	end
	screen_settile(screen, x_shift+w-1, y_shift+y, tileset..":roof_rgt")
end
