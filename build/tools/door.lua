#!/usr/bin/lua

-- - - - - - - - - --
-- Build big door. --
-- - - - - - - - - --

-- Get arguments.
local tileset, zone, x, y = ...

-- Build door around X and Y.
place_setaspect(zone, x-1, y-1, tileset..":bigdoor_toplft")
place_setaspect(zone, x,   y-1, tileset..":bigdoor_top")
place_setaspect(zone, x+1, y-1, tileset..":bigdoor_toprgt")
place_setaspect(zone, x-1, y,   tileset..":bigdoor_lft")
place_setaspect(zone, x,   y,   tileset..":bigdoor")
place_setaspect(zone, x+1, y,   tileset..":bigdoor_rgt")

-- -- Give open/close tags.
-- place_settag(zone, x, y, "openclose_state", "open")
-- place_settag(zone, x, y, "openclose_opentile", tileset..":bigdoor")
-- place_settag(zone, x, y, "openclose_closetile", tileset..":bigdoor_closed")
