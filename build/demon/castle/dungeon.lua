#!/usr/bin/lua

info("[WORLDGEN] [Demon Castle] Dungeon")

local tileset, zone, x_shift, y_shift = ...
local name = "Donjon des Démons"
local w = 11
local h = 12

place_setaspect(zone, x_shift+0, y_shift+0, tileset..":roof_toplft")
place_setaspect(zone, x_shift+1, y_shift+0, tileset..":roof_toprgt")
--
--
--
place_setaspect(zone, x_shift+5, y_shift+0, tileset..":roof_toplft")
place_setaspect(zone, x_shift+6, y_shift+0, tileset..":roof_toprgt")

place_setaspect(zone, x_shift+0, y_shift+1, tileset..":roof_botlft")
place_setaspect(zone, x_shift+1, y_shift+1, tileset..":roof_botrgt")
place_setaspect(zone, x_shift+2, y_shift+1, tileset..":roof_top")
place_setaspect(zone, x_shift+3, y_shift+1, tileset..":roof_top")
place_setaspect(zone, x_shift+4, y_shift+1, tileset..":roof_top")
place_setaspect(zone, x_shift+5, y_shift+1, tileset..":roof_botlft")
place_setaspect(zone, x_shift+6, y_shift+1, tileset..":roof_botrgt")

place_setaspect(zone, x_shift+0, y_shift+2, tileset..":wall_botlft")
place_setaspect(zone, x_shift+1, y_shift+2, tileset..":wall_botrgt")
place_setaspect(zone, x_shift+2, y_shift+2, tileset..":roof")
place_setaspect(zone, x_shift+3, y_shift+2, tileset..":roof")
place_setaspect(zone, x_shift+4, y_shift+2, tileset..":roof")
place_setaspect(zone, x_shift+5, y_shift+2, tileset..":wall_botlft")
place_setaspect(zone, x_shift+6, y_shift+2, tileset..":wall_botrgt")

place_setaspect(zone, x_shift+0, y_shift+3, tileset..":roof_lft")
place_setaspect(zone, x_shift+1, y_shift+3, tileset..":roof")
place_setaspect(zone, x_shift+2, y_shift+3, tileset..":roof")
place_setaspect(zone, x_shift+3, y_shift+3, tileset..":roof")
place_setaspect(zone, x_shift+4, y_shift+3, tileset..":roof")
place_setaspect(zone, x_shift+5, y_shift+3, tileset..":roof")
place_setaspect(zone, x_shift+6, y_shift+3, tileset..":roof_rgt")

place_setaspect(zone, x_shift+0, y_shift+4, tileset..":roof_toplft")
place_setaspect(zone, x_shift+1, y_shift+4, tileset..":roof_toprgt")
place_setaspect(zone, x_shift+2, y_shift+4, tileset..":roof")
place_setaspect(zone, x_shift+3, y_shift+4, tileset..":roof")
place_setaspect(zone, x_shift+4, y_shift+4, tileset..":roof")
place_setaspect(zone, x_shift+5, y_shift+4, tileset..":roof_toplft")
place_setaspect(zone, x_shift+6, y_shift+4, tileset..":roof_toprgt")

place_setaspect(zone, x_shift+0, y_shift+5, tileset..":roof_botlft")
place_setaspect(zone, x_shift+1, y_shift+5, tileset..":roof_botrgt")
place_setaspect(zone, x_shift+2, y_shift+5, tileset..":roof")
place_setaspect(zone, x_shift+3, y_shift+5, tileset..":roof")
place_setaspect(zone, x_shift+4, y_shift+5, tileset..":roof")
place_setaspect(zone, x_shift+5, y_shift+5, tileset..":roof_botlft")
place_setaspect(zone, x_shift+6, y_shift+5, tileset..":roof_botrgt")

place_setaspect(zone, x_shift+0, y_shift+6, tileset..":wall_lft")
place_setaspect(zone, x_shift+1, y_shift+6, tileset..":wall_rgt")
place_setaspect(zone, x_shift+2, y_shift+6, tileset..":roof_bot")
place_setaspect(zone, x_shift+3, y_shift+6, tileset..":roof_bot")
place_setaspect(zone, x_shift+4, y_shift+6, tileset..":roof_bot")
place_setaspect(zone, x_shift+5, y_shift+6, tileset..":wall_lft")
place_setaspect(zone, x_shift+6, y_shift+6, tileset..":wall_rgt")

