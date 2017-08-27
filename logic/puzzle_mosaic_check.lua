#!/usr/bin/lua

local master_zone, master_x, master_y = ...

local n=1
local tag = place_gettag(master_zone, master_x, master_y, "puzzle_piece_"..n)
while tag ~= "" do
	local zone, x, y = string.match(tag, "(.*)/(.*)-(.*)")

	-- Check if piece N matches its model.
	model = place_gettag(zone, x, y, "puzzle_model")
	tile = string.match(place_getaspect(zone, x, y), ".*:mosaic_(.*)")
	if tile ~= model then
		return -- At least one piece is wrong. Check is negative.
	end

	-- Next piece.
	n = n+1
	tag = place_gettag(master_zone, master_x, master_y, "puzzle_piece_"..n)
end

-- All pieces were right: puzzle complete.
local script = place_gettag(master_zone, master_x, master_y, "puzzle_script")
loadstring(script)()
