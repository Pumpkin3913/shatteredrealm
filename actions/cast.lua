#!/usr/bin/lua

if not Arg or Arg == "" then
	player_message(Player, "Tu dois préciser quel sort incanter.")
elseif Arg == "Invocatio" then
	dofile("logic/spell/invoke.lua")
elseif Arg == "Sésame" then
	dofile("logic/spell/sesame.lua")
elseif Arg == "Transfragmentum" then
	dofile("logic/spell/portal.lua")
elseif Arg == "Aetheria" then
	dofile("logic/spell/aether.lua")
else
	player_message(Player, "Rien ne se produit...")
end
