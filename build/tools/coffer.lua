#!/usr/bin/lua

local tileset, zone, x, y, rarity = ...
if not rarity then rarity = "common" end

place_setaspect(zone, x, y, tileset..":coffer_"..rarity.."_close")
place_settag(zone, x, y, "openclose_state", "close")
place_settag(zone, x, y, "openclose_opentile", tileset..":coffer_"..rarity.."_open")
place_settag(zone, x, y, "openclose_closetile", tileset..":coffer_"..rarity.."_close")
