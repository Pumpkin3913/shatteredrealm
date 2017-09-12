#!/usr/bin/lua

local zone, x, y, aspect, ore, hardness, work = ...

work = tonumber(work);
if not work then work = 3; end

hardness = tonumber(hardness);
if not hardness then hardness = 0; end

place_setaspect(zone, x, y, aspect);
place_settag(zone, x, y, "mining_hardness", hardness);
place_settag(zone, x, y, "mining_work", work);
place_settag(zone, x, y, "mining_content", ore);
