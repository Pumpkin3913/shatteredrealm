#!/usr/bin/lua

local name = character_getname(Character)
if name ~= "_" then
	character_message(Character, "Ton nom est "..name..".")
end

if not Arg then
	character_message(Character, "Tu dois spécifier ton nom après la commande.")
	return
end

character_setname(Character, Arg)
character_message(Character, "Ton nom est désormais "..Arg..".")
