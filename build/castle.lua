#!/usr/bin/lua

local zone = "castle"
local tileset = "redruins"

-- Width: 5 towers (5 tiles wide each) and 4 walls (6 tiles long each) and one free tile on each side.
local w = 1+5*5+4*6+1
local h = 40 -- for now

new_zone(zone, "Castle", w, h, tileset..":soil_c")

-- Randomize soil.
for x=0,w-1 do
	for y=0,h-1 do
		local dice = c_rand(4)
		if dice == 1 then
			place_setaspect(zone, x, y, tileset..":soil_a")
		elseif dice == 2 then
			place_setaspect(zone, x, y, tileset..":soil_b")
		elseif dice == 3 then
			place_setaspect(zone, x, y, tileset..":soil_c")
		elseif dice == 4 then
			place_setaspect(zone, x, y, tileset..":soil_d")
		end
	end
end

place_setaspect(zone, 25, 15, tileset..":mosaic_a") -- Spawn point.

loadfile("build/north_wall.lua")(tileset, zone)

loadfile("build/ziggurat_crystal.lua")(tileset, zone, 8, 15)
loadfile("build/ziggurat_portal.lua")(tileset, zone, 8, 24)
loadfile("build/library.lua")(tileset, zone, w-8-11, 15) -- 8 is offset from right, 11 is library's length.
loadfile("build/the_graveyard.lua")(tileset, zone, 18, 18)
loadfile("build/writeme_wall.lua")(tileset, zone, 17, 13)

-- Dispatch treasures.

-- Chalk coffer.
place_setaspect("left_floor_0", 4, 5, tileset..":coffer_rare_close")
place_settag ("left_floor_0", 4, 5, "openclose_state", "close")
place_settag ("left_floor_0", 4, 5, "openclose_opentile", tileset..":coffer_rare_open")
place_settag ("left_floor_0", 4, 5, "openclose_closetile", tileset..":coffer_rare_close")
place_settag ("left_floor_0", 4, 5, "content", "chalk")

-- Ziggurat's key coffer.
place_setaspect(zone, 25, 2, tileset..":coffer_common_close")
place_settag (zone, 25, 2, "openclose_state", "close")
place_settag (zone, 25, 2, "openclose_opentile", tileset..":coffer_common_open")
place_settag (zone, 25, 2, "openclose_closetile", tileset..":coffer_common_close")
place_settag (zone, 25, 2, "content", "Ziggurat's Key")

info("[WORLDGEN] Castle finished.")
