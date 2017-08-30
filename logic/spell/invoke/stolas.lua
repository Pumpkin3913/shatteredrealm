#!/usr/bin/lua

player_message(Player, "You feel a demonic presence near you.")

local race = player_gettag(Player, "race")
local inventory = player_gettag(Player, "inventory")

local whisp = function(msg)
	player_message(Player, "Stolas whispers to you: \""..msg.."\"")
end

if race == "demon" and not string.match(inventory, ".*chalk.*") then
	whisp("You don't even have a chalk. Here. Use it wisely.")
	player_settag(Player, "inventory", inventory..":chalk")
else
	local dice = c_rand(3)
	if dice == 1 then
		whisp("Find books and read them all. Knowledge is power!")
	elseif dice == 2 then
		whisp("Ancient places may contain valuable books and engravings...")
	elseif dice == 3 then
		whisp("Mana and Knowledge are powerful weapons. Seek both!")
	end
end

player_message(Player, "The demonic presence vanishes.")
