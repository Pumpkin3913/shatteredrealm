#!/usr/bin/lua

local screen = "village"
local tileset = "redruins"

new_screen(screen, "Village", 30, 30, tileset..":soil_c")

screen_settile(screen, 5, 5, tileset..":mosaic_a")

local x,y

-- Build ziggurat with crystal.
x,y = loadfile("build/tools/ziggurat.lua")(tileset, screen, 10, 2)
loadfile("build/tools/interior.lua")(tileset, "ziggurat_1", "Ziggurat", 9, 10)
verbose("IJUI")
loadfile("build/tools/doorway.lua")(tileset, "ziggurat_1", 4, 9)
loadfile("build/tools/link.lua")(screen, x, y, "ziggurat_1", 4, 9)
loadfile("build/tools/crystal.lua")(tileset, "ziggurat_1", 4, 5)
screen_settile("ziggurat_1", 3, 1, tileset..":wall_bot_written")
screen_settag("ziggurat_1", 3, 1, "text", "To change the color of the crystal, set the floor tiles to the same color.")
screen_settile(screen, x, y, tileset..":bigdoor_closed")

-- Build empty ziggurat.
x,y = loadfile("build/tools/ziggurat.lua")(tileset, screen, 21, 5)
loadfile("build/tools/interior.lua")(tileset, "ziggurat_2", "Ziggurat", 9, 10)
loadfile("build/tools/doorway.lua")(tileset, "ziggurat_2", 4, 9)
loadfile("build/tools/link.lua")(screen, x, y, "ziggurat_2", 4, 9)

-- Build library.
x,y = loadfile("build/tools/building.lua")(tileset, screen, 7, 14, 11, 8)
loadfile("build/tools/interior.lua")(tileset, "library_0", "Library", 13, 10)
loadfile("build/tools/doorway.lua")(tileset, "library_0", 6, 9)
loadfile("build/tools/link.lua")(screen, x, y, "library_0", 6, 9)

-- Build library's first floor.
loadfile("build/tools/interior.lua")(tileset, "library_1", "Library", 13, 10)
loadfile("build/tools/door.lua")(tileset, "library_0", 6, 1)
loadfile("build/tools/door.lua")(tileset, "library_1", 6, 1)
loadfile("build/tools/link.lua")("library_0", 6, 1, "library_1", 6, 1)
-- TODO: add internal windows corresponding to the external ones.

verbose("Screen \""..screen.."\" loaded.")
