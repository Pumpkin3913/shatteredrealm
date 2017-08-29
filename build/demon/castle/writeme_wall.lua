#!/usr/bin/lua

local tileset, zone, x, y = ...

place_setaspect(zone, x, y,   tileset..":roof_endlft")
place_setaspect(zone, x, y+1, tileset..":wall_lft")
place_setaspect(zone, x, y+2, tileset..":wall_botlft")
for i=1,3 do
	place_setaspect(zone, x+i, y,   tileset..":roof_horizontal")
	place_setaspect(zone, x+i, y+1, tileset..":wall")
	place_setaspect(zone, x+i, y+2, tileset..":wall_bot")
end
place_setaspect(zone, x+4, y,   tileset..":roof_endrgt")
place_setaspect(zone, x+4, y+1, tileset..":wall_rgt")
place_setaspect(zone, x+4, y+2, tileset..":wall_botrgt")

local write = function(zone, i, text)
	place_setaspect(zone, x+i, y+2, tileset..":wall_bot_written")
	place_settag(zone, x+i, y+2, "text", text)
	place_settag(zone, x+i, y+2, "text_type", "chalk")
end

write(zone, 1, "Someone, please unlock the ziggurat.")
write(zone, 2, "Kali was here!")
write(zone, 3, "We need more souls in the graveyard!")
