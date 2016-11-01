#!/usr/bin/lua

-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - --
-- Builds a 7x7 ziggurat at designated point with entrance and intern room.  --
-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - --

-- Keep track of the number of ziggurats created.

if ziggurat_number == nil then
	ziggurat_number = 0
else
	ziggurat_number = ziggurat_number + 1
end

-- Get arguments.
local tileset, extern_screen, x_shift, y_shift = ...

-- Build Extern Ziggurat.

--
--
screen_settile(extern_screen, x_shift+2, y_shift+0, tileset..":roof_toplft")
screen_settile(extern_screen, x_shift+3, y_shift+0, tileset..":roof_top")
screen_settile(extern_screen, x_shift+4, y_shift+0, tileset..":roof_toprgt")
--
--

--
screen_settile(extern_screen, x_shift+1, y_shift+1, tileset..":roof_toplft")
screen_settile(extern_screen, x_shift+2, y_shift+1, tileset..":roof_botlft")
screen_settile(extern_screen, x_shift+3, y_shift+1, tileset..":roof_bot")
screen_settile(extern_screen, x_shift+4, y_shift+1, tileset..":roof_botrgt")
screen_settile(extern_screen, x_shift+5, y_shift+1, tileset..":roof_toprgt")
--

screen_settile(extern_screen, x_shift+0, y_shift+2, tileset..":roof_toplft")
screen_settile(extern_screen, x_shift+1, y_shift+2, tileset..":roof_lft")
screen_settile(extern_screen, x_shift+2, y_shift+2, tileset..":wall_botlft")
screen_settile(extern_screen, x_shift+3, y_shift+2, tileset..":wall_bot")
screen_settile(extern_screen, x_shift+4, y_shift+2, tileset..":wall_botrgt")
screen_settile(extern_screen, x_shift+5, y_shift+2, tileset..":roof_rgt")
screen_settile(extern_screen, x_shift+6, y_shift+2, tileset..":roof_toprgt")

screen_settile(extern_screen, x_shift+0, y_shift+3, tileset..":roof_lft")
screen_settile(extern_screen, x_shift+1, y_shift+3, tileset..":roof_botlft")
screen_settile(extern_screen, x_shift+2, y_shift+3, tileset..":roof_bot")
screen_settile(extern_screen, x_shift+3, y_shift+3, tileset..":roof_bot")
screen_settile(extern_screen, x_shift+4, y_shift+3, tileset..":roof_bot")
screen_settile(extern_screen, x_shift+5, y_shift+3, tileset..":roof_botrgt")
screen_settile(extern_screen, x_shift+6, y_shift+3, tileset..":roof_rgt")

screen_settile(extern_screen, x_shift+0, y_shift+4, tileset..":roof_lft")
screen_settile(extern_screen, x_shift+1, y_shift+4, tileset..":wall_lft")
screen_settile(extern_screen, x_shift+2, y_shift+4, tileset..":bigdoor_toplft")
screen_settile(extern_screen, x_shift+3, y_shift+4, tileset..":bigdoor_top")
screen_settile(extern_screen, x_shift+4, y_shift+4, tileset..":bigdoor_toprgt")
screen_settile(extern_screen, x_shift+5, y_shift+4, tileset..":wall_rgt")
screen_settile(extern_screen, x_shift+6, y_shift+4, tileset..":roof_rgt")

screen_settile(extern_screen, x_shift+0, y_shift+5, tileset..":roof_botlft")
screen_settile(extern_screen, x_shift+1, y_shift+5, tileset..":roof_botrgt")
screen_settile(extern_screen, x_shift+2, y_shift+5, tileset..":bigdoor_lft")
screen_settile(extern_screen, x_shift+3, y_shift+5, tileset..":bigdoor")
screen_settile(extern_screen, x_shift+4, y_shift+5, tileset..":bigdoor_rgt")
screen_settile(extern_screen, x_shift+5, y_shift+5, tileset..":roof_botlft")
screen_settile(extern_screen, x_shift+6, y_shift+5, tileset..":roof_botrgt")

screen_settile(extern_screen, x_shift+0, y_shift+6, tileset..":wall_botlft")
screen_settile(extern_screen, x_shift+1, y_shift+6, tileset..":wall_botrgt")
--
--
--
screen_settile(extern_screen, x_shift+5, y_shift+6, tileset..":wall_botlft")
screen_settile(extern_screen, x_shift+6, y_shift+6, tileset..":wall_botrgt")

-- Build Intern Room.

local screen = "ziggurat_intern_"..ziggurat_number
local w = 7
local h = 10
new_screen(screen, "Ziggurat", w, h, tileset..":roof")

for x=0,w-1 do
	for y=0,h-1 do
		local dice = c_rand(10)
		if dice == 1 then
			screen_settile(screen, x, y, tileset..":roof_rare_c")
		elseif dice == 2 then
			screen_settile(screen, x, y, tileset..":roof_rare_d")
		end
	end
end

local entrance_x = 3;
for i=0,w-1 do
	screen_settile(screen, i, 0, tileset..":wall")
	screen_settile(screen, i, 1, tileset..":wall_bot")
	if i == entrance_x then
		screen_settile(screen, i, h-2, tileset..":roof")
		screen_settile(screen, i, h-1, tileset..":mosaic_a")
		screen_setlandon(screen, 3, h-1, "player_changescreen(Player, \""..extern_screen.."\", ".. x_shift+3 ..", ".. y_shift+5 ..")")
		screen_setlandon(extern_screen, x_shift+3, y_shift+5, "player_changescreen(Player, \""..screen.."\", 3, ".. h-1 ..")")
	elseif i == entrance_x-1 then
		-- screen_settile(screen, i, h-2, tileset..":roof_endrgt")
		screen_settile(screen, i, h-2, tileset..":wall_rgt")
		screen_settile(screen, i, h-1, tileset..":wall_botrgt")
	elseif i == entrance_x+1 then
		-- screen_settile(screen, i, h-2, tileset..":roof_endlft")
		screen_settile(screen, i, h-2, tileset..":wall_lft")
		screen_settile(screen, i, h-1, tileset..":wall_botlft")
	else
		-- screen_settile(screen, i, h-2, tileset..":roof_horizontal")
		screen_settile(screen, i, h-2, tileset..":wall")
		screen_settile(screen, i, h-1, tileset..":wall_bot")
	end
end

-- Add writtne "howto" on wall.
screen_settile(screen, 2, 1, tileset..":wall_bot_written")
screen_settag(screen, 2, 1, "text", "To change the color of the crystal, set the floor tiles to the same color.")

-- Add crystal and mosaic.
screen_settile(screen, 1, 5, tileset..":mosaic_black")
screen_settile(screen, 3, 3, tileset..":mosaic_black")
screen_settile(screen, 5, 5, tileset..":mosaic_black")
screen_settile(screen, 3, 5, tileset..":crystal_2")

-- Enable ziggurat's mechanism.
screen_setlandon(screen, 1, 5, "dofile(\"logic/ziggurat.lua\")")
screen_setlandon(screen, 3, 3, "dofile(\"logic/ziggurat.lua\")")
screen_setlandon(screen, 5, 5, "dofile(\"logic/ziggurat.lua\")")

verbose("Ziggurat #"..ziggurat_number.." built in '"..extern_screen.."'.")

