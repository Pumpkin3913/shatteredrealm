#!/usr/bin/lua

local zone = player_getzone(Player)
local x = player_getx(Player)
local y = player_gety(Player)

local function fun(zone, x, y)
	-- Check if slave.
	local master_zone, master_x, master_y = string.match(place_gettag(zone, x, y, "openclose_master"), "(.*)/(.*)-(.*)")
	if master_zone and master_zone ~= "" then
		fun(master_zone, master_x, master_y)
		return true
	end

	-- Get state.
	local state = place_gettag(zone, x, y, "openclose_state")
	if not state or state == "" then
		return false
	end

	-- If trigger-only, do nothing.
	if place_gettag(zone, x, y, "openclose_triggeronly") == "true" then
		player_message(Player, "Ça ne se ferme pas de cette façon.")
		return true
	end

	-- If close or locked, do nothing.
	if state == "close" or state == "locked" then
		player_message(Player, "C'est déjà fermé.")
		return true
	end

	-- If open, close it.
	if state == "open" then
		loadfile("logic/openclose.lua")(zone, x, y, "close")
		return true
	end

	-- Problem.
	warning("action/close.lua encountered a problem at "..zone.."/"..x.."-"..y..".")
	return true
end

if not fun(zone, x, y)
and not fun(zone, x, y-1)
and not fun(zone, x, y+1)
and not fun(zone, x-1, y)
and not fun(zone, x+1, y)
then
	player_message(Player, "Il n'y a rien à /fermer.")
end
