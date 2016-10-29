#!/usr/bin/lua

row = 0

dofile("load_tiles_base.lua")

loadfile("load_tileset_standard.lua")("bluesunken")
loadfile("load_tileset_standard.lua")("redruins")
loadfile("load_tileset_standard.lua")("violetcastle")
loadfile("load_tileset_standard.lua")("volcano")

verbose("Tiles loaded.")
