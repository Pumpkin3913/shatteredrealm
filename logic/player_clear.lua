#!/usr/bin/lua

local hand = player_gettag(Player, "hand")
if hand and hand ~= "" and hand ~= "EMPTY" then
	delete_artifact(hand)
end
