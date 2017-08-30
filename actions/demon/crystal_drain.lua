#!/usr/bin/lua

local zone = player_getzone(Player)
local x = player_getx(Player)
local y = player_gety(Player)

-- Check if Player is a daemon.
if player_gettag(Player, "race") ~= "demon" then
	player_message(Player, "You are not a daemon.")
	return
end

local fun = function (x, y)
	local tileset, n = string.match(place_getaspect(zone, x, y), "(.*):crystal_(.*)")
	if not tileset then
		return false
	end
	n = tonumber(n)
	if n <= 2 then
		player_message(Player, "This crystal isn't charged. There is no power to drain.")
	elseif n <= 5 then
		player_message(Player, "This crystal isn't charged enough. It must be charged further.")
	elseif n >= 6 then
		loadfile("logic/puzzle_mosaic_reset.lua")(zone, x, y)
		local max = gauge_getmax(Player, "mana")
		if n == 7 and player_gettag(Player, "has_drained_crystal") ~= "true" then
			player_message(Player, "You feel your magical power increases!")
			max = max+1
			gauge_setmax(Player, "mana", max)
			player_settag(Player, "has_drained_crystal", "true")
		else
			player_message(Player, "You feel your magical power renewed.")
		end
		gauge_setval(Player, "mana", max)

		if n == 6 then
			n = 2
		elseif n == 7 then
			n = 1
		end
		place_setaspect(zone, x, y, tileset..":crystal_"..n)
	end
	return true
end

if not fun(x, y)
and not fun(x, y-1)
and not fun(x, y+1)
and not fun(x-1, y)
and not fun(x+1, y)
then
	player_message(Player, "There is no crystal to drain here.")
end
