#!/usr/bin/lua

character_setaspect(Character, "at");
character_setwhendeath(Character, "dofile(\"logic/character_clear.lua\")");
character_settag(Character, "hand", create_inventory(1));
character_settag(Character, "belt", create_inventory(1, "belt"));

new_gauge(Character, "life", 1, 1, "heart", "heart_empty");
-- gauge_setonempty(Character, "life", "scripts/kill.lua");

character_message(Character, "Tu es '@'. Déplace-toi avec les flèches.");
character_message(Character, "Marche sur la dalle au sud pour accéder au tutorial.");
character_message(Character, "Entre dans un batiment pour choisir comment commencer.");
