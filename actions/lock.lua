#!/usr/bin/lua

local zone = player_getzone(Player)
local x = player_getx(Player)
local y = player_gety(Player)

local fun = function (x, y)
	local key = zone_gettag(zone, x, y, "openclose_key")
	if key and key ~= "" then
		if not string.match(player_gettag(Player, "inventory"), key) then
			player_message(Player, "You don't have: "..key)
		else
			local tile = zone_gettag(zone, x, y, "openclose_closetile")
			zone_settile(zone, x, y, tile)
			zone_settag(zone, x, y, "openclose_state", "locked")
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
	player_message(Player, "There is nothing to lock here.")
end
