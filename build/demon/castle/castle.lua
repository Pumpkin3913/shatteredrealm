#!/usr/bin/lua

info("[WORLDGEN] Demon Castle")

local zone = "castle"
local tileset = "redruins"

-- Width: 5 towers (5 tiles wide each) and 4 walls (6 tiles long each) and 2 free tiles on each side.
local w = 1+5*5+4*6+1
local h = 43

new_zone(zone, "Chateau Démoniaque", w, h, tileset..":soil_1")

-- Randomize soil.
for x=0,w-1 do
	for y=0,h-1 do
		place_setaspect(zone, x, y, tileset..":soil_"..c_rand(4))
	end
end

loadfile("build/demon/castle/north_wall.lua")(tileset, zone)
loadfile("build/demon/castle/rampart_walk.lua")(tileset, zone)

loadfile("build/demon/castle/graveyard.lua")(tileset, zone)
loadfile("build/demon/castle/dungeon.lua")(tileset, zone, 22, 13)
loadfile("build/demon/castle/ziggurat_secret.lua")(tileset, zone, 8, 14)
loadfile("build/demon/castle/ziggurat_crystal.lua")(tileset, zone, 22, 26)
loadfile("build/demon/castle/library.lua")(tileset, zone, 32, 15)
loadfile("build/demon/castle/tower_climb.lua")(tileset, zone, 38, 25)
loadfile("build/demon/castle/key_quest.lua")(tileset, zone)

-- Decorations.
local x, y

x = 18
y = 16
loadfile("build/tools/pillar.lua")(tileset, zone, x-2, y, 2)
loadfile("build/tools/pillar.lua")(tileset, zone, x, y-2, 2)
loadfile("build/tools/pillar.lua")(tileset, zone, x, y+2, 2)
loadfile("build/tools/pillar.lua")(tileset, zone, x+2, y, 2)

x = 33
y = 29
loadfile("build/tools/pillar.lua")(tileset, zone, x-2, y, 3)
loadfile("build/tools/pillar.lua")(tileset, zone, x,   y, 4)
loadfile("build/tools/pillar.lua")(tileset, zone, x+2, y, 2)
