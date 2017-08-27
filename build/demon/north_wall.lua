#!/usr/bin/lua

local tileset, zone = ...

loadfile("build/demon/tower_corner.lua")(tileset, zone, 1,  3, "northwest")
loadfile("build/tools/h_wall.lua")(tileset, zone, 6, 6, 6, 5)
loadfile("build/demon/tower.lua")(tileset, zone, 12, 3, "left")
loadfile("build/tools/h_wall.lua")(tileset, zone, 17, 4, 6, 7)
loadfile("build/demon/tower_tall.lua")(tileset, zone, 23, 1)
loadfile("build/tools/h_wall.lua")(tileset, zone, 28, 4, 6, 7)
loadfile("build/demon/tower.lua")(tileset, zone, 34, 3, "right")
loadfile("build/tools/h_wall.lua")(tileset, zone, 39, 6, 6, 5)
loadfile("build/demon/tower_corner.lua")(tileset, zone, 45, 3, "northeast")

place_setaspect(zone, 16, 5, tileset..":roof")
place_setaspect(zone, 34, 5, tileset..":roof")

place_setaspect("northwest_floor_1", 8, 3, tileset..":pillar_bot")
place_setaspect("northwest_floor_1", 8, 4, tileset..":mosaic_a")
place_setaspect(zone, 6, 7, tileset..":mosaic_a")
loadfile("build/tools/link.lua")("northwest_floor_1", 8, 4, zone, 6, 7)

place_setaspect("left_floor_1", 0, 3, tileset..":pillar_bot")
place_setaspect("left_floor_1", 0, 4, tileset..":mosaic_a")
place_setaspect(zone, 11, 7, tileset..":mosaic_a")
loadfile("build/tools/link.lua")("left_floor_1", 0, 4, zone, 11, 7)

place_setaspect("tall_tower_2", 0, 3, tileset..":pillar_bot")
place_setaspect("tall_tower_2", 0, 4, tileset..":mosaic_a")
place_setaspect(zone, 22, 5, tileset..":mosaic_a")
loadfile("build/tools/link.lua")("tall_tower_2", 0, 4, zone, 22, 5)

place_setaspect("tall_tower_2", 8, 3, tileset..":pillar_bot")
place_setaspect("tall_tower_2", 8, 4, tileset..":mosaic_a")
place_setaspect(zone, 28, 5, tileset..":mosaic_a")
loadfile("build/tools/link.lua")("tall_tower_2", 8, 4, zone, 28, 5)

place_setaspect("right_floor_1", 8, 3, tileset..":pillar_bot")
place_setaspect("right_floor_1", 8, 4, tileset..":mosaic_a")
place_setaspect(zone, 39, 7, tileset..":mosaic_a")
loadfile("build/tools/link.lua")("right_floor_1", 8, 4, zone, 39, 7)

place_setaspect("northeast_floor_1", 0, 3, tileset..":pillar_bot")
place_setaspect("northeast_floor_1", 0, 4, tileset..":mosaic_a")
place_setaspect(zone, 44, 7, tileset..":mosaic_a")
loadfile("build/tools/link.lua")("northeast_floor_1", 0, 4, zone, 44, 7)

-- Vertical walls.
loadfile("build/tools/v_wall.lua")(tileset, zone, 2, 10, 3, 30) -- TODO: cut the length
loadfile("build/tools/v_wall.lua")(tileset, zone, 46, 10, 3, 30) -- TODO: cut the length

-- Add puzzle to light up the crystal.
local master_zone = "tall_tower_2"
local master_x = 4
local master_y = 2
place_setaspect(master_zone, master_x, master_y, tileset..":crystal_2")
local script = "place_setaspect(\""..master_zone.."\", "..master_x..", "..master_y..", \""..tileset..":crystal_6\")"
place_settag(master_zone, master_x, master_y, "puzzle_script", script)
local master = master_zone.."/"..master_x.."-"..master_y

local place_piece = function(n, zone, x, y)
	place_setaspect(zone, x, y, tileset..":mosaic_black")
	place_settag(zone, x, y, "puzzle_init", "black")
	place_settag(zone, x, y, "puzzle_model", "white")
	place_settag(zone, x, y, "puzzle_master", master)
	place_setlandon(zone, x, y, "dofile(\"logic/puzzle_mosaic_walk.lua\")")
	place_settag(master_zone, master_x, master_y, "puzzle_piece_"..n, zone.."/"..x.."-"..y)
end

place_piece(1, "tall_tower_0", 4, 4)
place_piece(2, "northwest_floor_1", 2, 6)
place_piece(3, "northeast_floor_1", 6, 6)

-- Add hint around the crystal.
place_setaspect(master_zone, master_x-2, master_y+1, tileset..":mosaic_white")
place_setaspect(master_zone, master_x,   master_y+2, tileset..":mosaic_white")
place_setaspect(master_zone, master_x+2, master_y+1, tileset..":mosaic_white")
place_setaspect(master_zone, master_x-1, master_y+2, tileset..":mosaic_special")

-- Seal off left tower's door.
place_setaspect(zone, 14, 11, tileset..":bigdoor_locked")
place_setaspect("left_floor_0", 4, 9, tileset..":bigdoor_locked")
place_setaspect("left_floor_0", 4, 9-1, tileset..":bigdoor_top")

-- Add treasure in left tower.
place_setaspect("left_floor_0", 4, 3, tileset..":mosaic_special")
place_setaspect("left_floor_0", 4, 5, tileset..":coffer_rare_close")
place_settag ("left_floor_0", 4, 5, "openclose_state", "close")
place_settag ("left_floor_0", 4, 5, "openclose_opentile", tileset..":coffer_rare_open")
place_settag ("left_floor_0", 4, 5, "openclose_closetile", tileset..":coffer_rare_close")
place_settag ("left_floor_0", 4, 5, "content", "chalk")
