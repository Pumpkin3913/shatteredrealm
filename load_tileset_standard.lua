#!/usr/bin/lua

-- local file = {...}
-- local file = arg[1]
-- local file = arg[1] or dofile_arg[1]
-- local file = dofile_arg[1]

local file = ...
local prefix = file..":"

-- Floor 1/3
register_aspect(prefix.."path_toplft", row+0)
register_aspect(prefix.."path_top", row+1)
register_aspect(prefix.."path_toprgt", row+2)
register_aspect(prefix.."path_endtop", row+3)
register_aspect(prefix.."path_endlft", row+4)
register_aspect(prefix.."path_horizontal", row+5)
register_aspect(prefix.."path_endrgt", row+6)
register_aspect(prefix.."path_lone", row+7)
row = row+8
-- Floor 2/3
register_aspect(prefix.."path_lft", row+0)
register_aspect(prefix.."path", row+1)
register_aspect(prefix.."path_rgt", row+2)
register_aspect(prefix.."path_vertical", row+3)
register_aspect(prefix.."path_rare_a", row+4)
register_aspect(prefix.."path_rare_b", row+5)
register_aspect(prefix.."path_rare_c", row+6)
register_aspect(prefix.."path_rare_d", row+7)
row = row+8
-- Floor 3/3
register_aspect(prefix.."path_botlft", row+0)
register_aspect(prefix.."path_bot", row+1)
register_aspect(prefix.."path_botrgt", row+2)
register_aspect(prefix.."path_endbot", row+3)
register_aspect(prefix.."soil_a", row+4)
register_aspect(prefix.."soil_b", row+5)
register_aspect(prefix.."soil_c", row+6)
register_aspect(prefix.."soil_d", row+7)
row = row+8
-- Roof 1/3
register_aspect(prefix.."roof_toplft", row+0, false)
register_aspect(prefix.."roof_top", row+1, false)
register_aspect(prefix.."roof_toprgt", row+2, false)
register_aspect(prefix.."roof_endtop", row+3, false)
register_aspect(prefix.."roof_endlft", row+4, false)
register_aspect(prefix.."roof_horizontal", row+5, false)
register_aspect(prefix.."roof_endrgt", row+6, false)
register_aspect(prefix.."roof_lone", row+7, false)
row = row+8
-- Roof 2/3
register_aspect(prefix.."roof_lft", row+0, false)
register_aspect(prefix.."roof", row+1)
register_aspect(prefix.."roof_rgt", row+2, false)
register_aspect(prefix.."roof_vertical", row+3, false)
register_aspect(prefix.."roof_rare_a", row+4)
register_aspect(prefix.."roof_rare_b", row+5)
register_aspect(prefix.."roof_rare_c", row+6)
register_aspect(prefix.."roof_rare_d", row+7)
row = row+8
-- Roof 3/3
register_aspect(prefix.."roof_botlft", row+0, false)
register_aspect(prefix.."roof_bot", row+1, false)
register_aspect(prefix.."roof_botrgt", row+2, false)
register_aspect(prefix.."roof_endbot", row+3, false)
register_aspect(prefix.."roof_bot_alt", row+4, false)
register_aspect(prefix.."roof_bot_decorated", row+5, false)
register_aspect(prefix.."roof_bot_climb", row+6, false)
register_aspect(prefix.."roof_bot_written", row+7, false)
row = row+8
-- Wall 1/2
register_aspect(prefix.."wall_lft", row+0, false)
register_aspect(prefix.."wall", row+1, false)
register_aspect(prefix.."wall_rgt", row+2, false)
register_aspect(prefix.."pillar", row+3, false)
register_aspect(prefix.."wall_alt", row+3, false)
register_aspect(prefix.."wall_decorated", row+5, false)
register_aspect(prefix.."wall_climb", row+6, false)
register_aspect(prefix.."wall_written", row+7, false)
row = row+8
-- Wall 2/2
register_aspect(prefix.."wall_botlft", row+0, false)
register_aspect(prefix.."wall_bot", row+1, false)
register_aspect(prefix.."wall_botrgt", row+2, false)
register_aspect(prefix.."pillar_bot", row+3, false)
register_aspect(prefix.."wall_bot_alt", row+4, false)
register_aspect(prefix.."wall_bot_decorated", row+5, false)
register_aspect(prefix.."wall_bot_climb", row+6, false)
register_aspect(prefix.."wall_bot_written", row+7, false)
row = row+8

