#!/usr/bin/lua

-- - - - - - - - - --
-- Build entrance. --
-- - - - - - - - - --

-- Get arguments.
local tileset, zone, x, y = ...

-- Build entrance around X and Y.
place_setaspect(zone, x-1, y-1, tileset..":wall_rgt")
place_setaspect(zone, x,   y-1, tileset..":path")
place_setaspect(zone, x+1, y-1, tileset..":wall_lft")
place_setaspect(zone, x-1, y,   tileset..":wall_botrgt")
place_setaspect(zone, x,   y,   tileset..":mosaic_a")
place_setaspect(zone, x+1, y,   tileset..":wall_botlft")
