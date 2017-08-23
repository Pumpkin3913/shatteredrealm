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

-- DM commands
add_script("save", "actions/save.lua")
add_script("load", "actions/load.lua")
add_script("set", "actions/settile.lua")
add_script("tp", "actions/tp.lua")

verbose("Player actions loaded.")
