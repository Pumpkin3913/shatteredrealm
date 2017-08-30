#!/usr/bin/lua
local tileset, zone, x, y, state, version = ...
if not state then state = "open" end
if not version then version = "a" end

place_setaspect(zone, x, y, tileset..":book_"..version.."_"..state)
place_settag (zone, x, y, "openclose_state", state)
place_settag (zone, x, y, "openclose_opentile", tileset..":book_"..version.."_open")
place_settag (zone, x, y, "openclose_closetile", tileset..":book_"..version.."_close")
