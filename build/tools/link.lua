#!/usr/bin/lua

-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - --
-- Link two target places with bidirectional teleportation.  --
-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - --

-- Get arguments.
local Azone, Ax, Ay, Bzone, Bx, By = ...

place_setlandon(Azone, Ax, Ay, "player_changezone(Player, \""..Bzone.."\", "..Bx..", "..By..")")
place_setlandon(Bzone, Bx, By, "player_changezone(Player, \""..Azone.."\", "..Ax..", "..Ay..")")

