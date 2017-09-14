#!/usr/bin/lua

-- Check hand.
local hand = player_gettag(Player, "hand");
if not hand or hand == "" then
	player_message(Player, "Tu n'as pas de main.");
	return;
end

-- Check if hand is empty.
if hand ~= "EMPTY" then
	player_message(Player, "Tu dois avoir les mains vides.");
	return;
end

-- Convert Arg to equipment slot id.
if not Arg or Arg == "" then
	player_message(Player, "Tu dois préciser ce que tu veux déséquiper : 'ceinture' ou 'armure'.");
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
	player_message(Player, Arg.." : ce n'est pas un emplacement d'équipement valide.");
	return;
end

local artifact = player_gettag(Player, slot);
if not artifact or artifact == "" or artifact == "EMPTY" then
	player_message(Player, "Tu n'as pas de : "..slot);
	return;
end

-- Move equipment to hand.
player_settag(Player, slot, hand);
player_settag(Player, "hand", artifact);
player_message(Player, "Tu enlèves : "..artifact_getname(artifact));
