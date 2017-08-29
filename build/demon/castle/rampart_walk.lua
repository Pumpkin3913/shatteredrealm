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
