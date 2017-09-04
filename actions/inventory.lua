#!/usr/bin/lua

local hand = player_gettag(Player, "hand")
if hand and hand ~= "" then
	if hand == "EMPTY" then
		player_message(Player, "Mains : vide")
	else
		player_message(Player, "Mains : "..artifact_getname(hand))
	end
end
