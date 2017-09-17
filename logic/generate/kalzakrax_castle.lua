#!/usr/bin/lua

local zone, x, y, w, h = ...

local tileset = "redruins"

-- Prepare walls' positions.

local function recursive_1D_split(left, right, list, minsize)
	if right - left > minsize*2 then
		local middle = left + c_rand(right-left-minsize*2)-1 + minsize
		table.insert(list, middle)

		recursive_1D_split(left,  middle, list, minsize)
		recursive_1D_split(middle, right, list, minsize)
	end
end

-- Buildings are 7 * 9 at most and are built from top-left.

local Xs = { x, x+w-7 }
recursive_1D_split(x, x+w-7, Xs, 8)
table.sort(Xs)

local Ys = { y, y+h-9 }
recursive_1D_split(y, y+h-9, Ys, 10)
table.sort(Ys)

-- TODO: random puzzle.
-- TODO: rare basement for towers.

-- Treasures.

local function random_artifact()
	local dice = c_rand(10);

	-- Belt.
	if dice == 1 then
		local artifact = create_artifact("Ancienne ceinture");
		artifact_settag(artifact, "content_artifact_1", "EMPTY");
		artifact_settag(artifact, "equipment", "belt");
		return artifact;
	end

	-- Bag.
	if dice == 2 then
		local artifact = create_artifact("Ancien sac de cuir");
		artifact_settag(artifact, "inventory", create_inventory(4));
		return artifact;
	end

	-- Trident.
	if dice <= 4 then
		local artifact = create_artifact("Trident d'Airin");
		artifact_settag(artifact, "damage", "physical:1");
		return artifact;
	end

	-- Pickaxe.
	if dice <= 6 then
		local artifact = create_artifact("Pioche d'Airin");
		artifact_settag(artifact, "mining_power", 1);
		return artifact;
	end

	-- Else, nothing.
	return("EMPTY");
end

local function treasure_small_coffer(zone, x, y, alt_tileset)
	if not alt_tileset then alt_tileset = tileset; end
	loadfile("build/tools/coffer.lua")(alt_tileset, zone, x, y, "common");
	place_settag(zone, x, y, "content_artifact_1", random_artifact());
end

local function treasure_big_coffer(zone, x, y, alt_tileset)
	if not alt_tileset then alt_tileset = tileset; end
	loadfile("build/tools/coffer.lua")(alt_tileset, zone, x, y, "rare");
	for n=1,3 do
		place_settag(zone, x, y, "content_artifact_"..n, random_artifact());
	end
end

local function treasure_spellbook(zone, x, y, alt_tileset)
	if not alt_tileset then alt_tileset = tileset; end
	loadfile("build/tools/book.lua")(alt_tileset, zone, x, y, "open", "b");
	local spell;
	local dice = c_rand(3);
	if dice == 1 then spell = "Sésame";
	elseif dice == 2 then spell = "Aetheria";
	elseif dice == 3 then spell = "Ignis";
	end
	place_settag(zone, x, y, "text", "Incantation : "..spell);
	-- TODO: give hint.
end

