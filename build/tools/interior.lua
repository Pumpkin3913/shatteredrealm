#!/usr/bin/lua

-- - - - - - - - - - - - --
-- Builds interior room. --
-- - - - - - - - - - - - --

-- Get arguments.
local tileset, screen, name, w, h = ...

new_screen(screen, name, w, h, tileset..":path")

-- Randomize soil.
for x=0,w-1 do
	for y=0,h-1 do
		local chance = c_rand(100)
		local dice = c_rand(4)
		if chance > 5 then
			-- nothing
		elseif dice == 1 then
			screen_settile(screen, x, y, tileset..":path_rare_a")
		elseif dice == 2 then
			screen_settile(screen, x, y, tileset..":path_rare_b")
		elseif dice == 3 then
			screen_settile(screen, x, y, tileset..":path_rare_c")
		elseif dice == 4 then
			screen_settile(screen, x, y, tileset..":path_rare_d")
		end
	end
end

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
