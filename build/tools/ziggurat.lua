#!/usr/bin/lua

-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - --
-- Builds a 7x7 ziggurat at designated point.  Return coordinates of entrance. --
-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - --

-- Get arguments.
local tileset, zone, x_shift, y_shift = ...

-- Build Extern Ziggurat.

--
--
zone_settile(zone, x_shift+2, y_shift+0, tileset..":roof_toplft")
zone_settile(zone, x_shift+3, y_shift+0, tileset..":roof_top")
zone_settile(zone, x_shift+4, y_shift+0, tileset..":roof_toprgt")
--
--

--
zone_settile(zone, x_shift+1, y_shift+1, tileset..":roof_toplft")
zone_settile(zone, x_shift+2, y_shift+1, tileset..":roof_botlft")
zone_settile(zone, x_shift+3, y_shift+1, tileset..":roof_bot")
zone_settile(zone, x_shift+4, y_shift+1, tileset..":roof_botrgt")
zone_settile(zone, x_shift+5, y_shift+1, tileset..":roof_toprgt")
--

zone_settile(zone, x_shift+0, y_shift+2, tileset..":roof_toplft")
zone_settile(zone, x_shift+1, y_shift+2, tileset..":roof_lft")
zone_settile(zone, x_shift+2, y_shift+2, tileset..":wall_botlft")
zone_settile(zone, x_shift+3, y_shift+2, tileset..":wall_bot")
zone_settile(zone, x_shift+4, y_shift+2, tileset..":wall_botrgt")
zone_settile(zone, x_shift+5, y_shift+2, tileset..":roof_rgt")
zone_settile(zone, x_shift+6, y_shift+2, tileset..":roof_toprgt")

zone_settile(zone, x_shift+0, y_shift+3, tileset..":roof_lft")
zone_settile(zone, x_shift+1, y_shift+3, tileset..":roof_botlft")
zone_settile(zone, x_shift+2, y_shift+3, tileset..":roof_bot")
zone_settile(zone, x_shift+3, y_shift+3, tileset..":roof_bot")
zone_settile(zone, x_shift+4, y_shift+3, tileset..":roof_bot")
zone_settile(zone, x_shift+5, y_shift+3, tileset..":roof_botrgt")
zone_settile(zone, x_shift+6, y_shift+3, tileset..":roof_rgt")

zone_settile(zone, x_shift+0, y_shift+4, tileset..":roof_lft")
zone_settile(zone, x_shift+1, y_shift+4, tileset..":wall_lft")
zone_settile(zone, x_shift+2, y_shift+4, tileset..":bigdoor_toplft")
zone_settile(zone, x_shift+3, y_shift+4, tileset..":bigdoor_top")
zone_settile(zone, x_shift+4, y_shift+4, tileset..":bigdoor_toprgt")
zone_settile(zone, x_shift+5, y_shift+4, tileset..":wall_rgt")
zone_settile(zone, x_shift+6, y_shift+4, tileset..":roof_rgt")

zone_settile(zone, x_shift+0, y_shift+5, tileset..":roof_botlft")
zone_settile(zone, x_shift+1, y_shift+5, tileset..":roof_botrgt")
zone_settile(zone, x_shift+2, y_shift+5, tileset..":bigdoor_lft")
zone_settile(zone, x_shift+3, y_shift+5, tileset..":bigdoor")
zone_settile(zone, x_shift+4, y_shift+5, tileset..":bigdoor_rgt")
zone_settile(zone, x_shift+5, y_shift+5, tileset..":roof_botlft")
zone_settile(zone, x_shift+6, y_shift+5, tileset..":roof_botrgt")

zone_settile(zone, x_shift+0, y_shift+6, tileset..":wall_botlft")
zone_settile(zone, x_shift+1, y_shift+6, tileset..":wall_botrgt")
--
--
--
zone_settile(zone, x_shift+5, y_shift+6, tileset..":wall_botlft")
zone_settile(zone, x_shift+6, y_shift+6, tileset..":wall_botrgt")

-- -- Add open/close tags for entrance.
-- local door_x = x_shift + 3
-- local door_y = y_shift + 5
-- zone_settag(zone, door_x, door_y, "openclose_state", "open")
-- zone_settag(zone, door_x, door_y, "openclose_opentile", tileset..":bigdoor")
-- zone_settag(zone, door_x, door_y, "openclose_closetile", tileset..":bigdoor_closed")

-- Finish.
return x_shift+3, y_shift+5
