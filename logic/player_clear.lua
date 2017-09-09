#!/usr/bin/lua

local hand = player_gettag(Player, "hand");
if hand and hand ~= "" and hand ~= "EMPTY" then
	local inventory = artifact_gettag(hand, "inventory");
	if inventory and inventory ~= "" then
		delete_inventory(inventory);
	end
	delete_artifact(hand);
end
