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
place_setaspect(zone, 9, 24, tileset..":wall_bot_written")
place_settag   (zone, 9, 24, "text", "Help! The door closed itself and I have no mana left!")

-- Add book and path.

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

loadfile("build/tools/book.lua")(tileset, zone, x, y, "close", "b")
place_settag(zone, x, y, "text", "Incantation nécromantique : Aetheria")
place_settag(zone, x, y, "openclose_selfclose", 30)

-- Hand-place graves.

place_setaspect(zone, 5,  28, tileset..":tombstone_cross")
place_setaspect(zone, 7,  29, tileset..":tombstone_cross")
place_setaspect(zone, 7,  34, tileset..":tombstone_cross")
place_setaspect(zone, 9,  26, tileset..":tombstone_cross")
place_setaspect(zone, 10, 28, tileset..":tombstone_cross")
place_setaspect(zone, 11, 35, tileset..":tombstone_cross")
place_setaspect(zone, 14, 30, tileset..":tombstone_cross")
place_setaspect(zone, 16, 26, tileset..":tombstone_cross")

place_setaspect(zone, 13, 27, tileset..":tombstone_slab")
place_setaspect(zone, 6,  31, tileset..":tombstone_slab")
place_setaspect(zone, 7,  27, tileset..":tombstone_slab")
place_setaspect(zone, 9,  33, tileset..":tombstone_slab")
place_setaspect(zone, 13, 32, tileset..":tombstone_slab")
place_setaspect(zone, 15, 34, tileset..":tombstone_slab")
place_setaspect(zone, 17, 29, tileset..":tombstone_slab")
-- TODO: add text on the slab tombstones, explaining the usage of the spell.
