#!/usr/bin/lua

local zone = player_getzone(Player);
local p_x = player_getx(Player);
local p_y = player_gety(Player);

-- Check argument.
local seed = Arg;
if not seed or seed == "" then
	player_message(Player, "Tu dois préciser le nom de la graine que tu veux planter.");
	return;
end

-- Get artifact in player's hands.
local artifact = player_gettag(Player, "hand");
if not artifact or artifact == "" or artifact == "EMPTY" then
	player_message(Player, "Tu dois tenir ce qui contient ce que tu veux /semer.");
	return;
end

-- Get inventory from artifact.
local inventory = artifact_gettag(artifact, "inventory");
if not inventory or inventory == "" then
	player_message(Player, "L'objet tenu en main n'est pas un conteneur.");
	return;
end

-- Get available seeds.
local quantity = inventory_get(inventory, seed);
if quantity <= 0 then
	player_message(Player, "Il n'y a pas de "..seed.." dans "..artifact_getname(artifact)..".");
	return;
end

-- Get plant from seed.
local name;
local aspect;
-- TODO: use server_gettag() to retrieve seed-plant link.
if seed ~= "Spore rouge" then
	player_message(Player, seed.." ne poussera pas.");
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
	player_message(Player, seed.." ne peut pas être planté ici.");
elseif n == 1 then
	player_message(Player, n.." "..seed.." prend racine.");
else
	player_message(Player, n.." "..seed.." prennent racine.");
end
