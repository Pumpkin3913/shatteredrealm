#!/usr/bin/lua

local tileset, zone, x, y = ...

place_setaspect(zone, x-1, y-1, tileset..":roof_endrgt")
place_setaspect(zone, x,   y-1, tileset..":slab")
place_setaspect(zone, x+1, y-1, tileset..":roof_endlft")
place_setaspect(zone, x-1, y,   tileset..":wall_botrgt")
place_setaspect(zone, x,   y,   tileset..":pillar_bot")
place_setaspect(zone, x+1, y,   tileset..":wall_botlft")

-- Add Sesame spell's tags.
local target = zone.."/"..x.."-"..y
place_settag(zone, x, y-2, "sesame", target)
place_settag(zone, x, y-1, "sesame", target)
place_settag(zone, x, y+1, "sesame", target)

-- Add description.
local description = "Ceci est une porte magique. Un sortilège peut l'ouvrir.";
place_settag(zone, x, y,   "description", description);
place_settag(zone, x, y-1, "description", description);
