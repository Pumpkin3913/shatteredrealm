#!/usr/bin/lua

add_script("name", "actions/name.lua")
add_script("read", "actions/read.lua")

-- DM commands
add_script("save", "actions/save.lua")
add_script("load", "actions/load.lua")
add_script("set", "actions/settile.lua")

verbose("Player actions loaded.")
