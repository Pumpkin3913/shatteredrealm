#!/usr/bin/lua

local zone, x, y, size, type_ = ...
local inventory = create_inventory(size, type_);
place_settag(zone, x, y, "inventory", inventory);
