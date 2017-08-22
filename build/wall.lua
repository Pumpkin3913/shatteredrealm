#!/usr/bin/lua

local tileset, screen, x_shift, y_shift, height = ...

for x=0,5 do
	screen_settile(screen, x_shift+x, y_shift+0, tileset..":roof_top")
	screen_settile(screen, x_shift+x, y_shift+1, tileset..":roof")
	screen_settile(screen, x_shift+x, y_shift+2, tileset..":roof_bot")
	for y=3,height-2 do
		screen_settile(screen, x_shift+x, y_shift+y, tileset..":wall")
	end
	screen_settile(screen, x_shift+x, y_shift+height-1, tileset..":wall_bot")
end
