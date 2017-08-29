#!/usr/bin/lua

-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - --
-- Builds a 11x7 building at designated point. Return coordinates of entrance. --
-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - --

local tileset, zone, x_shift, y_shift, w, h, roof_h, entrance_x = ...

-- Set default values for unobtained arguments.
if w == nil then w = 11 end
if h == nil then h = 7 end
if roof_h == nil then roof_h = 3 end
if entrance_x == nil then entrance_x = math.floor(w/2) end

-- Build extern building.
loadfile("build/tools/cube.lua")(tileset, zone, x_shift, y_shift, w, h, roof_h)

-- Add decoration.
for y = roof_h+1, h-1 do
	for x=1, w-2 do
		if x%2 == 1 then
			if y == h-1 then
				place_setaspect(zone, x_shift+x, y_shift+y, tileset..":wall_bot_window")
			elseif y%2 == 0 then
				place_setaspect(zone, x_shift+x, y_shift+y, tileset..":wall_window")
			end
		end
	end
end

-- Add entrance.
place_setaspect(zone, x_shift+entrance_x-1, y_shift+h-2, tileset..":bigdoor_toplft")
place_setaspect(zone, x_shift+entrance_x+0, y_shift+h-2, tileset..":bigdoor_top")
place_setaspect(zone, x_shift+entrance_x+1, y_shift+h-2, tileset..":bigdoor_toprgt")

place_setaspect(zone, x_shift+entrance_x-1, y_shift+h-1, tileset..":bigdoor_lft")
place_setaspect(zone, x_shift+entrance_x+0, y_shift+h-1, tileset..":bigdoor")
place_setaspect(zone, x_shift+entrance_x+1, y_shift+h-1, tileset..":bigdoor_rgt")

-- Finish.
return x_shift+entrance_x+0, y_shift+h-1

