#!/usr/bin/lua

local tileset, zone, x, y = ...

place_setaspect(zone, x-1, y-1, tileset..":wall")
place_setaspect(zone, x,   y-1, tileset..":wall")
place_setaspect(zone, x+1, y-1, tileset..":wall")
place_setaspect(zone, x-1, y,   tileset..":wall_bot")
place_setaspect(zone, x,   y,   tileset..":wall_bot")
place_setaspect(zone, x+1, y,   tileset..":wall_bot")

place_deltag(zone, x, y, "openclose_state")
place_deltag(zone, x, y, "openclose_opentile")
place_deltag(zone, x, y, "openclose_closetile")
place_deltag(zone, x, y, "openclose_closetrigger")
place_resetlandon(zone, x, y)
