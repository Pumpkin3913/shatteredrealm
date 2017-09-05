#!/usr/bin/lua

local tileset, zone = ...

info("[WORLDGEN] [Demon Castle] Graveyard")

-- North east cube.
loadfile("build/tools/cube.lua")(tileset, zone, 17, 21, 3, 5, 2)

-- North low wall.
for x=6,16 do
	place_setaspect(zone, x, 23, tileset..":roof_horizontal")
	place_setaspect(zone, x, 24, tileset..":wall_bot")
end

-- East low wall.
for y=24,32 do
	place_setaspect(zone, 18, y, tileset..":roof_vertical")
end

-- Sesame door.
loadfile("build/demon/castle/sesame_door.lua")(tileset, zone, 11, 24)

-- One-way exit.
place_setaspect(zone, 17, 31, tileset..":mosaic_a")
place_setlandon(zone, 17, 31, "player_setxy(Player, 19, 31)")

-- Path to book.
for y=25,29 do
	place_setaspect(zone, 11, y, tileset..":path_vertical")
end
local x = 11
local y = 31

place_setaspect(zone, x-1, y-1, tileset..":path_toplft")
place_setaspect(zone, x,   y-1, tileset..":path")
place_setaspect(zone, x+1, y-1, tileset..":path_toprgt")

place_setaspect(zone, x-1, y,   tileset..":path_lft")
place_setaspect(zone, x,   y,   tileset..":book_b_open")
place_setaspect(zone, x+1, y,   tileset..":path_rgt")

place_setaspect(zone, x-1, y+1, tileset..":path_botlft")
place_setaspect(zone, x,   y+1, tileset..":path_bot")
place_setaspect(zone, x+1, y+1, tileset..":path_botrgt")

-- Book of Necromancy.
loadfile("build/tools/book.lua")(tileset, zone, x, y, "close", "b")
place_settag(zone, x, y, "text", "Incantation : Aetheria")
place_settag(zone, x, y, "title", "Grimoire d'Animancie")
place_settag(zone, x, y, "openclose_selfclose", 30)

-- Coffer of skulls.
local function new_skull()
	local id = create_artifact("Crâne")
	artifact_settag(id, "soul_vessel", "empty")
	return id
end

x = 8
y = 31
loadfile("build/tools/coffer.lua")(tileset, zone, x, y, "unique")
place_settag(zone, x, y, "content_artifact_1", new_skull())
place_settag(zone, x, y, "content_artifact_2", new_skull())
place_settag(zone, x, y, "content_artifact_3", "EMPTY")
place_settag(zone, x, y, "content_artifact_4", "EMPTY")

-- Soul-vessel graves.
local function put_cross(x, y, soul)
	place_setaspect(zone, x,  y, tileset..":tombstone_cross")
	place_settag(zone, x, y, "soul_vessel", soul)
end
put_cross(5,  28, "empty")
put_cross(7,  29, "empty")
put_cross(7,  34, "full")
put_cross(9,  26, "empty")
put_cross(10, 28, "full")
put_cross(11, 35, "empty")
put_cross(14, 30, "full")
put_cross(16, 26, "empty")

-- Engraved slabs.
local texts = {
	-- Hints.
	"L'animancie est une branche de nécromancie qui concerne la manipulation des âmes.",
	"Certains lieux et objets, comme les tombes et les crânes, peuvent contenir des âmes.",
	"Il est possible, même sans magie, de /détecter les âmes dans les lieux et les objets.",
	-- Lore.
	"Le Créateur avait instauré des dieux de la mort pour guider les âmes vers la réincarnation.",
	"Le nom du fragment des dieux de la mort a été perdu il y a bien longtemps.",
	"Sans le travail des dieux de la mort, les âmes errent sans but."
}
local function put_slab(x, y)
	place_setaspect(zone, x, y, tileset..":tombstone_slab")
	local text = "Cette stelle est trop abimée."
	if #texts >= 1 then
		text = table.remove(texts, c_rand(#texts))
	end
	place_settag(zone, x, y, "text", text)
end
put_slab(13, 27)
put_slab(6,  31)
put_slab(7,  27)
put_slab(9,  33)
put_slab(13, 32)
put_slab(15, 34)
put_slab(17, 28)
