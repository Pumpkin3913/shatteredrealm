#!/usr/bin/lua

local zone = player_getzone(Player)
local x = player_getx(Player)
local y = player_gety(Player)

-- Check mana.
local gauge = "mana"
local cost = 1
if gauge_getval(Player, gauge) < cost then
	player_message(Player, "Tu n'as pas assez de "..gauge..".")
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
	player_message(Player, "Il n'y a pas de nom de démon inscrit ici.")
	return
end

-- Check demon name.
if string.match(text, "Stolas.*") then
	gauge_decrease(Player, gauge, cost)
	dofile("logic/spell/invoke/stolas.lua")
else
	player_message(Player, "Ceci n'est pas un nom de démon.")
end
