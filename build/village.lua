#!/usr/bin/lua

local screen = "village"
local tileset = "redruins"

new_screen(screen, "Village", 30, 30, tileset..":path")

screen_settile(screen, 5, 5, tileset..":mosaic_a")

local x,y

-- Build ziggurat with crystal.
x,y = loadfile("build/ziggurat.lua")(tileset, screen, 10, 2)
loadfile("build/interior.lua")(tileset, "ziggurat_1", "Ziggurat", 9, 10, screen, x, y)
loadfile("build/crystal.lua")(tileset, "ziggurat_1", 4, 5)
screen_settile("ziggurat_1", 3, 1, tileset..":wall_bot_written")
screen_settag("ziggurat_1", 3, 1, "text", "To change the color of the crystal, set the floor tiles to the same color.")
screen_settile(screen, x, y, tileset..":bigdoor_closed")

-- Build empty ziggurat.
x,y = loadfile("build/ziggurat.lua")(tileset, screen, 21, 5)
loadfile("build/interior.lua")(tileset, "ziggurat_2", "Ziggurat", 9, 10, screen, x, y)

-- Build library.
x,y = loadfile("build/building.lua")(tileset, screen, 7, 14)
loadfile("build/interior.lua")(tileset, "library", "Library", 13, 10, screen, x, y)

verbose("Screen \""..screen.."\" loaded.")
