#!/usr/bin/lua

local zone, x, y = ...

local tileset, n = string.match(place_getaspect(zone, x, y), "(.*):crystal_(.*)")

if not tileset then
	warning("Cannot increase crystal at "..zone.." "..x.." "..y)
	return
end

n = tonumber(n)
if n < 7 then
	n = n+1
	if n == 3 or n == 5 then n = n+1 end
	place_setaspect(zone, x, y, tileset..":crystal_"..n)
	loadfile("logic/puzzle_mosaic_reset.lua")(zone, x, y)
end
