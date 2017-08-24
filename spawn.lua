#!/usr/bin/lua

player_setaspect(Player, tile_getaspect("demon"))
new_gauge(Player, "life", 3, 3, 2, 3) -- 2 is heart; 3 is empty heart.
new_gauge(Player, "mana", 0, 3, 11, 8) -- 11 is blue potion; 8 is empty potion.
-- player_setondeath(Player, "scripts/death.lua")
-- new_gauge(Player, "life", 3, 3, string.byte('o'), string.byte('.'))
-- gauge_setonempty(Player, "life", "scripts/kill.lua")
-- new_gauge(Player, "xp", 0, 10, string.byte('#'), string.byte('_'), false)
-- player_settag(Player, "damned", "false")
player_spawn(Player, "castle", 25, 15)
