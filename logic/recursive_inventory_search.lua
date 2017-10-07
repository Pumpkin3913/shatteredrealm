#!/usr/bin/lua

local pattern, character = ...
if not character then character = Character; end

local function search(inventory)
-- TODO: failsafe for wrong inventory.
	local content = inventory_get_all(inventory);
	for _, artifact in ipairs(content) do
		local name = artifact_getname(inventory, artifact);
		if string.find(name, pattern) then
			return inventory, artifact;
		end

		local subinventory = artifact_gettag(inventory, artifact, "inventory");
		if subinventory and subinventory ~= "" then
			local i, a = search(subinventory);
			if i or a then
				return i, a;
			end
		end
	end
	return;
end

-- Check hand.
local hand = character_gettag(character, "hand");
if not hand or hand == "" then
	warning("Character has no hand slot.");
	return;
end

local i, a = search(hand);
if i or a then
	return i, a;
end

-- Check belt.
local belt = character_gettag(character, "belt");
if not belt or belt == "" then
	warning("Character has no belt slot.");
	return;
end

i, a = search(belt);
if i or a then
	return i, a;
end
