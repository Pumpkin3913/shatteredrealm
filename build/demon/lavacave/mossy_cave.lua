#!/usr/bin/lua

info("[WORLDGEN] [Lava Cave] Mossy Cave")

local zone = "mossy_cave"
local tileset = "volcano"
local moss_tileset = "forest_underground"
local w = 38
local h = 25

new_zone(zone, "Caverne Moussue", w, h, tileset..":roof")

-- Randomize soil.
for x=0,w-1 do
	for y=0,h-1 do
		if c_rand(100) <= 10 then
			place_setaspect(zone, x, y, tileset..":roof_rare_"..c_rand(4))
		end
	end
end

-- Patches of moss.

local function patch_o_moss(x, y)
	for i=x-3,x+3 do
		for j=y-3,y+3 do
			place_setaspect(zone, i, j, moss_tileset..":grass_"..c_rand(4));
		end
	end

	place_setaspect(zone, x-2, y-4, moss_tileset..":grass_toplft");
	place_setaspect(zone, x-3, y-3, moss_tileset..":grass_toplft");
	place_setaspect(zone, x-4, y-2, moss_tileset..":grass_toplft");
	place_setaspect(zone, x-3, y-2, moss_tileset..":grass_angle_botrgt");
	place_setaspect(zone, x-2, y-3, moss_tileset..":grass_angle_botrgt");

	place_setaspect(zone, x+2, y-4, moss_tileset..":grass_toprgt");
	place_setaspect(zone, x+3, y-3, moss_tileset..":grass_toprgt");
	place_setaspect(zone, x+4, y-2, moss_tileset..":grass_toprgt");
	place_setaspect(zone, x+3, y-2, moss_tileset..":grass_angle_botlft");
	place_setaspect(zone, x+2, y-3, moss_tileset..":grass_angle_botlft");

	place_setaspect(zone, x-2, y+4, moss_tileset..":grass_botlft");
	place_setaspect(zone, x-3, y+3, moss_tileset..":grass_botlft");
	place_setaspect(zone, x-4, y+2, moss_tileset..":grass_botlft");
	place_setaspect(zone, x-3, y+2, moss_tileset..":grass_angle_toprgt");
	place_setaspect(zone, x-2, y+3, moss_tileset..":grass_angle_toprgt");

	place_setaspect(zone, x+2, y+4, moss_tileset..":grass_botrgt");
	place_setaspect(zone, x+3, y+3, moss_tileset..":grass_botrgt");
	place_setaspect(zone, x+4, y+2, moss_tileset..":grass_botrgt");
	place_setaspect(zone, x+3, y+2, moss_tileset..":grass_angle_toplft");
	place_setaspect(zone, x+2, y+3, moss_tileset..":grass_angle_toplft");

	for n=-1,1 do
		place_setaspect(zone, x-4, y+n, moss_tileset..":grass_lft");
		place_setaspect(zone, x+4, y+n, moss_tileset..":grass_rgt");
		place_setaspect(zone, x+n, y-4, moss_tileset..":grass_top");
		place_setaspect(zone, x+n, y+4, moss_tileset..":grass_bot");
	end

end

local function fertilize(zone, x, y, name, aspect);
	for i = -1,1 do
		for j = -1,1 do
			loadfile("build/tools/plant.lua")(zone, x+2*i-j, y+2*j+i, name, aspect);
		end
	end
end

patch_o_moss(13, 10); fertilize(zone, 13, 10);
patch_o_moss(31, 7);  fertilize(zone, 31, 7, "Amanite", moss_tileset..":plant_1");

-- North-west peak.

for y=0,3 do
	place_setaspect(zone, 0, y, tileset..":wall")
end
loadfile("build/tools/cube.lua")(tileset, zone, 0, 4, 8, 8, 5)
loadfile("build/tools/cube.lua")(tileset, zone, 1, 0, 6, 8, 5)
loadfile("build/tools/circle.lua")(moss_tileset..":grass", zone, 2, 1, 4, 4)
place_setaspect(zone, 3, 2, moss_tileset..":tree_toplft")
place_setaspect(zone, 4, 2, moss_tileset..":tree_toprgt")
place_setaspect(zone, 3, 3, moss_tileset..":tree_botlft_alive")
place_setaspect(zone, 4, 3, moss_tileset..":tree_botrgt_alive")
for x=2,5 do
	place_setaspect(zone, x, 8, moss_tileset..":grass_horizontal")
