#!/usr/bin/lua

local zone = player_getzone(Player)
local x = player_getx(Player)
local y = player_gety(Player)

local fun = function (x, y)
	local tag = zone_gettag(zone, x, y, "openclose_state")
	if tag == "open" then
		local tile = zone_gettag(zone, x, y, "openclose_closetile")
		zone_settile(zone, x, y, tile)
		zone_settag(zone, x, y, "openclose_state", "close")

		local script = zone_gettag(zone, x, y, "openclose_closetrigger")
		if script and script ~= "" then
			loadstring(script)()
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
	player_message(Player, "There is nothing to close here.")
end
