#!/usr/bin/lua

local zone, x, y, slave_zone, slave_x, slave_y, slave_n, tile_open, tile_close, tile_locked = ...

local prefix = "openclose_"

if not tile_open then
	tile_open = place_gettag(zone, x, y, prefix.."tile_open")
end
if not tile_close then
	tile_close = place_gettag(zone, x, y, prefix.."tile_close")
end
local state = place_gettag(zone, x, y, prefix.."state")

local tile
if state == "open" then
	tile = tile_open
elseif state == "close" then
	tile = tile_close
elseif state == "locked" then
	if tile_locked and tile_locked ~= "" then
		tile = tile_locked
	else
		tile = tile_close
	end
else
	warning("Invalid open/close state at "..zone.."/"..x.."-"..y..".")
	return
end

place_setaspect(slave_zone, slave_x, slave_y, tile)
place_settag(slave_zone, slave_x, slave_y, prefix.."tile_open", tile_open)
place_settag(slave_zone, slave_x, slave_y, prefix.."tile_close", tile_close)
if tile_locked then
	place_settag(slave_zone, slave_x, slave_y, prefix.."tile_locked", tile_locked)
end
place_settag(slave_zone, slave_x, slave_y, prefix.."master", zone.."/"..x.."-"..y)

place_settag(zone, x, y, prefix.."slave_"..slave_n, slave_zone.."/"..slave_x.."-"..slave_y)
