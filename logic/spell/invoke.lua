#!/usr/bin/lua

local zone = character_getzone(Character)
local x = character_getx(Character)
local y = character_gety(Character)

-- Check mana.
local gauge = "mana"
local cost = 1
if gauge_getval(Character, gauge) < cost then
	character_message(Character, "Tu n'as pas assez de "..gauge..".")
	return
end

-- Check place.
local text
local check_place = function(x, y)
	text = place_gettag(zone, x, y, "text")
	return (text ~= "")
end
if not check_place(x,y)
and not check_place(x,y-1)
and not check_place(x,y+1)
and not check_place(x+1,y)
and not check_place(x-1,y)
then
	character_message(Character, "Il n'y a pas de nom de démon inscrit ici.")
	return
end

-- Check demon name.
if string.match(text, "Stolas.*") then
	gauge_decrease(Character, gauge, cost)
	dofile("logic/spell/invoke/stolas.lua")
else
	character_message(Character, "Ceci n'est pas un nom de démon.")
end
