#!/usr/bin/lua

info("[WORLDGEN] [Demon Castle] Library")

local tileset, zone, x_shift, y_shift = ...

local name = "Bibliothèque"
local floor0 = "library_0"
local floor1 = "library_1"

local x,y = loadfile("build/tools/building.lua")(tileset, zone, x_shift, y_shift, 11, 8)
loadfile("build/tools/interior.lua")(tileset, floor0, name, 13, 10)
loadfile("build/tools/door.lua")(tileset, floor0, 6, 9)
place_setaspect(floor0, 6, 9, tileset..":mosaic_a")
place_setaspect(floor0, 6, 9-1, tileset..":path")
loadfile("build/tools/link.lua")(zone, x, y, floor0, 6, 9)

loadfile("build/tools/interior.lua")(tileset, floor1, name, 13, 10)
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
	"Les Mots de Pouvoir doivent être /incanter, parfois en des lieux spéficiques.",
	"Certaines formes de magie requièrent une craie pour /écrire sur les murs.",
	"Les écritures à la craie sont faciles à /effacer.",
	"Le sage sait /fouiller, car les trésors ne sont pas donnés aisément.",
	-- "Chaque clef ne peut /ouvrir et /verrouiller qu'une porte ou un coffre en particulier.", -- "Est-ce que tu t'attendais à des passe-partout consommables ?"
	"Les démons peuvent /drainer les cristaux magiques. Les cristaux de feu sont les plus puissants.",
	"Les fragments étaient autrefois un, mais le Créateur fut mécontent de sa création.",
	"Les fragments ne sont séparés les uns des autres que par l'épaisseur d'une ombre.",
	"Les démons sont destinés à conquérir les fragments, par la force, la ruse et la volonté."
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
place_settag(floor1, 6, 5, "text", "Mot de Pouvoir: Sésame")
