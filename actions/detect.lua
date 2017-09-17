#!/usr/bin/lua

local zone = character_getzone(Character)
local x = character_getx(Character)
local y = character_gety(Character)

local function fun(x, y)
	local content = place_gettag(zone, x, y, "soul_vessel")
	if not content or content == "" then
		return false
	end

	if content == "full" then
		character_message(Character, "Ce lieu contient une âme.")
	elseif content == "empty" then
		character_message(Character, "Ce lieu peut contenir une âme.")
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
	character_message(Character, "Il n'y a pas de réceptacle d'âme, ici.")
end

-- Also check held item.
local hand = character_gettag(Character, "hand")
if hand ~= "EMPTY" then
	local vessel = artifact_gettag(hand, "soul_vessel")
	if vessel == "full" then
		character_message(Character, "L'objet en main contient une âme.")
	elseif vessel == "empty" then
		character_message(Character, "L'objet en main peut contenir une âme.")
	end
end
