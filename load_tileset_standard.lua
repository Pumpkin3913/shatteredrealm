#!/usr/bin/lua

-- local file = {...}
-- local file = arg[1]
-- local file = arg[1] or dofile_arg[1]
-- local file = dofile_arg[1]

local file = ...
local prefix = file..":"

-- Floor 1/3
new_tile(prefix.."path_toplft", "Path", row+0)
new_tile(prefix.."path_top", "Path", row+1)
new_tile(prefix.."path_toprgt", "Path", row+2)
new_tile(prefix.."path_endtop", "Path", row+3)
new_tile(prefix.."path_endlft", "Path", row+4)
new_tile(prefix.."path_horizontal", "Path", row+5)
new_tile(prefix.."path_endrgt", "Path", row+6)
new_tile(prefix.."path_lone", "Path", row+7)
row = row+8
-- Floor 2/3
new_tile(prefix.."path_lft", "Path", row+0)
new_tile(prefix.."path", "Path", row+1)
new_tile(prefix.."path_rgt", "Path", row+2)
new_tile(prefix.."path_vertical", "Path", row+3)
new_tile(prefix.."path_rare_a", "Path", row+4)
new_tile(prefix.."path_rare_b", "Path", row+5)
new_tile(prefix.."path_rare_c", "Path", row+6)
new_tile(prefix.."path_rare_d", "Path", row+7)
row = row+8
-- Floor 3/3
new_tile(prefix.."path_botlft", "Path", row+0)
new_tile(prefix.."path_bot", "Path", row+1)
new_tile(prefix.."path_botrgt", "Path", row+2)
new_tile(prefix.."path_endbot", "Path", row+3)
new_tile(prefix.."soil_a", "Soil", row+4)
new_tile(prefix.."soil_b", "Soil", row+5)
new_tile(prefix.."soil_c", "Soil", row+6)
new_tile(prefix.."soil_d", "Soil", row+7)
row = row+8
-- Roof 1/3
new_tile(prefix.."roof_toplft", "Roof", row+0, false)
new_tile(prefix.."roof_top", "Roof", row+1, false)
new_tile(prefix.."roof_toprgt", "Roof", row+2, false)
new_tile(prefix.."roof_endtop", "Roof", row+3, false)
new_tile(prefix.."roof_endlft", "Roof", row+4, false)
new_tile(prefix.."roof_horizontal", "Roof", row+5, false)
new_tile(prefix.."roof_endrgt", "Roof", row+6, false)
new_tile(prefix.."roof_lone", "Roof", row+7, false)
row = row+8
-- Roof 2/3
new_tile(prefix.."roof_lft", "Roof", row+0, false)
new_tile(prefix.."roof", "Roof", row+1)
new_tile(prefix.."roof_rgt", "Roof", row+2, false)
new_tile(prefix.."roof_vertical", "Roof", row+3, false)
new_tile(prefix.."roof_rare_a", "Roof", row+4)
new_tile(prefix.."roof_rare_b", "Roof", row+5)
new_tile(prefix.."roof_rare_c", "Roof", row+6)
new_tile(prefix.."roof_rare_d", "Roof", row+7)
row = row+8
-- Roof 3/3
new_tile(prefix.."roof_botlft", "Roof", row+0, false)
new_tile(prefix.."roof_bot", "Roof", row+1, false)
new_tile(prefix.."roof_botrgt", "Roof", row+2, false)
new_tile(prefix.."roof_endbot", "Roof", row+3, false)
new_tile(prefix.."roof_bot_climb", "Roof", row+4, false)
new_tile(prefix.."roof_bot_special_1", "Roof", row+5, false)
new_tile(prefix.."roof_bot_special_2", "Roof", row+6, false)
new_tile(prefix.."roof_bot_special_3", "Roof", row+7, false)
row = row+8
-- Wall 1/2
new_tile(prefix.."wall_lft", "Wall", row+0, false)
new_tile(prefix.."wall", "Wall", row+1, false)
new_tile(prefix.."wall_rgt", "Wall", row+2, false)
new_tile(prefix.."pillar", "Wall", row+3, false)
new_tile(prefix.."wall_climb", "Wall", row+4, false)
new_tile(prefix.."wall_special_1", "Wall", row+5, false)
new_tile(prefix.."wall_special_2", "Wall", row+6, false)
new_tile(prefix.."wall_window", "Wall", row+7, false)
row = row+8
-- Wall 2/2
new_tile(prefix.."wall_botlft", "Wall", row+0, false)
new_tile(prefix.."wall_bot", "Wall", row+1, false)
new_tile(prefix.."wall_botrgt", "Wall", row+2, false)
new_tile(prefix.."pillar_bot", "Wall", row+3, false)
new_tile(prefix.."wall_bot_climb", "Wall", row+4, false)
new_tile(prefix.."wall_bot_special_1", "Wall", row+5, false)
new_tile(prefix.."wall_bot_special_2", "Wall", row+6, false)
new_tile(prefix.."wall_bot_window", "Wall", row+7, false)
row = row+8