place_setaspect(zone, x_shift+0, y_shift+7, tileset..":wall_lft")
place_setaspect(zone, x_shift+1, y_shift+7, tileset..":wall_window")
place_setaspect(zone, x_shift+2, y_shift+7, tileset..":wall")
place_setaspect(zone, x_shift+3, y_shift+7, tileset..":wall_window")
place_setaspect(zone, x_shift+4, y_shift+7, tileset..":wall")
place_setaspect(zone, x_shift+5, y_shift+7, tileset..":wall_window")
place_setaspect(zone, x_shift+6, y_shift+7, tileset..":wall_rgt")

place_setaspect(zone, x_shift+0, y_shift+8, tileset..":wall_lft")
place_setaspect(zone, x_shift+1, y_shift+8, tileset..":wall")
place_setaspect(zone, x_shift+2, y_shift+8, tileset..":wall")
place_setaspect(zone, x_shift+3, y_shift+8, tileset..":wall")
place_setaspect(zone, x_shift+4, y_shift+8, tileset..":wall")
place_setaspect(zone, x_shift+5, y_shift+8, tileset..":wall")
place_setaspect(zone, x_shift+6, y_shift+8, tileset..":wall_rgt")

place_setaspect(zone, x_shift+0, y_shift+9, tileset..":wall_lft")
place_setaspect(zone, x_shift+1, y_shift+9, tileset..":wall_window")
place_setaspect(zone, x_shift+2, y_shift+9, tileset..":bigdoor_toplft")
place_setaspect(zone, x_shift+3, y_shift+9, tileset..":bigdoor_top")
place_setaspect(zone, x_shift+4, y_shift+9, tileset..":bigdoor_toprgt")
place_setaspect(zone, x_shift+5, y_shift+9, tileset..":wall_window")
place_setaspect(zone, x_shift+6, y_shift+9, tileset..":wall_rgt")

place_setaspect(zone, x_shift+0, y_shift+10, tileset..":wall_botlft")
place_setaspect(zone, x_shift+1, y_shift+10, tileset..":wall_bot_window")
place_setaspect(zone, x_shift+2, y_shift+10, tileset..":bigdoor_lft")
place_setaspect(zone, x_shift+3, y_shift+10, tileset..":bigdoor")
place_setaspect(zone, x_shift+4, y_shift+10, tileset..":bigdoor_rgt")
place_setaspect(zone, x_shift+5, y_shift+10, tileset..":wall_bot_window")
place_setaspect(zone, x_shift+6, y_shift+10, tileset..":wall_botrgt")

-- Floor 0
local floor0 = "demon_dungeon_0"
loadfile("build/tools/interior.lua")(tileset, floor0, name.." : Salle du Trone", w, h)
loadfile("build/tools/door.lua")(tileset, floor0, 5, 11)
place_setaspect(floor0, 5, 11-1, tileset..":path")
place_setaspect(floor0, 5, 11,   tileset..":mosaic_a")
loadfile("build/tools/link.lua")(floor0, 5, 11, zone, x_shift+3, y_shift+10)

place_setaspect(floor0, 2, 0,  tileset..":wall_window")
place_setaspect(floor0, 8, 0,  tileset..":wall_window")
place_setaspect(floor0, 2, 10, tileset..":wall_window")
place_setaspect(floor0, 8, 10, tileset..":wall_window")
loadfile("build/tools/pillar.lua")(tileset, floor0, 2, 5, 2)
loadfile("build/tools/pillar.lua")(tileset, floor0, 2, 8, 2)
loadfile("build/tools/pillar.lua")(tileset, floor0, 8, 5, 2)
loadfile("build/tools/pillar.lua")(tileset, floor0, 8, 8, 2)

for x=4,6 do
	for y=5,7 do
		if (x+y)%2 == 0 then
			place_setaspect(floor0, x, y, tileset..":mosaic_a")
		else
			place_setaspect(floor0, x, y, tileset..":mosaic_b")
		end
	end
end
place_setaspect(floor0, 5, 6, "volcano:mosaic_special")

place_setaspect(floor0, 4, 1, tileset..":throne_toplft")
place_setaspect(floor0, 5, 1, tileset..":throne_top")
place_setaspect(floor0, 6, 1, tileset..":throne_toprgt")

place_setaspect(floor0, 4, 2, tileset..":throne_lft")
place_setaspect(floor0, 5, 2, tileset..":throne")
place_setaspect(floor0, 6, 2, tileset..":throne_rgt")

