#!/usr/bin/lua

local zone = character_getzone(Character);
local char_x = character_getx(Character);
local char_y = character_gety(Character);

local target_container;

-- Search nearby container.
local function coffer_found(X, Y)
	target_container = place_gettag(zone, X, Y, "inventory");
	if not target_container or target_container == "" then
		return false;
	end

	return true;
end

if not coffer_found(char_x, char_y)
	-- Clockwise, starting north.
	and not coffer_found(char_x, char_y-1)
	and not coffer_found(char_x+1, char_y)
	and not coffer_found(char_x, char_y+1)
	and not coffer_found(char_x-1, char_y)
then
	character_message(Character, "Il n'y a pas de conteneur ici.");
	return;
end

-- If no argument: from hand to coffer.
if not Arg or Arg == "" then

	-- Check hand.
	local hand = character_gettag(Character, "hand");
	if not hand or hand == "" then
		character_message(Character, "Tu n'as pas de main.");
		return;
	end

	local content = inventory_get_all(hand);

	-- Check if hand not empty.
	if #content <= 0 then
		character_message(Character, "Tu n'as rien en main.");
		return;
	end

	local artifact = content[1];
	local name = artifact_getname(hand, artifact);
	if artifact_move(hand, artifact, target_container) then
		character_message(Character, name.." posé.");
	else
		character_message(Character, "Impossible de poser : "..name);
	end
end

-- Extract eventual quantity from Arg.
local quantity, pattern = string.match(Arg, "^(%d+) (.*)$");
if not quantity or not pattern then
	quantity = 1;
	pattern = Arg;
end

-- Recursively search character's inventory.
local inventory, artifact = loadfile("logic/recursive_character_search.lua")(pattern);
if not inventory or not artifact then
	character_message(Character, pattern.." : pas trouvé dans ton inventaire.");
	return;
end

local name = artifact_getname(inventory, artifact);
if artifact_move(inventory, artifact, target_container, quantity)  then
	character_message(Character, quantity.." "..name.." posé.");
else
	character_message(Character, "Impossible de poser : "..quantity.." "..name);
end
