#!/usr/bin/lua

local lobby_zone, lobby_x, lobby_y = ...

local zone = "tutorial"
local tileset = "violetcastle"
local w = 11
local h = 37
local x_mid = math.floor(w/2)

new_zone(zone, "Tutorial", w, h, tileset..":path")

local build_horizontal_wall = function(y)
	for x=0,w-1 do
		place_setaspect(zone, x, y-1, tileset..":roof_horizontal")
		place_setaspect(zone, x, y,   tileset..":wall_bot")
	end
	place_setaspect(zone, x_mid-1, y-1, tileset..":roof_endrgt")
	place_setaspect(zone, x_mid,   y-1, tileset..":path")
	place_setaspect(zone, x_mid+1, y-1, tileset..":roof_horizontal")
	place_setaspect(zone, x_mid-1, y,   tileset..":wall_botrgt")
	place_setaspect(zone, x_mid,   y,   tileset..":path")
	place_setaspect(zone, x_mid+1, y,   tileset..":wall_botlft")
end

local y = h-2

local entrance_x = x_mid
local entrance_y = y
place_setaspect(zone, entrance_x, entrance_y, tileset..":mosaic_a") -- spawn point

y = y-3

build_horizontal_wall(y)
place_setlandon(zone, x_mid, y, "\
player_message(Player, \"* * *\")\
player_message(Player, \"Some elements are interacted with by simply walking over them.\")\
player_message(Player, \"Try walking on these squares, then go to the next room.\")\
")

y = y-3

place_setaspect  (zone, 2,   y, tileset..":mosaic_white")
place_setlandon(zone, 2,   y, "dofile(\"logic/switch_bw_mosaic.lua\")")
place_setaspect  (zone, w-3, y, tileset..":mosaic_black")
place_setlandon(zone, w-3, y, "dofile(\"logic/switch_bw_mosaic.lua\")")

y = y-3

place_setaspect  (zone, 2,   y, tileset..":mosaic_b")
place_setlandon(zone, 2,   y, "player_setxy(Player, "..w-3 ..", "..y..")")
place_setaspect  (zone, w-3, y, tileset..":mosaic_b")
place_setlandon(zone, w-3, y, "player_setxy(Player, 2, "..y..")")

y = y-2

build_horizontal_wall(y)
place_setlandon(zone, x_mid, y, "\
player_message(Player, \"* * *\")\
player_message(Player, \"To interact with an object, stand near it and type a command.\")\
player_message(Player, \"Try to /read this book.\")\
player_message(Player, \"Stand near the book, type '/read' and validate with enter.\")\
")

y = y-4

place_setaspect(zone, x_mid, y, tileset..":book_a_open")
place_settag(zone, x_mid, y, "text", "Well done! Go to the next room.")

y = y-3

build_horizontal_wall(y)
place_setlandon(zone, x_mid, y, "\
player_message(Player, \"* * *\")\
player_message(Player, \"Commands can be saved in the Fx keys and rapidely reused.\")\
player_message(Player, \"Pressing shift + F1 saves the current buffer in F1.\")\
player_message(Player, \"F1 then adds the saved text to the buffer. (Escape clears the buffer.)\")\
player_message(Player, \"Save the command '/read' to rapidely read these books, from left to right.\")\
")

y = y-4

place_setaspect(zone, 1, y, tileset..":book_a_open")
place_settag(zone, 1, y, "text", "You")

place_setaspect(zone, 3, y, tileset..":book_a_open")
place_settag(zone, 3, y, "text", "Are")

place_setaspect(zone, x_mid, y, tileset..":book_a_open")
place_settag(zone, x_mid, y, "text", "Doing")

place_setaspect(zone, w-4, y, tileset..":book_a_open")
place_settag(zone, w-4, y, "text", "It")

place_setaspect(zone, w-2, y, tileset..":book_a_open")
place_settag(zone, w-2, y, "text", "Right!")

y = y-3

build_horizontal_wall(y)
place_setlandon(zone, x_mid, y, "\
player_message(Player, \"* * *\")\
player_message(Player, \"Some items may be interacted with in a more advanced way.\")\
player_message(Player, \"Try to /open and /close these objects.\")\
player_message(Player, \"Look out for tips about commands throughout the game.\")\
")

y = y-4

place_setaspect(zone, 3, y, tileset..":book_a_close")
place_settag(zone, 3, y, "openclose_state", "close")
place_settag(zone, 3, y, "openclose_opentile", tileset..":book_a_open")
place_settag(zone, 3, y, "openclose_closetile", tileset..":book_a_close")
place_settag(zone, 3, y, "text", "You can /search containers.")

place_setaspect(zone, w-4, y, tileset..":coffer_common_close")
place_settag (zone, w-4, y, "openclose_state", "close")
place_settag (zone, w-4, y, "openclose_opentile", tileset..":coffer_common_open")
place_settag (zone, w-4, y, "openclose_closetile", tileset..":coffer_common_close")
place_settag (zone, w-4, y, "content", "Cookie!")

place_setaspect(zone, 1, y-2, tileset..":roof_lone")
place_setaspect(zone, 1, y-1, tileset..":pillar")
place_setaspect(zone, 1, y,   tileset..":pillar_bot")

place_setaspect(zone, w-2, y-2, tileset..":roof_lone")
place_setaspect(zone, w-2, y-1, tileset..":pillar")
place_setaspect(zone, w-2, y,   tileset..":pillar_bot")

y = y-3

place_setaspect(zone, x_mid-2, y,   tileset..":wall_botlft")
place_setaspect(zone, x_mid-1, y,   tileset..":bigdoor_lft")
place_setaspect(zone, x_mid,   y,   tileset..":bigdoor_closed")
place_setaspect(zone, x_mid+1, y,   tileset..":bigdoor_rgt")
place_setaspect(zone, x_mid+2, y,   tileset..":wall_botrgt")

place_setaspect(zone, x_mid-2, y-1, tileset..":wall_lft")
place_setaspect(zone, x_mid-1, y-1, tileset..":bigdoor_toplft")
place_setaspect(zone, x_mid,   y-1, tileset..":bigdoor_top")
place_setaspect(zone, x_mid+1, y-1, tileset..":bigdoor_toprgt")
place_setaspect(zone, x_mid+2, y-1, tileset..":wall_rgt")

place_setaspect(zone, x_mid-2, y-2, tileset..":roof_endlft")
place_setaspect(zone, x_mid-1, y-2, tileset..":roof_horizontal")
place_setaspect(zone, x_mid,   y-2, tileset..":roof_horizontal")
place_setaspect(zone, x_mid+1, y-2, tileset..":roof_horizontal")
place_setaspect(zone, x_mid+2, y-2, tileset..":roof_endrgt")

place_settag(zone, x_mid, y, "openclose_state", "close")
place_settag(zone, x_mid, y, "openclose_opentile", tileset..":bigdoor")
place_settag(zone, x_mid, y, "openclose_closetile", tileset..":bigdoor_closed")

place_setlandon(zone, x_mid, y, "player_changezone(Player, \""..lobby_zone.."\", "..lobby_x..", "..lobby_y..")")

info("[WORLDGEN] Tutorial finished.")

return zone, entrance_x, entrance_y
