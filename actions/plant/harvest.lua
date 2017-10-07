#!/usr/bin/lua

local zone = character_getzone(Character);
local x = character_getx(Character);
local y = character_gety(Character);

-- Check hand.
local hand = character_gettag(Character, "hand");
if not hand or hand == "" then
	character_message(Character, "Tu ne peux pas /récolter.");
	return;
end

local name;
local inventory;

-- Get artifact in character's hands.
local hand_content = inventory_get_all(hand);
local artifact = hand_content[1];

-- Get inventory from artifact.
if artifact then
	name = artifact_getname(hand, artifact);
	inventory = artifact_gettag(hand, artifact, "inventory");
	if inventory == "" then inventory = nil; end
end

local function fun(x, y)
	-- Check if target is a plant.
	if place_gettag(zone, x, y, "plant_state") == "mature" then
		-- Check if artifact held in hand.
		if not artifact then
			character_message(Character, "Tu dois tenir un conteneur en main.");
			return true;
		end

		-- Check if container.
		if not inventory then
			character_message(Character, name.." n'est pas un conteneur.");
			return true;
		end

		-- Harvest plant.
		local plant = place_gettag(zone, x, y, "plant_name");
		local aspect = place_gettag(zone, x, y, "plant_aspect");
		local qtt = 1;
		local added = create_artifact(inventory, plant, "ingredient", qtt);
		if not added then
			character_message(Character, "Tu n'as plus de place dans : "..name);
			return true;
		end

		character_message(Character, "Tu récoltes "..qtt.." "..plant.." dans : "..name);
		loadfile("logic/plant/destroy.lua")(zone, x, y);

		-- Give seed.
		if c_rand(4) ~= 4 then
			return true;
		end
		-- local seed = server_gettag("seedof:"..plant); -- TODO
		local seed = "Spore rouge"; -- XXX
		added = create_artifact(inventory, seed, "ingredient");
		if added then
			character_message(Character, "Tu récoltes également : "..seed);
			character_hint(Character, aspect, "/semer "..seed);
		else
			character_message(Character, "Oups. "..seed.." déborde de : "..name);
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

	-- Make leaves bag.
	if not artifact then
		local bag_name = "Sac de feuilles"..color;
		local bag = create_artifact(hand, bag_name, "hung");
		artifact_settag(hand, bag, "inventory", create_inventory(3, "ingredient"));
		character_message(Character, "Tu fabriques : "..bag_name);
		character_hint(Character, tileset.."_leavesbag", "/contenu");
		return true;
	end

	-- Check if container.
	if not inventory then
		character_message(Character, name.." n'est pas un conteneur.");
		return true;
	end
	
	-- Fill container with leaves.
	local item = "Feuilles"..color;
	local qtt = 1;
	local added = create_artifact(inventory, item, "ingredient", qtt);
	if added then
		character_message(Character, "Tu récoltes "..qtt.." "..item.." dans : "..name);
	else
		character_message(Character, "Tu n'as plus de place dans : "..name);
	end
	return true;
end

if not fun(x, y)
and not fun(x, y-1)
and not fun(x, y+1)
and not fun(x-1, y)
and not fun(x+1, y)
then
	character_message(Character, "Il n'y a rien à /récolter.");
end
