#!/usr/bin/lua

character_message(Character, "Tu sens une présence démoniaque près de toi.")

local whisp = function(msg)
	character_message(Character, "Stolas te murmure: \""..msg.."\"")
end

local race = character_gettag(Character, "race")

if race == "demon" and character_gettag(Character, "have chalk") ~= "true" then
	whisp("Tu n'as même pas de craie. Tiens. Fais-en bon usage.")
	character_settag(Character, "have chalk", "true")
else
	local dice = c_rand(3)
	if dice == 1 then
		whisp("Trouves des livres et lis-les. Le savoir, c'est le pouvoir !")
	elseif dice == 2 then
		whisp("Les lieux anciens peuvent contenir des gravures et des livres précieux...")
	elseif dice == 3 then
		whisp("Le Mana et le Savoir sont des armes puissantes. Recherche les deux !")
	end
end

character_message(Character, "La présence démoniaque disparait.")
