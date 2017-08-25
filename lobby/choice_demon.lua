#!/usr/bin/lua

player_settag(Player, "race", "demon")
player_setaspect(Player, tile_getaspect("demon"))
new_gauge(Player, "mana", 0, 1, tile_getaspect("star"), tile_getaspect("star_empty"))

player_changescreen(Player, "castle", 25, 15)
player_message(Player, "You are a newborn demon.")
player_message(Player, "Go learn magic, gain power and breach into other worlds.")
