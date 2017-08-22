#!/usr/bin/lua

local tileset, screen, x_shift, y_shift = ...

local x,y = loadfile("build/tools/building.lua")(tileset, screen, x_shift, y_shift, 5, 11)

verbose("[WORLDGEN] Tower built in "..screen..".")
