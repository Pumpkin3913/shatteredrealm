#!/usr/bin/lua

local zone = player_getzone(Player)
local x = player_getx(Player)
local y = player_gety(Player)

local fun = function (x, y)
	local tag = place_gettag(zone, x, y, "openclose_state")
	if tag == "open" then
		local tile = place_gettag(zone, x, y, "openclose_closetile")
		place_setaspect(zone, x, y, tile)
		place_settag(zone, x, y, "openclose_state", "close")

		local script = place_gettag(zone, x, y, "openclose_closetrigger")
		if script and script ~= "" then
			loadstring(script)()
		end

		-- Cancel eventual selfclose timer.
		local selfclose_timer = place_gettag(zone, x, y, "openclose_selfclose_timer")
		if selfclose_timer and selfclose_timer ~= "" then
			delete_timer(selfclose_timer)
			place_deltag(zone, x, y, "openclose_selfclose_timer")
		end
	else
		return false
	end
	return true
end

if not fun(x, y)
and not fun(x, y-1)
and not fun(x, y+1)
and not fun(x-1, y)
and not fun(x+1, y)
then
	player_message(Player, "Il n'y a rien à /fermer.")
end
