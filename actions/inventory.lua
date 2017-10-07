#!/usr/bin/lua

local function list_inventory(inventory)
	if not inventory or inventory == "" or inventory == "0.0" then
		return "";
	end

	local msg = " ["..inventory_total(inventory).."/"..inventory_size(inventory).."]";
	if inventory_total(inventory) <= 0 then
		return msg.." Vide";
	end

	local list = inventory_get_all(inventory);
	for _, artifact in ipairs(list) do
		local name = artifact_getname(inventory, artifact);
		local quantity = artifact_getquantity(inventory, artifact);
		if quantity == 0 then quantity = 1 end;
		local subinventory = list_inventory(artifact_gettag(inventory, artifact, "inventory"));
		if subinventory ~= "" then
			subinventory = " ("..subinventory..")";
		end
		msg = msg.." "..quantity.." "..name..subinventory.." ;";
	end

	return msg;
end

local hand = character_gettag(Character, "hand");
if hand and hand ~= "" then
	character_message(Character, "Mains"..list_inventory(character_gettag(Character, "hand")));
end

local belt = character_gettag(Character, "belt");
if belt and belt ~= "" then
	character_message(Character, "Ceinture"..list_inventory(character_gettag(Character, "belt")));
end
