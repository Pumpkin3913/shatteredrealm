#!/usr/bin/lua

local zone = player_getzone(Player)
local x = player_getx(Player)
local y = player_gety(Player)
player_message(Player, zone.." "..x.." "..y)
