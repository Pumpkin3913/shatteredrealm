#!/usr/bin/lua

local tileset = ...
local zone = "forest_southwest"
local w = 19
local h = 19

new_zone(zone, "Forêt", w, h, tileset..":grass_1")

for x=0,w-1 do
	for y=0,h-1 do
		place_setaspect(zone, x, y, tileset..":grass_"..c_rand(4))
	end
end

loadfile("build/tools/forest.lua")(tileset, zone, -1, -1, 2, 7)
loadfile("build/tools/forest.lua")(tileset, zone, -1, 8, 6, 12)
loadfile("build/tools/forest.lua")(tileset, zone, 6, -1, 12, 4)
loadfile("build/tools/forest.lua")(tileset, zone, -1, 16, 11, 19)
loadfile("build/tools/forest.lua")(tileset, zone, 12, 12, 19, 19)
loadfile("build/tools/forest.lua")(tileset, zone, 16, -1, 19, 11)

loadfile("build/tools/forest.lua")(tileset, zone, 9, 8, 11, 10)

-- Patches.
loadfile("build/tools/forest_patch.lua")(tileset, zone, 0, 7, 2, 8)
place_setaspect(zone, 3, 7, tileset..":tree_toprgt")
place_setaspect(zone, 3, 8, tileset..":trees_lft")
loadfile("build/tools/forest_patch.lua")(tileset, zone, 11, 16, 12, 18)
place_setaspect(zone, 11, 16, tileset..":tree_toplft")
loadfile("build/tools/forest_patch.lua")(tileset, zone, 16, 11, 18, 12)
place_setaspect(zone, 16, 11, tileset..":tree_toplft")

place_setaspect(zone, 15, 6, tileset..":tree_toplft")
place_setaspect(zone, 15, 7, tileset..":tree_botlft")
place_setaspect(zone, 16, 6, tileset..":trees_rgt")
place_setaspect(zone, 16, 7, tileset..":trees_lft")

place_setaspect(zone, 6, 15, tileset..":tree_toplft")
place_setaspect(zone, 7, 15, tileset..":tree_toprgt")
place_setaspect(zone, 6, 16, tileset..":trees_rgt")
place_setaspect(zone, 7, 16, tileset..":trees_lft")

place_setaspect(zone, 7,  5, tileset..":tree_botlft")
place_setaspect(zone, 8,  5, tileset..":tree_botrgt")
place_setaspect(zone, 9,  5, tileset..":tree_botlft")
place_setaspect(zone, 10, 5, tileset..":tree_botrgt")
place_setaspect(zone, 7,  4, tileset..":trees_lft")
place_setaspect(zone, 8,  4, tileset..":trees_rgt")
place_setaspect(zone, 9,  4, tileset..":trees_lft")
place_setaspect(zone, 10, 4, tileset..":trees_rgt")

local script = "player_changezone(Player, \"forest_south\", 18, player_gety(Player))"
for y=13,15 do
	place_setlandon(zone, 0, y, script)
end
