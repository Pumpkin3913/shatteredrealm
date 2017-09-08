#!/usr/bin/lua

dofile("build/demon/castle/castle.lua")
dofile("build/demon/lavacave/cave_hub.lua")

place_setaspect("climbtower_floor_-1", 4, 7, "volcano:stairs_down")
place_setaspect("cave_hub", 14, 4, "redruins:stairs_up")
loadfile("build/tools/link.lua")("climbtower_floor_-1", 4, 7, "cave_hub", 14, 4)
