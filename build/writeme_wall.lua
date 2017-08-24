#!/usr/bin/lua

local tileset, screen, x, y = ...

screen_settile(screen, x, y,   tileset..":roof_endlft")
screen_settile(screen, x, y+1, tileset..":wall_lft")
screen_settile(screen, x, y+2, tileset..":wall_botlft")
for i=1,3 do
	screen_settile(screen, x+i, y,   tileset..":roof_horizontal")
	screen_settile(screen, x+i, y+1, tileset..":wall")
	screen_settile(screen, x+i, y+2, tileset..":wall_bot")
end
screen_settile(screen, x+4, y,   tileset..":roof_endrgt")
screen_settile(screen, x+4, y+1, tileset..":wall_rgt")
screen_settile(screen, x+4, y+2, tileset..":wall_botrgt")

local write = function(screen, i, text)
	screen_settile(screen, x+i, y+2, tileset..":wall_bot_written")
	screen_settag(screen, x+i, y+2, "text", text)
	screen_settag(screen, x+i, y+2, "text_type", "chalk")
end

write(screen, 1, "Someone, please unlock the ziggurat.")
write(screen, 2, "Kali was here!")
write(screen, 3, "We need more souls in the graveyard!")
