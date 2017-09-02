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

	-- If open, do nothing.
	if state == "open" then
		player_message(Player, "C'est déjà ouvert.")
		return true
	end

	-- If trigger-only, do nothing.
	if place_gettag(zone, x, y, "openclose_triggeronly") == "true" then
		player_message(Player, "Ça ne s'ouvre pas de cette façon.")
		return true
	end

	-- If close, open it.
	if state == "close" then
		loadfile("logic/openclose.lua")(zone, x, y, "open")
		return true
	end

	-- If locked, check if player has key.
	if state == "locked" then
		local key = place_gettag(zone, x, y, "openclose_key")
		if player_gettag(Player, "have "..key) == "true" then
			player_message(Player, "Tu utilise : "..key)
			loadfile("logic/openclose.lua")(zone, x, y, "open")
		else
			player_message(Player, "C'est verrouillé avec : "..key)
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
	player_message(Player, "Il n'y a rien à /ouvrir.")
end
