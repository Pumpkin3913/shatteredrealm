#!/usr/bin/lua

local master_zone, master_x, master_y = ...

local n=1
local tag = place_gettag(master_zone, master_x, master_y, "puzzle_piece_"..n)
while tag ~= "" do
	local zone, x, y = string.match(tag, "(.*)/(.*)-(.*)")

	-- Reset piece.
	local init = place_gettag(zone, x, y, "puzzle_init")
	if init and init ~= "" then
		local tileset = string.match(place_getaspect(zone, x, y), "(.*):.*")
		place_setaspect(zone, x, y, tileset..":mosaic_"..init)
	end

	-- Next piece.
	n = n+1
	tag = place_gettag(master_zone, master_x, master_y, "puzzle_piece_"..n)
end
