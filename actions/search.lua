#!/usr/bin/lua

local zone = character_getzone(Character);
local x = character_getx(Character);
local y = character_gety(Character);

local function fun(x, y);

	-- Get tile.
	local tileset, tile = string.match(place_getaspect(zone, x, y), "(.*):(.*)");

	-- Check if close.
	local openclose = place_gettag(zone, x, y, "openclose_state");
	local notclose = (openclose ~= "close" and openclose ~= "locked");

	-- Check if it has a specific description.
	local nodescription = false;
	local description = place_gettag(zone, x, y, "description");
	if description and description ~= "" then
		character_message(Character, description);
	-- Else, automatically create a description.
	elseif string.match(tile, "tombstone") then
		local msg = "Ceci est une pierre tombale.";
		local text = place_gettag(zone, x, y, "text");
		if text and text ~= "" then
			msg = msg.." Elle porte une inscription gravée.";
		end
		character_message(Character, msg);
	elseif string.match(tile, "coffer") then
		local msg = "Ceci est un coffre ";

		local rarity = string.match(tile, "coffer_(.*)_");
		if rarity == "common" then msg = msg.."simple";
		elseif rarity == "hard" then msg = msg.."solide";
		elseif rarity == "rare" then msg = msg.."rare";
		elseif rarity == "unique" then msg = msg.."unique";
		end
		msg = msg..".";
		if not notclose then
			msg = msg.." Il est fermé.";
		end
		character_message(Character, msg);
	elseif string.match(tile, "book") then
		local msg = "Ceci est un livre";
		if string.match(tile, "book_b") then
			msg = msg.." noir";
		end
		msg = msg..".";
		if not notclose then
			msg = msg.." Il est fermé.";
		else
			msg = msg.." Il est ouvert.";
		end
		character_message(Character, msg);
	elseif string.match(tile, "crystal") then
		local level = string.match(tile, "crystal_(.*)");
		if level == "empty" then
			character_message(Character, "Ceci est un emplacement de cristal, mais il est vide.");
		else
			local msg = "Ceci est un cristal";
			if tileset == "volcano" then
				msg = msg.." de feu.";
			else
				msg = msg.." magique.";
			end

			level = tonumber(level);
			if level == 1 then
				msg = msg.." Il est complètement déchargé.";
			elseif level == 2 then
				msg = msg.." Il est déchargé.";
			elseif level <= 5 then
				msg = msg.." Il n'est pas encore assez chargé.";
			elseif level == 6 then
				msg = msg.." Il est presque entièrement chargé.";
			else -- if level >= 7 then
				msg = msg.." Il est surchargé !";
			end
			character_message(Character, msg);
		end
	elseif place_gettag(zone, x, y, "text_type") == "chalk" then
		character_message(Character, "Ceci est une inscription tracée à la craie.");
	elseif place_gettag(zone, x, y, "text_type") == "engraving" then
		character_message(Character, "Ceci est une très ancienne inscription gravée.");
	else
		nodescription = true;
	end

	-- Check if contains key.
	local key = place_gettag(zone, x, y, "content_key");
	if notclose and key and key ~= "" then
		-- Check if character already has it.
		if character_gettag(Character, "have "..key) == "true" then
			character_message(Character, "Tu as déjà : "..key);
			return true;
		end

		-- Add key to keyring.
		character_settag(Character, "have "..key, "true");
		character_message(Character, "La clef se copie magiquement à ton trousseau : "..key);
		return true;
	end

	-- Check if contains artifact.
	local artifact = place_gettag(zone, x, y, "content_artifact_1");
	if notclose and artifact and artifact ~= "" then
		local n = 1;
		local msg = "Contenu : ";
		repeat
			if artifact == "EMPTY" then
				msg = msg.."("..n..") Vide ; ";
			else
				msg = msg.."("..n..") "..artifact_getname(artifact).." ; ";
			end
			n = n+1;
			artifact = place_gettag(zone, x, y, "content_artifact_"..n);
		until(not artifact or artifact == "");
		character_message(Character, msg);
		return true;
	end

	-- Check if contains ore.
	local ore = place_gettag(zone, x, y, "mining_content");
	if ore and ore ~= "" then
		character_message(Character, "Ce rocher peut être miné pour récupérer : "..ore);
		return true;
	end

	return (nodescription == false);
end

if not fun(x, y)
and not fun(x, y-1)
and not fun(x, y+1)
and not fun(x-1, y)
and not fun(x+1, y)
then
	character_message(Character, "Tu ne trouves rien.");
end
