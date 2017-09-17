#!/usr/bin/lua

local zone, x, y = string.match(Arg, "(.*) (.*) (.*)")

character_changezone(Character, zone, x, y)
