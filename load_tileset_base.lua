#!/usr/bin/lua

-- Row 1: Icons
register_aspect("void", row+0)
register_aspect("at", row+1)
register_aspect("heart", row+2)
register_aspect("heart_empty", row+3)
register_aspect("star", row+4)
register_aspect("star_empty", row+5)
register_aspect("gem", row+6)
register_aspect("question_mark", row+7)
row = row+8

-- Row 2: Vial A
register_aspect("vial_A_empty", row+0)
register_aspect("vial_A_red", row+1)
register_aspect("vial_A_green", row+2)
register_aspect("vial_A_blue", row+3)
register_aspect("vial_A_purple", row+4)
register_aspect("vial_A_yellow", row+5)
register_aspect("vial_A_orange", row+6)
register_aspect("vial_A_black", row+7)
row = row+8

-- Row 3: Vial B
register_aspect("vial_B_empty", row+0)
register_aspect("vial_B_red", row+1)
register_aspect("vial_B_green", row+2)
register_aspect("vial_B_blue", row+3)
register_aspect("vial_B_purple", row+4)
register_aspect("vial_B_yellow", row+5)
register_aspect("vial_B_orange", row+6)
register_aspect("vial_B_black", row+7)
row = row+8

-- Row 4: Vial C
register_aspect("vial_C_empty", row+0)
register_aspect("vial_C_red", row+1)
register_aspect("vial_C_green", row+2)
register_aspect("vial_C_blue", row+3)
register_aspect("vial_C_purple", row+4)
register_aspect("vial_C_yellow", row+5)
register_aspect("vial_C_orange", row+6)
register_aspect("vial_C_black", row+7)
row = row+8

-- Row 5: Armored character
register_aspect("blue_armor", row+0)
register_aspect("red_armor", row+1)
register_aspect("white_armor", row+2)
register_aspect("black_armor", row+3)
-- register_aspect("", row+4)
-- register_aspect("", row+5)
-- register_aspect("", row+6)
-- register_aspect("", row+7)
row = row+8

-- Row 6: Unused
row = row+8

-- Row 7: Unused
row = row+8

-- Row 8: Daemon character
register_aspect("demon", row+0)
register_aspect("demon_trident", row+1)
register_aspect("demon_flame", row+2)
register_aspect("demon_trident_flame", row+3)
register_aspect("demon_wings", row+4)
register_aspect("demon_trident_wings", row+5)
register_aspect("demon_flame_wings", row+6)
register_aspect("demon_trident_flame_wings", row+7)
row = row+8

info("Base tileset loaded.")

