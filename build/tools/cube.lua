#!/usr/bin/lua

-- - - - - - - - - - - - - - - - - - - - - - - - --
-- Builds a cubic building at designated point.  --
-- - - - - - - - - - - - - - - - - - - - - - - - --

local tileset, zone, x_shift, y_shift, w, h, roof_h = ...

-- Set default values for unobtained arguments.
if w == nil then w = 11 end
if h == nil then h = 7 end
if roof_h == nil then roof_h = 3 end

for x=0, w-1 do
	for y=0, h-1 do
		if y == 0 then
			if x == 0 then
				place_setaspect(zone, x_shift+x, y_shift+y, tileset..":roof_toplft")
			elseif x == w-1 then
				place_setaspect(zone, x_shift+x, y_shift+y, tileset..":roof_toprgt")
			else
				place_setaspect(zone, x_shift+x, y_shift+y, tileset..":roof_top")
			end
		elseif y < roof_h then
			if x == 0 then
				place_setaspect(zone, x_shift+x, y_shift+y, tileset..":roof_lft")
			elseif x == w-1 then
				place_setaspect(zone, x_shift+x, y_shift+y, tileset..":roof_rgt")
			else
				place_setaspect(zone, x_shift+x, y_shift+y, tileset..":roof")
			end
		elseif y == roof_h then
			if x == 0 then
				place_setaspect(zone, x_shift+x, y_shift+y, tileset..":roof_botlft")
			elseif x == w-1 then
				place_setaspect(zone, x_shift+x, y_shift+y, tileset..":roof_botrgt")
			else
				place_setaspect(zone, x_shift+x, y_shift+y, tileset..":roof_bot")
			end
		elseif y < h-1 then
			if x == 0 then
				place_setaspect(zone, x_shift+x, y_shift+y, tileset..":wall_lft")
			elseif x == w-1 then
				place_setaspect(zone, x_shift+x, y_shift+y, tileset..":wall_rgt")
			else
				place_setaspect(zone, x_shift+x, y_shift+y, tileset..":wall")
			end
		elseif y == h-1 then
			if x == 0 then
				place_setaspect(zone, x_shift+x, y_shift+y, tileset..":wall_botlft")
			elseif x == w-1 then
				place_setaspect(zone, x_shift+x, y_shift+y, tileset..":wall_botrgt")
			else
				place_setaspect(zone, x_shift+x, y_shift+y, tileset..":wall_bot")
			end
		end
	end
end
