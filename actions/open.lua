#!/usr/bin/lua

local zone = player_getzone(Player)
local x = player_getx(Player)
local y = player_gety(Player)

local fun = function (x, y)
	local tag = place_gettag(zone, x, y, "openclose_state")
	if tag == "close" then
		local tile = place_gettag(zone, x, y, "openclose_opentile")
		place_setaspect(zone, x, y, tile)
		place_settag(zone, x, y, "openclose_state", "open")

		-- Create eventual selfclose timer.
		local selfclose = place_gettag(zone, x, y, "openclose_selfclose")
		if selfclose and selfclose ~= "" then
			local timer = create_timer(selfclose, "loadfile(\"logic/selfclose.lua\")(\""..zone.."\", "..x..", "..y..")")
			place_settag(zone, x, y, "openclose_selfclose_timer", timer)
		end

	elseif tag == "locked" then
		local key = place_gettag(zone, x, y, "openclose_key")
		if not string.match(player_gettag(Player, "inventory"), key) then
			player_message(Player, "It's locked. You need: "..key)
		else
			player_message(Player, "You use: "..key)
			local tile = place_gettag(zone, x, y, "openclose_opentile")
			place_setaspect(zone, x, y, tile)
			place_settag(zone, x, y, "openclose_state", "open")
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
	player_message(Player, "There is nothing to open here.")
end
