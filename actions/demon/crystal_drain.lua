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
	local tile = string.match(place_getaspect(zone, x, y), ".*:(.*)")
	if tile == "crystal_2" then
		player_message(Player, "This crystal isn't charged. There is no power to drain.")
		return true
	elseif tile == "crystal_6" then
		loadfile("logic/reset_crystal.lua")(zone, x, y)
		local gauge = "mana"
		local max = gauge_getmax(Player, gauge)
		local tag = "has_drained_crystal"
		local val = "true"
		if player_gettag(Player, tag) ~= val then
			max = max+1
			gauge_setmax(Player, gauge, max)
			player_settag(Player, tag, val)
			player_message(Player, "You feel your magical power increases.")
		else
			player_message(Player, "You feel your magical power renewed.")
		end
		gauge_setval(Player, gauge, max)
		return true
	else
		return false
	end
end

if not fun(x, y)
and not fun(x, y-1)
and not fun(x, y+1)
and not fun(x-1, y)
and not fun(x+1, y)
then
	player_message(Player, "There is no crystal to drain here.")
end
