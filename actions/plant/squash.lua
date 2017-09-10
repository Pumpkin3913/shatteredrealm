#!/usr/bin/lua

local zone = player_getzone(Player);
local x = player_getx(Player);
local y = player_gety(Player);

-- Check if target is a plant.
if place_gettag(zone, x, y, "plant_state") == "mature" then
	loadfile("logic/plant/destroy.lua")(zone, x, y);
	zone_event(zone, "*Sproutch*")
else
	player_message(Player, "Il n'y a pas de plante ici.");
end
