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
place_setaspect(floor0, 6, 2, tileset..":stairs_up")
place_setaspect(floor1, 6, 2, tileset..":stairs_down")
loadfile("build/tools/link.lua")(floor0, 6, 2, floor1, 6, 2)

place_setaspect(floor0, 2,  0, tileset..":wall_window")
place_setaspect(floor0, 2,  8, tileset..":wall_window")
place_setaspect(floor0, 4,  0, tileset..":wall_window")
place_setaspect(floor0, 4,  8, tileset..":wall_window")
place_setaspect(floor0, 6,  0, tileset..":wall_window")
-- place_setaspect(floor0, 6,  8, tileset..":wall_window")
place_setaspect(floor0, 8,  0, tileset..":wall_window")
place_setaspect(floor0, 8,  8, tileset..":wall_window")
place_setaspect(floor0, 10, 0, tileset..":wall_window")
place_setaspect(floor0, 10, 8, tileset..":wall_window")
place_setaspect(floor1, 2,  0, tileset..":wall_window")
place_setaspect(floor1, 2,  8, tileset..":wall_window")
place_setaspect(floor1, 4,  0, tileset..":wall_window")
place_setaspect(floor1, 4,  8, tileset..":wall_window")
place_setaspect(floor1, 6,  0, tileset..":wall_window")
place_setaspect(floor1, 6,  8, tileset..":wall_window")
place_setaspect(floor1, 8,  0, tileset..":wall_window")
place_setaspect(floor1, 8,  8, tileset..":wall_window")
place_setaspect(floor1, 10, 0, tileset..":wall_window")
place_setaspect(floor1, 10, 8, tileset..":wall_window")

-- Add books in floor 0.

local content = {
	-- Basic /actions.
	"Les Mots de Pouvoir doivent être /incanter, parfois en des lieux spéficiques.",
	"Certaines formes de magie requièrent une craie pour /écrire sur les murs.",
	"Les écritures à la craie sont faciles à /effacer.",
	"Le sage sait /fouiller, car les trésors ne sont pas donnés aisément.",
	"Les démons peuvent /drainer les cristaux magiques. Les cristaux de feu sont les plus puissants.",
	"Chaque clef ne peut /ouvrir et /verrouiller qu'une porte ou un coffre en particulier.", -- "Est-ce que tu t'attendais à des passe-partout consommables ?"
	"Il y a des coffres dans le donjon où les démons peuvent /prendre et /poser de l'équipement.",
	"Un bon aventurier doit toujours vérifier son /inventaire.",

	-- Lore.
	"Les fragments étaient autrefois un, mais le Créateur fut mécontent de sa création.",
	"Les fragments ne sont séparés les uns des autres que par l'épaisseur d'une ombre.",
	"Ce fragment se nomme Kalzakrax. Il est le plus anciens et a toujours été la demeure des démons.",
	"Il y a d'autres chateau sur Kalzakrax qui peuvent être atteints par des portes magies.",
	"Les plus vieux démons se souviennent de l'époque de la Terre Unifiée.",
	"Il reste des mortels à duper sur les autres fragments. Comment ont-ils survécu aussi longtemps ?",
	"Maintenant que le Créateur nous a abandonnés, nous, démons, pouvons régner sans partage !",
	"Les démons sont destinés à conquérir les fragments, par la force, la ruse et la volonté."
}

local add_book = function(zone, x, y)
	local text = "Ce livre est trop abimé."
	if #content >= 1 then
		text = table.remove(content, c_rand(#content))
	end
	local state = "open"; if c_rand(4) == 4 then state = "close" end
	loadfile("build/tools/book.lua")(tileset, zone, x, y, state)
	place_settag(zone, x, y, "text", text)
end

for x=2,10,2 do
	if x ~= 6 then
		add_book(floor0, x, 3)
		add_book(floor0, x, 6)
		add_book(floor1, x, 3)
		add_book(floor1, x, 6)
	end
end

-- Add a lone magical book on first floor.
loadfile("build/tools/book.lua")(tileset, floor1, 6, 5, "close", "b")
place_settag(floor1, 6, 5, "text", "Incantation: Sésame")
place_settag(floor1, 6, 5, "openclose_selfclose", 30)
