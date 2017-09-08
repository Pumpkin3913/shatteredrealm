#!/usr/bin/lua

info("[WORLDGEN] [Lava Cave] Mossy Cave")

local zone = "mossy_cave"
local tileset = "volcano"
local w = 10
local h = 10

new_zone(zone, "Caverne Moussue", w, h, tileset..":roof")

-- Randomize soil.
for x=0,w-1 do
	for y=0,h-1 do
		if c_rand(100) > 10 then
			-- Nothing.
		else
			place_setaspect(zone, x, y, tileset..":roof_rare_"..c_rand(4))
		end
	end
end

place_setaspect(zone, 5, 0, tileset..":mosaic_a")
return zone, 5, 0
