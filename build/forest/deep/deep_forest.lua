#!/usr/bin/lua

info("[WORLDGEN] Deep Forest")

-- local tileset = "forest"
local tileset = "forest_corrupted" -- XXX

loadfile("build/forest/deep/south.lua")(tileset)
loadfile("build/forest/deep/southwest.lua")(tileset)
