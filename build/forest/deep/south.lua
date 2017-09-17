#!/usr/bin/lua

local tileset = ...
local zone = "forest_south"
local w = 19
local h = 19

new_zone(zone, "Forêt", w, h, tileset..":grass_1")

for x=0,w-1 do
	for y=0,h-1 do
		place_setaspect(zone, x, y, tileset..":grass_"..c_rand(4))
	end
end

loadfile("build/tools/forest.lua")(tileset, zone, -1, -1, 19, 3)
loadfile("build/tools/forest.lua")(tileset, zone, -1, 4, 3, 12)
loadfile("build/tools/forest.lua")(tileset, zone, 15, 4, 19, 12)
loadfile("build/tools/forest.lua")(tileset, zone, -1, 16, 19, 19)

loadfile("build/tools/forest_patch.lua")(tileset, zone, 0, 3, 3, 4)
place_setaspect(zone, 3, 4, tileset..":tree_botrgt")

loadfile("build/tools/forest_patch.lua")(tileset, zone, 15, 3, 18, 4)
place_setaspect(zone, 14, 3, tileset..":trees_lft")
place_setaspect(zone, 14, 4, tileset..":tree_botlft")

place_setaspect(zone, 3, 10, tileset..":trees_lft")
place_setaspect(zone, 3, 11, tileset..":trees_rgt")
place_setaspect(zone, 4, 10, tileset..":tree_toprgt")
place_setaspect(zone, 4, 11, tileset..":tree_botrgt")

place_setaspect(zone, 14, 9,  tileset..":tree_toplft")
place_setaspect(zone, 14, 10, tileset..":tree_botlft")
place_setaspect(zone, 15, 9,  tileset..":trees_rgt")
place_setaspect(zone, 15, 10, tileset..":trees_lft")


for x=7,10 do
	place_setaspect(zone, x, 3, tileset..":grass_"..c_rand(4))
end
place_setaspect(zone, 7,  2, tileset..":tree_botrgt")
place_setaspect(zone, 8,  2, tileset..":tree_botlft_alive")
place_setaspect(zone, 9,  2, tileset..":tree_botrgt_alive")
place_setaspect(zone, 10, 2, tileset..":tree_botlft")

local script = "character_changezone(Character, \"forest_southwest\", 0, character_gety(Character))"
for y=13,15 do
	place_setlandon(zone, 18, y, script)
end
