#!/usr/bin/lua

local screen = player_getscreen(Player)
local x = player_getx(Player)
local y = player_gety(Player)

-- Check mana.
local gauge = "mana"
local cost = 1
if gauge_getval(Player, gauge) < cost then
	player_message(Player, "You don't have enough "..gauge..".")
	return
end

-- Check place.
local tag = screen_gettag(screen, x, y, "sesame")
if not tag or tag == "" then
	player_message(Player, "The spell has no effect here.")
	return
end

-- Spend mana.
gauge_decrease(Player, gauge, cost)

-- Do the effect.
screen, x, y = string.match(tag, "(.*)/(.*)-(.*)")
local tileset, tile = string.match(screen_gettile(screen, x, y), "(.*):(.*)")

if tile == "slab_passable" then -- The door is open: close it.
	screen_settile(screen, x, y,   tileset..":pillar_bot")
	screen_settile(screen, x, y-1, tileset..":slab")
else -- The door is closed: open it.
	screen_settile(screen, x, y,   tileset..":slab_passable")
	screen_settile(screen, x, y-1, tileset..":path_vertical")
end
