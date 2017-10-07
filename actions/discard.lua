#!/usr/bin/lua

-- Get artifact in character's hands.
local hand, held = loadfile("logic/get_equipment.lua")("hand");
if not hand or not held then
	character_message(Character, "Tu n'as rien en main à /jeter.");
	return;
end

local name = artifact_getname(hand, held);
if Arg ~= name then
	character_message(Character, "Es-tu sûr ? Confirme avec /jeter "..name);
	return;
end

loadfile("logic/recursive_inventory_delete.lua")(artifact_gettag(hand, held, "inventory"));
delete_artifact(hand, held);
character_message(Character, "Tu as /jeté : "..name..".");
