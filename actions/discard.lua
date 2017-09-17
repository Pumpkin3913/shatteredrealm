#!/usr/bin/lua

local artifact = character_gettag(Character, "hand");
if not artifact or artifact == "" or artifact == "EMPTY" then
	character_message(Character, "Tu n'as rien en main à /jeter.");
	return;
end

local name = artifact_getname(artifact);
if Arg ~= name then
	character_message(Character, "Es-tu sûr ? Confirme avec /jeter "..name);
	return;
end

local inventory = artifact_gettag(artifact, "inventory");
if inventory and inventory ~= "" then
	delete_inventory(inventory);
end

delete_artifact(artifact);
character_settag(Character, "hand", "EMPTY");
character_message(Character, "Tu as /jeté : "..name..".");
