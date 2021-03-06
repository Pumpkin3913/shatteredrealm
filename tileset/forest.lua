#!/usr/bin/lua

local file = ...
local prefix = file..":"

-- Forest.
register_aspect(prefix.."trees_lft", row+0, false)
register_aspect(prefix.."trees_rgt", row+1, false)
register_aspect(prefix.."trees_lft_flowers", row+2, false)
register_aspect(prefix.."trees_rgt_flowers", row+3, false)
register_aspect(prefix.."trees_lft_fruits", row+4, false)
register_aspect(prefix.."trees_rgt_fruits", row+5, false)
register_aspect(prefix.."trees_lft_noleaves", row+6, false)
register_aspect(prefix.."trees_rgt_noleaves", row+7, false)
row = row+8

-- Tree tops.
register_aspect(prefix.."tree_toplft", row+0, false)
register_aspect(prefix.."tree_toprgt", row+1, false)
register_aspect(prefix.."tree_toplft_flowers", row+2, false)
register_aspect(prefix.."tree_toprgt_flowers", row+3, false)
register_aspect(prefix.."tree_toplft_fruits", row+4, false)
register_aspect(prefix.."tree_toprgt_fruits", row+5, false)
register_aspect(prefix.."tree_toplft_noleaves", row+6, false)
register_aspect(prefix.."tree_toprgt_noleaves", row+7, false)
row = row+8

-- Tree trunks.
register_aspect(prefix.."tree_botlft", row+0, false)
register_aspect(prefix.."tree_botrgt", row+1, false)
register_aspect(prefix.."tree_botlft_flowers", row+2, false)
register_aspect(prefix.."tree_botrgt_flowers", row+3, false)
register_aspect(prefix.."tree_botlft_fruits", row+4, false)
register_aspect(prefix.."tree_botrgt_fruits", row+5, false)
register_aspect(prefix.."tree_botlft_noleaves", row+6, false)
register_aspect(prefix.."tree_botrgt_noleaves", row+7, false)
row = row+8

-- Trees parts.
register_aspect(prefix.."tree_botlft_alive", row+0, false)
register_aspect(prefix.."tree_botrgt_alive", row+1, false)
register_aspect(prefix.."tree_botlft_stump", row+2, false)
register_aspect(prefix.."tree_botrgt_stump", row+3, false)
register_aspect(prefix.."tree_door", row+4, true)
register_aspect(prefix.."tree_door_closed", row+5, false)
register_aspect(prefix.."tree_door_locked", row+6, false)
register_aspect(prefix.."tree_door_top", row+7, false)
row = row+8

-- Grass and plants.
register_aspect(prefix.."grass_1", row+0)
register_aspect(prefix.."grass_2", row+1)
register_aspect(prefix.."grass_3", row+2)
register_aspect(prefix.."grass_4", row+3)
register_aspect(prefix.."plant_1", row+4)
register_aspect(prefix.."plant_2", row+5)
register_aspect(prefix.."plant_3", row+6)
register_aspect(prefix.."plant_4", row+7)
row = row+8

-- Rocks.
register_aspect(prefix.."rock_1", row+0, false)
register_aspect(prefix.."rock_2", row+1, false)
register_aspect(prefix.."rock_3", row+2, false)
register_aspect(prefix.."rock_4", row+3, false)
row = row+8

-- Transition grass 1/3
register_aspect(prefix.."grass_toplft", row+0)
register_aspect(prefix.."grass_top", row+1)
register_aspect(prefix.."grass_toprgt", row+2)
register_aspect(prefix.."grass_endtop", row+3)
register_aspect(prefix.."grass_endlft", row+4)
register_aspect(prefix.."grass_horizontal", row+5)
register_aspect(prefix.."grass_endrgt", row+6)
register_aspect(prefix.."grass_lone", row+7)
row = row+8

-- Transition grass 2/3
register_aspect(prefix.."grass_lft", row+0)
register_aspect(prefix.."grass_hole", row+1)
register_aspect(prefix.."grass_rgt", row+2)
register_aspect(prefix.."grass_vertical", row+3)
register_aspect(prefix.."grass_angle_toplft", row+4)
register_aspect(prefix.."grass_angle_toprgt", row+5)
register_aspect(prefix.."grass_turn_toplft", row+6)
register_aspect(prefix.."grass_turn_toprgt", row+7)
row = row+8

-- Transition grass 3/3
register_aspect(prefix.."grass_botlft", row+0)
register_aspect(prefix.."grass_bot", row+1)
register_aspect(prefix.."grass_botrgt", row+2)
register_aspect(prefix.."grass_endbot", row+3)
register_aspect(prefix.."grass_angle_botlft", row+4)
register_aspect(prefix.."grass_angle_botrgt", row+5)
register_aspect(prefix.."grass_turn_botlft", row+6)
register_aspect(prefix.."grass_turn_botrgt", row+7)
row = row+8

row = row+8
row = row+8
row = row+8
row = row+8
row = row+8
row = row+8
row = row+8

info("Forest tileset '"..file.."' loaded.")
