#!/usr/bin/lua

local zone = player_getzone(Player)
local x = player_getx(Player)
local y = player_gety(Player)-1

-- Check mana.
local gauge = "mana"
local cost = 1
if gauge_getval(Player, gauge) < cost then
	player_message(Player, "Tu n'as pas assez de "..gauge..".")
	return
end

-- Check wall size and /clear-ness.
local nope = function() zone_event(zone, "Le mur frémit...") end
if not string.match(place_getaspect(zone, x-1, y-1), ".*:wall") then nope(); return; end
if not string.match(place_getaspect(zone, x,   y-1), ".*:wall") then nope(); return; end
if not string.match(place_getaspect(zone, x+1, y-1), ".*:wall") then nope(); return; end
if not string.match(place_getaspect(zone, x-1, y), ".*:wall_bot") then nope(); return; end
if not string.match(place_getaspect(zone, x,   y), ".*:wall_bot_written") then nope(); return; end
if not string.match(place_getaspect(zone, x+1, y), ".*:wall_bot") then nope(); return; end

-- Get target name.
local name = place_gettag(zone, x, y, "text")
if not name or name == "" then nope(); return; end
if name ~= "Ashflame Range" then nope(); return; end -- TODO: still open a gate, but to the Void.

-- Spend mana.
gauge_decrease(Player, gauge, cost)

-- Create target world.
id = "ashflame_"..c_rand(999999) -- TODO: request UUID.
new_zone(id, name, 20, 20, "volcano:roof")
place_setaspect(id, 10, 10, "volcano:mosaic_a")

-- Open gate and link.
local tileset = string.match(place_getaspect(zone, x, y), "(.*):.*")
loadfile("build/tools/door.lua")(tileset, zone, x, y)
loadfile("build/tools/link.lua")(zone, x, y, id, 10, 10)

-- TODO: close trigger
place_settag(zone, x, y, "openclose_state", "open")
place_settag(zone, x, y, "openclose_opentile", tileset..":bigdoor")
place_settag(zone, x, y, "openclose_closetile", tileset..":bigdoor_closed")
place_settag(zone, x, y, "openclose_closetrigger", "loadfile(\"logic/close_portal.lua\")(\""..tileset.."\", \""..zone.."\", "..x..", "..y..")")

zone_event(zone, "La chaleur et les odeurs de soufre émanent du portail !")
