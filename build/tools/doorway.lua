#!/usr/bin/lua

-- - - - - - - - - --
-- Build entrance. --
-- - - - - - - - - --

-- Get arguments.
local tileset, zone, x, y = ...

-- Build entrance around X and Y.
zone_settile(zone, x-1, y-1, tileset..":wall_rgt")
zone_settile(zone, x,   y-1, tileset..":path")
zone_settile(zone, x+1, y-1, tileset..":wall_lft")
zone_settile(zone, x-1, y,   tileset..":wall_botrgt")
zone_settile(zone, x,   y,   tileset..":mosaic_a")
zone_settile(zone, x+1, y,   tileset..":wall_botlft")
