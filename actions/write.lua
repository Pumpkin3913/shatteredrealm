#!/usr/bin/lua

-- Check text argument.
if not Arg or Arg == "" then
	player_message(Player, "Tu dois spécifier ce que tu veux écrire après la commande.")
	return
end

-- Check if Player has a chalk.
if player_gettag(Player, "have chalk") ~= "true" then
	player_message(Player, "Tu ne peux pas écrire avec tes ongles.")
	return
end

-- Check if appropriate wall.
local zone = player_getzone(Player)
local x = player_getx(Player)
local y = player_gety(Player)-1
local tileset, tile = string.match(place_getaspect(zone, x, y), "(.*):(.*)")
if tile ~= "wall_bot" then
	player_message(Player, "Tu ne peux pas écrire ici. Il faut un mur dégagé.")
	return
end

-- Do the writing.
place_settag(zone, x, y, "text", Arg)
place_settag(zone, x, y, "text_type", "chalk")
place_setaspect(zone, x, y, tileset..":wall_bot_written")
