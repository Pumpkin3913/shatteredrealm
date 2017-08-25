#!/usr/bin/lua

local zone, x, y = ...

local tileset = string.match(zone_gettile(zone, x, y), "(.*):.*")
loadfile("build/tools/door.lua")(tileset, zone, x, y)
-- The room behind is already created and the door already linked.

-- TODO: add a delayed script to turn the door back into wall with a sealed writing.
