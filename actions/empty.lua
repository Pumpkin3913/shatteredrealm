#!/usr/bin/lua

-- Get artifact in character's hands.
local hand, held = loadfile("logic/get_equipment.lua")("hand");
if not hand or not held then
	character_message(Character, "Tu n'as rien en main à /vider.");
	return;
end

-- Get inventory of hand-held item.
local name = artifact_getname(hand, held);
local inventory = artifact_gettag(hand, held, "inventory");
if not inventory or inventory == "" then
	character_message(Character, name.." n'est pas un conteneur.");
	return;
end

-- Check confirmation.
if Arg ~= name then
	character_message(Character, "Es-tu sûr ? Confirme avec /vider "..name);
	return;
end

-- Empty the hand-held container.
for _, artifact in ipairs(inventory_get_all(inventory)) do
	local qtt = artifact_getquantity(inventory, artifact);
	delete_artifact(inventory, artifact, qtt);
end
character_message(Character, name.." est vide.");
