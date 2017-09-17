#!/usr/bin/lua

-- Check hand.
local hand = character_gettag(Character, "hand");
if not hand or hand == "" or hand == "EMPTY" then
	character_message(Character, "Tu n'as rien en main.");
	return;
end

local zone = character_getzone(Character);
local x = character_getx(Character);
local y = character_gety(Character);

local function coffer(x, y)
	local content = place_gettag(zone, x, y, "content_artifact_1");
	if not content or content == "" then
		return false;
	end

	-- Check if close.
	local openclose = place_gettag(zone, x, y, "openclose_state");
	if openclose == "close" or openclose == "locked" then
		character_message(Character, "C'est fermé.");
		return true;
	end

	-- Drop in first empty slot.
	local n = 1;
	repeat
		if content == "EMPTY" then
			place_settag(zone, x, y, "content_artifact_"..n, hand);
			character_settag(Character, "hand", "EMPTY");
			character_message(Character, "Tu as posé "..artifact_getname(hand).." dans l'emplacement ("..n..").");
			return true;
		end
		n = n+1;
		content = place_gettag(zone, x, y, "content_artifact_"..n);
	until(not content or content == "");

	character_message(Character, "Il n'y a pas assez de place.");
	return true;
end

local function belt()
	-- Check belt.
	local belt = character_gettag(Character, "belt");
	if not belt or belt == "" or belt == "EMPTY" then
		return false;
	end

	-- Check if hand doesn't contain an equipment.
	if hand ~= "EMPTY" then
		local equipment = artifact_gettag(hand, "equipment");
		if equipment and equipment ~= "" then
			character_message(Character, "L'objet tenu en main est un équipement et ne peut pas être accroché à une ceinture.");
			return true;
		end
	end

	-- Sheathe in first empty slot.
	local n = 1;
	local artifact = artifact_gettag(belt, "content_artifact_"..n);
	repeat
		if artifact == "EMPTY" then
			artifact_settag(belt, "content_artifact_"..n, hand);
			character_settag(Character, "hand", "EMPTY");
			character_message(Character, "Tu as placé "..artifact_getname(hand).." dans l'emplacement ("..n..") de "..artifact_getname(belt)..".");
			return true;
		end
		n = n+1;
		artifact = artifact_gettag(belt, "content_artifact_"..n);
	until(not artifact or artifact == "");

	character_message(Character, "Il n'y a pas assez de place sur : "..artifact_getname(belt));
	return true;
end

if not coffer(x, y)
and not coffer(x, y-1)
and not coffer(x, y+1)
and not coffer(x-1, y)
and not coffer(x+1, y)
and not belt()
then
	character_message(Character, "Tu n'as pas de ceinture.");
end
