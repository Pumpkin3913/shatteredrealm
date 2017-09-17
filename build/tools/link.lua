#!/usr/bin/lua

-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - --
-- Link two target places with bidirectional teleportation.  --
-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - --

-- Get arguments.
local Azone, Ax, Ay, Bzone, Bx, By = ...

place_setlandon(Azone, Ax, Ay, "character_changezone(Character, \""..Bzone.."\", "..Bx..", "..By..")")
place_setlandon(Bzone, Bx, By, "character_changezone(Character, \""..Azone.."\", "..Ax..", "..Ay..")")

