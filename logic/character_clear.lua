#!/usr/bin/lua

loadfile("logic/recursive_inventory_delete.lua")(character_gettag(Character, "hand"));
loadfile("logic/recursive_inventory_delete.lua")(character_gettag(Character, "belt"));
