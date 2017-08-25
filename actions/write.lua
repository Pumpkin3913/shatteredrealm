#!/usr/bin/lua

-- Check text argument.
if not Arg or Arg == "" then
	player_message(Player, "You need to specify what you want to write after the command.")
	return
end

-- Check if Player has a chalk.
if not string.match(player_gettag(Player, "inventory"), "chalk") then
	-- player_message(Player, "You need a chalk to write.")
	player_message(Player, "You can't write with your fingers.")
	return
end

-- Check if appropriate wall.
local zone = player_getzone(Player)
local x = player_getx(Player)
local y = player_gety(Player)-1
local tileset, tile = string.match(zone_gettile(zone, x, y), "(.*):(.*)")
if tile ~= "wall_bot" then
	player_message(Player, "You can't write here. You need a flat wall.")
	return
end

-- Do the writing.
zone_settag(zone, x, y, "text", Arg)
zone_settag(zone, x, y, "text_type", "chalk")
zone_settile(zone, x, y, tileset..":wall_bot_written")
