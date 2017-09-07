#!/usr/bin/lua

player_settag(Player, "race", "treefolk")
-- player_setaspect(Player, "???")

player_changezone(Player, "forest_south", 9, 9)
player_message(Player, "Tu es un sylvain, né de la terre, chargé de protéger la forêt...")
player_message(Player, "... car un mal mystérieux la corromp lentement.")
