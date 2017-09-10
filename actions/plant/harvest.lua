#!/usr/bin/lua

local zone = player_getzone(Player);
local x = player_getx(Player);
local y = player_gety(Player);

-- Get artifact in player's hands.
local artifact = player_gettag(Player, "hand");
if not artifact or artifact == "" then
	player_message("Tu ne peux pas /récolter.");
	return;
end

local name
local inventory

-- Get inventory from artifact.
if artifact ~= "EMPTY" then
	name = artifact_getname(artifact);
	inventory = artifact_gettag(artifact, "inventory");
	if inventory == "" then inventory = nil; end
end

local function fun(x, y)
	-- Check if target is a plant.
	if place_gettag(zone, x, y, "plant_state") == "mature" then
		-- Check if artifact held in hand.
		if artifact == "EMPTY" then
			player_message(Player, "Tu dois tenir un conteneur en main.");
			return true;
		end

		-- Check if container.
		if not inventory then
			player_message(Player, name.." n'est pas un conteneur.");
			return true;
		end

		-- Harvest plant.
		local plant = place_gettag(zone, x, y, "plant_name");
		local added = inventory_add(inventory, 1, plant);
		if added > 0 then
			player_message(Player, "Tu récoltes "..added.." "..plant.." dans : "..name);
			-- TODO: get seed item.
			loadfile("logic/plant/destroy.lua")(zone, x, y);
		else
			player_message(Player, "Tu n'as plus de place dans : "..name);
		end
		return true;
	end

	-- Check if target is a tree.
	local aspect = place_getaspect(zone, x, y);
	local tileset, tile = string.match(aspect, "(.*):(.*)");
	if tile ~= "trees_lft" and tile ~= "trees_rgt" and tile ~= "tree_toplft" and tile ~= "tree_toprgt" and tile ~= "tree_botlft" and tile ~= "tree_botrgt" then
		return false;
	end

	-- Get color of leaves.
	local color = "";
	if tileset == "forest_corrupted" then
		color = " bleues";
	elseif tileset == "forest_underground" then
		color = " violettes";
	end

	if artifact == "EMPTY" then
		-- Make leaves bag.
		local bag = create_artifact("Sac de feuilles"..color);
		artifact_settag(bag, "inventory", create_inventory(3));
		player_settag(Player, "hand", bag);
		player_message(Player, "Tu fabriques un sac avec des feuilles.")
		player_hint(Player, tileset.."_leavesbag", "/contenu");
		return true;
	end

	-- Check if container.
	if not inventory then
		player_message(Player, name.." n'est pas un conteneur.");
		return true;
	end
	
	-- Fill container with leaves.
	local item = "Feuilles"..color;
	local added = inventory_add(inventory, 1, item);
	if added > 0 then
		player_message(Player, "Tu récoltes "..added.." "..item.." dans : "..name);
	else
		player_message(Player, "Tu n'as plus de place dans : "..name);
	end
	return true;
end

if not fun(x, y)
and not fun(x, y-1)
and not fun(x, y+1)
and not fun(x-1, y)
and not fun(x+1, y)
then
	player_message(Player, "Il n'y a rien à /récolter.");
end
