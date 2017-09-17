#!/usr/bin/lua

local zone = character_getzone(Character)
local x = character_getx(Character)
local y = character_gety(Character)

local fun = function (x, y)
	local text = place_gettag(zone, x, y, "text")

	if text == "" then
		return false
	end

	-- Check if close.
	local state = place_gettag(zone, x, y, "openclose_state")
	if state == "close" then
		local title = place_gettag(zone, x, y, "title")
		if title and title ~= "" then
			character_message(Character, title)
		else
			character_message(Character, "Ce livre est fermé.")
		end
		return true
	end

	-- Check hint.
	local hint = place_gettag(zone, x, y, "text_hint")
	if hint ~= "" then
		local aspect = place_gettag(zone, x, y, "text_hint_aspect")
		if aspect == "" then aspect = "void" end
		character_hint(Character, aspect, hint);
	end

	character_message(Character, '"'..text..'"')
	return true

end

if not fun(x, y)
and not fun(x, y-1)
and not fun(x, y+1)
and not fun(x-1, y)
and not fun(x+1, y)
then
	character_message(Character, "Il n'y a rien à /lire.")
end
