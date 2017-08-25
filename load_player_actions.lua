#!/usr/bin/lua

add_script("name", "actions/name.lua")
add_script("read", "actions/read.lua")
add_script("write", "actions/write.lua")
add_script("clear", "actions/clear.lua")

add_script("open", "actions/open.lua")
add_script("close", "actions/close.lua")
add_script("lock", "actions/lock.lua")

add_script("search", "actions/search.lua")

add_script("cast", "actions/cast.lua")

-- Demon commands.
add_script("drain", "actions/demon/crystal_drain.lua")

-- Debug commands.
add_script("save", "actions/debug/save.lua")
add_script("load", "actions/debug/load.lua")
add_script("set", "actions/debug/settile.lua")
add_script("tp", "actions/debug/tp.lua")

verbose("Player actions loaded.")
