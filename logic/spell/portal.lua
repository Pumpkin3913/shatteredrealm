#!/usr/bin/lua

local zone = character_getzone(Character)
local x = character_getx(Character)
local y = character_gety(Character)

-- Check place.
if place_gettag(zone, x, y, "portal") ~= "true" then
	character_message(Character, "Ce sort n'a aucun effet ici.")
	return
end

y = y-1 -- Target the door.
local tileset = string.match(place_getaspect(zone, x, y), "(.*):.*")

-- Check if must close.
local openat = place_gettag(zone, x, y, "portal_openat")
if openat and openat ~= "" then
	-- Must close: no mana required.
	local success = assert(loadfile("logic/clear_procedural.lua"))(openat)
	if success then
		place_setaspect(zone, x, y, tileset..":wall_bot")
		place_deltag(zone, x, y, "portal_openat")
	else
		warning("Portal Spell: Error while closing a portal to "..openat);
	end
	return
end

-- Check mana.
local gauge = "mana"
local cost = 2
if gauge_getval(Character, gauge) < cost then
	character_message(Character, "Tu n'as pas assez de "..gauge..".")
	return
end

-- Check name.
local name = place_gettag(zone, x, y, "text")
if not name or name == "" then
	character_message(Character, "Il n'y a pas de nom de fragment inscrit ici.")
	return
end

local prepare = function(id)
	gauge_decrease(Character, gauge, cost)
	place_setaspect(zone, x, y, tileset..":bigdoor")
	place_deltag(zone, x, y, "text")
	place_deltag(zone, x, y, "text_type")
	place_settag(zone, x, y, "portal_openat", id)
end

if name == "Kalzakrax" then
	local id = loadfile("logic/generate/kalzakrax.lua")(zone, x, y)
	prepare(id)
elseif name == "Empyrithéa" then
	local id = loadfile("logic/generate/empyrithea.lua")(zone, x, y)
	prepare(id)
else
	character_message(Character, "Ceci n'est pas un nom de fragment.")
end
