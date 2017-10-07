#!/usr/bin/lua

local pattern, inventory = ...

local function search(inventory)
	if not inventory or inventory == "" then
		return;
	end

	local content = inventory_get_all(inventory);
	for _, artifact in ipairs(content) do
		local name = artifact_getname(inventory, artifact);
		if string.find(name, pattern) then
			return inventory, artifact;
		end

		local subinventory = artifact_gettag(inventory, artifact, "inventory");
		local i, a = search(subinventory);
		if i or a then
			return i, a;
		end
	end
	return;
end

return search(inventory);
