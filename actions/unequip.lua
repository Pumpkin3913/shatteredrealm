#!/usr/bin/lua

-- Check hand.
local hand = character_gettag(Character, "hand");
if not hand or hand == "" then
	character_message(Character, "Tu n'as pas de main.");
	return;
end

-- Check if hand is empty.
if hand ~= "EMPTY" then
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

local artifact = character_gettag(Character, slot);
if not artifact or artifact == "" or artifact == "EMPTY" then
	character_message(Character, "Tu n'as pas de : "..slot);
	return;
end

-- Move equipment to hand.
character_settag(Character, slot, hand);
character_settag(Character, "hand", artifact);
character_message(Character, "Tu enlèves : "..artifact_getname(artifact));
