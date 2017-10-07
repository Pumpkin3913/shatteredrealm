#!/usr/bin/lua

info("[WORLDGEN] [Lava Cave] Portal Cave")

local tileset = "volcano"

local entrance_x;
local entrance_y;

local antichamber = "portal_cave_antichamber"
local antichamber_w = 19;
local antichamber_h = 8;
new_zone(antichamber, "Antichambre du Portail", antichamber_w, antichamber_h, tileset..":roof");

local antichamber_level = {
	" O - - O - - O - - - O - O - - O - - O",
	" | _ _ | _ _ | _ ~ _ | _ | _ _ | _ _ |",
	" O . . n . . n * n * n * n . . n . . O",
	" | . . . . . . . . . . . . . . . . . |",
	" O . . . . . O . O . O . . . . > . . O",
	" | . . . . . | . | . | . ~ . . . . . |",
	" - - ( . ) - - - - - - - - - - - - - -",
	" - - [ # ] - - - - - - - - - - - - - -"
};

local portalcave = "portal_cave";
local portalcave_w = 19;
local portalcave_h = 12;
new_zone(portalcave, "Grotte du Portail", portalcave_w, portalcave_h, tileset..":roof");

local portalcave_level = {
	" - - O - - - - - - - - - - - - - O - -",
	" O _ | _ _ _ _ _ _ _ _ _ _ _ _ _ | _ O",
	" | . n . . . . . . . . . . . . . n . |",
	" O . . . . . . . . . . . . . . . . . O",
	" | . . . O . . X X X X X . . O . . . |",
	" O . < . | . . X ( ^ ) X . . | . > . O",
	" | . . . n . . X [ P ] X . . n . . . |",
	" O . . . . . . . . M . . . . . . . . O",
	" | . O . . . % . . . . . % . . . O . |",
	" n . | . . . . . . . . . . . . . | . n",
	" - - - - - - - - - - - - - - - - - - -",
	" - - - - - - - - - - - - - - - - - - -"
};

local writingscave = "writings_cave";
local writingscave_w = 24;
local writingscave_h = 18;
new_zone(writingscave, "Caverne des Légendes", writingscave_w, writingscave_h, tileset..":roof");

local writingscave_level = {
	" . . . . . . . . . . . . . . . . . . . . . . . .",
	" . . . . ; : : . . ~ . . . . O . . . . . . . . .",
	" . O . . : . : . . n . . . . | . . ; : : . . . .",
	" . | . . : W : . . . . . . . | . . : . : . . ~ .",
	" . | . . : W : . . . . . . . | . . : W : . . n .",
	" . | . . : W : . . ; : : . . n . . : W : . . . .",
	" . n . . . . . . . : < : . . . . . : W : . O . .",
	" . . . . . . . . . : C : . . . . . . . . . | . .",
	" . . . . . ~ . . . : C : . . . . . . . . . | . .",
	" . ; : : . n . . . : C : . . . ; : : . . . | . .",
	" . : . : . . . . . . . . . . . : . : . . . n . .",
	" . : W : . . O . . . . . . O . : W : . . . . . .",
	" . : W : . . | . ; : : . . | . : W : . . ; : : .",
	" . : W : . . | . : . : . . | . : W : . . : . : .",
	" . . . . . . | . : W : . . | . . . . . . : W : .",
	" . . . ~ . . n . : W : . . n . . . . . . : W : .",
	" . . . n . . . . : W : . . . . . . ~ . . : W : .",
	" . . . . . . . . . . . . . . . . . n . . . . . ."
};

local texts = {
	"Que le monde ait été fragmenté ne nous empèchera pas de voyager.",
	"Il n'y a plus rien à /miner, ici. Nous avons creusé aussi profondément que nous l'osions.",
	"Ne creusez pas trop profondément, sous peine de tomber dans le Grand Vide !",
	"Le Créateur nous a laissé des ressources limitées, mais nous pouvons en prendre ailleurs.",
	"Les volcans d'Empyrithéa ont été séparés de Kalzakrax par le Cataclysme.",
	"Nous pouvons toujours trouver du minerai d'Airin et des pierres précieuses dans les volcans."
};

local function get(level, x, y)
	local line = y+1;
	local i = x*2+2;
	return string.sub(level[line], i, i);
end

local links = {};