end
place_setaspect(zone, 1, 8, moss_tileset..":grass_endlft")
place_setaspect(zone, 6, 8, moss_tileset..":grass_endrgt")

place_setaspect(zone, 3, 5, tileset..":roof_bot_climb"); place_setpassable(zone, 3, 5)
place_setaspect(zone, 3, 6, tileset..":wall_climb"); place_setpassable(zone, 3, 6)
place_setaspect(zone, 3, 7, tileset..":wall_bot_climb"); place_setpassable(zone, 3, 7)
place_setaspect(zone, 5, 9,  tileset..":roof_bot_climb"); place_setpassable(zone, 5, 9)
place_setaspect(zone, 5, 10, tileset..":wall_climb"); place_setpassable(zone, 5, 10)
place_setaspect(zone, 5, 11, tileset..":wall_bot_climb"); place_setpassable(zone, 5, 11)

loadfile("build/tools/door.lua")(tileset, zone, 3, 11)
loadfile("build/tools/interior.lua")(tileset, "root_cave", "Caverne aux Racines", 7, 11, "roof", "nocolumns")
loadfile("build/tools/door.lua")(tileset, "root_cave", 3, 10)
place_setaspect("root_cave", 3, 9, tileset..":roof")
loadfile("build/tools/link.lua")(zone, 3, 11, "root_cave", 3, 10)

loadfile("build/tools/circle.lua")(moss_tileset..":grass", zone, 3, 12, 3, 3);
place_setaspect(zone, 4, 13, moss_tileset..":rock_"..c_rand(4));

-- South-west wood.

loadfile("build/tools/bluff.lua")(tileset, zone, 0, 12, 14, 6, 3, "noright");
loadfile("build/tools/bluff.lua")(tileset, zone, 0, 18, 16, 7, 5, "noright,nobottom");
place_setaspect(zone, 14, 15, tileset..":roof_angle_toprgt");
place_setaspect(zone, 14, 16, tileset..":roof_lft");
place_setaspect(zone, 14, 17, tileset..":roof_botlft");
place_setaspect(zone, 14, 18, tileset..":wall_lft");
place_setaspect(zone, 14, 19, tileset..":wall_botlft");
place_setaspect(zone, 15, 17, tileset..":roof_bot_climb"); place_setpassable(zone, 15, 17);
place_setaspect(zone, 15, 18, tileset..":wall_climb"); place_setpassable(zone, 15, 18);
place_setaspect(zone, 15, 19, tileset..":wall_bot_climb"); place_setpassable(zone, 15, 19);
place_setaspect(zone, 16, 17, tileset..":roof_angle_toprgt");

loadfile("build/tools/forest.lua")(moss_tileset, zone, 2, 17, 5, 20);
loadfile("build/tools/forest.lua")(moss_tileset, zone, 8, 17, 12, 20, 1);
place_setaspect(zone, 3, 19, moss_tileset..":tree_botlft");
place_setaspect(zone, 11, 19, moss_tileset..":tree_botrgt");
place_setaspect(zone, 6, 17, moss_tileset..":tree_toplft");
place_setaspect(zone, 6, 18, moss_tileset..":tree_botlft");
place_setaspect(zone, 6, 19, moss_tileset..":grass_"..c_rand(4));
place_setaspect(zone, 6, 20, moss_tileset..":grass_"..c_rand(4));
place_setaspect(zone, 7, 17, moss_tileset..":tree_door_top");
place_setaspect(zone, 7, 18, moss_tileset..":tree_door"); -- door at 7, 18
place_setaspect(zone, 7, 19, moss_tileset..":grass_"..c_rand(4));
place_setaspect(zone, 7, 20, moss_tileset..":grass_"..c_rand(4));
place_setaspect(zone, 8, 17, moss_tileset..":tree_toprgt");
place_setaspect(zone, 8, 18, moss_tileset..":trees_lft");
place_setaspect(zone, 8, 20, moss_tileset..":grass_"..c_rand(4));
place_setaspect(zone, 1, 18, moss_tileset..":grass_lft");
place_setaspect(zone, 1, 19, moss_tileset..":grass_botlft");
place_setaspect(zone, 2, 19, moss_tileset..":grass_angle_toprgt");
place_setaspect(zone, 2, 20, moss_tileset..":grass_botlft");
place_setaspect(zone, 3, 20, moss_tileset..":grass_angle_toprgt");
place_setaspect(zone, 3, 21, moss_tileset..":grass_botlft");
for x=4,10 do
	place_setaspect(zone, x, 21, moss_tileset..":grass_bot");
