#!/usr/bin/lua

local lobby_screen, lobby_x, lobby_y = ...

local screen = "tutorial"
local tileset = "violetcastle"
local w = 11
local h = 37
local x_mid = math.floor(w/2)

new_screen(screen, "Tutorial", w, h, tileset..":path")

local build_horizontal_wall = function(y)
	for x=0,w-1 do
		screen_settile(screen, x, y-1, tileset..":roof_horizontal")
		screen_settile(screen, x, y,   tileset..":wall_bot")
	end
	screen_settile(screen, x_mid-1, y-1, tileset..":roof_endrgt")
	screen_settile(screen, x_mid,   y-1, tileset..":path")
	screen_settile(screen, x_mid+1, y-1, tileset..":roof_horizontal")
	screen_settile(screen, x_mid-1, y,   tileset..":wall_botrgt")
	screen_settile(screen, x_mid,   y,   tileset..":path")
	screen_settile(screen, x_mid+1, y,   tileset..":wall_botlft")
end

local y = h-2

local entrance_x = x_mid
local entrance_y = y
screen_settile(screen, entrance_x, entrance_y, tileset..":mosaic_a") -- spawn point

y = y-3

build_horizontal_wall(y)
screen_setlandon(screen, x_mid, y, "\
player_message(Player, \"* * *\")\
player_message(Player, \"Some elements are interacted with by simply walking over them.\")\
player_message(Player, \"Try walking on these squares, then go to the next room.\")\
")

y = y-3

screen_settile  (screen, 2,   y, tileset..":mosaic_white")
screen_setlandon(screen, 2,   y, "dofile(\"logic/switch_bw_mosaic.lua\")")
screen_settile  (screen, w-3, y, tileset..":mosaic_black")
screen_setlandon(screen, w-3, y, "dofile(\"logic/switch_bw_mosaic.lua\")")

y = y-3

screen_settile  (screen, 2,   y, tileset..":mosaic_b")
screen_setlandon(screen, 2,   y, "player_setxy(Player, "..w-3 ..", "..y..")")
screen_settile  (screen, w-3, y, tileset..":mosaic_b")
screen_setlandon(screen, w-3, y, "player_setxy(Player, 2, "..y..")")

y = y-2

build_horizontal_wall(y)
screen_setlandon(screen, x_mid, y, "\
player_message(Player, \"* * *\")\
player_message(Player, \"To interact with an object, stand near it and type a command.\")\
player_message(Player, \"Try to /read this book.\")\
player_message(Player, \"Stand near the book, type '/read' and validate with enter.\")\
")

y = y-4

screen_settile(screen, x_mid, y, tileset..":book_a_open")
screen_settag(screen, x_mid, y, "text", "Well done! Go to the next room.")

y = y-3

build_horizontal_wall(y)
screen_setlandon(screen, x_mid, y, "\
player_message(Player, \"* * *\")\
player_message(Player, \"Commands can be saved in the Fx keys and rapidely reused.\")\
player_message(Player, \"Pressing shift + F1 saves the current buffer in F1.\")\
player_message(Player, \"F1 then adds the saved text to the buffer. (Escape clears the buffer.)\")\
player_message(Player, \"Save the command '/read' to rapidely read these books, from left to right.\")\
")

y = y-4

screen_settile(screen, 1, y, tileset..":book_a_open")
screen_settag(screen, 1, y, "text", "You")

screen_settile(screen, 3, y, tileset..":book_a_open")
screen_settag(screen, 3, y, "text", "Are")

screen_settile(screen, x_mid, y, tileset..":book_a_open")
screen_settag(screen, x_mid, y, "text", "Doing")

screen_settile(screen, w-4, y, tileset..":book_a_open")
screen_settag(screen, w-4, y, "text", "It")

screen_settile(screen, w-2, y, tileset..":book_a_open")
screen_settag(screen, w-2, y, "text", "Right!")

y = y-3

build_horizontal_wall(y)
screen_setlandon(screen, x_mid, y, "\
player_message(Player, \"* * *\")\
player_message(Player, \"Some items may be interacted with in a more advanced way.\")\
player_message(Player, \"Try to /open and /close these objects.\")\
player_message(Player, \"Look out for tips about commands throughout the game.\")\
")

y = y-4

screen_settile(screen, 3, y, tileset..":book_a_close")
screen_settag(screen, 3, y, "openclose_state", "close")
screen_settag(screen, 3, y, "openclose_opentile", tileset..":book_a_open")
screen_settag(screen, 3, y, "openclose_closetile", tileset..":book_a_close")
screen_settag(screen, 3, y, "text", "You can /search containers.")

screen_settile(screen, w-4, y, tileset..":coffer_common_close")
screen_settag (screen, w-4, y, "openclose_state", "close")
screen_settag (screen, w-4, y, "openclose_opentile", tileset..":coffer_common_open")
screen_settag (screen, w-4, y, "openclose_closetile", tileset..":coffer_common_close")
screen_settag (screen, w-4, y, "content", "Cookie!")

screen_settile(screen, 1, y-2, tileset..":roof_lone")
screen_settile(screen, 1, y-1, tileset..":pillar")
screen_settile(screen, 1, y,   tileset..":pillar_bot")

screen_settile(screen, w-2, y-2, tileset..":roof_lone")
screen_settile(screen, w-2, y-1, tileset..":pillar")
screen_settile(screen, w-2, y,   tileset..":pillar_bot")

y = y-3

screen_settile(screen, x_mid-2, y,   tileset..":wall_botlft")
screen_settile(screen, x_mid-1, y,   tileset..":bigdoor_lft")
screen_settile(screen, x_mid,   y,   tileset..":bigdoor_closed")
screen_settile(screen, x_mid+1, y,   tileset..":bigdoor_rgt")
screen_settile(screen, x_mid+2, y,   tileset..":wall_botrgt")

screen_settile(screen, x_mid-2, y-1, tileset..":wall_lft")
screen_settile(screen, x_mid-1, y-1, tileset..":bigdoor_toplft")
screen_settile(screen, x_mid,   y-1, tileset..":bigdoor_top")
screen_settile(screen, x_mid+1, y-1, tileset..":bigdoor_toprgt")
screen_settile(screen, x_mid+2, y-1, tileset..":wall_rgt")

screen_settile(screen, x_mid-2, y-2, tileset..":roof_endlft")
screen_settile(screen, x_mid-1, y-2, tileset..":roof_horizontal")
screen_settile(screen, x_mid,   y-2, tileset..":roof_horizontal")
screen_settile(screen, x_mid+1, y-2, tileset..":roof_horizontal")
screen_settile(screen, x_mid+2, y-2, tileset..":roof_endrgt")

screen_settag(screen, x_mid, y, "openclose_state", "close")
screen_settag(screen, x_mid, y, "openclose_opentile", tileset..":bigdoor")
screen_settag(screen, x_mid, y, "openclose_closetile", tileset..":bigdoor_closed")

screen_setlandon(screen, x_mid, y, "player_changescreen(Player, \""..lobby_screen.."\", "..lobby_x..", "..lobby_y..")")

verbose("[WORLDGEN] Tutorial finished.")

return screen, entrance_x, entrance_y
