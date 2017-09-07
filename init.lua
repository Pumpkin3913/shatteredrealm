#!/usr/bin/lua

setverbose()
info("Lua Init...")

row = 0
dofile("load_tileset_base.lua")
loadfile("load_tileset_standard.lua")("redruins")
loadfile("load_tileset_standard.lua")("violetcastle")
loadfile("load_tileset_standard.lua")("volcano")
loadfile("load_tileset_standard.lua")("bluesunken")
loadfile("load_tileset_forest.lua")("forest")
loadfile("load_tileset_forest.lua")("forest_corrupted")
loadfile("load_tileset_forest.lua")("forest_underground")

dofile("register_player_actions.lua")
dofile("lobby/build_lobby.lua")
dofile("build/demon/build.lua")
dofile("build/forest/build.lua")

open(31337)
info("Lua Init OK.")

