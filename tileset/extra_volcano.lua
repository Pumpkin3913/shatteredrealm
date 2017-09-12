#!/usr/bin/lua

local file = ...
local prefix = file..":"

register_aspect(prefix.."cracks", row+0, false)
register_aspect(prefix.."spikes", row+1, false)
register_aspect(prefix.."bigdoor_written", row+2, false)
row = row+8

register_aspect(prefix.."ore_strips", row+0, false)
register_aspect(prefix.."ore_nuggets", row+1, false)
register_aspect(prefix.."ore_black", row+2, false)
row = row+8

row = row+8
row = row+8
row = row+8
row = row+8
row = row+8
row = row+8
