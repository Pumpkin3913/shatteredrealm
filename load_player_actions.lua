#!/usr/bin/lua

add_action("name", "dofile(\"actions/name.lua\")")
add_action("read", "dofile(\"actions/read.lua\")")
add_action("write", "dofile(\"actions/write.lua\")")
add_action("clear", "dofile(\"actions/clear.lua\")")

add_action("open", "dofile(\"actions/open.lua\")")
add_action("close", "dofile(\"actions/close.lua\")")
add_action("lock", "dofile(\"actions/lock.lua\")")

add_action("search", "dofile(\"actions/search.lua\")")

add_action("cast", "dofile(\"actions/cast.lua\")")

-- Demon commands.
add_action("drain", "dofile(\"actions/demon/crystal_drain.lua\")")

-- Debug commands.
add_action("save", "dofile(\"actions/debug/save.lua\")")
add_action("load", "dofile(\"actions/debug/load.lua\")")
add_action("set", "dofile(\"actions/debug/settile.lua\")")
add_action("tp", "dofile(\"actions/debug/tp.lua\")")

verbose("Player actions loaded.")
