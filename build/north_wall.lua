#!/usr/bin/lua

local tileset, zone = ...

loadfile("build/corner_tower.lua")(tileset, zone, 1,  3, "northwest")
loadfile("build/tools/h_wall.lua")(tileset, zone, 6, 6, 6, 5)
loadfile("build/tower.lua")(tileset, zone, 12, 3, "left")
loadfile("build/tools/h_wall.lua")(tileset, zone, 17, 4, 6, 7)
loadfile("build/lone_tower.lua")(tileset, zone, 23, 1)
loadfile("build/tools/h_wall.lua")(tileset, zone, 28, 4, 6, 7)
loadfile("build/tower.lua")(tileset, zone, 34, 3, "right")
loadfile("build/tools/h_wall.lua")(tileset, zone, 39, 6, 6, 5)
loadfile("build/corner_tower.lua")(tileset, zone, 45, 3, "northeast")

zone_settile(zone, 16, 5, tileset..":roof")
zone_settile(zone, 34, 5, tileset..":roof")

zone_settile("northwest_floor_1", 8, 3, tileset..":pillar_bot")
zone_settile("northwest_floor_1", 8, 4, tileset..":mosaic_a")
zone_settile(zone, 6, 7, tileset..":mosaic_a")
loadfile("build/tools/link.lua")("northwest_floor_1", 8, 4, zone, 6, 7)

zone_settile("left_floor_1", 0, 3, tileset..":pillar_bot")
zone_settile("left_floor_1", 0, 4, tileset..":mosaic_a")
zone_settile(zone, 11, 7, tileset..":mosaic_a")
loadfile("build/tools/link.lua")("left_floor_1", 0, 4, zone, 11, 7)

zone_settile("lone_tower_2", 0, 3, tileset..":pillar_bot")
zone_settile("lone_tower_2", 0, 4, tileset..":mosaic_a")
zone_settile(zone, 22, 5, tileset..":mosaic_a")
loadfile("build/tools/link.lua")("lone_tower_2", 0, 4, zone, 22, 5)

zone_settile("lone_tower_2", 8, 3, tileset..":pillar_bot")
zone_settile("lone_tower_2", 8, 4, tileset..":mosaic_a")
zone_settile(zone, 28, 5, tileset..":mosaic_a")
loadfile("build/tools/link.lua")("lone_tower_2", 8, 4, zone, 28, 5)

zone_settile("right_floor_1", 8, 3, tileset..":pillar_bot")
zone_settile("right_floor_1", 8, 4, tileset..":mosaic_a")
zone_settile(zone, 39, 7, tileset..":mosaic_a")
loadfile("build/tools/link.lua")("right_floor_1", 8, 4, zone, 39, 7)

zone_settile("northeast_floor_1", 0, 3, tileset..":pillar_bot")
zone_settile("northeast_floor_1", 0, 4, tileset..":mosaic_a")
zone_settile(zone, 44, 7, tileset..":mosaic_a")
loadfile("build/tools/link.lua")("northeast_floor_1", 0, 4, zone, 44, 7)

-- Vertical walls.
loadfile("build/tools/v_wall.lua")(tileset, zone, 2, 10, 3, 30) -- TODO: cut the length
loadfile("build/tools/v_wall.lua")(tileset, zone, 46, 10, 3, 30) -- TODO: cut the length

-- Add crystal and mosaic disseminated through the towers.
local crystal_zone = "lone_tower_2"
local crystal_x = 4
local crystal_y = 3
zone_settile(crystal_zone, crystal_x, crystal_y, tileset..":crystal_2")

local put_switch = function(n, zone, x, y)
	local script = "loadfile(\"logic/switch_bw_crystal.lua\")(\""..crystal_zone.."\", "..crystal_x..", "..crystal_y..")"
	zone_settile(zone, x, y, tileset..":mosaic_black")
	zone_setlandon(zone, x, y, script)
	zone_settag(
		crystal_zone, crystal_x, crystal_y,
		"controlling_mosaic_"..n,
		zone .. "/" .. x .. "-" .. y
	)
end

put_switch(1, "lone_tower_0", 2, 4)
put_switch(2, "lone_tower_0", 6, 4)
put_switch(3, "northwest_floor_1", 2, 6)
put_switch(4, "northeast_floor_1", 6, 6)

-- Add advice on the wall, near the crystal.
zone_settile(crystal_zone, 3, 1, tileset..":wall_bot_written")
zone_settag(crystal_zone, 3, 1, "text", "To change the color of the crystal, set the floor tiles to the same color.")
zone_settag(crystal_zone, 3, 1, "text_type", "chalk")

-- Seal off left tower's door.
zone_settile(zone, 14, 11, tileset..":bigdoor_locked")
zone_settile("left_floor_0", 4, 9, tileset..":block_a")
