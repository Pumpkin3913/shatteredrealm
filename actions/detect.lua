#!/usr/bin/lua

local zone = player_getzone(Player)
local x = player_getx(Player)
local y = player_gety(Player)

local function fun(x, y)
	local content = place_gettag(zone, x, y, "soul_vessel")
	if not content or content == "" then
		return false
	end

	if content == "full" then
		player_message(Player, "Ce lieu contient une âme.")
	elseif content == "empty" then
		player_message(Player, "Ce lieu peut contenir une âme.")
	else
		return false
	end

	return true
end

if not fun(x, y)
and not fun(x, y-1)
and not fun(x, y+1)
and not fun(x-1, y)
and not fun(x+1, y)
then
	player_message(Player, "Il n'y a pas de réceptacle d'âme, ici.")
end

-- Also check held item.
local hand = player_gettag(Player, "hand")
if hand ~= "EMPTY" then
	local vessel = artifact_gettag(hand, "soul_vessel")
	if vessel == "full" then
		player_message(Player, "L'objet en main contient une âme.")
	elseif vessel == "empty" then
		player_message(Player, "L'objet en main peut contenir une âme.")
	end
end
