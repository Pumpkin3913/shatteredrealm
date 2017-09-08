#!/usr/bin/lua

local tileset, zone, x, y, w, h, plateau_h, options = ...

if not options then options = "" end
local left = not string.match(options, ".*noleft.*")
local right = not string.match(options, ".*noright.*")
local bottom = not string.match(options, ".*nobottom.*")
local roof = string.match(options, ".*roof.*")

for i=0,w-1 do
	for j=0,h-1 do
		if j < plateau_h then
			if i == 0 and left then
				place_setaspect(zone, x+i, y+j, tileset..":roof_lft")
			elseif i == w-1 and right then
				place_setaspect(zone, x+i, y+j, tileset..":roof_rgt")
			elseif roof then
				place_setaspect(zone, x+i, y+j, tileset..":roof")
			end
		elseif j == plateau_h then
			if i == 0 and left then
				place_setaspect(zone, x+i, y+j, tileset..":roof_botlft")
			elseif i < w-1 or not right then
				place_setaspect(zone, x+i, y+j, tileset..":roof_bot")
			elseif i == w-1 and right then
				place_setaspect(zone, x+i, y+j, tileset..":roof_botrgt")
			end
		elseif j < h-1 or not bottom then
			if i == 0 and left then
				place_setaspect(zone, x+i, y+j, tileset..":wall_lft")
			elseif i < w-1 or not right then
				place_setaspect(zone, x+i, y+j, tileset..":wall")
			elseif i == w-1 and right then
				place_setaspect(zone, x+i, y+j, tileset..":wall_rgt")
			end
		elseif j == h-1 then
			if i == 0 and left then
				place_setaspect(zone, x+i, y+j, tileset..":wall_botlft")
			elseif i < w-1 or not right then
				place_setaspect(zone, x+i, y+j, tileset..":wall_bot")
			elseif i == w-1 and right then
				place_setaspect(zone, x+i, y+j, tileset..":wall_botrgt")
			end
		end
	end
end
