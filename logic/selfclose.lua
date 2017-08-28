#!/usr/bin/lua

local zone, x, y = ...

-- Close
local tile = place_gettag(zone, x, y, "openclose_closetile")
place_setaspect(zone, x, y, tile)
place_settag(zone, x, y, "openclose_state", "close")

-- Clean selfclose timer.
place_deltag(zone, x, y, "openclose_selfclose_timer")
