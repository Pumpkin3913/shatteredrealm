#!/usr/bin/lua

if not Arg or Arg == "" then
	player_message(Player, "What do you want to cast?")
elseif Arg == "Invoke" then
	loadfile("logic/spell/invoke.lua")()
elseif Arg == "Sesame" then
	loadfile("logic/spell/sesame.lua")()
elseif Arg == "Portal" then
	loadfile("logic/spell/portal.lua")()
else
	player_message(Player, "Nothing happened...")
end
