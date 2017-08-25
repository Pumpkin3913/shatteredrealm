#!/usr/bin/lua

-- - - - - - - - - --
-- Build big door. --
-- - - - - - - - - --

-- Get arguments.
local tileset, zone, x, y = ...

-- Build door around X and Y.
zone_settile(zone, x-1, y-1, tileset..":bigdoor_toplft")
zone_settile(zone, x,   y-1, tileset..":bigdoor_top")
zone_settile(zone, x+1, y-1, tileset..":bigdoor_toprgt")
zone_settile(zone, x-1, y,   tileset..":bigdoor_lft")
zone_settile(zone, x,   y,   tileset..":bigdoor")
zone_settile(zone, x+1, y,   tileset..":bigdoor_rgt")

-- -- Give open/close tags.
-- zone_settag(zone, x, y, "openclose_state", "open")
-- zone_settag(zone, x, y, "openclose_opentile", tileset..":bigdoor")
-- zone_settag(zone, x, y, "openclose_closetile", tileset..":bigdoor_closed")
