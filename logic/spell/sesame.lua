#!/usr/bin/lua

local zone = player_getzone(Player)
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
local tag = place_gettag(zone, x, y, "sesame")
if not tag or tag == "" then
	player_message(Player, "The spell has no effect here.")
	return
end

-- Spend mana.
gauge_decrease(Player, gauge, cost)

-- Do the effect.
zone, x, y = string.match(tag, "(.*)/(.*)-(.*)")
local tileset, tile = string.match(place_getaspect(zone, x, y), "(.*):(.*)")

if tile == "slab_passable" then -- The door is open: close it.
	place_setaspect(zone, x, y,   tileset..":pillar_bot")
	place_setaspect(zone, x, y-1, tileset..":slab")
else -- The door is closed: open it.
	place_setaspect(zone, x, y,   tileset..":slab_passable")
	place_setaspect(zone, x, y-1, tileset..":path_vertical")
end
