#!/usr/bin/lua

local zone, x, y = ...

-- Check if place is free.
if place_gettag(zone, x, y, "plant_state") ~= "free" then return; end
-- info("DEBUG PLANT: try to regrow at "..zone.."/"..x.."-"..y);

local neighbours = {};
for target_x = x-2,x+2 do
	for target_y = y-2,y+2 do
		if place_gettag(zone, target_x, target_y, "plant_state") == "mature" then
			table.insert(neighbours, {target_x, target_y});
		end
	end
end

-- Check if at least one neighbour is mature.
if #neighbours <= 0 then return; end

-- Select random neighbour.
local dice = c_rand(#neighbours);
local target_x = neighbours[dice][1];
local target_y = neighbours[dice][2];

-- Pull from selected neighbour.
local name = place_gettag(zone, target_x, target_y, "plant_name");
local aspect = place_gettag(zone, target_x, target_y, "plant_aspect");

-- info("DEBUG PLANT: regrow pulling "..name.." from "..zone.."/"..target_x.."-"..target_y);

loadfile("logic/plant/seed.lua")(zone, x, y, name, aspect);
