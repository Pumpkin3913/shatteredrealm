#!/usr/bin/lua

local id = ...

-- TODO: abort if there are players in.
-- TODO: delete subzones.
-- TODO: delete contained artifacts.

delete_zone(id)

return true
