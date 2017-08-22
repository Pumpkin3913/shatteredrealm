#!/usr/bin/lua

local screen = "village"
local tileset = "redruins"

new_screen(screen, "Village", 30, 30, tileset..":soil_c")

screen_settile(screen, 5, 5, tileset..":mosaic_a")

loadfile("build/ziggurat_crystal.lua")(tileset, screen, 10, 2)
loadfile("build/library.lua")(tileset, screen, 3, 12)
loadfile("build/tower.lua")(tileset, screen, 20, 1)
loadfile("build/chalk_coffer.lua")(tileset, screen, 5, 2)

verbose("[WORLDGEN] Village finished.")
