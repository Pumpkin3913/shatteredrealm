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

-- Get artifact in character's hands.
local artifact = character_gettag(Character, "hand");
if not artifact or artifact == "" or artifact == "EMPTY" then
	character_message(Character, "Tu dois tenir ce qui contient ce que tu veux /semer.");
	return;
end

-- Get inventory from artifact.
local inventory = artifact_gettag(artifact, "inventory");
if not inventory or inventory == "" then
	character_message(Character, "L'objet tenu en main n'est pas un conteneur.");
	return;
end

-- Get available seeds.
local quantity = inventory_get(inventory, seed);
if quantity <= 0 then
	character_message(Character, "Il n'y a pas de "..seed.." dans "..artifact_getname(artifact)..".");
	return;
end

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

local n = 0;
for x = p_x-1,p_x+1 do
	for y = p_y-1,p_y+1 do
		if quantity > 0 and place_gettag(zone, x, y, "plant_state") == "free" then;
			loadfile("logic/plant/seed.lua")(zone, x, y, name, aspect);
			n = n+1;
			quantity = quantity-1;
			inventory_del(inventory, 1, seed);
		end
	end
end

if n == 0 then
	character_message(Character, seed.." ne peut pas être planté ici.");
elseif n == 1 then
	character_message(Character, n.." "..seed.." prend racine.");
else
	character_message(Character, n.." "..seed.." prennent racine.");
end
