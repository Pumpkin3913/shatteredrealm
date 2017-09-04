#!/usr/bin/lua

local hand = player_gettag(Player, "hand");
if not hand or hand == "" or hand == "EMPTY" then
	player_message(Player, "Tu n'as rien en main.")
	return
end

local zone = player_getzone(Player)
local x = player_getx(Player)
local y = player_gety(Player)

local function fun(x, y)
	local content = place_gettag(zone, x, y, "content_artifact_1")
	if not content or content == "" then
		return false
	end

	-- Check if close.
	local openclose = place_gettag(zone, x, y, "openclose_state")
	if openclose == "close" or openclose == "locked" then
		player_message(Player, "C'est fermé.")
		return true
	end

	-- Drop in first non-empty.
	local n = 1
	repeat
		if content == "EMPTY" then
			place_settag(zone, x, y, "content_artifact_"..n, hand)
			player_settag(Player, "hand", "EMPTY")
			player_message(Player, "Tu as posé dans l'emplacement ["..n.."]: "..artifact_getname(hand))
			return true
		end
		n = n+1
		content = place_gettag(zone, x, y, "content_artifact_"..n)
	until(not content or content == "")

	player_message(Player, "Il n'y a pas assez de place.")
	return true
end

if not fun(x, y)
and not fun(x, y-1)
and not fun(x, y+1)
and not fun(x-1, y)
and not fun(x+1, y)
then
	player_message(Player, "Tu ne peux rien poser ici.")
end
