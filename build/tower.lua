#!/usr/bin/lua

local tileset, screen, x_shift, y_shift = ...

local entrance_x, entrance_y = loadfile("build/tools/building.lua")(tileset, screen, x_shift, y_shift, 5, 11, 4)

local hatch_x = x_shift+2
local hatch_y = y_shift+3
screen_settile(screen, hatch_x, hatch_y, tileset..":roof_rare_a") -- Hatch

local coffer_x = x_shift+2
local coffer_y = y_shift+1
screen_settile(screen, coffer_x, coffer_y, tileset..":coffer_common_close")
screen_settag(screen, coffer_x, coffer_y, "openclose_state", "close")
screen_settag(screen, coffer_x, coffer_y, "openclose_opentile", tileset..":coffer_common_open")
screen_settag(screen, coffer_x, coffer_y, "openclose_closetile", tileset..":coffer_common_close")
screen_settag(screen, coffer_x, coffer_y, "content", "Ziggurat's Key")

-- Floor 0
local floor0 = "tower_0"
loadfile("build/tools/interior.lua")(tileset, floor0, "Tower", 9, 10)
loadfile("build/tools/doorway.lua")(tileset, floor0, 4, 9)
loadfile("build/tools/link.lua")(screen, entrance_x, entrance_y, floor0, 4, 9)

-- Floor 1
local floor1 = "tower_1"
loadfile("build/tools/interior.lua")(tileset, floor1, "Tower", 9, 10)
loadfile("build/tools/door.lua")(tileset, floor0, 4, 1)
loadfile("build/tools/door.lua")(tileset, floor1, 4, 1)
loadfile("build/tools/link.lua")(floor0, 4, 1, floor1, 4, 1)

-- Floor 2
local floor2 = "tower_2"
loadfile("build/tools/interior.lua")(tileset, floor2, "Tower", 9, 10)
loadfile("build/tools/doorway.lua")(tileset, floor1, 4, 9)
loadfile("build/tools/doorway.lua")(tileset, floor2, 4, 9)
loadfile("build/tools/link.lua")(floor1, 4, 9, floor2, 4, 9)

-- Way to hatch
screen_settile(floor2, 4, 6, tileset..":mosaic_a")
loadfile("build/tools/link.lua")(floor2, 4, 6, screen, hatch_x, hatch_y)

-- loadfile("build/tools/link.lua")(screen, entrance_x, entrance_y, screen, hatch_x, hatch_y) -- XXX

verbose("[WORLDGEN] Tower built in "..screen..".")
