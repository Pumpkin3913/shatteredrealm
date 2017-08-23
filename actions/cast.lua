#!/usr/bin/lua

local screen = player_getscreen(Player)
local x = player_getx(Player)
local y = player_gety(Player)

local word = screen_gettag(screen, x, y, "spellplace_word")

if not Arg or Arg == "" then
	player_message(Player, "What do you want to cast?")
elseif word == Arg then
	local script = screen_gettag(screen, x, y, "spellplace_script")
	loadstring(script)()
else
	player_message(Player, "Nothing happened...")
end
