#!/usr/bin/lua

-- Check if Character is a daemon.
if character_gettag(Character, "race") ~= "demon" then
	character_message(Character, "Tu n'es pas un démon.")
	return
end

-- Check if hand contains an artifact.
local hand = character_gettag(Character, "hand")
if not hand or hand == "" or hand == "EMPTY" then
	character_message(Character, "Tu dois tenir un réceptacle d'âme dans ta main.")
	return
end

-- Check if the artifact is a soul_vessel.
local content = artifact_gettag(hand, "soul_vessel")
if not content or content == "" then
	character_message(Character, "Ceci n'est pas un réceptacle d'âme.")
	return
end

-- Check if the vessel contains a soul.
if content ~= "full" then
	character_message(Character, "Ce réceptacle ne contient pas d'âme.")
	return
end

-- Devour the soul.
artifact_settag(hand, "soul_vessel", "empty")
character_message(Character, "L'âme est dévorée !")

-- Get soul-level.
local level = character_gettag(Character, "soul_level")
if not level or level == "" then
	level = 0
else
	level = tonumber(level)
end

-- Increase soul-level.
if level < 999 then
	level = level+1
	character_settag(Character, "soul_level", level)
end

-- Hint to continue.
if level < 3 then
	character_message(Character, "Tu sens ta puissance augmenter légèrement.")
-- Give power at level 3.
elseif level == 3 then
	-- Mana-up.
	local mana_max = gauge_getmax(Character, "mana")
	gauge_setmax(Character, "mana", mana_max+1)

	-- Give wings.
	local aspect = character_getaspect(Character)
	if aspect == "demon" then
		aspect = "demon_wings"
	elseif aspect == "demon_flame" then
		aspect = "demon_flame_wings"
	elseif aspect == "demon_trident_flame" then
		aspect = "demon_trident_flame_wings"
	else
		Warning("devour_soul.lua cannot give wings: Character aspect error.")
	end
	character_setaspect(Character, aspect)

	-- Message.
	character_message(Character, "Tu sens tes pouvoirs magiques augmenter !")
end

-- Regenerate mana.
gauge_increase(Character, "mana", 3)
