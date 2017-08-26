#!/usr/bin/lua

local tileset, zone, x_shift, y_shift = ...
local interior = "ziggurat_crystal"

local x,y = loadfile("build/tools/ziggurat.lua")(tileset, zone, x_shift, y_shift)
loadfile("build/tools/interior.lua")(tileset, interior, "Ziggurat", 9, 10)
loadfile("build/tools/doorway.lua")(tileset, interior, 4, 9)
loadfile("build/tools/link.lua")(zone, x, y, interior, 4, 9)

-- Add writing on the wall.
place_setaspect(interior, 3, 1, tileset..":wall_bot_written")
place_settag(interior, 3, 1, "text", "To change the color of the crystal, set the floor tiles to the same color.")
place_settag(interior, 3, 1, "text_type", "chalk")

-- Lock the entrance.
place_setaspect(zone, x, y, tileset..":bigdoor_closed")
place_settag(zone, x, y, "openclose_opentile", tileset..":bigdoor")
place_settag(zone, x, y, "openclose_closetile", tileset..":bigdoor_closed")
place_settag(zone, x, y, "openclose_state", "locked")
place_settag(zone, x, y, "openclose_key", "Ziggurat's Key")

-- Add crystal and three mosaic switches.
x = 4
y = 5
local script = "loadfile(\"logic/switch_bw_crystal.lua\")(\""..interior.."\", "..x..", "..y..")"
local pack = function (zone, x, y) return zone .. "/" .. x .. "-" .. y end

place_setaspect(interior, x, y, tileset..":crystal_2")

place_setaspect(interior, x-2, y, tileset..":mosaic_black")
place_settag(interior, x, y, "controlling_mosaic_1", pack(interior, x-2, y))
place_setlandon(interior, x-2, y, script)

place_setaspect(interior, x, y-2, tileset..":mosaic_black")
place_settag(interior, x, y, "controlling_mosaic_2", pack(interior, x, y-2))
place_setlandon(interior, x, y-2, script)

place_setaspect(interior, x+2, y, tileset..":mosaic_black")
place_settag(interior, x, y, "controlling_mosaic_3", pack(interior, x+2, y))
place_setlandon(interior, x+2, y, script)

info("[WORLDGEN] Crystal's ziggurat build in "..zone..".");
