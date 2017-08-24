#!/usr/bin/lua

if not string.match(player_gettag(Player, "inventory"), "chalk") then
	player_message(Player, "You can't write.")
	return
end

if not Arg then
	player_message(Player, "What do you want to write?")
	return
end

local screen = player_getscreen(Player)
local x = player_getx(Player)
local y = player_gety(Player)

local fun = function (x, y)
	local tileset, tile = string.match(screen_gettile(screen, x, y), "(.*):(.*)")
	if tile == "wall_bot" then
		screen_settag(screen, x, y, "text", Arg)
		screen_settag(screen, x, y, "text_type", "chalk")
		screen_settile(screen, x, y, tileset..":wall_bot_written")
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
	player_message(Player, "You can't write here.")
end
