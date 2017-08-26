#!/usr/bin/lua

local tileset, zone, x_shift, y_shift = ...

local floor0 = "library_0"
local floor1 = "library_1"

local x,y = loadfile("build/tools/building.lua")(tileset, zone, x_shift, y_shift, 11, 8)
loadfile("build/tools/interior.lua")(tileset, floor0, "Library", 13, 10)
loadfile("build/tools/doorway.lua")(tileset, floor0, 6, 9)
loadfile("build/tools/link.lua")(zone, x, y, floor0, 6, 9)

loadfile("build/tools/interior.lua")(tileset, floor1, "Library", 13, 10)
loadfile("build/tools/door.lua")(tileset, floor0, 6, 1)
loadfile("build/tools/door.lua")(tileset, floor1, 6, 1)
loadfile("build/tools/link.lua")(floor0, 6, 1, floor1, 6, 1)
-- TODO: add internal windows corresponding to the external ones.

-- Add books in floor 0.

local content = {
	"Some Magical Words are to be /cast in specific places.",
	"Some Magical Words are to be /write with a chalk on a wall.",
	"Chalk's writing is easy to /clear.",
	"The Wise knows how to /search, for no treasure is given by Destiny.",
	-- "Each key can only /open and /lock a specific door or coffer.", -- "Did you expect consumable skeleton keys?"
	"Daemons can /drain magical crystals.", -- XXX
	"The shards were once one, though the Creator was dissatisfied with its creation.",
	"Shards are the thickness of a shadow away from each other.",
	"Daemons are destined to conquer the shards, by force, cunning and will."
}

local add_book = function(x, y)
	local text = table.remove(content, c_rand(#content))
	local state = "open"; if c_rand(4) == 4 then state = "close" end
	place_setaspect(floor0, x, y, tileset..":book_a_"..state)
	place_settag(floor0, x, y, "openclose_state", state)
	place_settag(floor0, x, y, "openclose_opentile", tileset..":book_a_open")
	place_settag(floor0, x, y, "openclose_closetile", tileset..":book_a_close")
	place_settag(floor0, x, y, "text", text)
end

add_book(2, 3)
add_book(2, 6)
add_book(4, 3)
add_book(4, 6)
add_book(8, 3)
add_book(8, 6)
add_book(10, 3)
add_book(10, 6)

-- Add a lone magical book on first floor.
place_setaspect(floor1, 6, 5, tileset..":book_b_close")
place_settag(floor1, 6, 5, "openclose_state", "close")
place_settag(floor1, 6, 5, "openclose_opentile", tileset..":book_b_open")
place_settag(floor1, 6, 5, "openclose_closetile", tileset..":book_b_close")
place_settag(floor1, 6, 5, "title", "Tome of Dark Magic")
place_settag(floor1, 6, 5, "text", "Sesame")

info("[WORLDGEN] Library build in "..zone..".");
