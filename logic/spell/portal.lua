#!/usr/bin/lua

local zone = player_getzone(Player)
local x = player_getx(Player)
local y = player_gety(Player)

-- Check mana.
local gauge = "mana"
local cost = 2
if gauge_getval(Player, gauge) < cost then
	player_message(Player, "Tu n'as pas assez de "..gauge..".")
	return
end

-- Check place.
if place_gettag(zone, x, y, "portal") ~= "true" then
	player_message(Player, "Ce sort n'a aucun effet ici.")
	return
end

y = y-1

-- Check name.
local name = place_gettag(zone, x, y, "text")
if not name or name == "" then
	player_message(Player, "Il n'y a pas de nom de fragment inscrit ici.")
	return
end

local prepare = function(id)
	local tileset = string.match(place_getaspect(zone, x, y), "(.*):.*")
	gauge_decrease(Player, gauge, cost)
	place_setaspect(zone, x, y, tileset..":bigdoor")
	place_deltag(zone, x, y, "text")
	place_deltag(zone, x, y, "text_type")
	local script = "\
		place_setaspect(\""..zone.."\","..x..","..y..",\""..tileset..":wall_bot\")\
		delete_zone(\""..id.."\")\
	"
	-- create_timer(180, script) -- 3 minutes.
	-- Note: deleting a zone with a player inside cause the server to crash.
end

if name == "Ashflame Range" then
	local id = loadfile("logic/generate/ashflame_range.lua")(zone, x, y)
	prepare(id)
elseif name == "Kalzakrax" then
	local id = loadfile("logic/generate/kalzakrax.lua")(zone, x, y)
	prepare(id)
else
	player_message(Player, "Ceci n'est pas un nom de fragment.")
end
