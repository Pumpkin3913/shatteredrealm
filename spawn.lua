#!/usr/bin/lua

player_setaspect(Player, tile_getaspect("@"))

new_gauge(Player, "life", 1, 1, tile_getaspect("heart"), tile_getaspect("heart_empty"))
-- gauge_setonempty(Player, "life", "scripts/kill.lua")
-- player_setondeath(Player, "scripts/death.lua")

player_spawn(Player, "lobby", 16, 16)

player_message(Player, "You are '@'. Move with arrow keys.")
player_message(Player, "Step on the south square to access the tutorial.")
player_message(Player, "Enter a building to choose as who to start.")
