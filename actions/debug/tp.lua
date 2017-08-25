#!/usr/bin/lua

local screen, x, y = string.match(Arg, "(.*) (.*) (.*)")

player_changescreen(Player, screen, x, y)
