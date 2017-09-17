#!/usr/bin/lua

local zone = character_getzone(Character);
local x = character_getx(Character);
local y = character_gety(Character);

-- Check if target is a plant.
if place_gettag(zone, x, y, "plant_state") == "mature" then
	loadfile("logic/plant/destroy.lua")(zone, x, y);
	zone_event(zone, "*Sproutch*")
else
	character_message(Character, "Il n'y a pas de plante ici.");
end
