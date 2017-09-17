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

	-- If open, do nothing.
	if state == "open" then
		character_message(Character, "C'est déjà ouvert.")
		return true
	end

	-- If trigger-only, do nothing.
	if place_gettag(zone, x, y, "openclose_triggeronly") == "true" then
		character_message(Character, "Ça ne s'ouvre pas de cette façon.")
		return true
	end

	-- If close, open it.
	if state == "close" then
		loadfile("logic/openclose.lua")(zone, x, y, "open")
		return true
	end

	-- If locked, check if character has key.
	if state == "locked" then
		local key = place_gettag(zone, x, y, "openclose_key")
		if character_gettag(Character, "have "..key) == "true" then
			character_message(Character, "Tu utilise : "..key)
			loadfile("logic/openclose.lua")(zone, x, y, "open")
		else
			character_message(Character, "C'est verrouillé avec : "..key)
		end
		return true
	end

	-- Problem.
	warning("action/open.lua encountered a problem at "..zone.."/"..x.."-"..y..".")
	return true
end

if not fun(zone, x, y)
and not fun(zone, x, y-1)
and not fun(zone, x, y+1)
and not fun(zone, x-1, y)
and not fun(zone, x+1, y)
then
	character_message(Character, "Il n'y a rien à /ouvrir.")
end
