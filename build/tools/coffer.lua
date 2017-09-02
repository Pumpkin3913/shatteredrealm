#!/usr/bin/lua

local tileset, zone, x, y, rarity, key = ...
if not rarity then rarity = "common" end

place_setaspect(zone, x, y, tileset..":coffer_"..rarity.."_close")
place_settag(zone, x, y, "openclose_tile_open", tileset..":coffer_"..rarity.."_open")
place_settag(zone, x, y, "openclose_tile_close", tileset..":coffer_"..rarity.."_close")
place_settag(zone, x, y, "openclose_state", "close")

if key and key ~= "" then
	-- place_setaspect(zone, x, y, tileset..":coffer_hard_close")
	-- place_settag(zone, x, y, "openclose_tile_locked", tileset..":coffer_hard_close")
	place_settag(zone, x, y, "openclose_state", "locked")
	place_settag(zone, x, y, "openclose_key", key)
end
