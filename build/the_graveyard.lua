#!/usr/bin/lua

local tileset, zone, x_shift, y_shift = ...
local w = 11
local h = 12
local mid = math.floor(w/2)
local book_y = h-5

loadfile("build/tools/graveyard.lua")(tileset, zone, x_shift, y_shift, w, h)

-- Add sealed entrance.
zone_settile(zone, x_shift+mid-1, y_shift,   tileset..":roof_endrgt")
zone_settile(zone, x_shift+mid,   y_shift,   tileset..":slab")
zone_settile(zone, x_shift+mid+1, y_shift,   tileset..":roof_endlft")
zone_settile(zone, x_shift+mid-1, y_shift+1, tileset..":wall_botrgt")
zone_settile(zone, x_shift+mid,   y_shift+1, tileset..":pillar_bot")
zone_settile(zone, x_shift+mid+1, y_shift+1, tileset..":wall_botlft")

-- Add Sesame spell's tags.
local target = zone.."/"..x_shift+mid.."-"..y_shift+1
zone_settag(zone, x_shift+mid, y_shift-1, "sesame", target)
zone_settag(zone, x_shift+mid, y_shift,   "sesame", target)
zone_settag(zone, x_shift+mid, y_shift+2, "sesame", target)

-- Add book and path.

for y=2,book_y-2 do
	zone_settile(zone, mid+x_shift, y+y_shift, tileset..":path_vertical")
end
local x = mid+x_shift
local y = book_y+y_shift

zone_settile(zone, x-1, y-1, tileset..":path_toplft")
zone_settile(zone, x,   y-1, tileset..":path")
zone_settile(zone, x+1, y-1, tileset..":path_toprgt")

zone_settile(zone, x-1, y,   tileset..":path_lft")
zone_settile(zone, x,   y,   tileset..":book_b_open")
zone_settile(zone, x+1, y,   tileset..":path_rgt")

zone_settile(zone, x-1, y+1, tileset..":path_botlft")
zone_settile(zone, x,   y+1, tileset..":path_bot")
zone_settile(zone, x+1, y+1, tileset..":path_botrgt")

zone_settile(zone, x, y, tileset..":book_b_open")
zone_settag(zone, x, y, "openclose_state", "open")
zone_settag(zone, x, y, "openclose_opentile", tileset..":book_b_open")
zone_settag(zone, x, y, "openclose_closetile", tileset..":book_b_close")
zone_settag(zone, x, y, "text", "Ashflame Range")

-- Finish
verbose("[WORLDGEN] Graveyard build in "..zone..".");
