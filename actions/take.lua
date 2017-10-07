#!/usr/bin/lua

local zone = character_getzone(Character);
local char_x = character_getx(Character);
local char_y = character_gety(Character);

-- Check hand.
local hand = character_gettag(Character, "hand");
if not hand or hand == "" then
	character_message(Character, "Tu n'as pas de main.");
	return;
end

local inventory;

-- Search nearby container.
local function coffer_found(X, Y)
	inventory = place_gettag(zone, X, Y, "inventory");
	if not inventory or inventory == "" then
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

-- Check if container contains someting.
if inventory_total(inventory) <= 0 then
	character_message(Character, "Ce conteneur est vide.");
	return;
end

local content = inventory_get_all(inventory);
local name;
local returned;

-- Check argument.
if not Arg or Arg == "" then
	-- If no argument: /take first.
	local first = content[1];
	name = artifact_getname(inventory, first);
	returned = artifact_move(inventory, first, hand);
else
	return; -- TODO
end

if returned then
	character_message(Character, name.." pris.");
else
	character_message(Character, "Impossible de prendre : "..name);
end

-- TODO: swap if hand contains something.
-- TODO: use argument, recursively search the coffer, asked quantity = 1 (because hand size is always 1).
