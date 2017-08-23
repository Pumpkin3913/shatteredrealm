#!/usr/bin/lua

local screen = "castle"
local tileset = "redruins"

-- Width: 5 towers (5 tiles wide each) and 4 walls (6 tiles long each) and one free tile on each side.
local w = 1+5*5+4*6+1
local h = 30 -- for now

new_screen(screen, "Castle", w, h, tileset..":soil_c")
screen_settile(screen, 25, 15, tileset..":mosaic_a") -- Spawn point.

loadfile("build/north_wall.lua")(tileset, screen)

loadfile("build/ziggurat_crystal.lua")(tileset, screen, 8, 15)
loadfile("build/library.lua")(tileset, screen, w-8-11, 15) -- 8 is offset from right, 11 is library's length.
loadfile("build/chalk_coffer.lua")(tileset, "lone_tower_1", 2, 3)
loadfile("build/the_graveyard.lua")(tileset, screen, 18, 18)

verbose("[WORLDGEN] Castle finished.")
