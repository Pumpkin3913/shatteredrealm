#!/usr/bin/lua

setverbose()
info("Lua Init...")

dofile("load_tiles.lua")
dofile("load_player_actions.lua")
dofile("lobby/build_lobby.lua")
dofile("build/demon/castle/castle.lua")

open(31337)
info("Lua Init OK.")

