#!/usr/bin/lua

local target = "mossy_cave"
local file = "build/demon/lavacave/mossy_cave.lua"

player_changezone(Player, "lobby", 0, 0)
-- delete_zone(target)
dofile(file)
player_changezone(Player, target, 31, 16)