end
place_setaspect(zone, 11, 21, moss_tileset..":grass_botrgt");
place_setaspect(zone, 11, 20, moss_tileset..":grass_angle_toplft");
place_setaspect(zone, 12, 20, moss_tileset..":grass_botrgt");
place_setaspect(zone, 12, 19, moss_tileset..":grass_angle_toplft");
place_setaspect(zone, 13, 19, moss_tileset..":grass_botrgt");
place_setaspect(zone, 13, 18, moss_tileset..":grass_rgt");

-- Small mossy cave.

local small = "mossy_cave_small";
local small_w = 11;
local small_h = 13;
new_zone(small, "Grotte des Spores", 11, 13, moss_tileset..":grass_1");
loadfile("build/tools/link.lua")(zone, 7, 18, small, 5, 12);
for x=0,small_w-1 do
	for y=0,small_h-1 do
		place_setaspect(small, x, y, moss_tileset..":grass_"..c_rand(4));
	end
end
loadfile("build/tools/forest.lua")(moss_tileset, small, -1, 6, 1, 10);
loadfile("build/tools/forest.lua")(moss_tileset, small, 0, 10, 3, 12);
loadfile("build/tools/forest.lua")(moss_tileset, small, 9, 6, 11, 10, 1);
loadfile("build/tools/forest.lua")(moss_tileset, small, 7, 10, 10, 12, 1);
place_setaspect(small, 1, 10, moss_tileset..":trees_lft");
place_setaspect(small, 9, 10, moss_tileset..":trees_rgt");

place_setaspect(small, 4, 11, moss_tileset..":tree_toplft");
place_setaspect(small, 6, 11, moss_tileset..":tree_toprgt");
place_setaspect(small, 4, 12, moss_tileset..":tree_botlft");
place_setaspect(small, 5, 12, moss_tileset..":tree_door");
place_setaspect(small, 6, 12, moss_tileset..":tree_botrgt");

place_setaspect(small, 0,  0, tileset..":wall");
place_setaspect(small, 1,  0, tileset..":wall_lft");
place_setaspect(small, 2,  0, tileset..":wall");
place_setaspect(small, 3,  0, tileset..":wall");
place_setaspect(small, 4,  0, tileset..":roof_toplft");
loadfile("build/tools/coffer.lua")(tileset, small, 5, 0, "hard");
loadfile("build/tools/give_empty_inventory.lua")(small, 5, 0, 2);
place_setaspect(small, 6,  0, tileset..":roof_toprgt");
place_setaspect(small, 7,  0, tileset..":wall");
place_setaspect(small, 8,  0, tileset..":wall");
place_setaspect(small, 9,  0, tileset..":wall_rgt");
place_setaspect(small, 10, 0, tileset..":wall");

place_setaspect(small, 0,  1, moss_tileset..":trees_rgt");
place_setaspect(small, 1,  1, tileset..":wall_lft");
place_setaspect(small, 2,  1, tileset..":wall");
place_setaspect(small, 3,  1, tileset..":wall");
place_setaspect(small, 4,  1, tileset..":roof_lft");
place_setaspect(small, 5,  1, tileset..":roof");
place_setaspect(small, 6,  1, tileset..":roof_rgt");
place_setaspect(small, 7,  1, tileset..":wall");
place_setaspect(small, 8,  1, tileset..":wall");
place_setaspect(small, 9,  1, tileset..":wall_rgt");
place_setaspect(small, 10, 1, moss_tileset..":trees_lft");

