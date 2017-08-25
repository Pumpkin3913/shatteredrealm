#!/usr/bin/lua

local zone, x, y = string.match(Arg, "(.*) (.*) (.*)")

player_changezone(Player, zone, x, y)
