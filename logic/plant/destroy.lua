#!/usr/bin/lua

local zone, x, y = ...

-- Check if plant is mature.
if place_gettag(zone, x, y, "plant_state") ~= "mature" then return; end

-- info("DEBUG PLANT: destroying at "..zone.."/"..x.."-"..y);

place_settag(zone, x, y, "plant_state", "free");
place_setaspect(zone, x, y, place_gettag(zone, x, y, "plant_grass"));

create_timer(24+c_rand(6), "loadfile(\"logic/plant/regrow.lua\")(\""..zone.."\","..x..","..y..")");
