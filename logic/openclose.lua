#!/usr/bin/lua

local zone, x, y, state = ...

-- Avoid triggering everything if the state won't change.
local current_state = place_gettag(zone, x, y, "openclose_state")
if state == current_state then
	return
end
if state == "locked" and current_state == "close" then
	return
end


local toogle = function(zone, x, y)
	local tile = place_gettag(zone, x, y, "openclose_tile_"..state)
	if state == "locked" and (not tile or tile == "") then
		tile = place_gettag(zone, x, y, "openclose_tile_close")
	end
	place_setaspect(zone, x, y, tile)
end

toogle(zone, x, y)
place_settag(zone, x, y, "openclose_state", state)

-- Cancel eventual selfclose-timer.
local selfclose_timer = place_gettag(zone, x, y, "openclose_selfclose_timer")
if selfclose_timer and selfclose_timer ~= "" then
	delete_timer(selfclose_timer)
	place_deltag(zone, x, y, "openclose_selfclose_timer")
end

if state == "open" then
	-- Create eventual selfclose timer.
	local selfclose = place_gettag(zone, x, y, "openclose_selfclose")
	if selfclose and selfclose ~= "" then
		local timer = create_timer(selfclose, "loadfile(\"logic/openclose.lua\")(\""..zone.."\", "..x..", "..y..", \"close\")")
		place_settag(zone, x, y, "openclose_selfclose_timer", timer)
	end
end

-- Trigger eventual open/close trigger.
local basic_state = state
if basic_state == "locked" then basic_state = "close" end
local trigger = place_gettag(zone, x, y, "openclose_trigger_"..basic_state)
if trigger and trigger ~= "" then
	loadstring(trigger)()
end

-- Toogle slaves.
local n = 1
local slave_zone, slave_x, slave_y = string.match(place_gettag(zone, x, y, "openclose_slave_"..n), "(.*)/(.*)-(.*)")
while slave_zone and slave_zone ~= "" do

	toogle(slave_zone, slave_x, slave_y)

	-- Next.
	slave_zone, slave_x, slave_y = string.match(place_gettag(zone, x, y, "openclose_slave_"..n), "(.*)/(.*)-(.*)")
	n = n+1
end
