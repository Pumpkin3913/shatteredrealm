#!/usr/bin/lua

-- Check hand.
local hand = player_gettag(Player, "hand");
if not hand or hand == "" or hand == "EMPTY" then
	player_message(Player, "Tu n'as rien en main.");
	return;
end

-- Check belt.
local belt = player_gettag(Player, "belt");
if not belt or belt == "" or belt == "EMPTY" then
	player_message(Player, "Tu n'as pas de ceinture.");
	return;
end

-- Sheathe in first empty slot.
local n = 1;
local artifact = artifact_gettag(belt, "content_artifact_"..n);
repeat
	if artifact == "EMPTY" then
		artifact_settag(belt, "content_artifact_"..n, hand);
		player_settag(Player, "hand", "EMPTY");
		player_message(Player, "Tu as /rengainé "..artifact_getname(hand).." dans l'emplacement "..n.." de "..artifact_getname(belt)..".");
		return;
	end
	n = n+1;
	artifact = artifact_gettag(belt, "content_artifact_"..n);
until(not artifact or artifact == "")

player_message(Player, "Il n'y a pas assez de place dans "..artifact_getname(belt)..".");