place_setaspect(small, 0,  2, tileset..":roof_top");
place_setaspect(small, 1,  2, tileset..":roof_toprgt");
place_setaspect(small, 2,  2, moss_tileset..":trees_lft");
place_setaspect(small, 3,  2, moss_tileset..":trees_rgt");
place_setaspect(small, 4,  2, tileset..":roof_botlft");
place_setaspect(small, 5,  2, tileset..":roof_bot_climb"); place_setpassable(small, 5, 2);
place_setaspect(small, 6,  2, tileset..":roof_botrgt");
place_setaspect(small, 7,  2, moss_tileset..":trees_lft");
place_setaspect(small, 8,  2, moss_tileset..":trees_rgt");
place_setaspect(small, 9,  2, tileset..":roof_toplft");
place_setaspect(small, 10, 2, tileset..":roof_top");

place_setaspect(small, 0,  3, tileset..":roof");
place_setaspect(small, 1,  3, tileset..":roof_rgt");
place_setaspect(small, 2,  3, moss_tileset..":trees_rgt");
place_setaspect(small, 3,  3, moss_tileset..":tree_botrgt");
place_setaspect(small, 4,  3, tileset..":wall_botlft");
place_setaspect(small, 5,  3, tileset..":wall_bot_climb"); place_setpassable(small, 5, 3);
place_setaspect(small, 6,  3, tileset..":wall_botrgt");
place_setaspect(small, 7,  3, moss_tileset..":tree_botlft");
place_setaspect(small, 8,  3, moss_tileset..":trees_lft");
place_setaspect(small, 9,  3, tileset..":roof_lft");
place_setaspect(small, 10, 3, tileset..":roof");

place_setaspect(small, 0,  4, tileset..":roof_bot");
place_setaspect(small, 1,  4, tileset..":roof_botrgt");
place_setaspect(small, 2,  4, moss_tileset..":tree_botrgt");
--
place_setaspect(small, 8,  4, moss_tileset..":tree_botlft");
place_setaspect(small, 9,  4, tileset..":roof_botlft");
place_setaspect(small, 10, 4, tileset..":roof_bot");

place_setaspect(small, 0,  5, tileset..":wall");
place_setaspect(small, 1,  5, tileset..":wall_rgt");
--
place_setaspect(small, 9,  5, tileset..":wall_lft");
place_setaspect(small, 10, 5, tileset..":wall");

place_setaspect(small, 0,  6, moss_tileset..":trees_rgt");
place_setaspect(small, 1,  6, tileset..":wall_botrgt");
--
place_setaspect(small, 9,  6, tileset..":wall_botlft");
place_setaspect(small, 10, 6, moss_tileset..":trees_lft");

fertilize(small, 5, 7);

-- North-west old archway.

for x=7,16 do
	if (x%2) == 0 then
		place_setaspect(zone, x, 0, moss_tileset..":trees_rgt");
	else
		place_setaspect(zone, x, 0, moss_tileset..":trees_lft");
	end
end
place_setaspect(zone, 7,  1, moss_tileset..":trees_rgt");
place_setaspect(zone, 8,  1, moss_tileset..":tree_botrgt");
place_setaspect(zone, 7,  2, moss_tileset..":trees_lft");
place_setaspect(zone, 8,  2, moss_tileset..":tree_toprgt");
place_setaspect(zone, 7,  3, moss_tileset..":tree_botlft");
place_setaspect(zone, 8,  3, moss_tileset..":trees_lft");
place_setaspect(zone, 9,  3, moss_tileset..":trees_rgt");
place_setaspect(zone, 8,  4, moss_tileset..":trees_rgt");
place_setaspect(zone, 9,  4, moss_tileset..":tree_botrgt");
place_setaspect(zone, 10, 4, moss_tileset..":grass_rgt");
place_setaspect(zone, 8,  5, moss_tileset..":tree_botrgt");
place_setaspect(zone, 9,  5, moss_tileset..":grass_angle_toplft");
place_setaspect(zone, 10, 5, moss_tileset..":grass_botrgt");
place_setaspect(zone, 8,  6, moss_tileset..":grass_bot");
place_setaspect(zone, 9,  6, moss_tileset..":grass_botrgt");

