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
local screen = player_getscreen(Player)
local x = player_getx(Player)
local y = player_gety(Player)-1
local tileset, tile = string.match(screen_gettile(screen, x, y), "(.*):(.*)")
if tile ~= "wall_bot" then
	player_message(Player, "You can't write here. You need a flat wall.")
	return
end

-- Do the writing.
screen_settag(screen, x, y, "text", Arg)
screen_settag(screen, x, y, "text_type", "chalk")
screen_settile(screen, x, y, tileset..":wall_bot_written")
