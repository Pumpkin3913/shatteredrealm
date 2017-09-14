#!/usr/bin/lua

-- Check hand.
local hand = player_gettag(Player, "hand");
if not hand or hand == "" then
	player_message(Player, "Tu n'as pas de main.");
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

	local n = 1;
	if Arg and Arg ~= "" then
		-- Select N-th.
		n = tonumber(Arg);
		if n ~= 1 then
			content = place_gettag(zone, x, y, "content_artifact_"..n);
			if not content or content == "" then
				player_message(Player, "Il n'y a pas d'emplacement "..n..".");
				return true;
			end
		end

		if content == "EMPTY" then
			player_message(Player, "L'emplacement "..n.." est vide.");
			return true;
		end
	else
		-- Select first non-empty.
		while content == "EMPTY" do
			n = n+1;
			content = place_gettag(zone, x, y, "content_artifact_"..n);
			if not content or content == "" then
				-- End of list and found nothing.
				player_message(Player, "C'est entièrement vide.");
				return true;
			end
		end
	end

	-- Take N-th.
	place_settag(zone, x, y, "content_artifact_"..n, hand);
	player_settag(Player, "hand", content);
	local msg = "Tu as en main : "..artifact_getname(content)..".";
	if hand ~= "EMPTY" then
		msg = msg.." (Tu échanges avec : "..artifact_getname(hand)..".)";
	end
	player_message(Player, msg);
	return true;
end

local function belt()
	-- Check belt.
	local belt = player_gettag(Player, "belt");
	if not belt or belt == "" or belt == "EMPTY" then
		return false;
	end

	-- Check if hand doesn't contain an equipment.
	if hand ~= "EMPTY" then
		local equipment = artifact_gettag(hand, "equipment");
		if equipment and equipment ~= "" then
			player_message(Player, "L'objet tenu en main est un équipement et ne peut pas être accroché à une ceinture.");
			return true;
		end
	end

	local artifact;

	local n = 1;
	if Arg and Arg ~= "" then
		-- Select N-th.
		n = tonumber(Arg);
		
		artifact = artifact_gettag(belt, "content_artifact_"..n);
		if not artifact or artifact == "" then
			player_message(Player, "Il n'y a pas d'emplacement "..n.." sur : "..artifact_getname(belt)..".");
			return true;
		end

		if artifact == "EMPTY" then
			player_message(Player, "L'emplacement ("..n..") est vide.");
			return true;
		end
	else
		-- Select first non-empty.
		artifact = artifact_gettag(belt, "content_artifact_"..n);
		while artifact == "EMPTY" do
			n = n+1;
			artifact = artifact_gettag(belt, "content_artifact_"..n);
			if not artifact or artifact == "" then
				-- End of list and found nothing.
				player_message(Player, "Il n'y a rien à prendre sur : "..artifact_getname(belt));
				return true;
			end
		end
	end

	-- Take N-th.
	player_settag(Player, "hand", artifact);
	local msg = "Tu as en main : "..artifact_getname(artifact)..".";
	artifact_settag(belt, "content_artifact_"..n, hand)
	if hand ~= "EMPTY" then
		msg = msg.." (Tu échanges avec : "..artifact_getname(hand)..".)";
	end
	player_message(Player, msg);
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
