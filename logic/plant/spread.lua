#!/usr/bin/lua

local zone, x, y = ...

-- Check if plant is mature.
if place_gettag(zone, x, y, "plant_state") ~= "mature" then return; end

local name = place_gettag(zone, x, y, "plant_name");
local aspect = place_gettag(zone, x, y, "plant_aspect");

-- info("DEBUG PLANT: spreading "..name.." from "..zone.."/"..x.."-"..y);

for target_x = x-2,x+2 do
	for target_y = y-2,y+2 do
		loadfile("logic/plant/seed.lua")(zone, target_x, target_y, name, aspect);
	end
end
