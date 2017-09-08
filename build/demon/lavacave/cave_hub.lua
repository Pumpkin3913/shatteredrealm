#!/usr/bin/lua

info("[WORLDGEN] [Lava Cave] Cave Hub")

local zone = "cave_hub"
local tileset = "volcano"

local w = 23
local h = 19

local target_zone, target_x, target_y

new_zone(zone, "Croisée des Grottes", w, h, tileset..":roof")

-- Randomize soil.
for x=0,w-1 do
	for y=0,h-1 do
		if c_rand(100) > 10 then
			-- Nothing.
		else
			place_setaspect(zone, x, y, tileset..":roof_rare_"..c_rand(4))
		end
	end
end

place_setaspect(zone, 12, 3, tileset..":block_"..c_rand(4))
place_setaspect(zone, 13, 6, tileset..":block_"..c_rand(4))

-- North pass to Old Forge.
loadfile("build/tools/bluff.lua")(tileset, zone, 11, 0, 3, 2, -1, "noleft")
loadfile("build/tools/bluff.lua")(tileset, zone, 15, 0, 2, 2, -1, "noright")
target_zone, target_x, target_y = loadfile("build/demon/lavacave/old_forge.lua")()
loadfile("build/tools/link.lua")(zone, 14, 0, target_zone, target_x, target_y)

-- East door to Portal Cave.
loadfile("build/tools/bluff.lua")(tileset, zone, 17, 0, 4, 3, 0, "noright")
loadfile("build/tools/bluff.lua")(tileset, zone, 21, 1, 2, 4, 1, "noright")
place_setaspect(zone, 21, 0, tileset..":roof_angle_toprgt")
loadfile("build/tools/door.lua")(tileset, zone, 19, 2)
target_zone, target_x, target_y = dofile("build/demon/lavacave/portal_cave.lua")
loadfile("build/tools/link.lua")(zone, 19, 2, target_zone, target_x, target_y)

-- West pass.
loadfile("build/tools/cube.lua")(tileset, zone, 0, 0, 3, 5, 2)
loadfile("build/tools/cube.lua")(tileset, zone, 0, 6, 4, 5, 2)
loadfile("build/tools/cube.lua")(tileset, zone, 3, 0, 8, 5, 3)
place_setaspect(zone, 4, 3, tileset..":roof_bot_climb"); place_setpassable(zone, 4, 3)
place_setaspect(zone, 4, 4, tileset..":wall_bot_climb"); place_setpassable(zone, 4, 4)
place_setaspect(zone, 6, 3, tileset..":roof_bot_decorated")
place_setaspect(zone, 6, 4, tileset..":wall_bot_decorated")
place_setaspect(zone, 8, 3, tileset..":roof_bot_climb"); place_setpassable(zone, 8, 3)
place_setaspect(zone, 8, 4, tileset..":wall_bot_climb"); place_setpassable(zone, 8, 4)

place_setaspect(zone, 6, 5, tileset..":misc_3") -- misc_3 = fire floor.
place_setpassable(zone, 6, 5)
-- TODO: do walkon damages.

loadfile("build/tools/bluff.lua")(tileset, zone, 4, 6, 7, 2, 0, "noleft,noright")
place_setaspect(zone, 6, 6, tileset..":roof_bot_decorated")
place_setaspect(zone, 6, 7, tileset..":wall_bot_decorated")

loadfile("build/tools/bluff.lua")(tileset, zone, 11, 7, 5, 3, 1)
place_setaspect(zone, 11, 6, tileset..":roof_angle_toprgt")
place_setaspect(zone, 15, 7, tileset..":roof_angle_toplft")
place_setaspect(zone, 13, 8, tileset..":roof_bot_climb"); place_setpassable(zone, 13, 8)
place_setaspect(zone, 13, 9, tileset..":wall_bot_climb"); place_setpassable(zone, 13, 9)

target_zone, target_x, target_y = dofile("build/demon/lavacave/lava_challenge.lua")
loadfile("build/tools/link.lua")(zone, 0, 5, target_zone, target_x, target_y)

-- South mossy plateau.
loadfile("build/tools/bluff.lua")(tileset, zone, 0, 11, 5, 8, 6, "noright,nobottom")
place_setaspect(zone, 5, 17, tileset..":roof_angle_toprgt")
place_setaspect(zone, 5, 18, tileset..":roof_lft")

loadfile("build/tools/bluff.lua")(tileset, zone, 8, 13, 4, 6, 4, "noleft,nobottom")
place_setaspect(zone, 7, 17, tileset..":roof_angle_toplft")
place_setaspect(zone, 7, 18, tileset..":roof_rgt")

loadfile("build/tools/bluff.lua")(tileset, zone, 12, 10, 4, 9, 2, "noleft")
place_setaspect(zone, 11, 12, tileset..":roof_angle_toplft")

local moss_tileset = "forest_underground"
local function moss_transition(x, y, w, h)
	place_setaspect(zone, x,     y,     moss_tileset..":grass_toplft")
	place_setaspect(zone, x+w-1, y,     moss_tileset..":grass_toprgt")
	place_setaspect(zone, x,     y+h-1, moss_tileset..":grass_botlft")
	place_setaspect(zone, x+w-1, y+h-1, moss_tileset..":grass_botrgt")
	for i=x+1,x+w-2 do
		place_setaspect(zone, i, y,     moss_tileset..":grass_top")
		place_setaspect(zone, i, y+h-1, moss_tileset..":grass_bot")
	end
	for j=y+1,y+h-2 do
		place_setaspect(zone, x,     j, moss_tileset..":grass_lft")
		place_setaspect(zone, x+w-1, j, moss_tileset..":grass_rgt")
	end