place_setaspect(floor0, 4, 3, tileset..":throne_botlft")
place_setaspect(floor0, 5, 3, tileset..":throne_bot")
place_setaspect(floor0, 6, 3, tileset..":throne_botrgt")

-- Floor -1
local floor_1 = "demon_dungeon_-1"
loadfile("build/tools/interior.lua")(tileset, floor_1, name.." : Sous-sol", w, h)

place_setaspect(floor_1, 2, 2, tileset..":stairs_up")
place_setaspect(floor0,  2, 2, tileset..":stairs_down")
loadfile("build/tools/link.lua")(floor_1, 2, 2, floor0, 2, 2)

for x=1,w-2 do
	place_setaspect(floor_1, x, 4, tileset..":roof_horizontal")
	place_setaspect(floor_1, x, 5, tileset..":wall_bot")
end
loadfile("build/demon/castle/sesame_door.lua")(tileset, floor_1, 5, 5)

loadfile("build/tools/book.lua")(tileset, floor_1, 3, 8)
place_settag(floor_1, 3, 8, "text", "Le sort de portail requiert d'écrire le nom d'un monde sur une embrasure magique.")
loadfile("build/tools/book.lua")(tileset, floor_1, 7, 8)
place_settag(floor_1, 7, 8, "text", "L'incantation ouvre le portail vers un endroit aléatoire du monde nommé.")

loadfile("build/tools/book.lua")(tileset, floor_1, 5, 8, "close", "b")
place_settag(floor_1, 5, 8, "openclose_selfclose", 30)
place_settag(floor_1, 5, 8, "text", "Incantation: Transfragmentum")
place_settag(floor_1, 5, 8, "text_hint", "/incanter Transfragmentum")
place_settag(floor_1, 5, 8, "text_hint_aspect", tileset..":bigdoor") -- bigdoor open

-- Floor 1
local floor1 = "demon_dungeon_1"
loadfile("build/tools/interior.lua")(tileset, floor1, name.." : Premier étage", w, h)

place_setaspect(floor1, 2, 0,  tileset..":wall_window")
place_setaspect(floor1, 5, 0,  tileset..":wall_window")
place_setaspect(floor1, 8, 0,  tileset..":wall_window")
place_setaspect(floor1, 2, 10, tileset..":wall_window")
place_setaspect(floor1, 5, 10, tileset..":wall_window")
place_setaspect(floor1, 8, 10, tileset..":wall_window")

place_setaspect(floor0, 8, 2, tileset..":stairs_up")
place_setaspect(floor1, 8, 2, tileset..":stairs_down")
loadfile("build/tools/link.lua")(floor0, 8, 2, floor1, 8, 2)

place_setaspect(floor1, 5, 2, tileset..":stairs_up")
place_setaspect(zone, x_shift+3, y_shift+2, tileset..":hatch")
loadfile("build/tools/link.lua")(floor1, 5, 2, zone, x_shift+3, y_shift+2)

place_setaspect(floor1, 3, 4, tileset..":roof_endlft")
place_setaspect(floor1, 4, 4, tileset..":roof_horizontal")
place_setaspect(floor1, 5, 4, tileset..":roof_horizontal")
place_setaspect(floor1, 6, 4, tileset..":roof_horizontal")
place_setaspect(floor1, 7, 4, tileset..":roof_endrgt")
place_setaspect(floor1, 3, 5, tileset..":wall_lft")
place_setaspect(floor1, 7, 5, tileset..":wall_rgt")
place_setaspect(floor1, 3, 6, tileset..":wall_botlft")
place_setaspect(floor1, 7, 6, tileset..":wall_botrgt")
loadfile("build/tools/door.lua")(tileset, floor1, 5, 6)

place_setaspect(floor1, 5, 6, tileset..":wall_bot_written");
place_settag(floor1, 5, 6, "text", "Kalzarak") -- Intentionally misspell.
place_settag(floor1, 5, 6, "text_type", "chalk") -- Intentionally misspell.
place_setaspect(floor1, 5, 7, tileset..":mosaic_b")
place_settag(floor1, 5, 7, "portal", "true") -- Intentionally misspell.

local function add_stash(x, y)
	loadfile("build/tools/coffer.lua")(tileset, floor1, x, y, "hard")
	loadfile("build/tools/give_empty_inventory.lua")(floor1, x, y, 2)
end
add_stash(2, 8)
add_stash(4, 9)
add_stash(6, 9)
add_stash(8, 8)
