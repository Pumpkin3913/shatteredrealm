#!/usr/bin/lua

local artifact = player_gettag(Player, "hand");
if not artifact or artifact == "" or artifact == "EMPTY" then
	player_message(Player, "Tu n'as rien en main à /jeter.");
	return;
end

local name = artifact_getname(artifact);
if Arg ~= name then
	player_message(Player, "Es-tu sûr ? Confirme avec /jeter "..name);
	return;
end

local inventory = artifact_gettag(artifact, "inventory");
if inventory and inventory ~= "" then
	delete_inventory(inventory);
end

delete_artifact(artifact);
player_settag(Player, "hand", "EMPTY");
player_message(Player, "Tu as /jeté : "..name..".");
