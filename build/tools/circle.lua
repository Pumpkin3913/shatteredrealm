#!/usr/bin/lua

local prefix, zone, x, y, w, h = ...

place_setaspect(zone, x,     y,     prefix.."_toplft")
place_setaspect(zone, x+w-1, y,     prefix.."_toprgt")
place_setaspect(zone, x,     y+h-1, prefix.."_botlft")
place_setaspect(zone, x+w-1, y+h-1, prefix.."_botrgt")
for i=x+1,x+w-2 do
	place_setaspect(zone, i, y,     prefix.."_top")
	place_setaspect(zone, i, y+h-1, prefix.."_bot")
end
for j=y+1,y+h-2 do
	place_setaspect(zone, x,     j, prefix.."_lft")
	place_setaspect(zone, x+w-1, j, prefix.."_rgt")
end