-- Mosaic
new_tile(prefix.."palette_a", "", row+0)
new_tile(prefix.."palette_b", "", row+1)
new_tile(prefix.."mosaic_a", "Mosaic", row+2)
new_tile(prefix.."mosaic_b", "Mosaic", row+3)
new_tile(prefix.."mosaic_c", "Mosaic", row+4)
new_tile(prefix.."mosaic_special", "Special Mosaic", row+5)
new_tile(prefix.."mosaic_white", "White Mosaic", row+6)
new_tile(prefix.."mosaic_black", "Black Mosaic", row+7)
row = row+8

-- Blocks
new_tile(prefix.."block_a", "Block", row+0, false)
new_tile(prefix.."block_b", "Block", row+1, false)
new_tile(prefix.."well", "Well", row+2, false)
new_tile(prefix.."octahedron", "Octahedron", row+3, false)
new_tile(prefix.."tombstone_cross", "Cross Tombstone", row+4, false)
new_tile(prefix.."tombstone_slab", "Slab Tombstone", row+5, false)
row = row+8

-- Undef
row = row+8

-- CrYstals
new_tile(prefix.."crystal_empty", "Crystal Socket", row+0)
new_tile(prefix.."crystal_1", "Crystal", row+1, false)
new_tile(prefix.."crystal_2", "Crystal", row+2, false)
new_tile(prefix.."crystal_3", "Crystal", row+3, false)
new_tile(prefix.."crystal_4", "Crystal", row+4, false)
new_tile(prefix.."crystal_5", "Crystal", row+5, false)
new_tile(prefix.."crystal_6", "Crystal", row+6, false)
new_tile(prefix.."crystal_7", "Crystal", row+7, false)
row = row+8

-- Undef
row = row+8

-- Undef
new_tile(prefix.."roof_bot_written", "Written Roof", row+7, false)
row = row+8

-- Big Door 1/2
new_tile(prefix.."bigdoor_toplft", "Wall", row+0, false)
new_tile(prefix.."bigdoor_top", "Wall", row+1, false)
new_tile(prefix.."bigdoor_toprgt", "Wall", row+2, false)
new_tile(prefix.."bigdoor_closed", "Closed Door", row+3, false)
--
new_tile(prefix.."wall_written", "Written Wall", row+7, false)
row = row+8

-- Big Door 2/2
new_tile(prefix.."bigdoor_lft", "Wall", row+0, false)
new_tile(prefix.."bigdoor", "Opened Door", row+1)
new_tile(prefix.."bigdoor_rgt", "Wall", row+2, false)
new_tile(prefix.."bigdoor_locked", "Locked Door", row+3, false)
--
new_tile(prefix.."wall_bot_written", "Written Wall", row+7, false)
row = row+8

verbose("Tileset '"..file.."' loaded.")

