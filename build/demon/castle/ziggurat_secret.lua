#!/usr/bin/lua

local tileset, zone, x_shift, y_shift = ...
local interior = "ziggurat_secret"

info("[WORLDGEN] [Demon Castle] Ziggurat of Secret")

local x,y = loadfile("build/tools/ziggurat.lua")(tileset, zone, x_shift, y_shift)
loadfile("build/tools/interior.lua")(tileset, interior, "Ziggurat of Secrets", 9, 10)
loadfile("build/tools/door.lua")(tileset, interior, 4, 9)
place_setaspect(interior, 4, 9, tileset..":mosaic_a")
place_setaspect(interior, 4, 9-1, tileset..":path")
loadfile("build/tools/link.lua")(zone, x, y, interior, 4, 9)

-- Add books.
loadfile("build/tools/book.lua")(tileset, interior, 2, 5)
place_settag(interior, 2, 5, "text", "/cast Invoke in front of the written name of a demon to summon it.")
loadfile("build/tools/book.lua")(tileset, interior, 6, 5)
place_settag(interior, 6, 5, "text", "Some demons may be willing to help fellow demons, but not all.")

-- Add magically sealed door.
place_setaspect(interior, 4, 1, tileset..":wall_bot_written")
place_settag(interior, 4, 1, "text", "Seal")
place_settag(interior, 4, 1, "text_type", "chalk")
place_settag(interior, 4, 1, "text_clear_trigger", "loadfile(\"logic/unseal.lua\")(\""..interior.."\", 4, 1)")

-- Pre-link the door to a secret room.
local secret_room = "secret_sealed_room"
local secret_tileset = "violetcastle"
loadfile("build/tools/interior.lua")(secret_tileset, secret_room, "Secret Room", 9, 10)
loadfile("build/tools/door.lua")(secret_tileset, secret_room, 4, 9)
place_setaspect(secret_room, 4, 9, secret_tileset..":mosaic_a")
place_setaspect(secret_room, 4, 9-1, secret_tileset..":path")
loadfile("build/tools/link.lua")(interior, 4, 1, secret_room, 4, 9)

-- Add secret spellbook.
loadfile("build/tools/book.lua")(secret_tileset, secret_room, 4, 5, "close")
place_settag (secret_room, 4, 5, "text", "Stolas: benevolent demon of knowledge.")
