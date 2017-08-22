#!/usr/bin/lua

local tileset, screen, x_shift, y_shift = ...

local floor0 = "library_0"
local floor1 = "library_1"

local x,y = loadfile("build/tools/building.lua")(tileset, screen, x_shift, y_shift, 11, 8)
loadfile("build/tools/interior.lua")(tileset, floor0, "Library", 13, 10)
loadfile("build/tools/doorway.lua")(tileset, floor0, 6, 9)
loadfile("build/tools/link.lua")(screen, x, y, floor0, 6, 9)

loadfile("build/tools/interior.lua")(tileset, floor1, "Library", 13, 10)
loadfile("build/tools/door.lua")(tileset, floor0, 6, 1)
loadfile("build/tools/door.lua")(tileset, floor1, 6, 1)
loadfile("build/tools/link.lua")(floor0, 6, 1, floor1, 6, 1)
-- TODO: add internal windows corresponding to the external ones.

-- Add books in floor 0.
local add_book = function(x, y, text)
	screen_settile(floor0, x, y, tileset..":book_a_open")
	screen_settag(floor0, x, y, "openclose_state", "open")
	screen_settag(floor0, x, y, "openclose_opentile", tileset..":book_a_open")
	screen_settag(floor0, x, y, "openclose_closetile", tileset..":book_a_close")
	screen_settag(floor0, x, y, "text", text)
end

add_book(2, 3, "Blabla")
add_book(2, 6, "Blabla")

add_book(4, 3, "Blabla")
add_book(4, 6, "Blabla")

add_book(8, 3, "Blabla")
add_book(8, 6, "Blabla")

add_book(10, 3, "Blabla")
add_book(10, 6, "Blabla")

-- Add a lone magical book on first floor.
screen_settile(floor1, 6, 5, tileset..":book_b_close")
screen_settag(floor1, 6, 5, "openclose_state", "close")
screen_settag(floor1, 6, 5, "openclose_opentile", tileset..":book_b_open")
screen_settag(floor1, 6, 5, "openclose_closetile", tileset..":book_b_close")
screen_settag(floor1, 6, 5, "text", "Elbereth")

verbose("[WORLDGEN] Library build in "..screen..".");
