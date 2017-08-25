#!/usr/bin/lua

-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - --
-- Builds a 11x7 building at designated point. Return coordinates of entrance. --
-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - --

-- Get arguments.
local tileset, zone, x_shift, y_shift, w, h, roof_h, entrance_x = ...

-- Set default values for unobtained arguments.
if w == nil then w = 11 end
if h == nil then h = 7 end
if roof_h == nil then roof_h = 3 end
if entrance_x == nil then entrance_x = math.floor(w/2) end

-- Build extern building.

for x=0, w-1 do
	for y=0, h-1 do
		if y == 0 then
			if x == 0 then
				zone_settile(zone, x_shift+x, y_shift+y, tileset..":roof_toplft")
			elseif x == w-1 then
				zone_settile(zone, x_shift+x, y_shift+y, tileset..":roof_toprgt")
			else
				zone_settile(zone, x_shift+x, y_shift+y, tileset..":roof_top")
			end
		elseif y < roof_h then
			if x == 0 then
				zone_settile(zone, x_shift+x, y_shift+y, tileset..":roof_lft")
			elseif x == w-1 then
				zone_settile(zone, x_shift+x, y_shift+y, tileset..":roof_rgt")
			else
				zone_settile(zone, x_shift+x, y_shift+y, tileset..":roof")
			end
		elseif y == roof_h then
			if x == 0 then
				zone_settile(zone, x_shift+x, y_shift+y, tileset..":roof_botlft")
			elseif x == w-1 then
				zone_settile(zone, x_shift+x, y_shift+y, tileset..":roof_botrgt")
			else
				zone_settile(zone, x_shift+x, y_shift+y, tileset..":roof_bot")
			end
		elseif y < h-1 then
			if x == 0 then
				zone_settile(zone, x_shift+x, y_shift+y, tileset..":wall_lft")
			elseif x == w-1 then
				zone_settile(zone, x_shift+x, y_shift+y, tileset..":wall_rgt")
			else
				zone_settile(zone, x_shift+x, y_shift+y, tileset..":wall")
			end
		elseif y == h-1 then
			if x == 0 then
				zone_settile(zone, x_shift+x, y_shift+y, tileset..":wall_botlft")
			elseif x == w-1 then
				zone_settile(zone, x_shift+x, y_shift+y, tileset..":wall_botrgt")
			else
				zone_settile(zone, x_shift+x, y_shift+y, tileset..":wall_bot")
			end
		end
	end
end

-- Add decoration.
for y = roof_h+1, h-1 do
	for x=1, w-2 do
		if x%2 == 1 then
			if y == h-1 then
				zone_settile(zone, x_shift+x, y_shift+y, tileset..":wall_bot_window")
			elseif y%2 == 0 then
				zone_settile(zone, x_shift+x, y_shift+y, tileset..":wall_window")
			end
		end
	end
end

-- Add entrance.
zone_settile(zone, x_shift+entrance_x-1, y_shift+h-2, tileset..":bigdoor_toplft")
zone_settile(zone, x_shift+entrance_x+0, y_shift+h-2, tileset..":bigdoor_top")
zone_settile(zone, x_shift+entrance_x+1, y_shift+h-2, tileset..":bigdoor_toprgt")

zone_settile(zone, x_shift+entrance_x-1, y_shift+h-1, tileset..":bigdoor_lft")
zone_settile(zone, x_shift+entrance_x+0, y_shift+h-1, tileset..":bigdoor")
zone_settile(zone, x_shift+entrance_x+1, y_shift+h-1, tileset..":bigdoor_rgt")

-- -- Add open/close tags for entrance.
-- local door_x = x_shift + entrance_x
-- local door_y = y_shift + h - 1
-- zone_settag(zone, door_x, door_y, "openclose_state", "open")
-- zone_settag(zone, door_x, door_y, "openclose_opentile", tileset..":bigdoor")
-- zone_settag(zone, door_x, door_y, "openclose_closetile", tileset..":bigdoor_closed")

-- Finish.
return x_shift+entrance_x+0, y_shift+h-1

