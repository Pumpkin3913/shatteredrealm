#!/usr/bin/lua

-- - - - - - - - - - - - --
-- Builds interior room. --
-- - - - - - - - - - - - --

-- Get arguments.
local tileset, zone, name, w, h = ...

new_zone(zone, name, w, h, tileset..":path")

-- Randomize soil.
for x=0,w-1 do
	for y=0,h-1 do
		local chance = c_rand(100)
		local dice = c_rand(4)
		if chance > 5 then
			-- nothing
		elseif dice == 1 then
			place_setaspect(zone, x, y, tileset..":path_rare_a")
		elseif dice == 2 then
			place_setaspect(zone, x, y, tileset..":path_rare_b")
		elseif dice == 3 then
			place_setaspect(zone, x, y, tileset..":path_rare_c")
		elseif dice == 4 then
			place_setaspect(zone, x, y, tileset..":path_rare_d")
		end
	end
end

for i=0,w-1 do
	place_setaspect(zone, i, 0,   tileset..":wall")
	place_setaspect(zone, i, 1,   tileset..":wall_bot")
	place_setaspect(zone, i, h-2, tileset..":wall")
	place_setaspect(zone, i, h-1, tileset..":wall_bot")
end

-- Add columns on flanks.
for j=1,h-4 do
	if j%2 == 0 then
		place_setaspect(zone, 0,   j, tileset..":pillar")
		place_setaspect(zone, w-1, j, tileset..":pillar")
	else
		place_setaspect(zone, 0,   j, tileset..":roof_lone")
		place_setaspect(zone, w-1, j, tileset..":roof_lone")
	end
end
place_setaspect(zone, 0,   h-3, tileset..":pillar_bot")
place_setaspect(zone, w-1, h-3, tileset..":pillar_bot")
