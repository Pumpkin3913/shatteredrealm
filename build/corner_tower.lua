#!/usr/bin/lua

local tileset, screen, x_shift, y_shift, id = ...

loadfile("build/tools/building.lua")(tileset, screen, x_shift, y_shift, 5, 9, 4)

local hatch_x = x_shift+2
local hatch_y = y_shift+2
screen_settile(screen, hatch_x, hatch_y, tileset..":roof_rare_a") -- Hatch

-- Floor 1
local floor1 = id.."_floor_1"
loadfile("build/tools/interior.lua")(tileset, floor1, "Tower", 9, 10)

-- Way to hatch
screen_settile(floor1, 4, 4, tileset..":mosaic_a")
loadfile("build/tools/link.lua")(floor1, 4, 4, screen, hatch_x, hatch_y)

-- South door.
loadfile("build/tools/doorway.lua")(tileset, floor1, 4, 9)
loadfile("build/tools/door.lua")(tileset, screen, x_shift+2, y_shift+6)
loadfile("build/tools/link.lua")(floor1, 4, 9, screen, x_shift+2, y_shift+6)

verbose("[WORLDGEN] Tower built in "..screen..".")
