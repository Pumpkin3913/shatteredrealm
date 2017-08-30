#!/usr/bin/lua

local zone = player_getzone(Player)
local x = player_getx(Player)
local y = player_gety(Player)

-- Check mana.
local gauge = "mana"
local cost = 1
if gauge_getval(Player, gauge) < cost then
	player_message(Player, "You don't have enough "..gauge..".")
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
	player_message(Player, "There is no demon name written here.")
	return
end

-- Check demon name.
if string.match(text, "Stolas.*") then
	gauge_decrease(Player, gauge, cost)
	dofile("logic/spell/invoke/stolas.lua")
else
	player_message(Player, "There is no demon name written here.")
end
