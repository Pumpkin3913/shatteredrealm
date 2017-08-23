#!/usr/bin/lua

local tileset, screen, x_shift, y_shift = ...
local interior = "ziggurat_crystal"

local x,y = loadfile("build/tools/ziggurat.lua")(tileset, screen, x_shift, y_shift)
loadfile("build/tools/interior.lua")(tileset, interior, "Ziggurat", 9, 10)
loadfile("build/tools/doorway.lua")(tileset, interior, 4, 9)
loadfile("build/tools/link.lua")(screen, x, y, interior, 4, 9)

-- Add writing on the wall.
screen_settile(interior, 3, 1, tileset..":wall_bot_written")
screen_settag(interior, 3, 1, "text", "To change the color of the crystal, set the floor tiles to the same color.")

-- Lock the entrance.
screen_settile(screen, x, y, tileset..":bigdoor_closed")
screen_settag(screen, x, y, "openclose_opentile", tileset..":bigdoor")
screen_settag(screen, x, y, "openclose_closetile", tileset..":bigdoor_closed")
screen_settag(screen, x, y, "openclose_state", "locked")
screen_settag(screen, x, y, "openclose_key", "Ziggurat's Key")

-- Add crystal and three mosaic switches.
x = 4
y = 5
local script = "loadfile(\"logic/switch_bw_crystal.lua\")(\""..interior.."\", "..x..", "..y..")"
local pack = function (screen, x, y) return screen .. "/" .. x .. "-" .. y end

screen_settile(interior, x, y, tileset..":crystal_2")

screen_settile(interior, x-2, y, tileset..":mosaic_black")
screen_settag(interior, x, y, "controlling_mosaic_1", pack(interior, x-2, y))
screen_setlandon(interior, x-2, y, script)

screen_settile(interior, x, y-2, tileset..":mosaic_black")
screen_settag(interior, x, y, "controlling_mosaic_2", pack(interior, x, y-2))
screen_setlandon(interior, x, y-2, script)

screen_settile(interior, x+2, y, tileset..":mosaic_black")
screen_settag(interior, x, y, "controlling_mosaic_3", pack(interior, x+2, y))
screen_setlandon(interior, x+2, y, script)

verbose("[WORLDGEN] Crystal's ziggurat build in "..screen..".");
