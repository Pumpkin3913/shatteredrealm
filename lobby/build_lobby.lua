#!/usr/bin/lua

local zone = "lobby"
local w = 31
local h = 31

info("[WORLDGEN] Lobby")

new_zone(zone, "Lobby", w, h, "void")

-- Tutorial

local x = 16
local y = 20
place_setaspect(zone, x, y, "violetcastle:mosaic_a")
local tuto_zone, tuto_x, tuto_y = loadfile("lobby/build_tutorial.lua")(zone, x, y)
place_setlandon(zone, x, y, "player_changezone(Player, \""..tuto_zone.."\", "..tuto_x..", "..tuto_y..")")

-- Start choices

local function build_choice(x, y, tileset, name, id, dummy)
	local x, y = loadfile("build/tools/building.lua")(tileset, zone, x, y, 5)
	place_setlandon(zone, x, y, "dofile(\"lobby/choice_"..id..".lua\")")
	place_setaspect(zone, x-1, y+2, dummy)
	place_setnotpassable(zone, x-1, y+2)
	place_setaspect(zone, x+1, y+2, tileset..":book_a_open")
	place_settag(zone, x+1, y+2, "text", name)
end

local function build_choice_tree(x, y, tileset, name, id, dummy)
	place_setaspect(zone, x,   y,   tileset..":tree_toplft")
	place_setaspect(zone, x+1, y,   tileset..":tree_toprgt")
	place_setaspect(zone, x+2, y,   tileset..":grass_1")
	place_setaspect(zone, x+3, y,   tileset..":tree_toplft")
	place_setaspect(zone, x+4, y,   tileset..":tree_toprgt")

	place_setaspect(zone, x,   y+1, tileset..":tree_botlft")
	place_setaspect(zone, x+1, y+1, tileset..":trees_lft")
	place_setaspect(zone, x+2, y+1, tileset..":tree_door_top")
	place_setaspect(zone, x+3, y+1, tileset..":trees_rgt")
	place_setaspect(zone, x+4, y+1, tileset..":tree_botrgt")

	place_setaspect(zone, x,   y+2, tileset..":grass_2")
	place_setaspect(zone, x+1, y+2, tileset..":tree_botlft")
	place_setaspect(zone, x+2, y+2, tileset..":tree_door")
	place_setaspect(zone, x+3, y+2, tileset..":tree_botrgt")
	place_setaspect(zone, x+4, y+2, tileset..":grass_3")

	place_setlandon(zone, x+2, y+2, "dofile(\"lobby/choice_"..id..".lua\")")
	-- place_setaspect(zone, x-1, y+2, dummy)
	-- place_setnotpassable(zone, x-1, y+2)
	-- place_setaspect(zone, x+1, y+2, tileset..":book_a_open")
	-- place_settag(zone, x+1, y+2, "text", name)
end

build_choice(0, 1, "redruins", "Démon", "demon", "demon_trident_flame_wings")
build_choice_tree(7, 5, "forest", "Sylvain", "tree", "???")
build_choice_tree(7, 1, "forest_corrupted", "Sylvain Corrompu", "tree_corrupted", "???")
build_choice(14, 1, "violetcastle", "Humain", "human", "white_armor", "closed")

-- Shortcut demon.
place_setaspect(zone, 16, 14, "redruins:mosaic_white")
place_setlandon(zone, 16, 14, "dofile(\"lobby/choice_demon.lua\")")

-- Shortcut power-demon.
place_setaspect("lobby", 16, 12, "redruins:mosaic_white")
place_setlandon("lobby", 16, 12, "\
	player_settag(Player, \"race\", \"demon\")\
	player_setaspect(Player, \"demon\")\
	new_gauge(Player, \"mana\", 10, 10, \"star\", \"star_empty\")\
	player_settag(Player, \"have chalk\", \"true\")\
	player_changezone(Player, \"demon_dungeon_0\", 5, 6)\
")

-- Shortcut lavacave.
place_setaspect(zone, 20, 16, "volcano:mosaic_white")
place_setlandon(zone, 20, 16, "player_changezone(Player, \"ritual_cave\", 11, 29)")
