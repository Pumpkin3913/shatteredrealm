#!/usr/bin/lua

if not Arg then
	character_message(Character, "Set Tile Command: provide tile ID as argument")
else
	if assert_tile(Arg) then
		place_setaspect(
			character_getzone(Character),
			character_getx(Character),
			character_gety(Character),
			Arg
		)
	else
		character_message(Character, "Tile '"..Arg.."' doesn't exist.")
	end
end
