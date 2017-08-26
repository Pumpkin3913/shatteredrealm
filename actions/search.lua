#!/usr/bin/lua

local zone = player_getzone(Player)
local x = player_getx(Player)
local y = player_gety(Player)

local fun = function (x, y)
	local content = place_gettag(zone, x, y, "content")
	if content ~= "" then
		local state = place_gettag(zone, x, y, "openclose_state")
		if state == "close" then
			player_message(Player, "The coffer is close.")
		else
			local inventory = player_gettag(Player, "inventory")
			if string.match(inventory, ".*"..content..".*") then
				player_message(Player, "You already have: "..content)
			else
				player_settag(Player, "inventory", inventory..":"..content)
				player_message(Player, "You found: "..content)
			end
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
	player_message(Player, "You found nothing.")
end