local function translate(zone, level, w, h)
	for x = 0, w-1 do
		for y = 0, h-1 do
			local c = get(level, x, y);
			if c == '.' then
				if c_rand(100) <= 10 then place_setaspect(zone, x, y, tileset..":roof_rare_"..c_rand(4)); end
			elseif c == '-' then
				place_setaspect(zone, x, y, tileset..":wall");
			elseif c == '_' then
				place_setaspect(zone, x, y, tileset..":wall_bot");
			elseif c == 'O' then
				place_setaspect(zone, x, y, tileset..":slab");
			elseif c == '~' then
				place_setaspect(zone, x, y, tileset..":roof_lone");
			elseif c == '|' then
				place_setaspect(zone, x, y, tileset..":pillar");
			elseif c == 'n' then
				place_setaspect(zone, x, y, tileset..":pillar_bot");
			elseif c == '(' then
				place_setaspect(zone, x, y, tileset..":bigdoor_toplft");
			elseif c == ')' then
				place_setaspect(zone, x, y, tileset..":bigdoor_toprgt");
			elseif c == '[' then
				place_setaspect(zone, x, y, tileset..":bigdoor_lft");
			elseif c == ']' then
				place_setaspect(zone, x, y, tileset..":bigdoor_rgt");
			elseif c == '^' then
				place_setaspect(zone, x, y, tileset..":bigdoor_top");
			elseif c == ':' then
				-- Nothing. Overitten by ';'.
			elseif c == ';' then
				loadfile("build/tools/cube.lua")(tileset, zone, x, y, 3, 5, 2);
			elseif c == 'C' then
				local top = (get(level, x, y-1) == c);
				local bot = (get(level, x, y+1) == c);
				if not top then
					place_setaspect(zone, x, y, tileset..":roof_bot_climb");
				elseif not bot then
					place_setaspect(zone, x, y, tileset..":wall_bot_climb");
				else
					place_setaspect(zone, x, y, tileset..":wall_climb");
				end
				place_setpassable(zone, x, y);
			elseif c == 'W' then
				local top = (get(level, x, y-1) == c);
				local bot = (get(level, x, y+1) == c);
				if not top then
					place_setaspect(zone, x, y, tileset..":roof_bot_written");
				elseif not bot then
					place_setaspect(zone, x, y, tileset..":wall_bot_written");
					place_settag(zone, x, y, "text", table.remove(texts, c_rand(#texts)));
					place_settag(zone, x, y, "text_type", "engraving");
				else
					place_setaspect(zone, x, y, tileset..":wall_written");
				end
			elseif c == 'X' then
-- TODO: create build/tool/ function, getting the level (or just the adjacent tiles) and a "clump-with" list, returning the right shape.
				if get(level, x+1, y) == '[' then
					place_setaspect(zone, x, y, tileset..":wall_botlft");
				elseif get(level, x-1, y) == ']' then
					place_setaspect(zone, x, y, tileset..":wall_botrgt");
				elseif get(level, x+1, y) == '(' then
					place_setaspect(zone, x, y, tileset..":wall_lft");
				elseif get(level, x-1, y) == ')' then
					place_setaspect(zone, x, y, tileset..":wall_rgt");
				else
					local lft = (get(level, x-1, y) == c);
					local rgt = (get(level, x+1, y) == c);
					if lft and rgt then
						place_setaspect(zone, x, y, tileset..":roof_horizontal");
					elseif lft then
						place_setaspect(zone, x, y, tileset..":roof_endrgt");
					elseif rgt then
						place_setaspect(zone, x, y, tileset..":roof_endlft");
					end
				end
			elseif c == '#' then
				place_setaspect(zone, x, y, tileset..":bigdoor");
				entrance_x = x;
				entrance_y = y;
			elseif c == '*' then
				loadfile("build/tools/coffer.lua")(tileset, zone, x, y, "hard");
				loadfile("build/tools/give_empty_inventory.lua")(zone, x, y, 2);
			elseif c == '%' then
				loadfile("build/tools/coffer.lua")(tileset, zone, x, y, "rare");
				loadfile("build/tools/give_empty_inventory.lua")(zone, x, y, 3);
			elseif c == '>' then
				place_setaspect(zone, x, y, tileset..":stairs_down");
				links[zone..":down"] = {x, y};
			elseif c == '<' then
				place_setaspect(zone, x, y, tileset..":stairs_up");
				links[zone..":up"] = {x, y};
			elseif c == 'M' then
				place_setaspect(zone, x, y, tileset..":mosaic_a");
				place_settag(zone, x, y, "portal", "true");
			elseif c == 'P' then
				place_setaspect(zone, x, y, tileset..":wall_bot_written");
				place_settag(zone, x, y, "text", "Empithyrae"); -- Intentionally misspell.
				place_settag(zone, x, y, "text_type", "chalk");
			end
		end
	end
end

translate(antichamber, antichamber_level, antichamber_w, antichamber_h);
translate(portalcave, portalcave_level, portalcave_w, portalcave_h);
translate(writingscave, writingscave_level, writingscave_w, writingscave_h);

local function do_link(zone1, xy1, zone2, xy2)
	loadfile("build/tools/link.lua")(zone1, xy1[1], xy1[2], zone2, xy2[1], xy2[2]);
end

do_link(antichamber, links[antichamber..":down"], portalcave, links[portalcave..":up"]);
do_link(portalcave, links[portalcave..":down"], writingscave, links[writingscave..":up"]);
return antichamber, entrance_x, entrance_y;
