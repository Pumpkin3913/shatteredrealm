#!/usr/bin/lua

local tileset, screen, x_shift, y_shift = ...
local w = 11
local h = 12
local mid = math.floor(w/2)
local book_y = h-5

loadfile("build/tools/graveyard.lua")(tileset, screen, x_shift, y_shift, w, h)

-- Add sealed entrance.
screen_settile(screen, x_shift+mid-1, y_shift,   tileset..":roof_endrgt")
screen_settile(screen, x_shift+mid,   y_shift,   tileset..":slab")
screen_settile(screen, x_shift+mid+1, y_shift,   tileset..":roof_endlft")
screen_settile(screen, x_shift+mid-1, y_shift+1, tileset..":wall_botrgt")
screen_settile(screen, x_shift+mid,   y_shift+1, tileset..":pillar_bot")
screen_settile(screen, x_shift+mid+1, y_shift+1, tileset..":wall_botlft")

-- Add Sesame spell's tags.
local target = screen.."/"..x_shift+mid.."-"..y_shift+1
screen_settag(screen, x_shift+mid, y_shift-1, "sesame", target)
screen_settag(screen, x_shift+mid, y_shift,   "sesame", target)
screen_settag(screen, x_shift+mid, y_shift+2, "sesame", target)

-- Add book and path.

for y=2,book_y-2 do
	screen_settile(screen, mid+x_shift, y+y_shift, tileset..":path_vertical")
end
local x = mid+x_shift
local y = book_y+y_shift

screen_settile(screen, x-1, y-1, tileset..":path_toplft")
screen_settile(screen, x,   y-1, tileset..":path")
screen_settile(screen, x+1, y-1, tileset..":path_toprgt")

screen_settile(screen, x-1, y,   tileset..":path_lft")
screen_settile(screen, x,   y,   tileset..":book_b_open")
screen_settile(screen, x+1, y,   tileset..":path_rgt")

screen_settile(screen, x-1, y+1, tileset..":path_botlft")
screen_settile(screen, x,   y+1, tileset..":path_bot")
screen_settile(screen, x+1, y+1, tileset..":path_botrgt")

screen_settile(screen, x, y, tileset..":book_b_open")
screen_settag(screen, x, y, "openclose_state", "open")
screen_settag(screen, x, y, "openclose_opentile", tileset..":book_b_open")
screen_settag(screen, x, y, "openclose_closetile", tileset..":book_b_close")
screen_settag(screen, x, y, "text", "Ashflame Range")

-- Finish
verbose("[WORLDGEN] Graveyard build in "..screen..".");
