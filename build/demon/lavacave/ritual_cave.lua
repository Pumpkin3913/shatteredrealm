#!/usr/bin/lua

info("[WORLDGEN] [Lava Cave] Ritual Cave")

local zone = "ritual_cave"
local tileset = "volcano"

local w = 23
local h = 30

-- Entrance : 2, 0

new_zone(zone, "Grotte du Rituel", w, h, tileset..":roof")

local build_bluff = function(x, y, w, h, plateau_h, options)
	if not options then options = "" end
	local left = not string.match(options, ".*noleft.*")
	local right = not string.match(options, ".*noright.*")
	local roof = string.match(options, ".*roof.*")

	for i=0,w-1 do
		for j=0,h-1 do
			if j < plateau_h then
				if i == 0 and left then
					place_setaspect(zone, x+i, y+j, tileset..":roof_lft")
				elseif i == w-1 and right then
					place_setaspect(zone, x+i, y+j, tileset..":roof_rgt")
				elseif roof then
					place_setaspect(zone, x+i, y+j, tileset..":roof")
				end
			elseif j == plateau_h then
				if i == 0 and left then
					place_setaspect(zone, x+i, y+j, tileset..":roof_botlft")
				elseif i < w-1 or not right then
					place_setaspect(zone, x+i, y+j, tileset..":roof_bot")
				elseif i == w-1 and right then
					place_setaspect(zone, x+i, y+j, tileset..":roof_botrgt")
				end
			elseif j < h-1 then
				if i == 0 and left then
					place_setaspect(zone, x+i, y+j, tileset..":wall_lft")
				elseif i < w-1 or not right then
					place_setaspect(zone, x+i, y+j, tileset..":wall")
				elseif i == w-1 and right then
					place_setaspect(zone, x+i, y+j, tileset..":wall_rgt")
				end
			elseif j == h-1 then
				if i == 0 and left then
					place_setaspect(zone, x+i, y+j, tileset..":wall_botlft")
				elseif i < w-1 or not right then
					place_setaspect(zone, x+i, y+j, tileset..":wall_bot")
				elseif i == w-1 and right then
					place_setaspect(zone, x+i, y+j, tileset..":wall_botrgt")
				end
			end
		end
	end
end

local randrock = function()
	local dice = c_rand(5)
	local block;
	if dice == 1 then
		block = "block_a"
	elseif dice == 2 then
		block = "block_b"
	elseif dice == 3 then
		block = "block_c"
	elseif dice == 4 then
		block = "block_d"
	elseif dice == 5 then
		block = "block_e"
	end
	return tileset..":"..block
end

-- Randomize soil.
for x=0,w-1 do
	for y=0,h-1 do
		local dice = c_rand(4)
		if c_rand(100) > 10 then
			-- Nothing.
		elseif dice == 1 then
			place_setaspect(zone, x, y, tileset..":roof_rare_a")
		elseif dice == 2 then
			place_setaspect(zone, x, y, tileset..":roof_rare_b")
		elseif dice == 3 then
			place_setaspect(zone, x, y, tileset..":roof_rare_c")
		elseif dice == 4 then
			place_setaspect(zone, x, y, tileset..":roof_rare_d")
		end
	end
end

-- Entrance.
build_bluff(0, 0, 5, 5, 2)
place_setaspect(zone, 2, 2, tileset..":roof_bot_climb")
place_setaspect(zone, 2, 3, tileset..":wall_climb")
place_setaspect(zone, 2, 4, tileset..":wall_bot_climb")
place_setpassable(zone, 2, 2)
place_setpassable(zone, 2, 3)
place_setpassable(zone, 2, 4)

-- Plateau.
place_setaspect(zone, 5, 0, randrock())
place_setaspect(zone, 6, 0, randrock())
place_setaspect(zone, 6, 1, randrock())
loadfile("build/tools/pillar.lua")(tileset, zone, 5, 2, 2)
loadfile("build/tools/pillar.lua")(tileset, zone, 1, 6, 3)

build_bluff(7, 0, 4, 3, 0)
build_bluff(11, 0, 3, 2, -1, "noright")
build_bluff(21, 0, 2, 3, -1, "noleft,noright")
build_bluff(14, 0, 7, 4, -1)
for y=0,2 do
	place_setaspect(zone, 17, y, tileset..":wall_decorated")
end
place_setaspect(zone, 17, 3, tileset..":wall_bot_decorated")

place_setaspect(zone, 3, 7, randrock())
place_setaspect(zone, 12, 3, randrock())

-- Cliff.
build_bluff(6, 6, 10, 5, 0, "noleft,noright")
build_bluff(2, 9, 4, 5, 0, "noleft")
build_bluff(0, 9, 3, 6, 1, "noleft")
build_bluff(21, 6, 2, 4, -1, "noleft,noright")
for y=6,8 do
	place_setaspect(zone, 5, y, tileset..":roof_rgt")
end

place_setaspect(zone, 11, 6, tileset..":roof_bot_decorated")
for y=7,9 do
	place_setaspect(zone, 11, y, tileset..":wall_decorated")
end
place_setaspect(zone, 11, 10, tileset..":wall_bot_decorated")

-- Treasure overhang.
build_bluff(6, 9, 4, 3, 1, "noleft,roof")
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
build_bluff(16, 4, 5, 8, 3)
place_setaspect(zone, 16, 4, tileset..":roof")
build_bluff(13, 9, 7, 4, 2, "roof")
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
place_setaspect(zone, 18, 15, randrock())
place_setaspect(zone, 22, 20, randrock())
place_setaspect(zone, 19, 28, randrock())
place_setaspect(zone, 13, 29, randrock())
place_setaspect(zone, 5,  25, randrock())

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
