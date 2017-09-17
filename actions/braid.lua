#!/usr/bin/lua

-- TODO: create the new belt into 'hand' with ingredient from belt's containers.

-- Check argument.
local ingredient = Arg;
if not ingredient or ingredient == "" then
	character_message(Character, "Tu dois préciser le nom de ce que tu veux /tresser.");
	return;
end

-- Get artifact in character's hands.
local artifact = character_gettag(Character, "hand");
if not artifact or artifact == "" or artifact == "EMPTY" then
	character_message(Character, "Tu dois tenir en main ce qui contient ce que tu veux /tresser.");
	return;
end

-- Get inventory from artifact.
local inventory = artifact_gettag(artifact, "inventory");
if not inventory or inventory == ""  then
	character_message(Character, "L'objet tenu en main n'est pas un conteneur.");
	return;
end

-- Check if character has no belt.
if character_gettag(Character, "belt") ~= "EMPTY" then
	character_message(Character, "Tu as déjà une ceinture. Tu dois la poser si tu veux en faire une nouvelle.");
	return;
end

-- Check quantity.
local quantity = 3;
if inventory_get(inventory, ingredient) < quantity then
	character_message(Character, "Il te faut au moins "..quantity.." éléments à /tresser.");
	return;
end

-- Check ingredient.
if not string.match(ingredient, "Feuilles.*") then
	character_message(Character, "Tu ne peux pas /tresser "..ingredient);
	return;
end

inventory_del(inventory, quantity, ingredient);
local name = "Tresse de "..ingredient
local new_artifact = create_artifact(name);
artifact_settag(new_artifact, "content_artifact_1", "EMPTY");
artifact_settag(new_artifact, "equipment", "belt");
character_settag(Character, "belt", new_artifact);
character_message(Character, "Tu as créé : "..name);
