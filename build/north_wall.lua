#!/usr/bin/lua

local tileset, screen = ...

loadfile("build/tower.lua")(tileset, screen, 1,  3, "northwest")
loadfile("build/tools/h_wall.lua")(tileset, screen, 6, 6, 6, 5)
loadfile("build/tower.lua")(tileset, screen, 12, 3, "left")
loadfile("build/tools/h_wall.lua")(tileset, screen, 17, 4, 6, 7)
loadfile("build/lone_tower.lua")(tileset, screen, 23, 1)
loadfile("build/tools/h_wall.lua")(tileset, screen, 28, 4, 6, 7)
loadfile("build/tower.lua")(tileset, screen, 34, 3, "right")
loadfile("build/tools/h_wall.lua")(tileset, screen, 39, 6, 6, 5)
loadfile("build/tower.lua")(tileset, screen, 45, 3, "northeast")

screen_settile(screen, 16, 5, tileset..":roof")
screen_settile(screen, 34, 5, tileset..":roof")

screen_settile("northwest_floor_1", 8, 3, tileset..":pillar_bot")
screen_settile("northwest_floor_1", 8, 4, tileset..":mosaic_a")
screen_settile(screen, 6, 7, tileset..":mosaic_a")
loadfile("build/tools/link.lua")("northwest_floor_1", 8, 4, screen, 6, 7)

screen_settile("left_floor_1", 0, 3, tileset..":pillar_bot")
screen_settile("left_floor_1", 0, 4, tileset..":mosaic_a")
screen_settile(screen, 11, 7, tileset..":mosaic_a")
loadfile("build/tools/link.lua")("left_floor_1", 0, 4, screen, 11, 7)

screen_settile("lone_tower_2", 0, 3, tileset..":pillar_bot")
screen_settile("lone_tower_2", 0, 4, tileset..":mosaic_a")
screen_settile(screen, 22, 5, tileset..":mosaic_a")
loadfile("build/tools/link.lua")("lone_tower_2", 0, 4, screen, 22, 5)

screen_settile("lone_tower_2", 8, 3, tileset..":pillar_bot")
screen_settile("lone_tower_2", 8, 4, tileset..":mosaic_a")
screen_settile(screen, 28, 5, tileset..":mosaic_a")
loadfile("build/tools/link.lua")("lone_tower_2", 8, 4, screen, 28, 5)

screen_settile("right_floor_1", 8, 3, tileset..":pillar_bot")
screen_settile("right_floor_1", 8, 4, tileset..":mosaic_a")
screen_settile(screen, 39, 7, tileset..":mosaic_a")
loadfile("build/tools/link.lua")("right_floor_1", 8, 4, screen, 39, 7)

screen_settile("northeast_floor_1", 0, 3, tileset..":pillar_bot")
screen_settile("northeast_floor_1", 0, 4, tileset..":mosaic_a")
screen_settile(screen, 44, 7, tileset..":mosaic_a")
loadfile("build/tools/link.lua")("northeast_floor_1", 0, 4, screen, 44, 7)

-- Seal off left tower's door.
screen_settile(screen, 14, 11, tileset..":bigdoor_locked")
screen_settile("left_floor_0", 4, 9, tileset..":block_a")
