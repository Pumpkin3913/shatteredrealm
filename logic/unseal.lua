#!/usr/bin/lua

local zone, x, y = ...

local tileset = string.match(place_getaspect(zone, x, y), "(.*):.*")
loadfile("build/tools/door.lua")(tileset, zone, x, y)
-- The room behind is already created and the door already linked.

-- Also clear adjacent writings.
place_deltag(zone, x-1, y, "text")
place_deltag(zone, x-1, y, "text_type")
place_deltag(zone, x+1, y, "text")
place_deltag(zone, x+1, y, "text_type")

-- Delayed self-reseal.
create_timer(15, "loadfile(\"logic/reseal.lua\")(\""..zone.."\","..x..","..y..")")
