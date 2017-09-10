#!/usr/bin/lua

player_setaspect(Player, "at")
player_setwhendeath(Player, "dofile(\"logic/player_clear.lua\")")
player_settag(Player, "hand", "EMPTY")
player_settag(Player, "belt", "EMPTY")

new_gauge(Player, "life", 1, 1, "heart", "heart_empty")
-- gauge_setonempty(Player, "life", "scripts/kill.lua")

player_spawn(Player, "lobby", 16, 16)

player_message(Player, "Tu es '@'. Déplace-toi avec les flèches.")
player_message(Player, "Marche sur la dalle au sud pour accéder au tutorial.")
player_message(Player, "Entre dans un batiment pour choisir comment commencer.")
