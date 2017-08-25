#!/usr/bin/lua

local screen = "lobby"
local w = 31
local h = 31

new_screen(screen, "Lobby", w, h, "void")

-- Tutorial

local x = 16
local y = 20
screen_settile(screen, x, y, "violetcastle:mosaic_a")
local tuto_screen, tuto_x, tuto_y = loadfile("lobby/build_tutorial.lua")(screen, x, y)
screen_setlandon(screen, x, y, "player_changescreen(Player, \""..tuto_screen.."\", "..tuto_x..", "..tuto_y..")")

-- Start choices

local build_choice = function(x, y, tileset, name, dummy)
	local x, y = loadfile("build/tools/building.lua")(tileset, screen, x, y, 5)
	screen_setlandon(screen, x, y, "dofile(\"lobby/choice_"..string.lower(name)..".lua\")")
	screen_settile(screen, x-1, y+2, dummy)
	screen_settile(screen, x+1, y+2, tileset..":book_a_open")
	screen_settag(screen, x+1, y+2, "text", name)
end

build_choice(1, 1, "redruins", "Demon", "demon_trident_flame_wings")
build_choice(8, 1, "violetcastle", "Human", "white_armor")

verbose("[WORLDGEN] Lobby finished.")
