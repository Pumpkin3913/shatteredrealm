#!/usr/bin/lua

local screen = player_getscreen(Player)
local x = player_getx(Player)
local y = player_gety(Player)

local read = function (x, y)
	local text = screen_gettag(screen, x, y, "text")

	if text ~= "" then
		player_message(Player, text)
		return true
	else
		return false
	end
end

if not read(x, y)
and not read(x, y-1)
and not read(x, y+1)
and not read(x-1, y)
and not read(x+1, y)
then
	player_message(Player, "There is nothing written here.")
end