place_setaspect(zone, 14, 1, moss_tileset..":trees_lft");
place_setaspect(zone, 15, 1, moss_tileset..":trees_rgt");
place_setaspect(zone, 16, 1, moss_tileset..":tree_botrgt");
place_setaspect(zone, 14, 2, moss_tileset..":tree_botlft");
place_setaspect(zone, 15, 2, moss_tileset..":trees_lft");
place_setaspect(zone, 16, 2, moss_tileset..":tree_toprgt");
place_setaspect(zone, 17, 2, moss_tileset..":grass_toprgt");
place_setaspect(zone, 14, 3, moss_tileset..":tree_toplft");
place_setaspect(zone, 15, 3, moss_tileset..":trees_rgt");
place_setaspect(zone, 16, 3, moss_tileset..":tree_botrgt");
place_setaspect(zone, 17, 3, moss_tileset..":grass_rgt");
place_setaspect(zone, 12, 4, moss_tileset..":grass_botlft");
place_setaspect(zone, 13, 4, moss_tileset..":grass_angle_toprgt");
place_setaspect(zone, 14, 4, moss_tileset..":tree_botlft");
place_setaspect(zone, 15, 4, moss_tileset..":tree_botrgt");
place_setaspect(zone, 16, 4, moss_tileset..":grass_angle_toplft");
place_setaspect(zone, 17, 4, moss_tileset..":grass_botrgt");
place_setaspect(zone, 13, 5, moss_tileset..":grass_botlft");
place_setaspect(zone, 14, 5, moss_tileset..":grass_bot");
place_setaspect(zone, 15, 5, moss_tileset..":grass_bot");
place_setaspect(zone, 16, 5, moss_tileset..":grass_botrgt");

place_setaspect(zone, 9,  2, tileset..":wall_lft");
place_setaspect(zone, 9,  1, tileset..":roof_endlft");
place_setaspect(zone, 10, 1, tileset..":roof_horizontal");
place_setaspect(zone, 11, 1, tileset..":roof_horizontal");
place_setaspect(zone, 12, 1, tileset..":roof_horizontal");
place_setaspect(zone, 13, 1, tileset..":roof_endrgt");
place_setaspect(zone, 13, 2, tileset..":wall_rgt");
place_setaspect(zone, 13, 3, tileset..":wall_botrgt");

loadfile("build/tools/door.lua")(tileset, zone, 11, 3);
place_setaspect(zone, 11, 3, tileset..":bigdoor_locked");
-- TODO: Archway to underground forest at 11, 3.

-- Central path.

place_setaspect(zone, 17, 0, tileset..":wall");
place_setaspect(zone, 18, 0, tileset..":wall");
place_setaspect(zone, 17, 1, tileset..":roof_top");
place_setaspect(zone, 18, 1, tileset..":roof_toprgt");
place_setaspect(zone, 18, 2, tileset..":roof_rgt");
place_setaspect(zone, 18, 3, tileset..":roof_angle_botlft");


local mid = 22;

for y=0,2 do
	place_setaspect(zone, mid-2, y, tileset..":wall"); place_setaspect(zone, mid+2, y, tileset..":wall");
	place_setaspect(zone, mid-3, y, tileset..":wall"); place_setaspect(zone, mid+3, y, tileset..":wall");
end
for y=0,4 do
	place_setaspect(zone, mid-1, y, tileset..":roof_lft"); place_setaspect(zone, mid+1, y, tileset..":roof_rgt");
end
place_setaspect(zone, mid-1, 5, tileset..":roof_angle_botrgt"); place_setaspect(zone, mid+1, 5, tileset..":roof_angle_botlft");

place_setaspect(zone, mid-2, 3, tileset..":roof_toprgt"); place_setaspect(zone, mid+2, 3, tileset..":roof_toplft");
place_setaspect(zone, mid-3, 3, tileset..":roof_top");    place_setaspect(zone, mid+3, 3, tileset..":roof_top");
for y=4,7 do
	place_setaspect(zone, mid-2, y, tileset..":roof_rgt"); place_setaspect(zone, mid+2, y, tileset..":roof_lft");
end
place_setaspect(zone, mid-2, 8, tileset..":roof_angle_botlft"); place_setaspect(zone, mid+2, 8, tileset..":roof_angle_botrgt");
place_setaspect(zone, mid-1, 8, tileset..":roof_top");          place_setaspect(zone, mid+1, 8, tileset..":roof_top");
place_setaspect(zone, mid,   8, tileset..":roof_top");

