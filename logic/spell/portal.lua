#!/usr/bin/lua

local screen = player_getscreen(Player)
local x = player_getx(Player)
local y = player_gety(Player)-1

-- Check mana.
local gauge = "mana"
local cost = 1
if gauge_getval(Player, gauge) < cost then
	player_message(Player, "You don't have enough "..gauge..".")
	return
end

-- Check wall size and /clear-ness.
local nope = function() screen_event(screen, "The wall shudders...") end
if not string.match(screen_gettile(screen, x-1, y-1), ".*:wall") then nope(); return; end
if not string.match(screen_gettile(screen, x,   y-1), ".*:wall") then nope(); return; end
if not string.match(screen_gettile(screen, x+1, y-1), ".*:wall") then nope(); return; end
if not string.match(screen_gettile(screen, x-1, y), ".*:wall_bot") then nope(); return; end
if not string.match(screen_gettile(screen, x,   y), ".*:wall_bot_written") then nope(); return; end
if not string.match(screen_gettile(screen, x+1, y), ".*:wall_bot") then nope(); return; end

-- Get target name.
local name = screen_gettag(screen, x, y, "text")
if not name or name == "" then nope(); return; end
if name ~= "Ashflame Range" then nope(); return; end -- TODO: still open a gate, but to the Void.

-- Spend mana.
gauge_decrease(Player, gauge, cost)

-- Create target world.
id = "ashflame_"..c_rand(999999)
new_screen(id, name, 20, 20, "volcano:roof")
screen_settile(id, 10, 10, "volcano:mosaic_a")

-- Open gate and link.
local tileset = string.match(screen_gettile(screen, x, y), "(.*):.*")
loadfile("build/tools/door.lua")(tileset, screen, x, y)
loadfile("build/tools/link.lua")(screen, x, y, id, 10, 10)

-- TODO: close trigger
screen_settag(screen, x, y, "openclose_state", "open")
screen_settag(screen, x, y, "openclose_opentile", tileset..":bigdoor")
screen_settag(screen, x, y, "openclose_closetile", tileset..":bigdoor_closed")
screen_settag(screen, x, y, "openclose_closetrigger", "loadfile(\"logic/close_portal.lua\")(\""..tileset.."\", \""..screen.."\", "..x..", "..y..")")

screen_event(screen, "Heat and smell of sulfur rush from the portal!")
