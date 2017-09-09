#!/usr/bin/lua

local artifact = player_gettag(Player, "hand");
if not artifact or artifact == "" or artifact == "EMPTY" then
	player_message(Player, "Tu n'as rien en main à /vider.");
	return;
end

local name = artifact_getname(artifact);
local inventory = artifact_gettag(artifact, "inventory");
if not inventory or inventory == "" then
	player_message(Player, name.." n'est pas un conteneur.");
	return;
end

if Arg ~= name then
	player_message(Player, "Es-tu sûr ? Confirme avec /vider "..name);
	return;
end

local size = inventory_size(inventory);
delete_inventory(inventory);
artifact_settag(artifact, "inventory", create_inventory(size));
player_message(Player, name.." est vide.");
