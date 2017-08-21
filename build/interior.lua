#!/usr/bin/lua

-- - - - - - - - - - - - --
-- Builds interior room. --
-- - - - - - - - - - - - --

-- Get arguments.
local tileset, screen, name, w, h, extern_screen, extern_entrance_x, extern_entrance_y = ...

new_screen(screen, name, w, h, tileset..":soil_a")

for x=1,w-2 do
	for y=0,h-1 do
		local dice = c_rand(3)
		if dice == 1 then
			screen_settile(screen, x, y, tileset..":soil_a")
		elseif dice == 2 then
			screen_settile(screen, x, y, tileset..":soil_c")
		elseif dice == 3 then
			screen_settile(screen, x, y, tileset..":soil_d")
		end
	end
end

local entrance_x = math.floor(w/2);
for i=0,w-1 do
	screen_settile(screen, i, 0, tileset..":wall")
	screen_settile(screen, i, 1, tileset..":wall_bot")
	if i == entrance_x then
		screen_settile(screen, i, h-2, tileset..":soil_a")
		screen_settile(screen, i, h-1, tileset..":mosaic_a")
		screen_setlandon(screen, entrance_x, h-1, "player_changescreen(Player, \""..extern_screen.."\", ".. extern_entrance_x ..", ".. extern_entrance_y ..")")
		screen_setlandon(extern_screen, extern_entrance_x, extern_entrance_y, "player_changescreen(Player, \""..screen.."\", "..entrance_x..", ".. h-1 ..")")
	elseif i == entrance_x-1 then
		screen_settile(screen, i, h-2, tileset..":wall_rgt")
		screen_settile(screen, i, h-1, tileset..":wall_botrgt")
	elseif i == entrance_x+1 then
		screen_settile(screen, i, h-2, tileset..":wall_lft")
		screen_settile(screen, i, h-1, tileset..":wall_botlft")
	else
		screen_settile(screen, i, h-2, tileset..":wall")
		screen_settile(screen, i, h-1, tileset..":wall_bot")
	end
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

-- Finish.
verbose("'"..screen.."' built inside '"..extern_screen.."'.")

