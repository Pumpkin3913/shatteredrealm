#!/usr/bin/lua

local hand = player_gettag(Player, "hand");
if not hand or hand == "" then
	player_message(Player, "Tu n'as pas de main.")
	return
end

local zone = player_getzone(Player)
local x = player_getx(Player)
local y = player_gety(Player)

local function fun(x, y)
	local content = place_gettag(zone, x, y, "content_artifact_1")
	if not content or content == "" then
		return false
	end

	-- Check if close.
	local openclose = place_gettag(zone, x, y, "openclose_state")
	if openclose == "close" or openclose == "locked" then
		player_message(Player, "C'est fermé.")
		return true
	end

	local n = 1
	if Arg and Arg ~= "" then
		-- Select N-th.
		n = tonumber(Arg)
		if n ~= 1 then
			content = place_gettag(zone, x, y, "content_artifact_"..n)
			if not content or content == "" then
				player_message(Player, "Il n'y a pas d'emplacement "..n..".")
				return true
			end
		end

		if content == "EMPTY" then
			player_message(Player, "L'emplacement "..n.." est vide.")
			return true
		end
	else
		-- Select first non-empty.
		while content == "EMPTY" do
			n = n+1
			content = place_gettag(zone, x, y, "content_artifact_"..n)
			if not content or content == "" then
				-- End of list and found nothing.
				player_message(Player, "C'est entièrement vide.")
				return true
			end
		end
	end

	-- Take N-th.
	place_settag(zone, x, y, "content_artifact_"..n, hand)
	player_settag(Player, "hand", content)
	if hand ~= "EMPTY" then
		player_message(Player, "Tu échange avec : "..artifact_getname(hand))
	end
	player_message(Player, "Tu as : "..artifact_getname(content))
	return true
end

if not fun(x, y)
and not fun(x, y-1)
and not fun(x, y+1)
and not fun(x-1, y)
and not fun(x+1, y)
then
	player_message(Player, "Il n'y a rien à prendre.")
end
