#!/usr/bin/lua

local origin, origin_x, origin_y = ...

zone_event(origin, "La chaleur et des odeurs de soufre émanent du portail !");

local zone = "empyrithea_"..c_rand(999999); -- TODO: request UUID.
local name = "Empyrithéa";
local tileset = "volcano";
local w = 40;
local h = 40;

local curve = 6;
local level_h = 9;

new_zone(zone, name, w, h, tileset..":roof");

-- Randomize soil.
for x=0,w-1 do
	for y=0,h-1 do
		if c_rand(100) <= 10 then
			place_setaspect(zone, x, y, tileset..":roof_rare_"..c_rand(4));
		end
	end
end

local function round(n)
	return math.floor(n+0.5);
end

local function check(x, y)
	return x >= 0 and y >= 0 and x < w and y < h;
end

local function reverse(n)
	if n == "lft" then
		return "rgt";
	elseif n == "rgt" then
		return "lft";
	else
		return n;
	end
end

local function putwall(x, y, height, angle)
	-- Force angle on border positions.
	if x == 0 then
		angle = -1;
	elseif x == w-1 then
		angle = 1;
		y = y-1;
	end

	-- Convert angle to lft/rgt.
	local n = "";
	if angle < 0 then
		n = "lft";
	elseif angle > 0 then
		n = "rgt";
		y = y+1;
	end

	-- Roll a dice for climb wall or lava fall.
	local special = "";
	if angle == 0 then
		local dice = c_rand(10);
		if dice == 1 then
			special = "_climb";
		elseif dice == 2 then
			special = "_decorated";
		end
	end

	-- Select and put the tile.
	for i=-1,height-1 do
		local tile = "";
		if not check(x, y+i) then
			-- Nothing.
		elseif i == -1 and n ~= "" then
			tile = "roof_angle_top"..reverse(n);
		elseif i == 0 then
			tile = "roof_bot"..n..special;
		elseif i == height-1 then
			tile = "wall_bot"..n..special;
		elseif i > 0 then
			if n ~= "" then
				tile = "wall_"..n;
			else
				tile = "wall"..special;
			end
		end

		if tile ~= "" then
			place_setaspect(zone, x, y+i, tileset..":"..tile);
			if special == "_climb" then
				place_setpassable(zone, x, y+i);
			end
		end
	end
end

for y = c_rand(level_h)*(-1), h-1, level_h do
	y = y + c_rand(3);
	local prev = 0;
	for x=0,w-1 do
		local shift = round(math.sin(math.pi*(x/(w-1)))*curve);
		putwall(x, y+shift, 3, prev - shift);
		prev = shift;
	end
end

local function is_free(x, y)
	local tile = string.match(place_getaspect(zone, x, y), ".*:(.*)");
	if tile == "roof" or string.match(tile, "^roof_rare_.*") then
		return true;
	else
		return false;
	end
end

-- Create entrance.

local first_free_y = h-2;
local mid_x = round(w/2);
while not is_free(mid_x, first_free_y) do
	first_free_y = first_free_y - 1;
end

place_setaspect(zone, mid_x, first_free_y, tileset..":mosaic_a");
loadfile("build/tools/link.lua")(zone, mid_x, first_free_y, origin, origin_x, origin_y);

-- Add minerals.

for x=0,w-1 do
	for y=0,h-1 do
		if c_rand(100) <= 15 and is_free(x, y) then
			local aspect, name, hardness;
			local dice = c_rand(10);
			if dice == 1 then
				name = "Rubis";
				hardness = 2;
				aspect = tileset..":ore_nuggets";
			elseif dice <= 3 then
				name = "Minerai d'Airin";
				hardness = 1;
				aspect = tileset..":ore_strips";
			else
				name = "Pierre";
				hardness = 0;
				aspect = tileset..":block_"..c_rand(4);
			end
			loadfile("build/tools/ore.lua")(zone, x, y, aspect, name, hardness);
		end
	end
end

return zone;
