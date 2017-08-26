#!/usr/bin/lua

if not Arg then
	player_message(Player, "Set Tile Command: provide tile ID as argument")
else
	if assert_tile(Arg) then
		place_setaspect(
			player_getzone(Player),
			player_getx(Player),
			player_gety(Player),
			Arg
		)
	else
		player_message(Player, "Tile '"..Arg.."' doesn't exist.")
	end
end
