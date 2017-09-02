#!/usr/bin/lua

local tileset, zone, x_shift, y_shift = ...
local name = "La Tour sans Porte"

info("[WORLDGEN] [Demon Castle] Climb Tower")

loadfile("build/tools/cube.lua")(tileset, zone, x_shift, y_shift, 5, 9, 4)

-- Add climb path.
place_setaspect(zone, x_shift+3, y_shift+4, tileset..":roof_bot_climb")
place_setaspect(zone, x_shift+3, y_shift+5, tileset..":wall_climb")
place_setaspect(zone, x_shift+3, y_shift+6, tileset..":wall_climb")
place_setaspect(zone, x_shift+3, y_shift+7, tileset..":wall_climb")
place_setaspect(zone, x_shift+3, y_shift+8, tileset..":wall_bot_climb")
for i=4,8 do
	place_setpassable(zone, x_shift+3, y_shift+i)
end

-- Add window.
place_setaspect(zone, x_shift+2, y_shift+6, tileset..":wall_window")
place_setaspect(zone, x_shift+2, y_shift+8, tileset..":wall_bot_window")

-- Floor 1
local floor1 = "climbtower_floor_1"
loadfile("build/tools/interior.lua")(tileset, floor1, name, 9, 10)
place_setaspect(floor1, 4, 0, tileset..":wall_window")
place_setaspect(floor1, 4, 8, tileset..":wall_window")

place_setaspect(floor1, 4, 2, tileset..":stairs_up")
place_setaspect(zone, x_shift+2, y_shift+1, tileset..":hatch")
loadfile("build/tools/link.lua")(floor1, 4, 2, zone, x_shift+2, y_shift+1)

for x=1,7 do
	place_setaspect(floor1, x, 4, tileset..":roof_horizontal")
	place_setaspect(floor1, x, 5, tileset..":wall_bot")
end

loadfile("build/demon/castle/sesame_door.lua")(tileset, floor1, 4, 5)

-- Floor 0
local floor0 = "climbtower_floor_0"
loadfile("build/tools/interior.lua")(tileset, floor0, name, 9, 10)
place_setaspect(floor0, 4, 1, tileset..":wall_bot_window")
place_setaspect(floor0, 4, 9, tileset..":wall_bot_window")

place_setaspect(floor0, 4, 7, tileset..":stairs_up")
place_setaspect(floor1, 4, 7, tileset..":stairs_down")
loadfile("build/tools/link.lua")(floor0, 4, 7, floor1, 4, 7)

-- Floor -1
local floor_1 = "climbtower_floor_-1"
loadfile("build/tools/interior.lua")(tileset, floor_1, name, 9, 10)

-- Magical stairs between floors 0 and -1.

loadfile("build/tools/openclose_build.lua")(floor0, 4, 2, "close", tileset..":stairs_down", tileset..":mosaic_special")
place_settag(floor0, 4, 2, "openclose_triggeronly", "true")
place_settag(floor0, 4, 2, "openclose_selfclose", 30)
place_settag(floor0, 4, 2, "openclose_trigger_close",
	"loadfile(\"logic/puzzle_mosaic_reset.lua\")(\""..floor0 .."\", 4, 2)\
	 loadfile(\"logic/puzzle_mosaic_reset.lua\")(\""..floor_1.."\", 4, 2)")
place_setlandon(floor0, 4, 2, "\
if place_gettag(\""..floor0.."\", 4, 2, \"openclose_state\") == \"open\" then\
	player_changezone(Player, \""..floor_1.."\", 4, 2)\
end")

loadfile("build/tools/openclose_addslave.lua")(floor0, 4, 2, floor_1, 4, 2, 1, tileset..":stairs_up", tileset..":mosaic_special")
place_settag(floor_1, 4, 2, "openclose_triggeronly", "true")
place_setlandon(floor_1, 4, 2, "\
if place_gettag(\""..floor0.."\", 4, 2, \"openclose_state\") == \"open\" then\
	player_changezone(Player, \""..floor0.."\", 4, 2)\
end")

-- Pattern puzzle

local script = "loadfile(\"logic/openclose.lua\")(\""..floor0.."\", 4, 2, \"open\")"

local master_x = 4
local master_y = 2
local n

local function place_piece(zone, n, model, x, y)
	local master = zone.."/"..master_x.."-"..master_y
	place_setaspect(zone, x, y, tileset..":mosaic_black")
	place_settag(zone, x, y, "puzzle_init", "black")
	place_settag(zone, x, y, "puzzle_model", model)
	place_settag(zone, x, y, "puzzle_master", master)
	place_setlandon(zone, x, y, "dofile(\"logic/puzzle_mosaic_walk.lua\")")
	place_settag(zone, master_x, master_y, "puzzle_piece_"..n, zone.."/"..x.."-"..y)
end

-- Puzzle floor 0
place_settag(floor0, master_x, master_y, "puzzle_script", script)

n = 1
for x=6,7 do
	for y=3,6 do
		local color = "black"
		if (x+y)%2 == 0 then color = "white" end
		place_setaspect(floor0, x-5, y, tileset..":mosaic_"..color) -- Model.
		place_piece(floor0, n, color, x, y)
		n = n+1
	end
end

-- Puzzle floor -1
place_settag(floor_1, master_x, master_y, "puzzle_script", script)

n = 1
for x=6,7 do
	for y=3,6 do
		local color = "black"
		if x == 6 and (y == 4 or y == 5) then color = "white" end
		place_setaspect(floor_1, x-5, y, tileset..":mosaic_"..color) -- Model.
		place_piece(floor_1, n, color, x, y)
		n = n+1
	end
end
