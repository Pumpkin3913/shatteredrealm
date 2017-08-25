#!/usr/bin/lua

local tileset, zone, x_shift, y_shift = ...
local interior = "ziggurat_portal"

local x,y = loadfile("build/tools/ziggurat.lua")(tileset, zone, x_shift, y_shift)
loadfile("build/tools/interior.lua")(tileset, interior, "Ziggurat", 9, 10)
loadfile("build/tools/doorway.lua")(tileset, interior, 4, 9)
loadfile("build/tools/link.lua")(zone, x, y, interior, 4, 9)

-- Add magically sealed door.
zone_settile(interior, 4, 1, tileset..":wall_bot_written")
zone_settag(interior, 4, 1, "text", "Seal")
zone_settag(interior, 4, 1, "text_type", "chalk")
zone_settag(interior, 4, 1, "text_clear_trigger", "loadfile(\"logic/unseal.lua\")(\""..interior.."\", 4, 1)")

-- Pre-link the door to a secret room.
local secret_room = "secret_sealed_room"
local secret_tileset = "violetcastle"
loadfile("build/tools/interior.lua")(secret_tileset, secret_room, "Secret Room", 9, 10)
loadfile("build/tools/doorway.lua")(secret_tileset, secret_room, 4, 9)
loadfile("build/tools/link.lua")(interior, 4, 1, secret_room, 4, 9)

-- Add secret spellbook.
local state = "close"
zone_settile(secret_room, 4, 5, secret_tileset..":book_a_"..state)
zone_settag (secret_room, 4, 5, "openclose_state", state)
zone_settag (secret_room, 4, 5, "openclose_opentile", secret_tileset..":book_a_open")
zone_settag (secret_room, 4, 5, "openclose_closetile", secret_tileset..":book_a_close")
zone_settag (secret_room, 4, 5, "title", "Trans-Shard Portals")
zone_settag (secret_room, 4, 5, "text", "/write the Name on a /clear wall and /cast Portal.")


verbose("[WORLDGEN] Portal's ziggurat build in "..zone..".");
