#!/usr/bin/lua

local tileset, zone, x_shift, y_shift, id = ...
local name = "Tour"

local entrance_x, entrance_y = loadfile("build/tools/building.lua")(tileset, zone, x_shift, y_shift, 5, 9, 4)

-- Floor 0
local floor0 = id.."_floor_0"
loadfile("build/tools/interior.lua")(tileset, floor0, name, 9, 10)
loadfile("build/tools/door.lua")(tileset, floor0, 4, 9)
place_setaspect(floor0, 4, 9, tileset..":mosaic_a")
place_setaspect(floor0, 4, 9-1, tileset..":path")
loadfile("build/tools/link.lua")(zone, entrance_x, entrance_y, floor0, 4, 9)

-- Floor 1
local floor1 = id.."_floor_1"
loadfile("build/tools/interior.lua")(tileset, floor1, name, 9, 10)
place_setaspect(floor1, 2, 0, tileset..":wall_window")
place_setaspect(floor1, 6, 0, tileset..":wall_window")
place_setaspect(floor1, 2, 8, tileset..":wall_window")
place_setaspect(floor1, 6, 8, tileset..":wall_window")

place_setaspect(floor0, 4, 2, tileset..":stairs_up")
place_setaspect(floor1, 4, 2, tileset..":stairs_down")
loadfile("build/tools/link.lua")(floor0, 4, 2, floor1, 4, 2)

-- Way to hatch
place_setaspect(floor1, 4, 4, tileset..":stairs_up")
place_setaspect(zone, x_shift+2, y_shift+2, tileset..":hatch")
loadfile("build/tools/link.lua")(floor1, 4, 4, zone, x_shift+2, y_shift+2)
