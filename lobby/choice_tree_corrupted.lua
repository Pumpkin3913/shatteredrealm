#!/usr/bin/lua

character_settag(Character, "race", "treefolk")
character_setaspect(Character, "treefolk_corrupted")

character_changezone(Character, "forest_south", 9, 9)
character_message(Character, "Tu es un sylvain corrompu, né de la terre mais perverti par un mal mystérieux.")
