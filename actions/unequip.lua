#!/usr/bin/lua

-- TODO: REVAMP

-- Check hand.
local hand = character_gettag(Character, "hand");
if not hand or hand == "" then
	warning("Equioment slot 'hand' invalid.");
	return;
end

-- Check if hand is empty.
if inventory_available(hand) <= 0 then
	character_message(Character, "Tu dois avoir les mains vides.");
	return;
end

-- Convert Arg to equipment slot id.
if not Arg or Arg == "" then
	character_message(Character, "Tu dois préciser ce que tu veux déséquiper : 'ceinture' ou 'armure'.");
	return;
end

local slot;
if Arg == "ceinture" then
	slot = "belt";
elseif Arg == "armure" then
	slot = "armor";
end

-- Check if slot exist and is not empty.
if not slot or slot == "" then
	character_message(Character, Arg.." : ce n'est pas un emplacement d'équipement valide.");
	return;
end

local inventory, artifact = loadfile("logic/get_equipment.lua")(slot);
if not inventory or not artifact then
	character_message(Character, "Tu n'as pas de : "..slot);
	return;
end

-- Move equipment to hand.
local name = artifact_getname(inventory, artifact);
local success = artifact_move(inventory, artifact, hand);
if success then
	character_message(Character, "Tu enlèves : "..name);
else
	warning("Unequip: inventory prediction error.");
end
-- TODO: prevent unequiping non-empty belt.
