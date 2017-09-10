#!/usr/bin/lua

local hand = player_gettag(Player, "hand");
if hand and hand ~= "" then
	if hand == "EMPTY" then
		player_message(Player, "Mains : vide");
	else
		player_message(Player, "Mains : "..artifact_getname(hand));
	end
end

local belt = player_gettag(Player, "belt");
if belt and belt ~= "" then
	if belt == "EMPTY" then
		player_message(Player, "Ceinture : aucune");
	else
		player_message(Player, "Ceinture : "..artifact_getname(belt));
		
		local n = 1;
		local artifact = artifact_gettag(belt, "content_artifact_"..n);
		while artifact and artifact ~= "" do
			local name;
			if artifact == "EMPTY" then
				name = "vide";
			else
				name = artifact_getname(artifact);
			end
			player_message(Player, "     Emplacement "..n.." : "..name..".");

			n = n+1;
			artifact = artifact_gettag(belt, "content_artifact_"..n);
		end
	end
end
