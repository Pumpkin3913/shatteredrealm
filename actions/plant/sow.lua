#!/usr/bin/lua

local zone = character_getzone(Character);
local p_x = character_getx(Character);
local p_y = character_gety(Character);

-- Check argument.
local seed = Arg;
if not seed or seed == "" then
	character_message(Character, "Tu dois préciser le nom de la graine que tu veux planter.");
	return;
end

local inventory, artifact = loadfile("logic/recursive_inventory_search.lua")(seed);
if not inventory or not artifact then
	character_message(Character, "Il n'y a pas de "..seed.." dans ton inventaire.");
	return;
end
local quantity = artifact_getquantity(inventory, artifact);

-- TODO: REVAMP

-- Get plant from seed.
local name;
local aspect;
-- TODO: use server_gettag() to retrieve seed-plant link.
if seed ~= "Spore rouge" then
	character_message(Character, seed.." ne poussera pas.");
	return;
end
name = "Amanite";
aspect = "forest_underground:plant_1";

-- TODO: check plant-to-grass compatibility. (Compare tilesets?)

local count = 0;
for x = p_x-1,p_x+1 do
	for y = p_y-1,p_y+1 do
		if quantity > 0 and place_gettag(zone, x, y, "plant_state") == "free" then;
			loadfile("logic/plant/seed.lua")(zone, x, y, name, aspect);
			count = count+1;
			quantity = quantity-1;
			delete_artifact(inventory, artifact, 1);
		end
	end
end

if count == 0 then
	character_message(Character, seed.." ne peut pas être planté ici.");
elseif count == 1 then
	character_message(Character, count.." "..seed.." prend racine.");
else
	character_message(Character, count.." "..seed.." prennent racine.");
end
