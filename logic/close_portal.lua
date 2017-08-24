#!/usr/bin/lua

local tileset, screen, x, y = ...

screen_settile(screen, x-1, y-1, tileset..":wall")
screen_settile(screen, x,   y-1, tileset..":wall")
screen_settile(screen, x+1, y-1, tileset..":wall")
screen_settile(screen, x-1, y,   tileset..":wall_bot")
screen_settile(screen, x,   y,   tileset..":wall_bot")
screen_settile(screen, x+1, y,   tileset..":wall_bot")

screen_deltag(screen, x, y, "openclose_state")
screen_deltag(screen, x, y, "openclose_opentile")
screen_deltag(screen, x, y, "openclose_closetile")
screen_deltag(screen, x, y, "openclose_closetrigger")
screen_resetlandon(screen, x, y)
