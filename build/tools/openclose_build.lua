#!/usr/bin/lua

local zone, x, y, state, tile_open, tile_close, tile_locked, key = ...

local prefix = "openclose_"

local tile
if state == "open" then
	tile = tile_open
elseif state == "close" then
	tile = tile_close
elseif state == "locked" then
	if tile_locked then
		tile = tile_locked
	else
		tile = tile_close
	end
else
	warning("Open-Close state isn't open/close/locked (at "..zone.."/"..x.."-"..y..").")
	return
end

place_setaspect(zone, x, y, tile)
place_settag(zone, x, y, prefix.."state", state)
place_settag(zone, x, y, prefix.."tile_open", tile_open)
place_settag(zone, x, y, prefix.."tile_close", tile_close)
if tile_locked then
	place_settag(zone, x, y, prefix.."tile_locked", tile_locked)
end
if key then
	place_settag(zone, x, y, prefix.."key", key)
end