place_setaspect(zone, mid-1, 7, moss_tileset..":grass_toplft"); place_setaspect(zone, mid+1, 7, moss_tileset..":grass_toprgt");
place_setaspect(zone, mid,   7, moss_tileset..":grass_top");

place_setaspect(zone, mid-2, 10, tileset..":roof_angle_toplft"); place_setaspect(zone, mid+2, 10, tileset..":roof_angle_toprgt");
place_setaspect(zone, mid-1, 10, tileset..":roof_bot");          place_setaspect(zone, mid+1, 10, tileset..":roof_bot");
place_setaspect(zone, mid,   10, tileset..":roof_bot");

loadfile("build/tools/door.lua")(tileset, zone, mid, 12);
loadfile("build/tools/link.lua")(zone, mid, 7, zone, mid, 12);

place_setaspect(zone, mid-1, 13, moss_tileset..":grass_botlft"); place_setaspect(zone, mid+1, 13, moss_tileset..":grass_botrgt");
place_setaspect(zone, mid,   13, moss_tileset..":grass_bot");

for y=11,12 do
	place_setaspect(zone, mid-2, y, tileset..":roof_rgt"); place_setaspect(zone, mid+2, y, tileset..":roof_lft");
end
place_setaspect(zone, mid-2, 13, tileset..":roof_botrgt");       place_setaspect(zone, mid+2, 13, tileset..":roof_botlft");
place_setaspect(zone, mid-3, 13, tileset..":roof_bot_climb");    place_setaspect(zone, mid+3, 13, tileset..":roof_bot_climb");
place_setpassable(zone, mid-3, 13);                              place_setpassable(zone, mid+3, 13);
place_setaspect(zone, mid-4, 13, tileset..":roof_angle_toplft"); place_setaspect(zone, mid+4, 13, tileset..":roof_angle_toprgt");

place_setaspect(zone, mid-2, 14, tileset..":wall_rgt");   place_setaspect(zone, mid+2, 14, tileset..":wall_lft");
place_setaspect(zone, mid-3, 14, tileset..":wall_climb"); place_setaspect(zone, mid+3, 14, tileset..":wall_climb");
place_setpassable(zone, mid-3, 14);                       place_setpassable(zone, mid+3, 14);
place_setaspect(zone, mid-4, 13, tileset..":roof_angle_toplft"); place_setaspect(zone, mid+4, 13, tileset..":roof_angle_toprgt");

place_setaspect(zone, mid-2, 15, tileset..":wall_botrgt");    place_setaspect(zone, mid+2, 15, tileset..":wall_botlft");
place_setaspect(zone, mid-3, 15, tileset..":wall_bot_climb"); place_setaspect(zone, mid+3, 15, tileset..":wall_bot_climb");
place_setpassable(zone, mid-3, 15);                           place_setpassable(zone, mid+3, 15);

for y=14,17 do
	place_setaspect(zone, mid-4, y, tileset..":roof_rgt"); place_setaspect(zone, mid+4, y, tileset..":roof_lft");
end

place_setaspect(zone, 18, 18, tileset..":roof_angle_botlft");
for x=19,25 do
	place_setaspect(zone, x, 18, tileset..":roof_top");
end
place_setaspect(zone, 26, 18, tileset..":roof_angle_botrgt");

place_setaspect(zone, 20, 16, moss_tileset..":grass_toplft");
place_setaspect(zone, 21, 16, moss_tileset..":grass_top");
place_setaspect(zone, 22, 16, moss_tileset..":grass_toprgt");
place_setaspect(zone, 20, 17, moss_tileset..":grass_lft");
place_setaspect(zone, 21, 17, moss_tileset..":rock_"..c_rand(4));
place_setaspect(zone, 22, 17, moss_tileset..":grass_rgt");

-- North-east wood.

for y=0,2 do
	place_setaspect(zone, 26, y, tileset..":wall");
end
place_setaspect(zone, 26, 3, tileset..":roof_top");

for x=27,37 do
	place_setaspect(zone, x, 0, tileset..":wall");
end

place_setaspect(zone, 27, 1, tileset..":roof_toplft");
place_setaspect(zone, 27, 2, tileset..":roof_lft");
place_setaspect(zone, 27, 3, tileset..":roof_angle_botrgt");

