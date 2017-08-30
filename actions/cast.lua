#!/usr/bin/lua

if not Arg or Arg == "" then
	player_message(Player, "Tu dois préciser quel sort incanter.")
elseif Arg == "Invoke" then
	loadfile("logic/spell/invoke.lua")()
elseif Arg == "Sésame" then
	loadfile("logic/spell/sesame.lua")()
elseif Arg == "Portal" then
	loadfile("logic/spell/portal.lua")()
else
	player_message(Player, "Rien ne se produit...")
end
