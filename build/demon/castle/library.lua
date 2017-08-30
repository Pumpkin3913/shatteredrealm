#!/usr/bin/lua

info("[WORLDGEN] [Demon Castle] Library")

local tileset, zone, x_shift, y_shift = ...

local floor0 = "library_0"
local floor1 = "library_1"

local x,y = loadfile("build/tools/building.lua")(tileset, zone, x_shift, y_shift, 11, 8)
loadfile("build/tools/interior.lua")(tileset, floor0, "Library", 13, 10)
loadfile("build/tools/door.lua")(tileset, floor0, 6, 9)
place_setaspect(floor0, 6, 9, tileset..":mosaic_a")
place_setaspect(floor0, 6, 9-1, tileset..":path")
loadfile("build/tools/link.lua")(zone, x, y, floor0, 6, 9)

loadfile("build/tools/interior.lua")(tileset, floor1, "Library", 13, 10)
loadfile("build/tools/door.lua")(tileset, floor0, 6, 1)
loadfile("build/tools/door.lua")(tileset, floor1, 6, 1)
loadfile("build/tools/link.lua")(floor0, 6, 1, floor1, 6, 1)

place_setaspect(floor0, 2,  0, tileset..":wall_window")
place_setaspect(floor0, 2,  8, tileset..":wall_window")
place_setaspect(floor0, 4,  0, tileset..":wall_window")
place_setaspect(floor0, 4,  8, tileset..":wall_window")
-- place_setaspect(floor0, 6,  0, tileset..":wall_window")
-- place_setaspect(floor0, 6,  8, tileset..":wall_window")
place_setaspect(floor0, 8,  0, tileset..":wall_window")
place_setaspect(floor0, 8,  8, tileset..":wall_window")
place_setaspect(floor0, 10, 0, tileset..":wall_window")
place_setaspect(floor0, 10, 8, tileset..":wall_window")
place_setaspect(floor1, 2,  0, tileset..":wall_window")
place_setaspect(floor1, 2,  8, tileset..":wall_window")
place_setaspect(floor1, 4,  0, tileset..":wall_window")
place_setaspect(floor1, 4,  8, tileset..":wall_window")
-- place_setaspect(floor1, 6,  0, tileset..":wall_window")
place_setaspect(floor1, 6,  8, tileset..":wall_window")
place_setaspect(floor1, 8,  0, tileset..":wall_window")
place_setaspect(floor1, 8,  8, tileset..":wall_window")
place_setaspect(floor1, 10, 0, tileset..":wall_window")
place_setaspect(floor1, 10, 8, tileset..":wall_window")

-- Add books in floor 0.

local content = {
	"Magical words are to be /cast, sometimes in specific places.",
	"Some forms of magic require a chalk to /write on walls.",
	"Chalk's writing is easy to /clear.",
	"The Wise knows how to /search, for no treasure is easily given.",
	-- "Each key can only /open and /lock a specific door or coffer.", -- "Did you expect consumable skeleton keys?"
	"Daemons can /drain magical crystals. Fire crystals are the most powerful.",
	"The shards were once one, though the Creator was dissatisfied with its creation.",
	"Shards are the thickness of a shadow away from each other.",
	"Daemons are destined to conquer the shards, by force, cunning and will."
}

local add_book = function(x, y)
	local text = table.remove(content, c_rand(#content))
	local state = "open"; if c_rand(4) == 4 then state = "close" end
	loadfile("build/tools/book.lua")(tileset, floor0, x, y, state)
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
loadfile("build/tools/book.lua")(tileset, floor1, 6, 5, "close", "b")
place_settag(floor1, 6, 5, "text", "Magic Word: Sesame")
