#!/usr/bin/lua

-- - - - - - - - - --
-- Build entrance. --
-- - - - - - - - - --

-- Get arguments.
local tileset, screen, x, y = ...

-- Build entrance around X and Y.
screen_settile(screen, x-1, y-1, tileset..":wall_rgt")
screen_settile(screen, x,   y-1, tileset..":path")
screen_settile(screen, x+1, y-1, tileset..":wall_lft")
screen_settile(screen, x-1, y,   tileset..":wall_botrgt")
screen_settile(screen, x,   y,   tileset..":mosaic_a")
screen_settile(screen, x+1, y,   tileset..":wall_botlft")
