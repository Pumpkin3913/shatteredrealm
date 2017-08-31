#!/usr/bin/lua

local zone, x, y = ...

zone_event(zone, "La chaleur et les odeurs de soufre émanent du portail !")

local id = "ashflame_"..c_rand(999999) -- TODO: request UUID.
local name = "Ashflame Range"
local tileset = "volcano"

new_zone(id, name, 20, 20, tileset..":roof")
place_setaspect(id, 10, 10, tileset..":mosaic_a")

loadfile("build/tools/link.lua")(zone, x, y, id, 10, 10)

return id
