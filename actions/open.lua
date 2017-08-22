#!/usr/bin/lua

local screen = player_getscreen(Player)
local x = player_getx(Player)
local y = player_gety(Player)

local fun = function (x, y)
	local t = screen_gettile(screen, x, y)
	local tileset, tile = string.match(t, "(.*):(.*)")

	if tile == "bigdoor_closed" then
		screen_settile(screen, x, y, tileset..":".."bigdoor")
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
	player_message(Player, "There is no door here.")
end
