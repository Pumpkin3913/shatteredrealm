#!/usr/bin/lua

local zone = character_getzone(Character);
local char_x = character_getx(Character);
local char_y = character_gety(Character);

-- Check hand.
local hand = character_gettag(Character, "hand");
if not hand or hand == "" then
	warning("Equipment slot 'hand' invalid.");
	return;
end

-- If hand not empty:
if inventory_available(hand) <= 0 then
	character_message(Character, "Tu tiens déjà quelque chose en main.");
	return;
end
-- TODO: automatically try to store hand-held item in inventory (error if unable).
-- TODO: swap?

if not Arg or Arg == "" then
	character_message(Character, "Tu dois préciser ce que tu veux /saisir.");
	return;
end

local inventory, artifact = loadfile("logic/recursive_character_search.lua")(Arg);

if not inventory or not artifact then
	character_message(Character, Arg.." : pas trouvé dans ton inventaire.");
	return;
end

local name = artifact_getname(inventory, artifact);
local success = artifact_move(inventory, artifact, hand, 1);
if success then
	character_message(Character, "Tu tiens : "..name);
else
	character_message(Character, "Impossible de /saisir : "..name);
end
