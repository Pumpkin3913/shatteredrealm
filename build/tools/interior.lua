#!/usr/bin/lua

-- - - - - - - - - - - - --
-- Builds interior room. --
-- - - - - - - - - - - - --

-- Get arguments.
local tileset, screen, name, w, h = ...

new_screen(screen, name, w, h, tileset..":path")

for i=0,w-1 do
	screen_settile(screen, i, 0,   tileset..":wall")
	screen_settile(screen, i, 1,   tileset..":wall_bot")
	screen_settile(screen, i, h-2, tileset..":wall")
	screen_settile(screen, i, h-1, tileset..":wall_bot")
end

-- Add columns on flanks.
for j=1,h-4 do
	if j%2 == 0 then
		screen_settile(screen, 0,   j, tileset..":pillar")
		screen_settile(screen, w-1, j, tileset..":pillar")
	else
		screen_settile(screen, 0,   j, tileset..":roof_lone")
		screen_settile(screen, w-1, j, tileset..":roof_lone")
	end
end
screen_settile(screen, 0,   h-3, tileset..":pillar_bot")
screen_settile(screen, w-1, h-3, tileset..":pillar_bot")
