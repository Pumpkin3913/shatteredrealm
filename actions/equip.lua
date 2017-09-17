#!/usr/bin/lua

-- Get artifact in hand.
local hand = character_gettag(Character, "hand");
if not hand or hand == "" or hand == "EMPTY" then
	character_message(Character, "Tu dois tenir l'objet que tu veux équiper en main.");
	return;
end

local name = artifact_getname(hand);

-- Check if artifact is an equipment.
local equipment_slot = artifact_gettag(hand, "equipment");
if not equipment_slot or equipment_slot == "" then
	character_message(Character, name.." n'est pas un équipement.");
	return;
end

-- Check if character can equip.
local equiped = character_gettag(Character, equipment_slot);
if not equiped or equiped == "" then
	character_message(Character, "Tu ne peux pas équiper "..name);
	return;
end

-- Swap hand and equipment slot..
character_settag(Character, equipment_slot, hand);
character_settag(Character, "hand", equiped);

local msg = "Tu t'équipes de : "..name..".";
if equiped ~= "EMPTY" then
	msg = msg.." (Tu échanges avec : "..artifact_getname(equiped)..".)";
end
character_message(Character, msg);
