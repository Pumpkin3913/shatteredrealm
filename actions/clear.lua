#!/usr/bin/lua

local zone = player_getzone(Player)
local x = player_getx(Player)
local y = player_gety(Player)

local fun = function (x, y)
	local tileset, tile = string.match(zone_gettile(zone, x, y), "(.*):(.*)")
	if tile == "wall_bot_written" then
		if zone_gettag(zone, x, y, "text_type") == "chalk" then
			zone_settag(zone, x, y, "text", "")
			zone_settile(zone, x, y, tileset..":wall_bot")
			local script = zone_gettag(zone, x, y, "text_clear_trigger")
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
