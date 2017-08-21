#!/usr/bin/lua

-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - --
-- Builds a 11x7 building at designated point. Return coordinates of entrance. --
-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - --

-- Get arguments.
local tileset, screen, x_shift, y_shift = ...
local w = 11
local h = 7
local roof_h = 3
local entrance_x = 5

-- Build extern building.

for x=0, w-1 do
	for y=0, h-1 do
		if y == 0 then
			if x == 0 then
				screen_settile(screen, x_shift+x, y_shift+y, tileset..":roof_toplft")
			elseif x == w-1 then
				screen_settile(screen, x_shift+x, y_shift+y, tileset..":roof_toprgt")
			else
				screen_settile(screen, x_shift+x, y_shift+y, tileset..":roof_top")
			end
		elseif y < roof_h then
			if x == 0 then
				screen_settile(screen, x_shift+x, y_shift+y, tileset..":roof_lft")
			elseif x == w-1 then
				screen_settile(screen, x_shift+x, y_shift+y, tileset..":roof_rgt")
			else
				screen_settile(screen, x_shift+x, y_shift+y, tileset..":roof")
			end
		elseif y == roof_h then
			if x == 0 then
				screen_settile(screen, x_shift+x, y_shift+y, tileset..":roof_botlft")
			elseif x == w-1 then
				screen_settile(screen, x_shift+x, y_shift+y, tileset..":roof_botrgt")
			else
				screen_settile(screen, x_shift+x, y_shift+y, tileset..":roof_bot")
			end
		elseif y < h-1 then
			if x == 0 then
				screen_settile(screen, x_shift+x, y_shift+y, tileset..":wall_lft")
			elseif x == w-1 then
				screen_settile(screen, x_shift+x, y_shift+y, tileset..":wall_rgt")
			else
				screen_settile(screen, x_shift+x, y_shift+y, tileset..":wall")
			end
		elseif y == h-1 then
			if x == 0 then
				screen_settile(screen, x_shift+x, y_shift+y, tileset..":wall_botlft")
			elseif x == w-1 then
				screen_settile(screen, x_shift+x, y_shift+y, tileset..":wall_botrgt")
			else
				screen_settile(screen, x_shift+x, y_shift+y, tileset..":wall_bot")
			end
		end
	end
end

-- Add decoration.
for x=1, w-2 do
	if x%2 == 1 then
		screen_settile(screen, x_shift+x, y_shift+h-2, tileset..":wall_window")
	else
		screen_settile(screen, x_shift+x, y_shift+h-1, tileset..":wall_bot_window")
	end
end

-- Add entrance.
screen_settile(screen, x_shift+entrance_x-1, y_shift+h-2, tileset..":bigdoor_toplft")
screen_settile(screen, x_shift+entrance_x+0, y_shift+h-2, tileset..":bigdoor_top")
screen_settile(screen, x_shift+entrance_x+1, y_shift+h-2, tileset..":bigdoor_toprgt")

screen_settile(screen, x_shift+entrance_x-1, y_shift+h-1, tileset..":bigdoor_lft")
screen_settile(screen, x_shift+entrance_x+0, y_shift+h-1, tileset..":bigdoor")
screen_settile(screen, x_shift+entrance_x+1, y_shift+h-1, tileset..":bigdoor_rgt")

-- Finish.
verbose("Building built in '"..screen.."'.")
return x_shift+entrance_x+0, y_shift+h-1

