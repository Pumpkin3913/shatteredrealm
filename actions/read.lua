#!/usr/bin/lua

local zone = player_getzone(Player)
local x = player_getx(Player)
local y = player_gety(Player)

local fun = function (x, y)
	local text = place_gettag(zone, x, y, "text")

	if text ~= "" then
		-- Check if close
		local state = place_gettag(zone, x, y, "openclose_state")
		if state == "close" then
			local title = place_gettag(zone, x, y, "title")
			if title and title ~= "" then
				player_message(Player, title)
			else
				player_message(Player, "Ce livre est fermé.")
			end
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
	player_message(Player, "Il n'y a rien à /lire.")
end
