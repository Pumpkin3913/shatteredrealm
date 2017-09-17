#!/usr/bin/lua

-- Check text argument.
if not Arg or Arg == "" then
	character_message(Character, "Tu dois spécifier ce que tu veux écrire après la commande.")
	return
end

-- Check if Character has a chalk.
if character_gettag(Character, "have chalk") ~= "true" then
	character_message(Character, "Tu ne peux pas écrire avec tes ongles.")
	return
end

-- Check if appropriate wall.
local zone = character_getzone(Character)
local x = character_getx(Character)
local y = character_gety(Character)-1
local tileset, tile = string.match(place_getaspect(zone, x, y), "(.*):(.*)")
if tile ~= "wall_bot" then
	character_message(Character, "Tu ne peux pas écrire ici. Il faut un mur dégagé.")
	return
end

-- Do the writing.
place_settag(zone, x, y, "text", Arg)
place_settag(zone, x, y, "text_type", "chalk")
place_setaspect(zone, x, y, tileset..":wall_bot_written")
