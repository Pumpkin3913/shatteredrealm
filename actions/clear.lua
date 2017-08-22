#!/usr/bin/lua

local screen = player_getscreen(Player)
local x = player_getx(Player)
local y = player_gety(Player)

local fun = function (x, y)
	local tileset, tile = string.match(screen_gettile(screen, x, y), "(.*):(.*)")
	if tile == "wall_bot_written" then
		screen_settag(screen, x, y, "text", "")
		screen_settile(screen, x, y, tileset..":wall_bot")
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
