#!/usr/bin/lua

local screen = player_getscreen(Player)
local x = player_getx(Player)
local y = player_gety(Player)

local fun = function (x, y)
	local text = screen_gettag(screen, x, y, "text")

	if text ~= "" then
		-- Check if close
		local state = screen_gettag(screen, x, y, "openclose_state")
		if state == "close" then
			player_message(Player, "This book is close.")
		else
			player_message(Player, text)
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
	player_message(Player, "There is nothing written here.")
end
