#!/usr/bin/lua

local tileset, zone, x_shift, y_shift, id = ...

local entrance_x, entrance_y = loadfile("build/tools/building.lua")(tileset, zone, x_shift, y_shift, 5, 9, 4)

local hatch_x = x_shift+2
local hatch_y = y_shift+2
place_setaspect(zone, hatch_x, hatch_y, tileset..":roof_rare_a") -- Hatch

-- Floor 0
local floor0 = id.."_floor_0"
loadfile("build/tools/interior.lua")(tileset, floor0, "Tower", 9, 10)
loadfile("build/tools/doorway.lua")(tileset, floor0, 4, 9)
loadfile("build/tools/link.lua")(zone, entrance_x, entrance_y, floor0, 4, 9)

-- Floor 1
local floor1 = id.."_floor_1"
loadfile("build/tools/interior.lua")(tileset, floor1, "Tower", 9, 10)
loadfile("build/tools/door.lua")(tileset, floor0, 4, 1)
loadfile("build/tools/door.lua")(tileset, floor1, 4, 1)
loadfile("build/tools/link.lua")(floor0, 4, 1, floor1, 4, 1)

-- Way to hatch
place_setaspect(floor1, 4, 4, tileset..":mosaic_a")
loadfile("build/tools/link.lua")(floor1, 4, 4, zone, hatch_x, hatch_y)

info("[WORLDGEN] Tower built in "..zone..".")
