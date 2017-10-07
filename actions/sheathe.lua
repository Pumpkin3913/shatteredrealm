#!/usr/bin/lua

local zone = character_getzone(Character);
local char_x = character_getx(Character);
local char_y = character_gety(Character);

-- Get hand-held item.
local hand, held = loadfile("logic/get_equipment.lua")("hand");
if not hand or not held then
	character_message(Character, "Tu n'as rien en main.");
	return;
end

-- If arg: try to store in target container.
if Arg and Arg ~= "" then
	local inventory, artifact = loadfile("logic/recursive_inventory_search.lua")(Arg);
	if not inventory or not artifact then
		character_message(Character, Arg.." : pas trouvé dans ton inventaire.");
		return;
	end
	local target_inventory = artifact_gettag(inventory, artifact, "inventory");
	if not target_inventory or target_inventory == "" then
		character_message(Character, artifact_getname(inventory, artifact).." : n'est pas un conteneur.");
		return;
	end
	local name = artifact_getname(hand, held);
	local success = artifact_move(hand, held, target_inventory);
	if success then
		character_message(Character, "Tu as rangé "..name.." dans "..artifact_getname(inventory, artifact)..".");
	else
		character_message(Character, "Tu ne peux pas ranger "..name.." dans "..artifact_getname(inventory, artifact)..".");
	end
	return;
end

-- No arg : try to sheath on belt.

local belt_slot, belt = loadfile("logic/get_equipment.lua")("belt");
if not belt_slot or not belt then
	character_message(Character, "Tu n'as pas de ceinture.");
	return;
end

local inventory = artifact_gettag(belt_slot, belt, "inventory");
if not inventory or inventory == "" then
	warning("Belt item '"..artifact_getname(belt_slot, belt).."' has no inventory.");
	return;
end

local name = artifact_getname(hand, held);
local success = artifact_move(hand, held, inventory);
if success then
	character_message(Character, "Tu suspends "..name.." à "..artifact_getname(belt_slot, belt)..".");
	return;
end

-- Else, recursively try to insert in inventory item.
-- TODO
character_message(Character, "Tu ne peux pas suspendre "..name.." à "..artifact_getname(belt_slot, belt)..".");
