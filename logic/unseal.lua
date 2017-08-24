#!/usr/bin/lua

local screen, x, y = ...

local tileset = string.match(screen_gettile(screen, x, y), "(.*):.*")
loadfile("build/tools/door.lua")(tileset, screen, x, y)
-- The room behind is already created and the door already linked.

-- TODO: add a delayed script to turn the door back into wall with a sealed writing.
