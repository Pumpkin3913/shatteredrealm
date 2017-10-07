#!/usr/bin/lua

-- Get artifact in character's hands.
local hand, held = loadfile("logic/get_equipment.lua")("hand");
if not hand or not held then
	character_message(Character, "Tu dois tenir l'objet que tu veux équiper en main.");
	return;
end

local name = artifact_getname(hand, held);

-- Check if artifact is an equipment.
local equipment_type = artifact_gettag(hand, held, "equipment");
if not equipment_type or equipment_type == "" then
	character_message(Character, name.." n'est pas un équipement.");
	return;
end

-- Check if character can equip.
local equipment_slot = character_gettag(Character, equipment_type);
if not equipment_slot or equipment_slot == "" then
	character_message(Character, "Tu ne peux pas équiper "..name);
	return;
end

local success = artifact_move(hand, held, equipment_slot);
if success then
	character_message(Character, "Tu t'équipes de : "..name..".");
else
	character_message(Character, "Tu ne peux pas t'équiper de : "..name..". Déséquipes-toi d'abord.");
end

-- TODO: swap equipments.
-- TODO: prevent unequiping non-empty belt.
