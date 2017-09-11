#!/usr/bin/lua

local zone = player_getzone(Player)
local x = player_getx(Player)
local y = player_gety(Player)

local fun = function (x, y)
	-- Check if close.
	local openclose = place_gettag(zone, x, y, "openclose_state")
	if openclose == "close" or openclose == "locked" then
		player_message(Player, "C'est fermé.")
		return true
	end

	-- Check if contains key.
	local key = place_gettag(zone, x, y, "content_key")
	if key and key ~= "" then
		-- Check if player already has it.
		if player_gettag(Player, "have "..key) == "true" then
			player_message(Player, "Tu as déjà : "..key)
			return true
		end

		-- Add key to keyring.
		player_settag(Player, "have "..key, "true")
		player_message(Player, "La clef se copie magiquement à ton trousseau : "..key)
		return true
	end

	-- Check if contains artifact.
	local artifact = place_gettag(zone, x, y, "content_artifact_1")
	if artifact and artifact ~= "" then
		local n = 1
		local msg = "Contenu : "
		repeat
			if artifact == "EMPTY" then
				msg = msg.."("..n..") Vide ; "
			else
				msg = msg.."("..n..") "..artifact_getname(artifact).." ; "
			end
			n = n+1
			artifact = place_gettag(zone, x, y, "content_artifact_"..n)
		until(not artifact or artifact == "")
		player_message(Player, msg)
		return true
	end

	-- Check if contains ore.
	local ore = place_gettag(zone, x, y, "content_mining")
	if ore and ore ~= "" then
		player_message(Player, "Ceci peut être miné pour récupérer : "..ore)
		return true
	end

	return false
end

if not fun(x, y)
and not fun(x, y-1)
and not fun(x, y+1)
and not fun(x-1, y)
and not fun(x+1, y)
then
	player_message(Player, "Tu ne trouves rien.")
end
