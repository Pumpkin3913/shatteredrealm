#!/usr/bin/lua

add_action("nom", "dofile(\"actions/name.lua\")")
add_action("lire", "dofile(\"actions/read.lua\")")
add_action("écrire", "dofile(\"actions/write.lua\")")
add_action("effacer", "dofile(\"actions/clear.lua\")")

add_action("ouvrir", "dofile(\"actions/open.lua\")")
add_action("fermer", "dofile(\"actions/close.lua\")")
add_action("verrouiller", "dofile(\"actions/lock.lua\")")

add_action("fouiller", "dofile(\"actions/search.lua\")")

add_action("incanter", "dofile(\"actions/cast.lua\")")

-- Demon commands.
add_action("drainer", "dofile(\"actions/demon/crystal_drain.lua\")")

-- Debug commands.
add_action("save", "dofile(\"actions/debug/save.lua\")")
add_action("load", "dofile(\"actions/debug/load.lua\")")
add_action("set", "dofile(\"actions/debug/settile.lua\")")
add_action("tp", "dofile(\"actions/debug/tp.lua\")")
add_action("polymorph", "dofile(\"actions/debug/polymorph.lua\")")
add_action("whereami", "dofile(\"actions/debug/whereami.lua\")")

info("Player actions loaded.")
