#!/usr/bin/lua

-- Row 1: Icons
new_tile("?", "", row+0)
new_tile("@", "", row+1)
new_tile("heart", "Heart", row+2)
new_tile("heart_empty", "Empty Heart", row+3)
new_tile("gem", "Green Gem", row+4)
-- new_tile("", "", row+5)
-- new_tile("", "", row+6)
-- new_tile("", "", row+7)
row = row+8

-- Row 2: Vial A
new_tile("vial_A_empty", "Empty Vial", row+0)
new_tile("vial_A_red", "Vial", row+1)
new_tile("vial_A_green", "Vial", row+2)
new_tile("vial_A_blue", "Vial", row+3)
new_tile("vial_A_purple", "Vial", row+4)
new_tile("vial_A_yellow", "Vial", row+5)
new_tile("vial_A_orange", "Vial", row+6)
new_tile("vial_A_black", "Vial", row+7)
row = row+8

-- Row 3: Vial B
new_tile("vial_B_empty", "Vial", row+0)
new_tile("vial_B_red", "Vial", row+1)
new_tile("vial_B_green", "Vial", row+2)
new_tile("vial_B_blue", "Vial", row+3)
new_tile("vial_B_purple", "Vial", row+4)
new_tile("vial_B_yellow", "Vial", row+5)
new_tile("vial_B_orange", "Vial", row+6)
new_tile("vial_B_black", "Vial", row+7)
row = row+8

-- Row 4: Vial C
new_tile("vial_C_empty", "Vial", row+0)
new_tile("vial_C_red", "Vial", row+1)
new_tile("vial_C_green", "Vial", row+2)
new_tile("vial_C_blue", "Vial", row+3)
new_tile("vial_C_purple", "Vial", row+4)
new_tile("vial_C_yellow", "Vial", row+5)
new_tile("vial_C_orange", "Vial", row+6)
new_tile("vial_C_black", "Vial", row+7)
row = row+8

-- Row 5: Armored character
new_tile("blue_armor", "Blue Armor", row+0)
new_tile("red_armor", "Red Armor", row+1)
new_tile("white_armor", "White Armor", row+2)
new_tile("black_armor", "black_armor", row+3)
-- new_tile("", "", row+4)
-- new_tile("", "", row+5)
-- new_tile("", "", row+6)
-- new_tile("", "", row+7)
row = row+8

-- Row 6: Unused
row = row+8

-- Row 7: Unused
row = row+8

-- Row 8: Daemon character
new_tile("demon", "Small Demon", row+0)
new_tile("demon_trident", "Armed Demon", row+1)
new_tile("demon_flame", "Pyro Demon", row+2)
new_tile("demon_trident_flame", "Pyro Armed Demon", row+3)
new_tile("demon_wings", "Winged Demon", row+4)
new_tile("demon_trident_wings", "Armed Winged Demon", row+5)
new_tile("demon_flame_wings", "Pyro Winged Demon", row+6)
new_tile("demon_trident_flame_wings", "Great Demon", row+7)
row = row+8

verbose("Base tileset loaded.")

