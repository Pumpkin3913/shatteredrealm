#!/usr/bin/lua

local tileset, zone, x_shift, y_shift, w, h = ...

for x=0,w-1 do
	for y=0,h-1 do
		-- Left and right walls.
		if x == 0 or x == w-1 then
			local side ; if x == 0 then side = "lft" else side = "rgt" end
			if y == 0 then
				zone_settile(zone, x+x_shift, y+y_shift, tileset..":roof_endtop")
			elseif y == h-2 then
				zone_settile(zone, x+x_shift, y+y_shift, tileset..":roof_end"..side)
			elseif y == h-1 then
				zone_settile(zone, x+x_shift, y+y_shift, tileset..":wall_bot"..side)
			else
				zone_settile(zone, x+x_shift, y+y_shift, tileset..":roof_vertical")
			end
		-- Top and bot walls.
		elseif y == 0 or y == h-2 then
			zone_settile(zone, x+x_shift, y+y_shift, tileset..":roof_horizontal")
		elseif y == 1 or y == h-1 then
			zone_settile(zone, x+x_shift, y+y_shift, tileset..":wall_bot")
		-- Add tombstones.
		elseif (x+y)%3 == 0 and (x-y)%3 ~= 0 then
			local dice = c_rand(3)
			if dice == 1 then
				zone_settile(zone, x+x_shift, y+y_shift, tileset..":tombstone_cross")
			elseif dice == 2 then
				zone_settile(zone, x+x_shift, y+y_shift, tileset..":tombstone_slab")
			end -- Else nothing
		end
	end
end

