#!/usr/bin/lua

local screen = player_getscreen(Player)
local x = player_getx(Player)
local y = player_gety(Player)

local fun = function (x, y)
	local tag = screen_gettag(screen, x, y, "openclose_state")
	if tag == "close" then
		local tile = screen_gettag(screen, x, y, "openclose_opentile")
		screen_settile(screen, x, y, tile)
		screen_settag(screen, x, y, "openclose_state", "open")
		return true
	elseif tag == "locked" then
		local key = screen_gettag(screen, x, y, "openclose_key")
		if not string.match(player_gettag(Player, "inventory"), key) then
			player_message(Player, "It's locked. You need: "..key)
		else
			player_message(Player, "You use: "..key)
			local tile = screen_gettag(screen, x, y, "openclose_opentile")
			screen_settile(screen, x, y, tile)
			screen_settag(screen, x, y, "openclose_state", "open")
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
	player_message(Player, "There is nothing to open here.")
end
