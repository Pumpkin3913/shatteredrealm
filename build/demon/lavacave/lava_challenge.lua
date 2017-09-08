#!/usr/bin/lua

info("[WORLDGEN] [Lava Cave] Lava Challenge")

local zone = "lava_challenge"
local tileset = "volcano"
local w = 10
local h = 10

new_zone(zone, "Défi de Lave", w, h, tileset..":roof")

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

place_setaspect(zone, 9, 5, tileset..":mosaic_a")
return zone, 9, 5
