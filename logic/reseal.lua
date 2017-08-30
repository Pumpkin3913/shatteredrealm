#!/usr/bin/lua

local zone, x, y = ...
local tileset = string.match(place_getaspect(zone, x, y), "(.*):.*")

place_setaspect(zone, x-1, y-1, tileset..":wall")
place_setaspect(zone, x,   y-1, tileset..":wall")
place_setaspect(zone, x+1, y-1, tileset..":wall")
place_setaspect(zone, x-1, y,   tileset..":wall_bot")
place_setaspect(zone, x,   y,   tileset..":wall_bot_written")
place_setaspect(zone, x+1, y,   tileset..":wall_bot")
place_settag(zone, x, y, "text", "Sceau")
place_settag(zone, x, y, "text_type", "chalk")
