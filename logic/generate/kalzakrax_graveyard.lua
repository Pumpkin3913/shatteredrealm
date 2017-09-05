#!/usr/bin/lua

local zone, x, y, w, h = ...

local tileset = "redruins"
local minsize = 10
-- TODO: horizontal minsize > vertical minsize.
-- TODO: track artifacts and clear remaining ones.

-- Prepare walls' positions.

local function recursive_1D_split(left, right, list)
	if right - left > minsize*2 then
		local middle = left + c_rand(right-left-minsize*2)-1 + minsize
		table.insert(list, middle)

		recursive_1D_split(left, middle, list)
		recursive_1D_split(middle, right, list)
	end
end

local Xs = { x, x+w }
recursive_1D_split(x, x+w, Xs)
table.sort(Xs)

local Ys = { y, y+h }
recursive_1D_split(y, y+h, Ys)
table.sort(Ys)

-- Build walls.

-- Horizontal

local function build_horizontal_low_wall(x1, x2, y)
	for x=x1,x2 do
		place_setaspect(zone, x, y, tileset..":wall_bot")
		place_setaspect(zone, x, y-1, tileset..":roof_horizontal")
	end
end

local function build_horizontal_ruined_wall(x1, x2, y, proba)
	for x=x1,x2 do
		if c_rand(proba) == 1 then
			local dice = c_rand(3)
			if dice <= 2 then
				place_setaspect(zone, x, y, tileset..":block_a")
			elseif dice == 3 then
				place_setaspect(zone, x, y, tileset..":pillar_bot")
				place_setaspect(zone, x, y-1, tileset..":roof_lone")
			end
		else
			place_setaspect(zone, x, y, tileset..":path_horizontal")
		end
	end
end

local function build_horizontal_low_wall_with_door(x1, x2, y)
	local mid = math.floor((x1+(x2-x1)/2)) + c_rand(3)-2
	for x=x1,x2 do
		if x == mid-1 then
			place_setaspect(zone, x, y, tileset..":wall_botrgt")
			place_setaspect(zone, x, y-1, tileset..":roof_endrgt")
		elseif x == mid then
			-- Nothing: open gap.
		elseif x == mid+1 then
			place_setaspect(zone, x, y, tileset..":wall_botlft")
			place_setaspect(zone, x, y-1, tileset..":roof_endlft")
		else
			place_setaspect(zone, x, y, tileset..":wall_bot")
			place_setaspect(zone, x, y-1, tileset..":roof_horizontal")
		end
	end
end

local function build_horizontal(x1, x2, y, door)
	if door then
		local dice = c_rand(5)
		if dice <= 3 then
			build_horizontal_low_wall_with_door(x1, x2, y)
		elseif dice == 4 then
			build_horizontal_ruined_wall(x1, x2, y, 2)
		elseif dice == 5 then
			build_horizontal_ruined_wall(x1, x2, y, 7)
		end
	else
		build_horizontal_low_wall(x1, x2, y)
	end
end

-- Vertical

local function build_vertical_low_wall(x, y1, y2, door)
	for y=y1,y2 do
		place_setaspect(zone, x, y, tileset..":roof_vertical")
	end
end

local function build_vertical_ruined_wall(x, y1, y2, proba)
	local y=y1+2
	while y<=y2 do
	-- for y=y1+2,y2 do
		if c_rand(proba) == 1 then
			local dice = c_rand(3)
			if dice <= 2 then
				place_setaspect(zone, x, y, tileset..":block_a")
			elseif dice == 3 and y < y2 then
				place_setaspect(zone, x, y, tileset..":roof_lone")
				y = y+1
				place_setaspect(zone, x, y, tileset..":pillar_bot")
			end
		else
			place_setaspect(zone, x, y, tileset..":path_vertical")
		end
		y = y+1
	end
end

local function build_vertical_low_wall_with_door(x, y1, y2)
	local mid = math.floor((y1+(y2-y1)/2)) + c_rand(3)-2
	mid = mid-1 -- Because vertical doors may end up "too south".
	for y=y1,y2 do
		if y == mid-2 then
			place_setaspect(zone, x, y, tileset..":roof_endbot")
		elseif y == mid-1 then
			place_setaspect(zone, x, y, tileset..":pillar_bot")
		elseif y == mid then
			-- Nothing: open gap.
		elseif y == mid+1 then
			place_setaspect(zone, x, y, tileset..":roof_endtop")
		else
			place_setaspect(zone, x, y, tileset..":roof_vertical")
		end
	end
end

local function build_vertical(x, y1, y2, door)
	if door then
		local dice = c_rand(5)
		if dice <= 3 then
			build_vertical_low_wall_with_door(x, y1, y2)
		elseif dice == 4 then
			build_vertical_ruined_wall(x, y1, y2, 2)
		elseif dice == 5 then
			build_vertical_ruined_wall(x, y1, y2, 7)
		end
	else
		build_vertical_low_wall(x, y1, y2)
	end
end

-- Place unique element.

