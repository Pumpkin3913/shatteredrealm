#!/usr/bin/lua

local tileset, screen, x, y = ...

screen_settile(screen, x, y, tileset..":coffer_rare_close")

screen_settag(screen, x, y, "openclose_state", "close")
screen_settag(screen, x, y, "openclose_opentile", tileset..":coffer_rare_open")
screen_settag(screen, x, y, "openclose_closetile", tileset..":coffer_rare_close")
screen_settag(screen, x, y, "content", "chalk")