local function tell_story(zone, x, y)
	local story;
	local dice = c_rand(3);
	if dice == 1 then
		-- Creation.
		story = {
			"Le Créateur forgea l'Éther en Matière au milieu du Grand Vide. Ceci fut la Création.",
			"Le Créateur fit les plantes et les bêtes. Il en fit des savantes et des muettes.",
			"Le Créateur fit les dieux et les démons et leur ordonna de veiller sur sa création.",
			"Le Créateur fut mécontent de son oeuvre et la brisa en Éclats. Ceci fut le Cataclysme."
		};
	elseif dice == 2 then
		-- Cataclysm.
		story = {
			"Frappé par le Créateur, le monde se brise et ses fragments dérivent dans le Grand Vide.",
			"Abandonnés par leur Créateur, les démons sont assaillits par des monstres inconnus.",
			"Loin de la protection du Créateur, les monstres inconnus envahissent les chateaux des démons.",
			"Les Dieux de la Mort sont-ils assaillits par les même monstres ?"
		};
	else -- if dice == 3 then
		-- Geography.
		story = {
			"Le Créateur donna les riches contrées de Kalzakrax et d'Empyrithéa comme demeure aux démons.",
			"Les Dieux de la Mort habitent d'étranges contrées lointaines où ils réincarnent les âmes mortelles.",
			"Toutes les races mortelles se pratagent les fertiles contrées entre Kalzakrax et le Bord du Monde.",
			"Le Créateur façonna des lieux secrets, inaccessibles aux mortels comme aux immortels."
		};
	end
	-- TODO: give titles with chapter numbers to these books. (Characters can reorder them if they /close them and /read their titles.)

	loadfile("build/tools/book.lua")(tileset, zone, x-2, y-1);
	place_settag(zone, x-2, y-1, "text", table.remove(story, c_rand(#story)));

	loadfile("build/tools/book.lua")(tileset, zone, x+2, y-1);
	place_settag(zone, x+2, y-1, "text", table.remove(story, c_rand(#story)));

	loadfile("build/tools/book.lua")(tileset, zone, x-2, y+1);
	place_settag(zone, x-2, y+1, "text", table.remove(story, c_rand(#story)));

	loadfile("build/tools/book.lua")(tileset, zone, x+2, y+1);
	place_settag(zone, x+2, y+1, "text", table.remove(story, c_rand(#story)));
end

-- Buildings.

local function build_tower(x, y)
	-- TODO: randomly build walls to link towers.
	local id = "kalzakrax_tower_"..c_rand(999999);
	loadfile("build/tools/tower.lua")(tileset, zone, x, y, id, "ground");
	local dice;

	dice = c_rand(4);
	if dice == 1 then
		tell_story(id.."_floor_0", 4, 5);
	elseif dice == 2 then
		treasure_small_coffer(id.."_floor_0", 2, 5);
		treasure_small_coffer(id.."_floor_0", 6, 5);
	-- elseif dice <= 4 then -- Nothing.
	end

	-- Coffer on first floor.
	dice = c_rand(7);
	if dice <= 2 then
		treasure_small_coffer(id.."_floor_1", 4, 6);
	elseif dice == 3 then
		treasure_small_coffer(id.."_floor_1", 2, 6);
		treasure_small_coffer(id.."_floor_1", 4, 6);
		treasure_small_coffer(id.."_floor_1", 6, 6);
	elseif dice == 4 then
		treasure_big_coffer(id.."_floor_1", 4, 6);
	-- elseif dice <= 7 then -- Nothing.
	end
end

local function build_ziggurat(x, y)
	local door_x, door_y = loadfile("build/tools/ziggurat.lua")(tileset, zone, x, y);
	local interior = "kalzakrax_ziggurat_"..c_rand(999999);
	loadfile("build/tools/interior.lua")(tileset, interior, "Ziggurat", 9, 10);
	loadfile("build/tools/door.lua")(tileset, interior, 4, 9);
	place_setaspect(interior, 4, 9, tileset..":mosaic_a");
	place_setaspect(interior, 4, 9-1, tileset..":path");
	loadfile("build/tools/link.lua")(zone, door_x, door_y, interior, 4, 9);

	-- Content of room.
	if c_rand(2) == 1 then
		-- Just books.
		tell_story(interior, 4, 5);
	else
		-- Sesame door.
		for i=1,7 do
			place_setaspect(interior, i, 4, tileset..":roof_horizontal");
			place_setaspect(interior, i, 5, tileset..":wall_bot");
		end
		loadfile("build/demon/castle/sesame_door.lua")(tileset, interior, 4, 5);
	end

	-- Secret room.
	local basement = c_rand(2) == 2;

	local secret_room = interior.."_secret";
	local secret_tileset = tileset;

	-- 1/4 for violet room.
	if c_rand(4) == 4 then
		secret_tileset = "violetcastle";
	end

	local name;
	if basement then
		name = "Sous-sol du Ziggurat";
	else
		name = "Salle secrète";
	end

	loadfile("build/tools/interior.lua")(secret_tileset, secret_room, name, 9, 10)

	-- 1/4 for checkered floor.
	if c_rand(4) == 4 then
		for i=1,7 do
			for j=2,7 do
				if (i+j) % 2 == 0 then
					place_setaspect(secret_room, i, j, secret_tileset..":mosaic_black");
				else
					place_setaspect(secret_room, i, j, secret_tileset..":mosaic_white");
				end
			end
		end
	end

	-- Access to Secret room.
	if c_rand(2) == 1 then
		-- "Seal" door.
		place_setaspect(interior, 4, 1, tileset..":wall_bot_written")
		place_settag(interior, 4, 1, "text", "Sceau")
		place_settag(interior, 4, 1, "text_type", "chalk")
		place_settag(interior, 4, 1, "text_clear_trigger", "loadfile(\"logic/unseal.lua\")(\""..interior.."\", 4, 1)")

		loadfile("build/tools/door.lua")(secret_tileset, secret_room, 4, 9)
		place_setaspect(secret_room, 4, 9, secret_tileset..":mosaic_a")
		place_setaspect(secret_room, 4, 9-1, secret_tileset..":path")
		loadfile("build/tools/link.lua")(interior, 4, 1, secret_room, 4, 9)
	else
		-- Basement.
		place_setaspect(interior, 4, 2, tileset..":stairs_down");
		place_setaspect(secret_room, 4, 2, secret_tileset..":stairs_up");
		loadfile("build/tools/link.lua")(interior, 4, 2, secret_room, 4, 2);
	end

	-- Treasure in secret room.
	local dice = c_rand(3)
	if dice == 1 then
		treasure_small_coffer(secret_room, 2, 4, secret_tileset);
		treasure_small_coffer(secret_room, 4, 5, secret_tileset);
		treasure_small_coffer(secret_room, 6, 4, secret_tileset);
	elseif dice == 2 then
		treasure_big_coffer(secret_room, 4, 5, secret_tileset);
	elseif dice == 3 then
		treasure_spellbook(secret_room, 4, 5, secret_tileset);
	end
end

local function build_something(x, y)
	local dice = c_rand(3);
	if dice == 1 then
		build_ziggurat(x, y+1);
	else -- if dice <= 3 then
		build_tower(x+1, y);
	end
end

for i=1,#Xs do
	for j=1,#Ys do
		build_something(Xs[i], Ys[j]);
	end
end
