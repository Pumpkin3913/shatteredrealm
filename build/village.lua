#!/usr/bin/lua

local screen = "village"
local tileset = "redruins"

new_screen(screen, "Village", 30, 30, tileset..":path")

screen_settile(screen, 5, 5, tileset..":mosaic_a")

loadfile("build/ziggurat.lua")(tileset, screen, 10, 2)
loadfile("build/ziggurat.lua")(tileset, screen, 21, 5)

verbose("Screen \""..screen.."\" loaded.")
