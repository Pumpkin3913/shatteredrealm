#!/usr/bin/lua

local tileset, screen, x_shift, y_shift = ...

local x,y = loadfile("build/tools/building.lua")(tileset, screen, x_shift, y_shift, 11, 8)
loadfile("build/tools/interior.lua")(tileset, "library_0", "Library", 13, 10)
loadfile("build/tools/doorway.lua")(tileset, "library_0", 6, 9)
loadfile("build/tools/link.lua")(screen, x, y, "library_0", 6, 9)

loadfile("build/tools/interior.lua")(tileset, "library_1", "Library", 13, 10)
loadfile("build/tools/door.lua")(tileset, "library_0", 6, 1)
loadfile("build/tools/door.lua")(tileset, "library_1", 6, 1)
loadfile("build/tools/link.lua")("library_0", 6, 1, "library_1", 6, 1)
-- TODO: add internal windows corresponding to the external ones.

verbose("[WORLDGEN] Library build in "..screen..".");
