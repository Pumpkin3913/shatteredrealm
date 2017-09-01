#!/usr/bin/lua

local zone = player_getzone(Player)
local x = player_getx(Player)
local y = player_gety(Player)

local fun = function (x, y)
	local key = place_gettag(zone, x, y, "openclose_key")
	if key and key ~= "" then
		if player_gettag(Player, "have "..key) == "true" then
			local tile = place_gettag(zone, x, y, "openclose_locktile")
			if not tile or tile == "" then
				tile = place_gettag(zone, x, y, "openclose_closetile")
			end
			place_setaspect(zone, x, y, tile)
			place_settag(zone, x, y, "openclose_state", "locked")
			player_message(Player, "C'est verrouillé avec : "..key)
		else
			player_message(Player, "Tu n'as pas : "..key)
		end
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
	player_message(Player, "Il n'y a rien à /verrouiller.")
end