-- Big Door 1/2
register_aspect(prefix.."bigdoor_toplft", row+0, false)
register_aspect(prefix.."bigdoor_top", row+1, false)
register_aspect(prefix.."bigdoor_toprgt", row+2, false)
register_aspect(prefix.."bigdoor_closed", row+3, false)
register_aspect(prefix.."wall_window", row+4, false)
register_aspect(prefix.."wall_window_lit", row+5, false)
register_aspect(prefix.."roof_angle_toplft", row+6, false)
register_aspect(prefix.."roof_angle_toprgt", row+7, false)
row = row+8

-- Big Door 2/2
register_aspect(prefix.."bigdoor_lft", row+0, false)
register_aspect(prefix.."bigdoor", row+1)
register_aspect(prefix.."bigdoor_rgt", row+2, false)
register_aspect(prefix.."bigdoor_locked", row+3, false)
register_aspect(prefix.."wall_bot_window", row+4, false)
register_aspect(prefix.."wall_bot_window_lit", row+5, false)
register_aspect(prefix.."roof_angle_botlft", row+6, false)
register_aspect(prefix.."roof_angle_botrgt", row+7, false)
row = row+8

-- Mosaic, Tombs.
register_aspect(prefix.."mosaic_white", row+0)
register_aspect(prefix.."mosaic_black", row+1)
register_aspect(prefix.."mosaic_a", row+2)
register_aspect(prefix.."mosaic_b", row+3)
register_aspect(prefix.."mosaic_c", row+4)
register_aspect(prefix.."mosaic_special", row+5)
register_aspect(prefix.."tombstone_cross", row+6, false)
register_aspect(prefix.."tombstone_slab", row+7, false)
row = row+8

-- Coffers
register_aspect(prefix.."coffer_common_close", row+0, false)
register_aspect(prefix.."coffer_common_open", row+1, false)
register_aspect(prefix.."coffer_hard_close", row+2, false)
register_aspect(prefix.."coffer_hard_open", row+3, false)
register_aspect(prefix.."coffer_rare_close", row+4, false)
register_aspect(prefix.."coffer_rare_open", row+5, false)
register_aspect(prefix.."coffer_unique_close", row+6, false)
register_aspect(prefix.."coffer_unique_open", row+7, false)
row = row+8

-- Crystals
register_aspect(prefix.."crystal_empty", row+0)
register_aspect(prefix.."crystal_1", row+1, false)
register_aspect(prefix.."crystal_2", row+2, false)
register_aspect(prefix.."crystal_3", row+3, false)
register_aspect(prefix.."crystal_4", row+4, false)
register_aspect(prefix.."crystal_5", row+5, false)
register_aspect(prefix.."crystal_6", row+6, false)
register_aspect(prefix.."crystal_7", row+7, false)
row = row+8

-- Books, Stairs
register_aspect(prefix.."book_a_open", row+0, false)
register_aspect(prefix.."book_a_close", row+1, false)
register_aspect(prefix.."book_b_open", row+2, false)
register_aspect(prefix.."book_b_close", row+3, false)
register_aspect(prefix.."stairs_up", row+4)
register_aspect(prefix.."stairs_down", row+5)
register_aspect(prefix.."hatch", row+6)
register_aspect(prefix.."slab", row+7, false)
row = row+8

-- Blocks
register_aspect(prefix.."block_a", row+0, false)
register_aspect(prefix.."block_b", row+1, false)
register_aspect(prefix.."block_c", row+2, false)
register_aspect(prefix.."block_d", row+3, false)
register_aspect(prefix.."block_e", row+4, false)
register_aspect(prefix.."block_f", row+5, false)
register_aspect(prefix.."block_g", row+6, false)
register_aspect(prefix.."block_h", row+7, false)
row = row+8

-- Misc
row = row+8
register_aspect(prefix.."well", row+0, false)
register_aspect(prefix.."octahedron", row+1, false)

info("Tileset '"..file.."' loaded.")

