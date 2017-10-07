#!/usr/bin/lua

local pattern, character = ...
if not character then character = Character; end

-- Check hand.
local hand = character_gettag(character, "hand");
if not hand or hand == "" then
	warning("Character has no hand slot.");
	return;
end

local i, a = loadfile("logic/recursive_inventory_search.lua")(pattern, hand);
if i or a then
	return i, a;
end

-- Check belt.
local belt = character_gettag(character, "belt");
if not belt or belt == "" then
	warning("Character has no belt slot.");
	return;
end

i, a = loadfile("logic/recursive_inventory_search.lua")(pattern, belt);
if i or a then
	return i, a;
end
