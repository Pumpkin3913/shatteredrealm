#!/usr/bin/lua

-- TODO: create the new belt into 'hand' with ingredient from belt's containers.

-- Check argument.
local ingredient = Arg;
if not ingredient or ingredient == "" then
	character_message(Character, "Tu dois préciser le nom de ce que tu veux /tresser.");
	return;
end

local inventory, artifact = loadfile("logic/recursive_character_search.lua")(ingredient);
if not inventory or not artifact then
	character_message(Character, ingredient.." : pas trouvé dans ton inventaire.");
	return;
end

-- Character must have hand or belt slot free.
local target = character_gettag(Character, "hand");
if inventory_available(target) <= 0 then
	target = character_gettag(Character, "belt");
	if inventory_available(target) <= 0 then
		character_message(Character, "Tu as déjà une ceinture et les mains prises.");
		return;
	end
end

local name = artifact_getname(inventory, artifact);

-- Check ingredient.
if not string.match(name, "Feuilles.*") then
	character_message(Character, "Tu ne peux pas /tresser "..name);
	return;
end

-- Check quantity.
local quantity = 3;
if artifact_getquantity(inventory, artifact) < quantity then
	character_message(Character, "Il te faut au moins "..quantity.." "..name.." à /tresser.");
	return;
end

local color = string.match(name, "Feuilles(.*)");
name = "Tresse de feuilles"..color;
local new_artifact = create_artifact(target, name, "belt");
-- if not new_artifact then ...
artifact_settag(target, new_artifact, "inventory", create_inventory(1, "hung"));
character_message(Character, "Tu as tressé : "..name);
delete_artifact(inventory, artifact, quantity);
