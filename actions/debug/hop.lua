#!/usr/bin/lua

local target = "mossy_cave"
local file = "build/demon/lavacave/mossy_cave.lua"

character_changezone(Character, "lobby", 0, 0)
-- delete_zone(target)
dofile(file)
character_changezone(Character, target, 31, 16)
