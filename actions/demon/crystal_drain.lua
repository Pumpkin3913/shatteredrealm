#!/usr/bin/lua

local zone = character_getzone(Character)
local x = character_getx(Character)
local y = character_gety(Character)

-- Check if Character is a daemon.
if character_gettag(Character, "race") ~= "demon" then
	character_message(Character, "Tu n'es pas un démon.")
	return
end

local fun = function (x, y)
	local tileset, n = string.match(place_getaspect(zone, x, y), "(.*):crystal_(.*)")
	if not tileset then
		return false
	end
	n = tonumber(n)
	if n <= 2 then
		character_message(Character, "Ce cristal n'est pas chargé. Il n'y a pas de pouvoir à /drainer.")
	elseif n <= 5 then
		character_message(Character, "Ce cristal n'est pas assez chargé. Il doit encore être chargé.")
	elseif n >= 6 then
		loadfile("logic/puzzle_mosaic_reset.lua")(zone, x, y)
		local max = gauge_getmax(Character, "mana")
		if n == 7 and character_gettag(Character, "has_drained_crystal") ~= "true" then
			character_message(Character, "Tu sens tes pouvoirs magiques augmenter !")
			max = max+1
			gauge_setmax(Character, "mana", max)
			character_settag(Character, "has_drained_crystal", "true")
		else
			character_message(Character, "Tu sens tes pouvoirs magiques renouvellés.")
		end
		gauge_setval(Character, "mana", max)

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
	character_message(Character, "Il n'y a pas de cristal à /drainer.")
end
