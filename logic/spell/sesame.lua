#!/usr/bin/lua

local zone = character_getzone(Character)
local x = character_getx(Character)
local y = character_gety(Character)

-- Check mana.
local gauge = "mana"
local cost = 1
if gauge_getval(Character, gauge) < cost then
	character_message(Character, "Tu n'as pas assez de "..gauge..".")
	return
end

-- Check place.
local tag = place_gettag(zone, x, y, "sesame")
if not tag or tag == "" then
	character_message(Character, "Ce sort n'a aucun effet ici.")
	return
end

-- Spend mana.
gauge_decrease(Character, gauge, cost)

-- Do the effect.
zone, x, y = string.match(tag, "(.*)/(.*)-(.*)")
local tileset, tile = string.match(place_getaspect(zone, x, y), "(.*):(.*)")

if tile == "slab" then -- The door is open: close it.
	place_setaspect(zone, x, y,   tileset..":pillar_bot")
	place_setaspect(zone, x, y-1, tileset..":slab")

	-- Clean selfclose timer.
	local timer = place_gettag(zone, x, y, "sesame_timer")
	if timer and timer ~= "" then
		delete_timer(timer)
		place_deltag(zone, x, y, "sesame_timer")
	end

else -- The door is closed: open it.
	place_setaspect(zone, x, y-1, tileset..":path")
	place_setaspect(zone, x, y,   tileset..":slab")
	place_setpassable(zone, x, y)

	-- Start selfclose timer.
	local script = "\
		place_setaspect(\""..zone.."\", "..x..", "..y   ..", \""..tileset..":pillar_bot\")\
		place_setaspect(\""..zone.."\", "..x..", "..y-1 ..", \""..tileset..":slab\")\
		place_deltag(\""   ..zone.."\", "..x..", "..y   ..", \"sesame_timer\")\
	"
	local timer = create_timer(120, script) -- 2 minutes
	place_settag(zone, x, y, "sesame_timer", timer)
end
