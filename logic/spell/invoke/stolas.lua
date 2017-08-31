#!/usr/bin/lua

player_message(Player, "Tu sens une présence démoniaque près de toi.")

local race = player_gettag(Player, "race")

local whisp = function(msg)
	player_message(Player, "Stolas te murmure: \""..msg.."\"")
end

if race == "demon" and not player_gettag(Player, "have chalk") then
	whisp("Tu n'as même pas de craie. Tiens. Fais-en bon usage.")
	player_settag(Player, "have chalk", true)
else
	local dice = c_rand(3)
	if dice == 1 then
		whisp("Trouves des livres et lis-les. Le savoir, c'est le pouvoir !")
	elseif dice == 2 then
		whisp("Les lieux anciens peuvent contenir des gravures livres précieux...")
	elseif dice == 3 then
		whisp("Le Mana et le Savoir sont des armes puissantes. Recherche les deux !")
	end
end

player_message(Player, "La présence démoniaque disparait.")
