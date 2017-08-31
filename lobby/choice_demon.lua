#!/usr/bin/lua

player_settag(Player, "race", "demon")
player_setaspect(Player, "demon")
new_gauge(Player, "mana", 0, 1, "star", "star_empty")

player_changezone(Player, "demon_dungeon_0", 5, 6)
player_message(Player, "Tu es un nouveau démon. Apprends la magie, gagne en pouvoir...")
player_message(Player, "... et trouve un moyen d'atteindre d'autres mondes.")
