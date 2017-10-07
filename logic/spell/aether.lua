#!/usr/bin/lua

local zone = character_getzone(Character);
local x = character_getx(Character);
local y = character_gety(Character);

-- Check mana.
local gauge = "mana"
local cost = 1
if gauge_getval(Character, gauge) < cost then
	character_message(Character, "Tu n'as pas assez de "..gauge..".");
	return;
end

-- Check if soul-vessel in hand.
local hand, held = loadfile("logic/get_equipment.lua")("hand");
if not hand or not held then
	character_message(Character, "Tu dois tenir un réceptacle d'âme en main.");
	return;
end

local vessen_state = artifact_gettag(hand, held, "soul_vessel");
if vessen_state ~= "full" and vessen_state ~= "empty" then
	character_message(Character, artifact_getname(hand, held).." n'est pas un réceptacle d'âme.");
	return;
end

-- Do the spell.
local function fun(x, y)
	local place_content = place_gettag(zone, x, y, "soul_vessel");
	if not place_content or (place_content ~= "full" and place_content ~= "empty") then
		return false;
	end

	if vessen_state == "empty" then
		if place_content == "full" then
			-- Capture soul.
			place_settag(zone, x, y, "soul_vessel", "empty");
			artifact_settag(hand, held, "soul_vessel", "full");
			gauge_decrease(Character, gauge, cost);
			character_message(Character, "L'âme est prise à ce lieu.");
		else
			character_message(Character, "Il n'y a pas d'âme à capturer, ici.");
		end
	else -- vessel is full
		if place_content == "empty" then
			-- Bind soul.
			artifact_settag(hand, held, "soul_vessel", "empty");
			place_settag(zone, x, y, "soul_vessel", "full");
			gauge_decrease(Character, gauge, cost);
			character_message(Character, "L'âme est liée à ce lieu.");
		else
			character_message(Character, "Il y a déjà une âme, ici.");
		end
	end
	
	return true;
end

if not fun(x, y)
and not fun(x, y-1)
and not fun(x, y+1)
and not fun(x-1, y)
and not fun(x+1, y)
then
	character_message(Character, "Il n'y a pas de réceptacle d'âme, ici.");
end
