#!/usr/bin/lua

if not Arg or Arg == "" then
	character_message(Character, "Tu dois préciser quel sort incanter.")
elseif Arg == "Invocatio" then
	dofile("logic/spell/invoke.lua")
elseif Arg == "Sésame" then
	dofile("logic/spell/sesame.lua")
elseif Arg == "Transfragmentum" then
	dofile("logic/spell/portal.lua")
elseif Arg == "Aetheria" then
	dofile("logic/spell/aether.lua")
else
	character_message(Character, "Rien ne se produit...")
end
