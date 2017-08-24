#!/usr/bin/lua

local screen, x, y = ...

local effect = function()
	local tileset, tile = string.match(screen_gettile(screen, x, y), "(.*):(.*)")

	if tile == "slab_passable" then -- The door is open: close it.
		screen_settile(screen, x, y,   tileset..":pillar_bot")
		screen_settile(screen, x, y-1, tileset..":slab")
	else -- The door is closed: open it.
		screen_settile(screen, x, y,   tileset..":slab_passable")
		screen_settile(screen, x, y-1, tileset..":path_vertical")
	end
end

local gauge = "mana"
local cost = 1

if gauge_getval(Player, gauge) < cost then
	player_message(Player, "You don't have enough "..gauge..".")
else
	gauge_decrease(Player, gauge, cost)
	effect()
end
