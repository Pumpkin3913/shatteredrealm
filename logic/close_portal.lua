#!/usr/bin/lua

local tileset, zone, x, y = ...

zone_settile(zone, x-1, y-1, tileset..":wall")
zone_settile(zone, x,   y-1, tileset..":wall")
zone_settile(zone, x+1, y-1, tileset..":wall")
zone_settile(zone, x-1, y,   tileset..":wall_bot")
zone_settile(zone, x,   y,   tileset..":wall_bot")
zone_settile(zone, x+1, y,   tileset..":wall_bot")

zone_deltag(zone, x, y, "openclose_state")
zone_deltag(zone, x, y, "openclose_opentile")
zone_deltag(zone, x, y, "openclose_closetile")
zone_deltag(zone, x, y, "openclose_closetrigger")
zone_resetlandon(zone, x, y)
