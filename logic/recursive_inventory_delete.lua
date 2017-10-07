#!/usr/bin/lua

local inventory = ...

local function delete(inventory)
	if not inventory or inventory == "" then
		return;
	end

	local content = inventory_get_all(inventory);
	for _, artifact in ipairs(content) do
		local subinventory = artifact_gettag(inventory, artifact, "inventory");
		delete(subinventory);
	end
	delete_inventory(inventory);
end

delete(inventory);
