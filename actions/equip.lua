#!/usr/bin/lua

-- Get artifact in hand.
local hand = player_gettag(Player, "hand");
if not hand or hand == "" or hand == "EMPTY" then
	player_message(Player, "Tu dois tenir l'objet que tu veux équiper en main.");
	return;
end

local name = artifact_getname(hand);

-- Check if artifact is an equipment.
local equipment_slot = artifact_gettag(hand, "equipment");
if not equipment_slot or equipment_slot == "" then
	player_message(Player, name.." n'est pas un équipement.");
	return;
end

-- Check if player can equip.
local equiped = player_gettag(Player, equipment_slot);
if not equiped or equiped == "" then
	player_message(Player, "Tu ne peux pas équiper "..name);
	return;
end

-- Swap hand and equipment slot..
player_settag(Player, equipment_slot, hand);
player_settag(Player, "hand", equiped);

local msg = "Tu t'équipes de : "..name..".";
if equiped ~= "EMPTY" then
	msg = msg.." (Tu échanges avec : "..artifact_getname(equiped)..".)";
end
player_message(Player, msg);
