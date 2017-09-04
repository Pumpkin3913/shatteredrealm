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

-- Check if soul-vessel in hand.
local hand = player_gettag(Player, "hand")
if not hand or hand == "" then -- or hand == "EMPTY" then
	-- player_message(Player, "Tu dois tenir un réceptacle d'âme en main.")
	player_message(Player, "Tu n'as pas de main.")
	return
end

if hand ~= "EMPTY" then
	local state = artifact_gettag(hand, "soul_vessel")
	if state ~= "full" and state ~= "empty" then
		player_message(Player, "L'objet tenu en main n'est pas un réceptacle d'âme.")
		return
	end
end

-- Do the spell.
local function fun(x, y, vessel)
	local place_content = place_gettag(zone, x, y, "soul_vessel")
	if not place_content or (place_content ~= "full" and place_content ~= "empty") then
		return false;
	end

	-- If spell cast empty-handed, check if place contains soul.
	-- This requires mana but consume none.
	if vessel == "EMPTY" then
		if place_content == "full" then
			player_message(Player, "Ce lieu contient une âme.")
		else
			player_message(Player, "Ce lieu peut contenir une âme.")
		end
		return true
	end

	-- Else, exchange a soul between the vessel and the place.
	local vessel_content = artifact_gettag(vessel, "soul_vessel")

	if vessel_content == "empty" then
		if place_content == "full" then
			-- Capture soul.
			place_settag(zone, x, y, "soul_vessel", "empty")
			artifact_settag(vessel, "soul_vessel", "full")
			gauge_decrease(Player, gauge, cost)
			player_message(Player, "L'âme est prise à ce lieu.")
		else
			player_message(Player, "Il n'y a pas d'âme à capturer, ici.")
		end
	else -- vessel is full
		if place_content == "empty" then
			-- Bind soul.
			artifact_settag(vessel, "soul_vessel", "empty")
			place_settag(zone, x, y, "soul_vessel", "full")
			gauge_decrease(Player, gauge, cost)
			player_message(Player, "L'âme est liée à ce lieu.")
		else
			player_message(Player, "Il y a déjà une âme, ici.")
		end
	end
	
	return true
end

if not fun(x, y, hand)
and not fun(x, y-1, hand)
and not fun(x, y+1, hand)
and not fun(x-1, y, hand)
and not fun(x+1, y, hand)
then
	if hand == "EMPTY" then
		player_message(Player, "Il n'y a pas de réceptacle d'âme, ici.")
	elseif artifact_gettag(hand, "soul_vessel") == "full" then
		player_message(Player, "Le réceptacle tenu en main contient une âme.")
	else
		player_message(Player, "Le réceptacle tenu en main ne contient pas d'âme.")
	end
end
