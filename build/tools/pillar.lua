#!/usr/bin/lua

local tileset, zone, x, y, h, top = ...

if not top then top = "roof_lone" end

place_setaspect(zone, x, y, tileset..":pillar_bot")
for i=1,h-2 do
	place_setaspect(zone, x, y-i, tileset..":pillar")
end
place_setaspect(zone, x, y-(h-1), tileset..":"..top)
