#!/usr/bin/lua

info("[WORLDGEN] [Lava Cave] Ritual Cave")

local zone = "ritual_cave"
local tileset = "volcano"

local w = 23
local h = 30

-- Entrance : 2, 0

new_zone(zone, "Grotte du Rituel", w, h, tileset..":roof")

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

-- Entrance.
loadfile("build/tools/bluff.lua")(tileset, zone, 0, 0, 5, 5, 2)
place_setaspect(zone, 2, 2, tileset..":roof_bot_climb")
place_setaspect(zone, 2, 3, tileset..":wall_climb")
place_setaspect(zone, 2, 4, tileset..":wall_bot_climb")
place_setpassable(zone, 2, 2)
place_setpassable(zone, 2, 3)
place_setpassable(zone, 2, 4)

-- Plateau.
place_setaspect(zone, 5, 0, tileset..":block_"..c_rand(4))
place_setaspect(zone, 6, 0, tileset..":block_"..c_rand(4))
place_setaspect(zone, 6, 1, tileset..":block_"..c_rand(4))
loadfile("build/tools/pillar.lua")(tileset, zone, 5, 2, 2)
loadfile("build/tools/pillar.lua")(tileset, zone, 1, 6, 3)

loadfile("build/tools/bluff.lua")(tileset, zone, 7, 0, 4, 3, 0)
loadfile("build/tools/bluff.lua")(tileset, zone, 11, 0, 3, 2, -1, "noright")
loadfile("build/tools/bluff.lua")(tileset, zone, 21, 0, 2, 3, -1, "noleft,noright")
loadfile("build/tools/bluff.lua")(tileset, zone, 14, 0, 7, 4, -1)
for y=0,2 do
	place_setaspect(zone, 17, y, tileset..":wall_decorated")
end
place_setaspect(zone, 17, 3, tileset..":wall_bot_decorated")

place_setaspect(zone, 3, 7, tileset..":block_"..c_rand(4))
place_setaspect(zone, 12, 3, tileset..":block_"..c_rand(4))

-- Cliff.
loadfile("build/tools/bluff.lua")(tileset, zone, 6, 6, 10, 5, 0, "noleft,noright")
loadfile("build/tools/bluff.lua")(tileset, zone, 2, 9, 4, 5, 0, "noleft")
loadfile("build/tools/bluff.lua")(tileset, zone, 0, 9, 3, 6, 1, "noleft")
loadfile("build/tools/bluff.lua")(tileset, zone, 21, 6, 2, 4, -1, "noleft,noright")
for y=6,8 do
	place_setaspect(zone, 5, y, tileset..":roof_rgt")
end

place_setaspect(zone, 11, 6, tileset..":roof_bot_decorated")
for y=7,9 do
	place_setaspect(zone, 11, y, tileset..":wall_decorated")
end
place_setaspect(zone, 11, 10, tileset..":wall_bot_decorated")

-- Treasure overhang.
loadfile("build/tools/bluff.lua")(tileset, zone, 6, 9, 4, 3, 1, "noleft,roof")
place_setaspect(zone, 9, 6, tileset..":roof_bot_climb"); place_setpassable(zone, 9, 6)
place_setaspect(zone, 9, 7, tileset..":wall_climb");     place_setpassable(zone, 9, 7)
place_setaspect(zone, 8, 7, tileset..":wall_climb");     place_setpassable(zone, 8, 7)
place_setaspect(zone, 8, 8, tileset..":wall_bot_climb"); place_setpassable(zone, 8, 8)

place_setaspect(zone, 6, 8, tileset..":wall_bot")
place_setaspect(zone, 7, 8, tileset..":wall_bot")
place_setaspect(zone, 9, 8, tileset..":wall_bot")
loadfile("build/tools/coffer.lua")(tileset, zone, 6, 9, "rare")
loadfile("build/tools/give_empty_inventory.lua")(zone, 6, 9, 3)

-- Stair room.
loadfile("build/tools/bluff.lua")(tileset, zone, 16, 4, 5, 8, 3)
place_setaspect(zone, 16, 4, tileset..":roof")
loadfile("build/tools/bluff.lua")(tileset, zone, 13, 9, 7, 4, 2, "roof")
place_setaspect(zone, 15, 11, tileset..":roof_bot_climb"); place_setpassable(zone, 15, 11)
place_setaspect(zone, 15, 12, tileset..":wall_bot_climb"); place_setpassable(zone, 15, 12)
for x=13,15 do
	place_setaspect(zone, x, 8, tileset..":wall_bot")
end
place_setaspect(zone, 16, 9, tileset..":wall_botlft")

