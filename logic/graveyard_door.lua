#!/usr/bin/lua

local screen, x, y = ...

local tileset, tile = string.match(screen_gettile(screen, x, y), "(.*):(.*)")

if tile == "slab_passable" then -- The door is open: close it.
	screen_settile(screen, x, y,   tileset..":pillar_bot")
	screen_settile(screen, x, y-1, tileset..":slab")
else -- The door is closed: open it.
	screen_settile(screen, x, y,   tileset..":slab_passable")
	screen_settile(screen, x, y-1, tileset..":path_vertical")
end
