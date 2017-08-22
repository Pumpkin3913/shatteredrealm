#!/usr/bin/lua

local tileset, screen, x, y = ...

local script = "loadfile(\"logic/switch_bw_crystal.lua\")(\""..screen.."\", "..x..", "..y..")"

-- Add crystal, mosaic and mechanism.
screen_settile(screen, x, y, tileset..":crystal_2")

screen_settile(screen, x-2, y, tileset..":mosaic_black")
screen_settag(screen, x, y, "controlling_mosaic_1", screen.."/"..x-2 .."-"..y)
screen_setlandon(screen, x-2, y, script)

screen_settile(screen, x, y-2, tileset..":mosaic_black")
screen_settag(screen, x, y, "controlling_mosaic_2", screen.."/"..x.."-"..y-2)
screen_setlandon(screen, x, y-2, script)

screen_settile(screen, x+2, y, tileset..":mosaic_black")
screen_settag(screen, x, y, "controlling_mosaic_3", screen.."/"..x+2 .."-"..y)
screen_setlandon(screen, x+2, y, script)
