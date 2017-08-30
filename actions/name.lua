#!/usr/bin/lua

local name = player_getname(Player)
if name ~= "_" then
	player_message(Player, "Ton nom est "..name..".")
end

if not Arg then
	player_message(Player, "Tu dois spécifier ton nom après la commande.")
	return
end

player_setname(Player, Arg)
player_message(Player, "Ton nom est désormais "..Arg..".")
