#!/usr/bin/lua

-- Check hand.
local hand = player_gettag(Player, "hand");
if not hand or hand == "" or hand == "EMPTY" then
	player_message(Player, "Tu n'as rien en main.");
	return;
end

local zone = player_getzone(Player);
local x = player_getx(Player);
local y = player_gety(Player);

local function coffer(x, y)
	local content = place_gettag(zone, x, y, "content_artifact_1");
	if not content or content == "" then
		return false;
	end

	-- Check if close.
	local openclose = place_gettag(zone, x, y, "openclose_state");
	if openclose == "close" or openclose == "locked" then
		player_message(Player, "C'est fermé.");
		return true;
	end

	-- Drop in first empty slot.
	local n = 1;
	repeat
		if content == "EMPTY" then
			place_settag(zone, x, y, "content_artifact_"..n, hand);
			player_settag(Player, "hand", "EMPTY");
			player_message(Player, "Tu as posé "..artifact_getname(hand).." dans l'emplacement ("..n..").");
			return true;
		end
		n = n+1;
		content = place_gettag(zone, x, y, "content_artifact_"..n);
	until(not content or content == "");

	player_message(Player, "Il n'y a pas assez de place.");
	return true;
end

local function belt()
	-- Check belt.
	local belt = player_gettag(Player, "belt");
	if not belt or belt == "" or belt == "EMPTY" then
		return false;
	end

	-- Sheathe in first empty slot.
	local n = 1;
	local artifact = artifact_gettag(belt, "content_artifact_"..n);
	repeat
		if artifact == "EMPTY" then
			artifact_settag(belt, "content_artifact_"..n, hand);
			player_settag(Player, "hand", "EMPTY");
			player_message(Player, "Tu as placé "..artifact_getname(hand).." dans l'emplacement ("..n..") de "..artifact_getname(belt)..".");
			return true;
		end
		n = n+1;
		artifact = artifact_gettag(belt, "content_artifact_"..n);
	until(not artifact or artifact == "");

	player_message(Player, "Il n'y a pas assez de place sur : "..artifact_getname(belt));
	return true;
end

if not coffer(x, y)
and not coffer(x, y-1)
and not coffer(x, y+1)
and not coffer(x-1, y)
and not coffer(x+1, y)
and not belt()
then
	player_message(Player, "Tu n'as pas de ceinture.");
end
