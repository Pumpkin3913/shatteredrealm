#!/usr/bin/lua

local tileset, zone, x_shift, y_shift = ...
local interior = "ziggurat_crystal"
local name = "Ziggurat au Cristal"

info("[WORLDGEN] [Demon Castle] Ziggurat Crystal")

local x,y = loadfile("build/tools/ziggurat.lua")(tileset, zone, x_shift, y_shift)
loadfile("build/tools/interior.lua")(tileset, interior, name, 9, 10)
loadfile("build/tools/door.lua")(tileset, interior, 4, 9)
place_setaspect(interior, 4, 9, tileset..":mosaic_a")
place_setaspect(interior, 4, 9-1, tileset..":path")
loadfile("build/tools/link.lua")(zone, x, y, interior, 4, 9)

-- Add writing on the wall.
place_setaspect(interior, 3, 1, tileset..":wall_bot_written")
place_settag(interior, 3, 1, "text", "To change the color of the crystal, set the floor tiles to the same color.")
place_settag(interior, 3, 1, "text_type", "chalk")

-- Lock the entrance.
place_setaspect(zone, x, y, tileset..":bigdoor_locked")
place_settag(zone, x, y, "openclose_opentile", tileset..":bigdoor")
place_settag(zone, x, y, "openclose_closetile", tileset..":bigdoor_closed")
place_settag(zone, x, y, "openclose_locktile", tileset..":bigdoor_locked")
place_settag(zone, x, y, "openclose_state", "locked")
place_settag(zone, x, y, "openclose_key", "Clef du Ziggurat")

-- Add puzzle to light up the crystal.
local master_x = 4
local master_y = 5
place_setaspect(interior, master_x, master_y, tileset..":crystal_2")
local script = "place_setaspect(\""..interior.."\", "..master_x..", "..master_y..", \""..tileset..":crystal_6\")"
place_settag(interior, master_x, master_y, "puzzle_script", script)
local master = interior.."/"..master_x.."-"..master_y

local place_piece = function(n, x, y)
	place_setaspect(interior, x, y, tileset..":mosaic_black")
	place_settag(interior, x, y, "puzzle_init", "black")
	place_settag(interior, x, y, "puzzle_model", "white")
	place_settag(interior, x, y, "puzzle_master", master)
	place_setlandon(interior, x, y, "dofile(\"logic/puzzle_mosaic_walk.lua\")")
	place_settag(interior, master_x, master_y, "puzzle_piece_"..n, interior.."/"..x.."-"..y)
end

place_piece(1, master_x-2, master_y)
place_piece(2, master_x, master_y-2)
place_piece(3, master_x+2, master_y)
