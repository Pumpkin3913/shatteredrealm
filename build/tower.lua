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

loadfile("build/tools/link.lua")(screen, entrance_x, entrance_y, screen, hatch_x, hatch_y)

verbose("[WORLDGEN] Tower built in "..screen..".")
