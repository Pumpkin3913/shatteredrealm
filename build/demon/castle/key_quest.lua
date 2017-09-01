#!/usr/bin/lua

local tileset, zone = ...

info("[WORLDGEN] [Demon Castle] Key Quest")

-- Add hint.
place_setaspect(zone, 20, 10, tileset..":wall_bot_written")
place_settag(zone, 20, 10, "text", "La clef du ziggurat a été perdue !")
place_settag(zone, 20, 10, "text_type", "chalk")

place_setaspect(zone, 21, 10, tileset..":wall_bot_written")
place_settag(zone, 21, 10, "text", "J'ai regardé dans le puits mais je n'ai rien trouvé...")
place_settag(zone, 21, 10, "text_type", "chalk")

-- Keys.
local key_tower = "Clef du coffre de la tour"
local key_hidden = "Clef du coffre caché"
local key_ziggurat = "Clef du Ziggurat"

-- South well.
place_setaspect(zone, 25, 34, tileset..":well")
place_settag(zone, 25, 34, "content", key_tower)

-- Tower's top coffer.
loadfile("build/tools/coffer.lua")(tileset, zone, 25, 2, "common", key_tower)
place_settag(zone, 25, 2, "content", key_hidden)

-- Sealed tower coffer.
loadfile("build/tools/coffer.lua")(tileset, "left_floor_0", 4, 6, "rare", key_hidden)
place_settag("left_floor_0", 4, 6, "openclose_state", "locked")
place_settag("left_floor_0", 4, 6, "openclose_key", key_hidden)
place_settag("left_floor_0", 4, 6, "content", key_ziggurat)