for x=28,32 do
	place_setaspect(zone, x, 1, tileset..":roof_top");
end

loadfile("build/tools/forest.lua")(moss_tileset, zone, 33, 1, 36, 5, 1);
place_setaspect(zone, 36, 2, moss_tileset..":trees_lft");
place_setaspect(zone, 36, 3, moss_tileset..":trees_rgt");
place_setaspect(zone, 37, 1, tileset..":wall");
place_setaspect(zone, 37, 2, moss_tileset..":tree_toprgt");
place_setaspect(zone, 37, 3, moss_tileset..":tree_botrgt");

place_setaspect(zone, 32, 2, moss_tileset..":grass_toplft");
place_setaspect(zone, 32, 3, moss_tileset..":grass_angle_botrgt");
place_setaspect(zone, 36, 5, moss_tileset..":grass_rgt");
place_setaspect(zone, 36, 6, moss_tileset..":grass_botrgt");
place_setaspect(zone, 35, 6, moss_tileset..":grass_angle_toplft");

for y=4,12 do
	place_setaspect(zone, 37, y, tileset..":roof_rgt");
end

place_setaspect(zone, 26, 11, tileset..":block_"..c_rand(4));

-- South-east trees.

loadfile("build/tools/bluff.lua")(tileset, zone, 29, 13, 9, 3, 0, "noleft");
place_setaspect(zone, 28, 13, tileset..":roof_angle_toplft");
for y=14,17 do
	place_setaspect(zone, 28, y, tileset..":roof_rgt");
end

for y=16,23 do
	place_setaspect(zone, 37, y, tileset..":roof_rgt");
end
for x=29,36 do
	place_setaspect(zone, x, 24, tileset..":roof_bot");
end
place_setaspect(zone, 37, 24, tileset..":roof_botrgt");

place_setaspect(zone, 31, 13, tileset..":roof_bot_climb"); place_setpassable(zone, 31, 13);
place_setaspect(zone, 31, 14, tileset..":wall_climb");     place_setpassable(zone, 31, 14);
place_setaspect(zone, 31, 15, tileset..":wall_bot_climb"); place_setpassable(zone, 31, 15);

loadfile("build/tools/circle.lua")(moss_tileset..":grass", zone, 30, 18, 7, 4);
loadfile("build/tools/forest.lua")(moss_tileset, zone, 32, 18, 35, 21);

place_setaspect(zone, 31, 19, moss_tileset..":tree_toplft");
place_setaspect(zone, 31, 20, moss_tileset..":tree_botlft");
place_setaspect(zone, 32, 19, moss_tileset..":tree_door_top");
place_setaspect(zone, 32, 20, moss_tileset..":tree_door_locked"); -- Door at 32, 20.

place_setaspect(zone, 32, 18, moss_tileset..":grass_angle_botrgt");
place_setaspect(zone, 32, 17, moss_tileset..":grass_toplft");
place_setaspect(zone, 33, 17, moss_tileset..":grass_top");
place_setaspect(zone, 34, 17, moss_tileset..":grass_top");
place_setaspect(zone, 35, 17, moss_tileset..":grass_toprgt");
place_setaspect(zone, 35, 18, moss_tileset..":grass_angle_botlft");

place_setaspect(zone, 31, 21, moss_tileset..":grass_angle_toprgt");
place_setaspect(zone, 31, 22, moss_tileset..":grass_botlft");
place_setaspect(zone, 32, 21, moss_tileset..":grass_"..c_rand(4));
place_setaspect(zone, 32, 22, moss_tileset..":grass_bot");
place_setaspect(zone, 33, 22, moss_tileset..":grass_bot");
place_setaspect(zone, 34, 22, moss_tileset..":grass_bot");
place_setaspect(zone, 35, 22, moss_tileset..":grass_botrgt");
place_setaspect(zone, 35, 21, moss_tileset..":grass_angle_toplft");

place_setaspect(zone, 33, 21, moss_tileset..":tree_botlft_alive"); -- Tree Alive at 33/34, 21.
place_setaspect(zone, 34, 21, moss_tileset..":tree_botrgt_alive");