local function place_unique(x, y)
	if c_rand(3) == 1 then
		-- Spellbook.
		loadfile("build/tools/book.lua")(tileset, zone, x, y, "close", "b")
		place_settag(zone, x, y, "openclose_selfclose", 30)
		place_settag(zone, x, y, "text", "Les démons oublient peu à peu comment /dévorer les âmes.")
		place_settag(zone, x, y, "title", "Chroniques de la Cute")
	else -- if dice <= 3 then
		-- Coffer of skulls.
		loadfile("build/tools/coffer.lua")(tileset, zone, x, y, "rare")
		for n=1,3 do
			local artifact
			local dice = c_rand(3)
			if dice == 1 then
				artifact = create_artifact("Crâne")
				artifact_settag(artifact, "soul_vessel", "full")
			elseif dice == 2 then
				artifact = create_artifact("Crâne")
				artifact_settag(artifact, "soul_vessel", "empty")
			else -- if dice == 3 then
				artifact = "EMPTY"
			end
			place_settag(zone, x, y, "content_artifact_"..n, artifact)
		end
	end
end

-- Place tombs.

local function place_one_tomb(x, y)
	local dice = c_rand(3)
	if dice == 1 then
		place_setaspect(zone, x, y, tileset..":tombstone_cross")
		if c_rand(6) == 1 then
			place_settag(zone, x, y, "soul_vessel", "full")
			-- place_setaspect(zone, x, y, "violetcastle:tombstone_cross") -- XXX -- DEBUG
		end
	elseif dice == 2 then
		place_setaspect(zone, x, y, tileset..":tombstone_slab")
	else -- if dice == 3 then
		place_setaspect(zone, x, y, tileset..":path_lone")
	end
end

local function place_tombs_aligned(lft, rgt, top, bot)
	for x=lft,rgt,2 do
		for y=top,bot,2 do
			place_one_tomb(x, y)
		end
	end
end

local function place_tombs_spread(lft, rgt, top, bot)
	for x=lft,rgt,3 do
		for y=top,bot,3 do
			x = x + c_rand(2)-1
			y = y + c_rand(2)-1
			if x < rgt and y < bot then
				place_one_tomb(x, y)
			end
		end
	end
end

local function place_ruin(lft, rgt, top, bot)
	-- First pass: ruined floor.
	for x=lft+1,rgt-1 do
		for y=top+1,bot-1 do
			if c_rand(2) == 1 then
				place_setaspect(zone, x, y, tileset..":path_lone")
			end
		end
	end

	-- Second pass: ruined blocks.
	for x=lft,rgt,3 do
		for y=top,bot,3 do
			x = x + c_rand(2)-1
			y = y + c_rand(2)-1
			if x < rgt and y < bot and y > top+1 then
				local dice = c_rand(2)
				if dice == 1 then
					place_setaspect(zone, x, y, tileset..":block_a")
				else -- if dice == 2 then
					loadfile("build/tools/pillar.lua")(tileset, zone, x, y, c_rand(2)+1)
				end
			end
		end
	end
end

local function place_tombs_with_unique(lft, rgt, top, bot)
	u_x = lft+math.floor((rgt-lft)/2)
	u_y = top+math.floor((bot-top)/2)
	place_unique(u_x, u_y)

	for x=lft,rgt,2 do
		for y=top,bot,2 do
			-- Avoid building close to the unique item.
			if x < u_x-1 or x > u_x+1 or y < u_y-1 or y > u_y+1 then
				place_one_tomb(x, y)
			end
		end
	end
end

local function place_tombs(lft, rgt, top, bot, unique)
	if unique then
		place_tombs_with_unique(lft, rgt, top, bot)
		return
	end

	local dice = c_rand(5)
	if dice <= 2 then
		place_tombs_aligned(lft, rgt, top, bot)
	elseif dice <= 4 then
		place_tombs_spread(lft, rgt, top, bot)
	else -- if dice == 5
		place_ruin(lft, rgt, top, bot)
	end
end

-- Build the whole graveyard.

local unique_x = c_rand(#Xs-1)
local unique_y = c_rand(#Ys-1)

for i=1,#Xs do
	for j=1,#Ys do
		if i < #Xs then
			local door = (j>1) or c_rand(3) == 1 -- Chance of plain walls at extreme north.
			build_horizontal(Xs[i], Xs[i+1], Ys[j], door)
		end
		loadfile("build/tools/cube.lua")(tileset, zone, Xs[i]-1, Ys[j]-3, 3, 5, 2)
		if j < #Ys then
			local door = (i>1 and i<#Xs) or c_rand(3) == 1 -- Chance of plain walls at extreme east and west.
			build_vertical(Xs[i], Ys[j], Ys[j+1], door)
		end

		if i < #Xs and j < #Ys then
			local have_unique = (i == unique_x and j == unique_y)
			place_tombs(Xs[i]+2, Xs[i+1]-2, Ys[j]+2, Ys[j+1]-3, have_unique)
		end
	end
end
