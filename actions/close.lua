#!/usr/bin/lua

local screen = player_getscreen(Player)
local x = player_getx(Player)
local y = player_gety(Player)

local fun = function (x, y)
	local tag = screen_gettag(screen, x, y, "openclose_state")
	if tag == "open" then
		local tile = screen_gettag(screen, x, y, "openclose_closetile")
		screen_settile(screen, x, y, tile)
		screen_settag(screen, x, y, "openclose_state", "close")

		local script = screen_gettag(screen, x, y, "openclose_closetrigger")
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
