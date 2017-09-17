#!/usr/bin/lua

local zone = character_getzone(Character)
local x = character_getx(Character)
local y = character_gety(Character)
character_message(Character, zone.." "..x.." "..y)
