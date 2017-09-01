#!/usr/bin/lua

local tileset, zone, x, y, rarity, key = ...
if not rarity then rarity = "common" end

place_setaspect(zone, x, y, tileset..":coffer_"..rarity.."_close")
place_settag(zone, x, y, "openclose_opentile", tileset..":coffer_"..rarity.."_open")
place_settag(zone, x, y, "openclose_closetile", tileset..":coffer_"..rarity.."_close")
place_settag(zone, x, y, "openclose_state", "close")

if key and key ~= "" then
	-- place_setaspect(zone, x, y, tileset..":coffer_hard_close")
	-- place_settag(zone, x, y, "openclose_locktile", tileset..":coffer_hard_close")
	place_settag(zone, x, y, "openclose_state", "locked")
	place_settag(zone, x, y, "openclose_key", key)
end
