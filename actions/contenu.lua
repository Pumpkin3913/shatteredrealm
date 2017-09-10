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
local msg = "";

for name, quantity in pairs(list) do
	msg = msg.. quantity.." "..name.." ; ";
end

local bagname = artifact_getname(artifact);
if msg == "" then
	player_message(Player, bagname.." est vide.");
else
	player_message(Player, "Contenu de "..bagname.." : "..msg);
end
