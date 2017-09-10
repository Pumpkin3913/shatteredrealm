#!/usr/bin/lua

local zone, x, y = ...

-- Check if seed.
if place_gettag(zone, x, y, "plant_state") ~= "seed" then return; end

-- info("DEBUG PLANT: growing at "..zone.."/"..x.."-"..y);

place_settag(zone, x, y, "plant_state", "mature");
place_setaspect(zone, x, y, place_gettag(zone, x, y, "plant_aspect"));

create_timer(24+c_rand(6), "loadfile(\"logic/plant/spread.lua\")(\""..zone.."\","..x..","..y..")");
