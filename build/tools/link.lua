#!/usr/bin/lua

-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - --
-- Link two target places with bidirectional teleportation.  --
-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - --

-- Get arguments.
local Ascreen, Ax, Ay, Bscreen, Bx, By = ...

screen_setlandon(Ascreen, Ax, Ay, "player_changescreen(Player, \""..Bscreen.."\", "..Bx..", "..By..")")
screen_setlandon(Bscreen, Bx, By, "player_changescreen(Player, \""..Ascreen.."\", "..Ax..", "..Ay..")")

