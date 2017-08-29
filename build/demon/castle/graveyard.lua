#!/usr/bin/lua

info("[WORLDGEN] [Demon Castle] Graveyard")

local tileset, zone, x_shift, y_shift = ...
local w = 11
local h = 12
local mid = math.floor(w/2)
local book_y = h-5

loadfile("build/tools/graveyard.lua")(tileset, zone, x_shift, y_shift, w, h)

-- Add sealed entrance.
place_setaspect(zone, x_shift+mid-1, y_shift,   tileset..":roof_endrgt")
place_setaspect(zone, x_shift+mid,   y_shift,   tileset..":slab")
place_setaspect(zone, x_shift+mid+1, y_shift,   tileset..":roof_endlft")
place_setaspect(zone, x_shift+mid-1, y_shift+1, tileset..":wall_botrgt")
place_setaspect(zone, x_shift+mid,   y_shift+1, tileset..":pillar_bot")
place_setaspect(zone, x_shift+mid+1, y_shift+1, tileset..":wall_botlft")

-- Add Sesame spell's tags.
local target = zone.."/"..x_shift+mid.."-"..y_shift+1
place_settag(zone, x_shift+mid, y_shift-1, "sesame", target)
place_settag(zone, x_shift+mid, y_shift,   "sesame", target)
place_settag(zone, x_shift+mid, y_shift+2, "sesame", target)
place_setaspect(zone, x_shift+mid-2, y_shift+1, tileset..":wall_bot_written")
place_settag   (zone, x_shift+mid-2, y_shift+1, "text", "Help! The door closed itself and I have no mana left!")

-- Add book and path.

for y=2,book_y-2 do
	place_setaspect(zone, mid+x_shift, y+y_shift, tileset..":path_vertical")
end
local x = mid+x_shift
local y = book_y+y_shift

place_setaspect(zone, x-1, y-1, tileset..":path_toplft")
place_setaspect(zone, x,   y-1, tileset..":path")
place_setaspect(zone, x+1, y-1, tileset..":path_toprgt")

place_setaspect(zone, x-1, y,   tileset..":path_lft")
place_setaspect(zone, x,   y,   tileset..":book_b_open")
place_setaspect(zone, x+1, y,   tileset..":path_rgt")

place_setaspect(zone, x-1, y+1, tileset..":path_botlft")
place_setaspect(zone, x,   y+1, tileset..":path_bot")
place_setaspect(zone, x+1, y+1, tileset..":path_botrgt")

place_setaspect(zone, x, y, tileset..":book_b_open")
place_settag(zone, x, y, "openclose_state", "open")
place_settag(zone, x, y, "openclose_opentile", tileset..":book_b_open")
place_settag(zone, x, y, "openclose_closetile", tileset..":book_b_close")
place_settag(zone, x, y, "text", "Ashflame Range")
