#!/usr/bin/lua

local zone = player_getzone(Player)
local x = player_getx(Player)
local y = player_gety(Player)

-- Check if Player is a daemon.
if player_gettag(Player, "race") ~= "demon" then
	player_message(Player, "Tu n'es pas un démon.")
	return
end

local fun = function (x, y)
	local tileset, n = string.match(place_getaspect(zone, x, y), "(.*):crystal_(.*)")
	if not tileset then
		return false
	end
	n = tonumber(n)
	if n <= 2 then
		player_message(Player, "Ce cristal n'est pas chargé. Il n'y a pas de pouvoir à /drainer.")
	elseif n <= 5 then
		player_message(Player, "Ce cristal n'est pas assez chargé. Il doit encore être chargé.")
	elseif n >= 6 then
		loadfile("logic/puzzle_mosaic_reset.lua")(zone, x, y)
		local max = gauge_getmax(Player, "mana")
		if n == 7 and player_gettag(Player, "has_drained_crystal") ~= "true" then
			player_message(Player, "Tu sens tes pouvoirs magiques augmenter !")
			max = max+1
			gauge_setmax(Player, "mana", max)
			player_settag(Player, "has_drained_crystal", "true")
		else
			player_message(Player, "Tu sens tes pouvoirs magiques renouvellés.")
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
	player_message(Player, "Il n'y a pas de cristal à /drainer.")
end
