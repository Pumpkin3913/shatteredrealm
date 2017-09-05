#!/usr/bin/lua

-- Check if Player is a daemon.
if player_gettag(Player, "race") ~= "demon" then
	player_message(Player, "Tu n'es pas un démon.")
	return
end

-- Check if hand contains an artifact.
local hand = player_gettag(Player, "hand")
if not hand or hand == "" or hand == "EMPTY" then
	player_message(Player, "Tu dois tenir un réceptacle d'âme dans ta main.")
	return
end

-- Check if the artifact is a soul_vessel.
local content = artifact_gettag(hand, "soul_vessel")
if not content or content == "" then
	player_message(Player, "Ceci n'est pas un réceptacle d'âme.")
	return
end

-- Check if the vessel contains a soul.
if content ~= "full" then
	player_message(Player, "Ce réceptacle ne contient pas d'âme.")
	return
end

-- Devour the soul.
artifact_settag(hand, "soul_vessel", "empty")
player_message(Player, "L'âme est dévorée !")

-- Get soul-level.
local level = player_gettag(Player, "soul_level")
if not level or level == "" then
	level = 0
else
	level = tonumber(level)
end

-- Increase soul-level.
if level < 999 then
	level = level+1
	player_settag(Player, "soul_level", level)
end

-- Hint to continue.
if level < 3 then
	player_message(Player, "Tu sens ta puissance augmenter légèrement.")
-- Give power at level 3.
elseif level == 3 then
	-- Mana-up.
	local mana_max = gauge_getmax(Player, "mana")
	gauge_setmax(Player, "mana", mana_max+1)

	-- Give wings.
	local aspect = player_getaspect(Player)
	if aspect == "demon" then
		aspect = "demon_wings"
	elseif aspect == "demon_flame" then
		aspect = "demon_flame_wings"
	elseif aspect == "demon_trident_flame" then
		aspect = "demon_trident_flame_wings"
	else
		Warning("devour_soul.lua cannot give wings: Player aspect error.")
	end
	player_setaspect(Player, aspect)

	-- Message.
	player_message(Player, "Tu sens tes pouvoirs magiques augmenter !")
end

-- Regenerate mana.
gauge_increase(Player, "mana", 3)
