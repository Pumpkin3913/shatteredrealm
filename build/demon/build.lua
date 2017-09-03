#!/usr/bin/lua

dofile("build/demon/castle/castle.lua")
dofile("build/demon/lavacave/ritual_cave.lua")

place_setaspect("climbtower_floor_-1", 4, 7, "volcano:stairs_down")
place_setaspect("ritual_cave", 2, 0, "redruins:stairs_up")
loadfile("build/tools/link.lua")("climbtower_floor_-1", 4, 7, "ritual_cave", 2, 0)
