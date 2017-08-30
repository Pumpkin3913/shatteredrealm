#!/usr/bin/lua

local tileset, zone, x_shift, y_shift = ...
local name = "La Grande Tour"

local entrance_x, entrance_y = loadfile("build/tools/building.lua")(tileset, zone, x_shift, y_shift, 5, 11, 4)

-- Floor 0
local floor0 = "tall_tower_0"
loadfile("build/tools/interior.lua")(tileset, floor0, name, 9, 10)
loadfile("build/tools/door.lua")(tileset, floor0, 4, 9)
place_setaspect(floor0, 4, 9, tileset..":mosaic_a")
place_setaspect(floor0, 4, 9-1, tileset..":path")
loadfile("build/tools/link.lua")(zone, entrance_x, entrance_y, floor0, 4, 9)

-- Floor 1
local floor1 = "tall_tower_1"
loadfile("build/tools/interior.lua")(tileset, floor1, name, 9, 10)
loadfile("build/tools/door.lua")(tileset, floor0, 4, 1)
loadfile("build/tools/door.lua")(tileset, floor1, 4, 1)
loadfile("build/tools/link.lua")(floor0, 4, 1, floor1, 4, 1)
place_setaspect(floor1, 2, 0, tileset..":wall_window")
place_setaspect(floor1, 6, 0, tileset..":wall_window")
place_setaspect(floor1, 2, 8, tileset..":wall_window")
place_setaspect(floor1, 6, 8, tileset..":wall_window")

-- Floor 2
local floor2 = "tall_tower_2"
loadfile("build/tools/interior.lua")(tileset, floor2, name, 9, 10)
place_setaspect(floor1, 4, 9, tileset..":mosaic_a")
place_setaspect(floor1, 4, 9-1, tileset..":path")
place_setaspect(floor2, 4, 9, tileset..":mosaic_a")
place_setaspect(floor2, 4, 9-1, tileset..":path")
loadfile("build/tools/link.lua")(floor1, 4, 9, floor2, 4, 9)
place_setaspect(floor2, 2, 0, tileset..":wall_window")
place_setaspect(floor2, 6, 0, tileset..":wall_window")
place_setaspect(floor2, 2, 8, tileset..":wall_window")
place_setaspect(floor2, 6, 8, tileset..":wall_window")

-- Way to hatch
place_setaspect(floor2, 4, 6, tileset..":stairs_up")
place_setaspect(zone, x_shift+2, y_shift+3, tileset..":hatch")
loadfile("build/tools/link.lua")(floor2, 4, 6, zone, x_shift+2, y_shift+3)
