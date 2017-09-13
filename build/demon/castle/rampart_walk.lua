#!/usr/bin/lua

local tileset, zone = ...

info("[WORLDGEN] [Demon Castle] Rampart Walk")

-- Build east and west vertical walls.
for y=10,32 do
	place_setaspect(zone, 2,  y, tileset..":roof_lft")
	place_setaspect(zone, 3,  y, tileset..":roof")
	place_setaspect(zone, 4,  y, tileset..":roof_rgt")
	place_setaspect(zone, 46, y, tileset..":roof_lft")
	place_setaspect(zone, 47, y, tileset..":roof")
	place_setaspect(zone, 48, y, tileset..":roof_rgt")
end

-- Build south horizontal wall.
for x=6,44 do
	place_setaspect(zone, x, 36, tileset..":roof_top")
	place_setaspect(zone, x, 37, tileset..":roof")
	place_setaspect(zone, x, 38, tileset..":roof_bot")
	place_setaspect(zone, x, 39, tileset..":wall")
	place_setaspect(zone, x, 40, tileset..":wall_bot")
end

-- Build towers.
loadfile("build/demon/castle/tower_rampart.lua")(tileset, zone, 1,  18, "middle_west", "north,south")
loadfile("build/demon/castle/tower_rampart.lua")(tileset, zone, 45, 18, "middle_east", "north,south")
loadfile("build/demon/castle/tower_rampart.lua")(tileset, zone, 1,  33, "south_west",  "north,east")
loadfile("build/demon/castle/tower_rampart.lua")(tileset, zone, 16, 33, "south_left",  "east,west")
loadfile("build/demon/castle/tower_rampart.lua")(tileset, zone, 30, 33, "south_right", "east,west")
loadfile("build/demon/castle/tower_rampart.lua")(tileset, zone, 45, 33, "south_east",  "north,west")

-- Add lore in wall engravings.
local texts = {
	"Le Créateur nous abandonne, puis des créatures étranges nous attaquent. Mauvaise journée.",
	"Sans le Créateur, nous sommes perdus ! Fuyez ! Fuyez tant que vous le povez !",
	"Pour l'une de ces horreurs vaincue, deux prennent sa place à l'assaut de nos remparts.",
	"Il en vient toujours plus. Mais le Chateau du Roi des Démons tiendra !",
	"Démons, tenez-bon ! Ces monstres ne sont pas plus féroces que nous !",
	"Ils ressemblent à des Cauchemars mais ce n'en sont pas. Le Créateur voulait-il nous éliminer ?",
	"La terre se disloque ! Nous sommes déjà isolés des autres forteresses démoniaques.",
	"Impossible d'appeler les Dieux de la Mort à l'aide. Le Créateur les a-t-il également abandonnés ?"
};

local function place_lore(zone, x, y)
	local tile = place_getaspect(zone, x, y);
	place_setaspect(zone, x, y, tile.."_written");

	place_settag(zone, x, y, "text", table.remove(texts, c_rand(#texts)));
	place_settag(zone, x, y, "text_type", "engraving");
end

place_lore("middle_west_floor_1", 6, 1);
place_lore(zone, 4, 37);
place_lore("south_left_floor_1", 5, 1);
place_lore(zone, 18, 37);
place_lore(zone, 24, 38);
place_lore(zone, 42, 38);
place_lore("south_east_floor_1", 2, 1);
place_lore(zone, 46, 22);
