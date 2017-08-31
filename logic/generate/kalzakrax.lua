#!/usr/bin/lua

local zone, x, y = ...

zone_event(zone, "...")

local id = "kalzakrax_"..c_rand(999999) -- TODO: request UUID.
local name = "Kalzakrax"
local tileset = "redruins"

new_zone(id, name, 20, 20, tileset..":soil_a")
place_setaspect(id, 10, 10, tileset..":mosaic_a")

loadfile("build/tools/link.lua")(zone, x, y, id, 10, 10)

return id
