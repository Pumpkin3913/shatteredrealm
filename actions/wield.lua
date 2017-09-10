#!/usr/bin/lua

-- Check hand.
local hand = player_gettag(Player, "hand");
if not hand or hand == "" then
	player_message(Player, "Tu n'as pas de main.");
	return;
end

-- Check belt.
local belt = player_gettag(Player, "belt");
if not belt or belt == "" or belt == "EMPTY" then
	player_message(Player, "Tu n'as pas de ceinture.");
	return;
end

local artifact;

local n = 1;
if Arg and Arg ~= "" then
	-- Select N-th.
	n = tonumber(Arg);
	
	artifact = artifact_gettag(belt, "content_artifact_"..n);
	if not artifact or artifact == "" then
		player_message(Player, "Il n'y a pas d'emplacement "..n.." sur : "..artifact_getname(belt)..".");
		return;
	end

	if artifact == "EMPTY" then
		player_message(Player, "L'emplacement "..n.." est vide.");
		return;
	end
else
	-- Select first non-empty.
	artifact = artifact_gettag(belt, "content_artifact_"..n);
	while artifact == "EMPTY" do
		n = n+1;
		artifact = artifact_gettag(artifact, "content_artifact_"..n);
		if not artifact or artifact == "" then
			-- End of list and found nothing.
			player_message(Player, artifact_getname(belt).." est entièrement vide.");
			return;
		end
	end
end

-- Take N-th.
player_settag(Player, "hand", artifact);
local msg = "Tu as en main : "..artifact_getname(artifact)..".";
artifact_settag(belt, "content_artifact_"..n, hand)
if hand ~= "EMPTY" then
	msg = msg.." (Tu échanges avec : "..artifact_getname(hand)..".)";
end
player_message(Player, msg);
