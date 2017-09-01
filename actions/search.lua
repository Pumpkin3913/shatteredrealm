#!/usr/bin/lua

local zone = player_getzone(Player)
local x = player_getx(Player)
local y = player_gety(Player)

local fun = function (x, y)
	local content = place_gettag(zone, x, y, "content")
	if content ~= "" then
		local state = place_gettag(zone, x, y, "openclose_state")
		if state == "close" then
			player_message(Player, "Ce coffre est fermé.")
		else
			if player_gettag(Player, "have "..content) == "true" then
				player_message(Player, "Tu as déjà : "..content)
			else
				player_settag(Player, "have "..content, "true")
				player_message(Player, "Tu as trouvé : "..content)
				if string.match(content, "Clef .*") then
					player_message(Player, "La clef se copie magiquement à ton trousseau.")
				end
			end
		end
		return true
	else
		return false
	end
end

if not fun(x, y)
and not fun(x, y-1)
and not fun(x, y+1)
and not fun(x-1, y)
and not fun(x+1, y)
then
	player_message(Player, "Tu ne trouves rien.")
end
