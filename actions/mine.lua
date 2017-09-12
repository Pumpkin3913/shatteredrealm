#!/usr/bin/lua

-- Get artifact in player's hands.
local artifact = player_gettag(Player, "hand");
if not artifact or artifact == "" or artifact == "EMPTY" then
	player_message(Player, "Tu dois tenir une piochee en main.");
	return;
end

local artifact_name = artifact_getname(artifact);

-- Check if artifact can mine.
local power = tonumber(artifact_gettag(artifact, "mining_power"));
if not power or power < 0 then
	player_message(Player, artifact_name.." n'est pas une pioche.");
	return;
end

-- Check belt.
local belt = player_gettag(Player, "belt");
if not belt or belt == "" or belt == "EMPTY" then
	player_message(Player, "Tu n'as pas de ceinture ni de quoi transporter du minerai.");
	return;
end

-- Get available inventory.
local inventory;
local found = false;
local n = 1;
local container = artifact_gettag(belt, "content_artifact_"..n);
while not found and container and container ~= "" do
	if container ~= "EMPTY" then
		inventory = artifact_gettag(container, "inventory");
		if inventory and inventory ~= "" and inventory_available(inventory) > 0 then
			found = true;
		end
	end
	n = n+1;
	container = artifact_gettag(belt, "content_artifact_"..n);
end

if not found then
	player_message(Player, "Tu n'as pas de place dans ton inventaire pour du minerai.");
	return;
end

local zone = player_getzone(Player);
local x = player_getx(Player);
local y = player_gety(Player);

local function mine(x, y)
	-- Get hardness.
	local hardness = tonumber(place_gettag(zone, x, y, "mining_hardness"));
	if not hardness then
		return false;
	end

	local ore_name = place_gettag(zone, x, y, "mining_content");

	-- Check hardness.
	if power < hardness then
		player_message(Player, artifact_name.." (force "..power..") ne peut pas miner "..ore_name.." (dureté "..hardness..").");
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
	inventory_add(inventory, quantity, ore_name);
	player_message(Player, "Tu obtiens "..quantity.." "..ore_name..".");

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
	player_message(Player, "Il n'y a rien à /miner ici.");
end
