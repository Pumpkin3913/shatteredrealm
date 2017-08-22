#!/usr/bin/lua

setverbose()
verbose("Lua Init...")

dofile("load_tiles.lua")
dofile("load_player_actions.lua")
-- dofile("build/village.lua")
dofile("build/castle.lua")

open(31337)
verbose("Lua Init OK.")

