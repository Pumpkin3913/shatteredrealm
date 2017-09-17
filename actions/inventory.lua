#!/usr/bin/lua

local function list_inventory(artifact)
	local inventory = artifact_gettag(artifact, "inventory");
	if not inventory or inventory == "" then
		return "";
	end

	local msg = "";
	local list = inventory_get_all(inventory);
	for name, quantity in pairs(list) do
		msg = msg .. " "..quantity.." "..name.." ;";
	end

	if msg == "" then
		msg = "vide";
	end

	return " ["..msg.."]";
end

local hand = character_gettag(Character, "hand");
if hand and hand ~= "" then
	if hand == "EMPTY" then
		character_message(Character, "Mains : vide");
	else
		character_message(Character, "Mains : "..artifact_getname(hand)..list_inventory(hand));
	end
end

local belt = character_gettag(Character, "belt");
if belt and belt ~= "" then
	if belt == "EMPTY" then
		character_message(Character, "Ceinture : aucune");
	else
		character_message(Character, "Ceinture : "..artifact_getname(belt));
		
		local n = 1;
		local artifact = artifact_gettag(belt, "content_artifact_"..n);
		while artifact and artifact ~= "" do
			local name;
			if artifact == "EMPTY" then
				name = "vide";
			else
				name = artifact_getname(artifact)..list_inventory(artifact);
			end
			character_message(Character, "    ("..n..") "..name..".");

			n = n+1;
			artifact = artifact_gettag(belt, "content_artifact_"..n);
		end
	end
end
