#!/usr/bin/lua

local file = ...
local prefix = file..":"

register_aspect(prefix.."tombstone_cross", row+0, false)
register_aspect(prefix.."tombstone_slab", row+1, false)
register_aspect(prefix.."well", row+2, false)
register_aspect(prefix.."hatch", row+3)
row = row+8

register_aspect(prefix.."throne_toplft", row+0, false)
register_aspect(prefix.."throne_top", row+1, false)
register_aspect(prefix.."throne_toprgt", row+2, false)
row = row+8

register_aspect(prefix.."throne_lft", row+0, false)
register_aspect(prefix.."throne", row+1, false)
register_aspect(prefix.."throne_rgt", row+2, false)
row = row+8

register_aspect(prefix.."throne_botlft", row+0, false)
register_aspect(prefix.."throne_bot", row+1, false)
register_aspect(prefix.."throne_botrgt", row+2, false)
row = row+8

row = row+8
row = row+8
row = row+8
row = row+8
