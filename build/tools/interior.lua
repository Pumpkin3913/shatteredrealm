#!/usr/bin/lua

-- - - - - - - - - - - - --
-- Builds interior room. --
-- - - - - - - - - - - - --

-- Get arguments.
local tileset, zone, name, w, h, soil, options = ...
if not soil then soil = "path" end
if not options then options = "" end

local columns = not string.match(options, ".*nocolumns.*")

new_zone(zone, name, w, h, tileset..":"..soil)

-- Randomize soil.
for x=0,w-1 do
	for y=0,h-1 do
		if c_rand(100) <= 5 then
			place_setaspect(zone, x, y, tileset..":"..soil.."_rare_"..c_rand(4))
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
if columns then
	for j=1,h-4 do
		if j%2 == 0 then
			place_setaspect(zone, 0,   j, tileset..":pillar")
			place_setaspect(zone, w-1, j, tileset..":pillar")
		else
			place_setaspect(zone, 0,   j, tileset..":slab")
			place_setaspect(zone, w-1, j, tileset..":slab")
		end
	end
	if h%2 == 0 then
		place_setaspect(zone, 0,   h-3, tileset..":pillar_bot")
		place_setaspect(zone, w-1, h-3, tileset..":pillar_bot")
	else
		place_setaspect(zone, 0,   h-3, tileset..":pillar")
		place_setaspect(zone, w-1, h-3, tileset..":pillar")
	end
end