local interior = "stairs_room"
loadfile("build/tools/interior.lua")(tileset, interior, "Petite grotte", 7, 9, "roof")

place_setaspect(interior, 3, 4, tileset..":stairs_up")
place_setaspect(zone, 18, 5, tileset..":stairs_down")
loadfile("build/tools/link.lua")(interior, 3, 4, zone, 18, 5)

place_setaspect(interior, 3, 7, tileset..":roof")
place_setaspect(interior, 3, 8, tileset..":roof")
loadfile("build/tools/door.lua")(tileset, zone, 18, 9)
loadfile("build/tools/link.lua")(interior, 3, 8, zone, 18, 9)

-- Pillars and Rocks.
loadfile("build/tools/pillar.lua")(tileset, zone, 4, 14, 4)
loadfile("build/tools/pillar.lua")(tileset, zone, 7, 13, 3)
loadfile("build/tools/pillar.lua")(tileset, zone, 6, 16, 2)
loadfile("build/tools/pillar.lua")(tileset, zone, 17, 16, 3)
loadfile("build/tools/pillar.lua")(tileset, zone, 21, 14, 2)
loadfile("build/tools/pillar.lua")(tileset, zone, 22, 10, 3)
loadfile("build/tools/pillar.lua")(tileset, zone, 0, 21, 3)
loadfile("build/tools/pillar.lua")(tileset, zone, 1, 28, 4)
loadfile("build/tools/pillar.lua")(tileset, zone, 3, 29, 3)
loadfile("build/tools/pillar.lua")(tileset, zone, 7, 27, 2)
loadfile("build/tools/pillar.lua")(tileset, zone, 16, 28, 3)
loadfile("build/tools/pillar.lua")(tileset, zone, 20, 26, 2)
place_setaspect(zone, 18, 15, tileset..":block_"..c_rand(4))
place_setaspect(zone, 22, 20, tileset..":block_"..c_rand(4))
place_setaspect(zone, 19, 28, tileset..":block_"..c_rand(4))
place_setaspect(zone, 13, 29, tileset..":block_"..c_rand(4))
place_setaspect(zone, 5,  25, tileset..":block_"..c_rand(4))

-- Crystal.
local master_x = 11
local master_y = 19
loadfile("build/tools/pillar.lua")(tileset, zone, master_x-2, master_y, 6, "slab")
loadfile("build/tools/pillar.lua")(tileset, zone, master_x+2, master_y, 6, "slab")
loadfile("build/tools/pillar.lua")(tileset, zone, master_x, master_y-2, 6, "slab")
place_setaspect(zone, master_x, master_y, tileset..":crystal_1")
local script = "loadfile(\"logic/increase_crystal.lua\")(\""..zone.."\", "..master_x..", "..master_y..")"
place_settag(zone, master_x, master_y, "puzzle_script", script)
local master = zone.."/"..master_x.."-"..master_y

local place_piece = function(n, x, y)
	place_setaspect(zone, x, y, tileset..":mosaic_black")
	place_settag(zone, x, y, "puzzle_init", "black")
	place_settag(zone, x, y, "puzzle_model", "white")
	place_settag(zone, x, y, "puzzle_master", master)
	place_setlandon(zone, x, y, "dofile(\"logic/puzzle_mosaic_walk.lua\")")
	place_settag(zone, master_x, master_y, "puzzle_piece_"..n, zone.."/"..x.."-"..y)
end

-- Switch rooms.
local n = 1
local build_room = function(x, y, id, shift)
	interior = "ritual_cave_room_"..id
	loadfile("build/tools/interior.lua")(tileset, interior, "Petite grotte", 7, 9, "roof")
	place_setaspect(interior, 3, 7, tileset..":roof")
	place_setaspect(interior, 3, 8, tileset..":roof")
	local d_x, d_y
	if id == "south" then
		d_x, d_y = loadfile("build/tools/building.lua")(tileset, zone, x, y, 5, 7, 4)
	else
		d_x, d_y = loadfile("build/tools/building.lua")(tileset, zone, x, y, 5, 6)
	end
	loadfile("build/tools/link.lua")(interior, 3, 8, zone, d_x, d_y)

	local j; if id == "south" then j=3 else j=2 end
	place_setaspect(zone, x+2+shift, y+j, tileset..":stairs_down")
	place_setaspect(interior, 3+shift, 5, tileset..":stairs_up")
	loadfile("build/tools/link.lua")(zone, x+2+shift, y+j, interior, 3+shift, 5)

	place_piece(n, x+2-shift, y+1)
	n = n+1
end

build_room(2,  18, "west", -1)
build_room(16, 18, "east",  1)
build_room(9 , 21, "south", 0)
