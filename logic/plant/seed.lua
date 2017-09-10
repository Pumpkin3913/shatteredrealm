#!/usr/bin/lua

local zone, x, y, name, aspect = ...

-- Check if place is free.
if place_gettag(zone, x, y, "plant_state") ~= "free" then return false; end

-- info("DEBUG PLANT: seeding "..name.." at "..zone.."/"..x.."-"..y);

place_settag(zone, x, y, "plant_state", "seed");
place_settag(zone, x, y, "plant_name", name);
place_settag(zone, x, y, "plant_aspect", aspect);

create_timer(24+c_rand(6), "loadfile(\"logic/plant/grow.lua\")(\""..zone.."\","..x..","..y..")");

return true;
