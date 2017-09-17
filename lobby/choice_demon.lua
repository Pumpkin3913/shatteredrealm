#!/usr/bin/lua

character_settag(Character, "race", "demon")
character_setaspect(Character, "demon")
new_gauge(Character, "mana", 0, 1, "star", "star_empty")

character_changezone(Character, "demon_dungeon_0", 5, 6)
character_message(Character, "Tu es un nouveau démon. Apprends la magie, gagne en pouvoir...")
character_message(Character, "... et trouve un moyen d'atteindre d'autres mondes.")
