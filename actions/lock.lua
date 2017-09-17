#!/usr/bin/lua

local zone = character_getzone(Character)
local x = character_getx(Character)
local y = character_gety(Character)

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
		character_message(Character, "C'est déjà verrouillé.")
		return true
	end

	-- If trigger-only, do nothing.
	if place_gettag(zone, x, y, "openclose_triggeronly") == "true" then
		character_message(Character, "Ça ne se verrouille pas de cette façon.")
		return true
	end

	-- Check if character has key.
	if state == "open" or state == "close" then
		local key = place_gettag(zone, x, y, "openclose_key")
		if not key or key == "" then
			warning("Locked item has no key, at "..zone.."/"..x.."-"..y..".")
			return true
		end

		if character_gettag(Character, "have "..key) == "true" then
			loadfile("logic/openclose.lua")(zone, x, y, "locked")
			character_message(Character, "C'est verrouillé avec : "..key)
		else
			character_message(Character, "Tu n'as pas : "..key)
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
	character_message(Character, "Il n'y a rien à /verrouiller.")
end