-- Secret room below south-east trees.

local secret = "secret_roots";
local secret_w = 5;
local secret_h = 6;
new_zone(secret, "Racines Secrètes", secret_w, secret_h, tileset..":roof");

loadfile("build/tools/link.lua")(zone, 32, 20, secret, 2, 0);

place_setaspect(secret, 0, 0, moss_tileset..":trees_rgt");
place_setaspect(secret, 1, 0, tileset..":wall_lft");
place_setaspect(secret, 2, 0, tileset..":wall_climb"); place_setpassable(secret, 2, 0);
place_setaspect(secret, 3, 0, tileset..":wall_rgt");
place_setaspect(secret, 4, 0, moss_tileset..":trees_lft");

place_setaspect(secret, 0, 1, moss_tileset..":tree_botrgt");
place_setaspect(secret, 1, 1, tileset..":wall_botlft");
place_setaspect(secret, 2, 1, tileset..":wall_bot_climb"); place_setpassable(secret, 2, 1);
place_setaspect(secret, 3, 1, tileset..":wall_botrgt");
place_setaspect(secret, 4, 1, moss_tileset..":tree_botlft");

place_setaspect(secret, 0, 2, moss_tileset..":grass_angle_toplft");
place_setaspect(secret, 1, 2, moss_tileset..":grass_botrgt");
--
place_setaspect(secret, 3, 2, moss_tileset..":grass_botlft");
place_setaspect(secret, 4, 2, moss_tileset..":grass_angle_toprgt");

place_setaspect(secret, 0, 3, moss_tileset..":grass_rgt");
--
loadfile("build/tools/coffer.lua")(tileset, secret, 2, 3, "hard");
--
place_setaspect(secret, 4, 3, moss_tileset..":grass_lft");

place_setaspect(secret, 0, 4, moss_tileset..":grass_angle_botlft");
place_setaspect(secret, 1, 4, moss_tileset..":grass_toprgt");
--
place_setaspect(secret, 3, 4, moss_tileset..":grass_toplft");
place_setaspect(secret, 4, 4, moss_tileset..":grass_angle_botrgt");

place_setaspect(secret, 0, 5, moss_tileset..":tree_toprgt");
place_setaspect(secret, 1, 5, moss_tileset..":grass_angle_botlft");
place_setaspect(secret, 2, 5, moss_tileset..":grass_top");
place_setaspect(secret, 3, 5, moss_tileset..":grass_angle_botrgt");
place_setaspect(secret, 4, 5, moss_tileset..":tree_toplft");

-- South cliff.

loadfile("build/tools/bluff.lua")(tileset, zone, 16, 18, 13, 7, 2, "nobottom");
loadfile("build/tools/door.lua")(tileset, zone, 22, 22); -- Door at 22,22.
place_setaspect(zone, 19, 22, tileset..":wall_bot");
place_setaspect(zone, 20, 22, tileset..":wall_bot");
place_setaspect(zone, 25, 22, tileset..":wall_bot");

place_setaspect(zone, 19, 23, tileset..":roof_lft");
for x=20,24 do
	place_setaspect(zone, x, 23, tileset..":roof");
end
place_setaspect(zone, 25, 23, tileset..":roof_rgt");

place_setaspect(zone, 19, 24, tileset..":roof_botlft");
for x=20,24 do
	place_setaspect(zone, x, 24, tileset..":roof_bot");
end
place_setaspect(zone, 25, 24, tileset..":roof_botrgt");

place_setaspect(zone, 24, 20, tileset..":roof_bot_climb"); place_setpassable(zone, 24, 20);
place_setaspect(zone, 24, 21, tileset..":wall_climb");     place_setpassable(zone, 24, 21);
place_setaspect(zone, 24, 22, tileset..":wall_bot_climb"); place_setpassable(zone, 24, 22);

-- South cave.

local south_cave = "placeholder";
loadfile("build/tools/interior.lua")(tileset, south_cave, "Grotte", 11, 11, "roof");
loadfile("build/tools/door.lua")(tileset, south_cave, 5, 10);
place_setaspect(south_cave, 5, 9, tileset..":roof");
loadfile("build/tools/link.lua")(south_cave, 5, 10, zone, 22, 22);







return zone, 22, 0
