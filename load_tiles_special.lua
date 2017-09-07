#!/usr/bin/lua

local file = ...
local prefix = file..":"

register_aspect(prefix.."trees_lft", row+0, false)
register_aspect(prefix.."trees_rgt", row+1, false)
register_aspect(prefix.."tree_door", row+2, true)
register_aspect(prefix.."tree_door_top", row+3, false)
register_aspect(prefix.."grass_1", row+4)
register_aspect(prefix.."grass_2", row+5)
register_aspect(prefix.."grass_3", row+6)
register_aspect(prefix.."grass_4", row+7)
row = row+8

register_aspect(prefix.."tree_toplft", row+0, false)
register_aspect(prefix.."tree_toprgt", row+1, false)
register_aspect(prefix.."tree_door_closed", row+2, false)
register_aspect(prefix.."tree_door_locked", row+3, false)
register_aspect(prefix.."flower_1", row+4)
register_aspect(prefix.."flower_2", row+5)
register_aspect(prefix.."flower_3", row+6)
register_aspect(prefix.."flower_4", row+7)
row = row+8

register_aspect(prefix.."tree_botlft", row+0, false)
register_aspect(prefix.."tree_botrgt", row+1, false)
register_aspect(prefix.."tree_botlft_alive", row+2, false)
register_aspect(prefix.."tree_botrgt_alive", row+3, false)
register_aspect(prefix.."rock_1", row+4)
register_aspect(prefix.."rock_2", row+5)
register_aspect(prefix.."rock_3", row+6)
register_aspect(prefix.."rock_4", row+7)
row = row+8

row = row+8
row = row+8
row = row+8
row = row+8
row = row+8
