#!/usr/bin/lua

-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - --
-- Builds a 7x7 ziggurat at designated point.  Return coordinates of entrance. --
-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - --

-- Get arguments.
local tileset, screen, x_shift, y_shift = ...

-- Build Extern Ziggurat.

--
--
screen_settile(screen, x_shift+2, y_shift+0, tileset..":roof_toplft")
screen_settile(screen, x_shift+3, y_shift+0, tileset..":roof_top")
screen_settile(screen, x_shift+4, y_shift+0, tileset..":roof_toprgt")
--
--

--
screen_settile(screen, x_shift+1, y_shift+1, tileset..":roof_toplft")
screen_settile(screen, x_shift+2, y_shift+1, tileset..":roof_botlft")
screen_settile(screen, x_shift+3, y_shift+1, tileset..":roof_bot")
screen_settile(screen, x_shift+4, y_shift+1, tileset..":roof_botrgt")
screen_settile(screen, x_shift+5, y_shift+1, tileset..":roof_toprgt")
--

screen_settile(screen, x_shift+0, y_shift+2, tileset..":roof_toplft")
screen_settile(screen, x_shift+1, y_shift+2, tileset..":roof_lft")
screen_settile(screen, x_shift+2, y_shift+2, tileset..":wall_botlft")
screen_settile(screen, x_shift+3, y_shift+2, tileset..":wall_bot")
screen_settile(screen, x_shift+4, y_shift+2, tileset..":wall_botrgt")
screen_settile(screen, x_shift+5, y_shift+2, tileset..":roof_rgt")
screen_settile(screen, x_shift+6, y_shift+2, tileset..":roof_toprgt")

screen_settile(screen, x_shift+0, y_shift+3, tileset..":roof_lft")
screen_settile(screen, x_shift+1, y_shift+3, tileset..":roof_botlft")
screen_settile(screen, x_shift+2, y_shift+3, tileset..":roof_bot")
screen_settile(screen, x_shift+3, y_shift+3, tileset..":roof_bot")
screen_settile(screen, x_shift+4, y_shift+3, tileset..":roof_bot")
screen_settile(screen, x_shift+5, y_shift+3, tileset..":roof_botrgt")
screen_settile(screen, x_shift+6, y_shift+3, tileset..":roof_rgt")

screen_settile(screen, x_shift+0, y_shift+4, tileset..":roof_lft")
screen_settile(screen, x_shift+1, y_shift+4, tileset..":wall_lft")
screen_settile(screen, x_shift+2, y_shift+4, tileset..":bigdoor_toplft")
screen_settile(screen, x_shift+3, y_shift+4, tileset..":bigdoor_top")
screen_settile(screen, x_shift+4, y_shift+4, tileset..":bigdoor_toprgt")
screen_settile(screen, x_shift+5, y_shift+4, tileset..":wall_rgt")
screen_settile(screen, x_shift+6, y_shift+4, tileset..":roof_rgt")

screen_settile(screen, x_shift+0, y_shift+5, tileset..":roof_botlft")
screen_settile(screen, x_shift+1, y_shift+5, tileset..":roof_botrgt")
screen_settile(screen, x_shift+2, y_shift+5, tileset..":bigdoor_lft")
screen_settile(screen, x_shift+3, y_shift+5, tileset..":bigdoor")
screen_settile(screen, x_shift+4, y_shift+5, tileset..":bigdoor_rgt")
screen_settile(screen, x_shift+5, y_shift+5, tileset..":roof_botlft")
screen_settile(screen, x_shift+6, y_shift+5, tileset..":roof_botrgt")

screen_settile(screen, x_shift+0, y_shift+6, tileset..":wall_botlft")
screen_settile(screen, x_shift+1, y_shift+6, tileset..":wall_botrgt")
--
--
--
screen_settile(screen, x_shift+5, y_shift+6, tileset..":wall_botlft")
screen_settile(screen, x_shift+6, y_shift+6, tileset..":wall_botrgt")

-- -- Add open/close tags for entrance.
-- local door_x = x_shift + 3
-- local door_y = y_shift + 5
-- screen_settag(screen, door_x, door_y, "openclose_state", "open")
-- screen_settag(screen, door_x, door_y, "openclose_opentile", tileset..":bigdoor")
-- screen_settag(screen, door_x, door_y, "openclose_closetile", tileset..":bigdoor_closed")

-- Finish.
return x_shift+3, y_shift+5
