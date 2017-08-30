#!/usr/bin/lua

local zone = player_getzone(Player)
local x = player_getx(Player)
local y = player_gety(Player)

local fun = function (x, y)
	local tileset, tile = string.match(place_getaspect(zone, x, y), "(.*):(.*)")
	if tile == "wall_bot_written" then
		if place_gettag(zone, x, y, "text_type") == "chalk" then
			place_deltag(zone, x, y, "text")
			place_deltag(zone, x, y, "text_type")
			place_setaspect(zone, x, y, tileset..":wall_bot")
			local script = place_gettag(zone, x, y, "text_clear_trigger")
			if script and script ~= "" then
				loadstring(script)()
			end
		else
			player_message(Player, "This message wasn't written with chalk and cannot be /clear.")
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
	player_message(Player, "There is no writing to clear here.")
end
