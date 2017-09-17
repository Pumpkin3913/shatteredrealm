#!/usr/bin/lua

local artifact = character_gettag(Character, "hand");
if not artifact or artifact == "" or artifact == "EMPTY" then
	character_message(Character, "Tu n'as rien en main à /vider.");
	return;
end

local name = artifact_getname(artifact);
local inventory = artifact_gettag(artifact, "inventory");
if not inventory or inventory == "" then
	character_message(Character, name.." n'est pas un conteneur.");
	return;
end

if Arg ~= name then
	character_message(Character, "Es-tu sûr ? Confirme avec /vider "..name);
	return;
end

local size = inventory_size(inventory);
delete_inventory(inventory);
artifact_settag(artifact, "inventory", create_inventory(size));
character_message(Character, name.." est vide.");
