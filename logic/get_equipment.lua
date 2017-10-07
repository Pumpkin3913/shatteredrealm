#!/usr/bin/lua

-- Equipment slots are size 1 inventories stored in a character tag.

local slot, character = ...
if not character then character = Character; end

local inventory = character_gettag(character, slot);
if not inventory or inventory == "" then
	warning("Equipment slot '"..slot.."' invalid.");
	return;
end

local content = inventory_get_all(inventory);
if #content <= 0 then
	return;
end

return inventory, content[1];
