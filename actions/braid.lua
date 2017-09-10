#!/usr/bin/lua

-- TODO: create the new belt into 'hand' with ingredient from belt's containers.

-- Check argument.
local ingredient = Arg;
if not ingredient or ingredient == "" then
	player_message(Player, "Tu dois préciser le nom de ce que tu veux /tresser.");
	return;
end

-- Get artifact in player's hands.
local artifact = player_gettag(Player, "hand");
if not artifact or artifact == "" or artifact == "EMPTY" then
	player_message(Player, "Tu dois tenir en main ce qui contient ce que tu veux /tresser.");
	return;
end

-- Get inventory from artifact.
local inventory = artifact_gettag(artifact, "inventory");
if not inventory or inventory == ""  then
	player_message(Player, "L'objet tenu en main n'est pas un conteneur.");
	return;
end

-- Check if player has no belt.
if player_gettag(Player, "belt") ~= "EMPTY" then
	player_message(Player, "Tu as déjà une ceinture. Tu dois la poser si tu veux en faire une nouvelle.");
	return;
end

-- Check quantity.
local quantity = 3;
if inventory_get(inventory, ingredient) < quantity then
	player_message(Player, "Il te faut au moins "..quantity.." éléments à /tresser.");
	return;
end

-- Check ingredient.
if not string.match(ingredient, "Feuilles.*") then
	player_message(Player, "Tu ne peux pas /tresser "..ingredient);
	return;
end

inventory_del(inventory, quantity, ingredient);
local name = "Tresse de "..ingredient
local new_artifact = create_artifact(name);
artifact_settag(new_artifact, "content_artifact_1", "EMPTY");
player_settag(Player, "belt", new_artifact);
player_message(Player, "Tu as créé : "..name);
