#!/usr/bin/lua

local tileset, screen, x_shift, y_shift = ...

local x,y = loadfile("build/tools/ziggurat.lua")(tileset, screen, x_shift, y_shift)
loadfile("build/tools/interior.lua")(tileset, "ziggurat_1", "Ziggurat", 9, 10)
loadfile("build/tools/doorway.lua")(tileset, "ziggurat_1", 4, 9)
loadfile("build/tools/link.lua")(screen, x, y, "ziggurat_1", 4, 9)
loadfile("build/tools/crystal.lua")(tileset, "ziggurat_1", 4, 5)

-- Add writing on the wall.
screen_settile("ziggurat_1", 3, 1, tileset..":wall_bot_written")
screen_settag("ziggurat_1", 3, 1, "text", "To change the color of the crystal, set the floor tiles to the same color.")

-- Lock the entrance.
screen_settile(screen, x, y, tileset..":bigdoor_closed")
screen_settag(screen, x, y, "openclose_state", "locked")
screen_settag(screen, x, y, "openclose_key", "Ziggurat's Key")

verbose("[WORLDGEN] Crystal's ziggurat build in "..screen..".");
