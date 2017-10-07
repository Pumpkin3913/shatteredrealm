#!/usr/bin/lua

-- Get artifact in character's hands.
local hand, held = loadfile("logic/get_equipment.lua")("hand");
if not hand or not held then
	character_message(Character, "Tu dois tenir une pioche en main.");
	return;
end

local artifact_name = artifact_getname(hand, held);

-- Check if artifact can mine.
local power = tonumber(artifact_gettag(hand, held, "mining_power"));
if not power or power < 0 then
	character_message(Character, artifact_name.." n'est pas une pioche.");
	return;
end

-- Get belt.
local belt_slot, belt = loadfile("logic/get_equipment.lua")("belt");
if not belt_slot or not belt then
	character_message(Character, "Tu n'as pas de ceinture ni de quoi transporter du minerai.");
	return;
end

local target_inventory;

local belt_inventory = artifact_gettag(belt_slot, belt, "inventory");
for _, artifact in ipairs(inventory_get_all(belt_inventory)) do
	local target = artifact_gettag(belt_inventory, artifact, "inventory");
	if target and target ~= "" then
		-- if inventory_gettype(target) == "ingredient" and inventory_available(target) > 0 then -- TODO
		if inventory_available(target) > 0 then
			target_inventory = target;
			break;
		end
	end
end

if not target_inventory then
	character_message(Character, "Tu n'as pas de place dans ton inventaire pour du minerai.");
	return;
end

local zone = character_getzone(Character);
local x = character_getx(Character);
local y = character_gety(Character);

local function mine(x, y)
	-- Get hardness.
	local hardness = tonumber(place_gettag(zone, x, y, "mining_hardness"));
	if not hardness then
		return false;
	end

	local ore_name = place_gettag(zone, x, y, "mining_content");

	-- Check hardness.
	if power < hardness then
		character_message(Character, artifact_name.." (force "..power..") ne peut pas miner "..ore_name.." (dureté "..hardness..").");
		return true;
	end

	-- Reduce work.
	local work = tonumber(place_gettag(zone, x, y, "mining_work"));
	if not work then work = 0; end
	if work > 0 then
		work = work-1;
		place_settag(zone, x, y, "mining_work", work);
		zone_event(zone, "*Tink* *Tink* *Tink*");
	end

	if work > 0 then
		return true;
	end

	-- Give ore.
	local quantity = 1;
	local added = create_artifact(target_inventory, ore_name, "ingredient", quantity);
	if added then
		character_message(Character, "Tu obtiens "..quantity.." "..ore_name..".");
	else
		warning("/mine error in inventory prediction.");
		return true;
	end

	-- Reduce block to rubble.
	local tileset = string.match(place_getaspect(zone, x, y), "(.*):.*");
	place_setaspect(zone, x, y, tileset..":rubble");
	place_setpassable(zone, x, y);
	place_deltag(zone, x, y, "mining_hardness");
	place_deltag(zone, x, y, "mining_work");
	place_deltag(zone, x, y, "mining_content");

	return true;
end

if not mine(x, y)
and not mine(x, y-1)
and not mine(x, y+1)
and not mine(x-1, y)
and not mine(x+1, y)
then
	character_message(Character, "Il n'y a rien à /miner ici.");
end
