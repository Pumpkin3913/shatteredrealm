#!/usr/bin/lua

local artifact = player_gettag(Player, "hand");
if not artifact or artifact == "" or artifact == "EMPTY" then
	player_message(Player, "Tu n'as rien dans les mains.");
	return;
end

local inventory = artifact_gettag(artifact, "inventory");
if not inventory or inventory == "" then
	player_message(Player, "L'objet tenu en main ne peut rien contenir.");
	return;
end

local list = inventory_get_all(inventory);
local msg = "Contenu de "..artifact_getname(artifact).." : ";

for name, quantity in pairs(list) do
	msg = msg.. quantity.." "..name.." ; ";
end
player_message(Player, msg);
