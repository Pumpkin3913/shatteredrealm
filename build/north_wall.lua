#!/usr/bin/lua

local tileset, screen = ...

loadfile("build/corner_tower.lua")(tileset, screen, 1,  3, "northwest")
loadfile("build/tools/h_wall.lua")(tileset, screen, 6, 6, 6, 5)
loadfile("build/tower.lua")(tileset, screen, 12, 3, "left")
loadfile("build/tools/h_wall.lua")(tileset, screen, 17, 4, 6, 7)
loadfile("build/lone_tower.lua")(tileset, screen, 23, 1)
loadfile("build/tools/h_wall.lua")(tileset, screen, 28, 4, 6, 7)
loadfile("build/tower.lua")(tileset, screen, 34, 3, "right")
loadfile("build/tools/h_wall.lua")(tileset, screen, 39, 6, 6, 5)
loadfile("build/corner_tower.lua")(tileset, screen, 45, 3, "northeast")

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

-- Vertical walls.
loadfile("build/tools/v_wall.lua")(tileset, screen, 2, 10, 3, 30) -- TODO: cut the length
loadfile("build/tools/v_wall.lua")(tileset, screen, 46, 10, 3, 30) -- TODO: cut the length

-- Add crystal and mosaic disseminated through the towers.
local crystal_screen = "lone_tower_2"
local crystal_x = 4
local crystal_y = 3
screen_settile(crystal_screen, crystal_x, crystal_y, tileset..":crystal_2")

local put_switch = function(n, screen, x, y)
	local script = "loadfile(\"logic/switch_bw_crystal.lua\")(\""..crystal_screen.."\", "..crystal_x..", "..crystal_y..")"
	screen_settile(screen, x, y, tileset..":mosaic_black")
	screen_setlandon(screen, x, y, script)
	screen_settag(
		crystal_screen, crystal_x, crystal_y,
		"controlling_mosaic_"..n,
		screen .. "/" .. x .. "-" .. y
	)
end

put_switch(1, "lone_tower_0", 2, 4)
put_switch(2, "lone_tower_0", 6, 4)
put_switch(3, "northwest_floor_1", 2, 6)
put_switch(4, "northeast_floor_1", 6, 6)

-- Add advice on the wall, near the crystal.
screen_settile(crystal_screen, 3, 1, tileset..":wall_bot_written")
screen_settag(crystal_screen, 3, 1, "text", "To change the color of the crystal, set the floor tiles to the same color.")
screen_settag(crystal_screen, 3, 1, "text_type", "chalk")

-- Seal off left tower's door.
screen_settile(screen, 14, 11, tileset..":bigdoor_locked")
screen_settile("left_floor_0", 4, 9, tileset..":block_a")
