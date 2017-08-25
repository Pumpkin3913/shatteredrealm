#!/usr/bin/lua

local tileset, zone, x, y = ...

zone_settile(zone, x, y,   tileset..":roof_endlft")
zone_settile(zone, x, y+1, tileset..":wall_lft")
zone_settile(zone, x, y+2, tileset..":wall_botlft")
for i=1,3 do
	zone_settile(zone, x+i, y,   tileset..":roof_horizontal")
	zone_settile(zone, x+i, y+1, tileset..":wall")
	zone_settile(zone, x+i, y+2, tileset..":wall_bot")
end
zone_settile(zone, x+4, y,   tileset..":roof_endrgt")
zone_settile(zone, x+4, y+1, tileset..":wall_rgt")
zone_settile(zone, x+4, y+2, tileset..":wall_botrgt")

local write = function(zone, i, text)
	zone_settile(zone, x+i, y+2, tileset..":wall_bot_written")
	zone_settag(zone, x+i, y+2, "text", text)
	zone_settag(zone, x+i, y+2, "text_type", "chalk")
end

write(zone, 1, "Someone, please unlock the ziggurat.")
write(zone, 2, "Kali was here!")
write(zone, 3, "We need more souls in the graveyard!")
