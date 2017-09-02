#!/usr/bin/lua

local zone = player_getzone(Player)
local x = player_getx(Player)
local y = player_gety(Player)

local function fun(zone, x, y)
	-- Check if slave.
	local master = place_gettag(zone, x, y, "openclose_master")
	if master and master ~= "" then
		local master_zone, master_x, master_y = string.match(master, "(.*)/(.*)-(.*)")
		fun(master_zone, master_x, master_y)
		return true
	end

	-- Get state.
	local state = place_gettag(zone, x, y, "openclose_state")
	if not state or state == "" then
		return false
	end

	-- If locked, do nothing.
	if state == "locked" then
		player_message(Player, "C'est déjà verrouillé.")
		return true
	end

	-- If trigger-only, do nothing.
	if place_gettag(zone, x, y, "openclose_triggeronly") == "true" then
		player_message(Player, "Ça ne se verrouille pas de cette façon.")
		return true
	end

	-- Check if player has key.
	if state == "open" or state == "close" then
		local key = place_gettag(zone, x, y, "openclose_key")
		if not key or key == "" then
			warning("Locked item has no key, at "..zone.."/"..x.."-"..y..".")
			return true
		end

		if player_gettag(Player, "have "..key) == "true" then
			loadfile("logic/openclose.lua")(zone, x, y, "locked")
			player_message(Player, "C'est verrouillé avec : "..key)
		else
			player_message(Player, "Tu n'as pas : "..key)
		end
		return true
	end

	-- Problem.
	warning("action/lock.lua encountered a problem at "..zone.."/"..x.."-"..y..".")
	return true
end

if not fun(zone, x, y)
and not fun(zone, x, y-1)
and not fun(zone, x, y+1)
and not fun(zone, x-1, y)
and not fun(zone, x+1, y)
then
	player_message(Player, "Il n'y a rien à /verrouiller.")
end
