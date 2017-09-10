#!/usr/bin/lua

local zone, x, y, name, aspect = ...

place_settag(zone, x, y, "plant_grass", place_getaspect(zone, x, y));

if not name or not aspect then
	place_settag(zone, x, y, "plant_state", "free");
else
	place_settag(zone, x, y, "plant_state", "mature");
	place_settag(zone, x, y, "plant_name", name);
	place_settag(zone, x, y, "plant_aspect", aspect);
	place_setaspect(zone, x, y, aspect);
end