end

moss_transition(6, 9, 3, 3)
place_setaspect(zone, 7, 10, moss_tileset..":rock_"..c_rand(4))

moss_transition(7, 13, 4, 4)
place_setaspect(zone, 8, 14, moss_tileset..":tree_toplft")
place_setaspect(zone, 9, 14, moss_tileset..":tree_toprgt")
place_setaspect(zone, 8, 15, moss_tileset..":tree_botlft")
place_setaspect(zone, 9, 15, moss_tileset..":tree_botrgt")

moss_transition(1, 12, 4, 4)
moss_transition(2, 13, 4, 4)
place_setaspect(zone, 4, 13, moss_tileset..":grass_angle_botlft")
place_setaspect(zone, 2, 15, moss_tileset..":grass_angle_toprgt")

place_setaspect(zone, 2, 13, moss_tileset..":tree_toplft")
place_setaspect(zone, 3, 13, moss_tileset..":tree_toprgt")
place_setaspect(zone, 2, 14, moss_tileset..":tree_botlft")
place_setaspect(zone, 3, 14, moss_tileset..":trees_lft")
place_setaspect(zone, 4, 14, moss_tileset..":tree_toprgt")
place_setaspect(zone, 3, 15, moss_tileset..":tree_botlft")
place_setaspect(zone, 4, 15, moss_tileset..":tree_botrgt")

target_zone, target_x, target_y = dofile("build/demon/lavacave/mossy_cave.lua")
loadfile("build/tools/link.lua")(zone, 6, 18, target_zone, target_x, target_y)

-- Down way: first cliff.
loadfile("build/tools/bluff.lua")(tileset, zone, 16, 6, 1, 4, 1, "noleft")
place_setaspect(zone, 16, 5, tileset..":roof_angle_toplft")
loadfile("build/tools/bluff.lua")(tileset, zone, 17, 5, 4, 3, 0, "noleft,noright")
place_setaspect(zone, 18, 5, tileset..":roof_bot_climb"); place_setpassable(zone, 18, 5)
place_setaspect(zone, 18, 6, tileset..":wall_climb"); place_setpassable(zone, 18, 6)
place_setaspect(zone, 18, 7, tileset..":wall_bot_climb"); place_setpassable(zone, 18, 7)
loadfile("build/tools/bluff.lua")(tileset, zone, 21, 6, 2, 4, 1, "noright")
place_setaspect(zone, 21, 5, tileset..":roof_angle_toprgt")

-- Down way: second cliff.
loadfile("build/tools/bluff.lua")(tileset, zone, 16, 12, 2, 2, 0, "noleft")
place_setaspect(zone, 17, 11, tileset..":roof_angle_toplft")
place_setaspect(zone, 18, 10, tileset..":roof_angle_toplft")
place_setaspect(zone, 18, 11, tileset..":roof_botrgt")
place_setaspect(zone, 18, 12, tileset..":wall_botrgt")
place_setaspect(zone, 19, 10, tileset..":roof_bot_climb"); place_setpassable(zone, 19, 10)
place_setaspect(zone, 19, 11, tileset..":wall_bot_climb"); place_setpassable(zone, 19, 11)
place_setaspect(zone, 20, 10, tileset..":roof_angle_toprgt")
loadfile("build/tools/bluff.lua")(tileset, zone, 20, 11, 2, 3, 1, "noright")
loadfile("build/tools/bluff.lua")(tileset, zone, 22, 10, 1, 6, 2, "noleft")

-- Down way: third cliff.
place_setaspect(zone, 16, 15, tileset..":roof_bot")
place_setaspect(zone, 16, 16, tileset..":wall_bot")
place_setaspect(zone, 17, 15, tileset..":roof_angle_toprgt")
place_setaspect(zone, 17, 16, tileset..":roof_botlft")
place_setaspect(zone, 17, 17, tileset..":wall_botlft")
place_setaspect(zone, 18, 16, tileset..":roof_bot")
place_setaspect(zone, 18, 17, tileset..":wall_bot")
place_setaspect(zone, 19, 15, tileset..":roof_angle_toplft")
place_setaspect(zone, 19, 16, tileset..":roof_botrgt")
place_setaspect(zone, 19, 17, tileset..":wall_botrgt")
place_setaspect(zone, 20, 15, tileset..":roof_bot")
place_setaspect(zone, 20, 16, tileset..":wall_bot")
place_setaspect(zone, 21, 14, tileset..":roof_rgt")
place_setaspect(zone, 21, 15, tileset..":roof_botrgt")
place_setaspect(zone, 21, 16, tileset..":wall_botrgt")

place_setaspect(zone, 18, 15, tileset..":stairs_down")
target_zone, target_x, target_y = dofile("build/demon/lavacave/ritual_cave.lua")
loadfile("build/tools/link.lua")(zone, 18, 15, target_zone, target_x, target_y)
