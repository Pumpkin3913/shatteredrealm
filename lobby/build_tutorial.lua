#!/usr/bin/lua

local lobby_zone, lobby_x, lobby_y = ...

info("[WORLDGEN] Tutorial")

local zone = "tutorial"
local tileset = "violetcastle"
local w = 11
local h = 37
local x_mid = math.floor(w/2)

new_zone(zone, "Tutorial", w, h, tileset..":path")

local build_horizontal_wall = function(y)
	for x=0,w-1 do
		place_setaspect(zone, x, y-1, tileset..":roof_horizontal")
		place_setaspect(zone, x, y,   tileset..":wall_bot")
	end
	place_setaspect(zone, x_mid-1, y-1, tileset..":roof_endrgt")
	place_setaspect(zone, x_mid,   y-1, tileset..":path")
	place_setaspect(zone, x_mid+1, y-1, tileset..":roof_horizontal")
	place_setaspect(zone, x_mid-1, y,   tileset..":wall_botrgt")
	place_setaspect(zone, x_mid,   y,   tileset..":path")
	place_setaspect(zone, x_mid+1, y,   tileset..":wall_botlft")
end

local y = h-2

local entrance_x = x_mid
local entrance_y = y
place_setaspect(zone, entrance_x, entrance_y, tileset..":mosaic_a") -- spawn point

y = y-3

build_horizontal_wall(y)
place_setlandon(zone, x_mid, y, "\
player_message(Player, \"* * *\")\
player_message(Player, \"Pour interagir avec certains éléments, il suffit de marcher dessus.\")\
player_message(Player, \"Essaye de marcher sur ces dalles, puis va jusqu'à la salle suivante.\")\
")

y = y-3

place_setaspect  (zone, 2,   y, tileset..":mosaic_white")
place_setlandon(zone, 2,   y, "dofile(\"logic/switch_bw_mosaic.lua\")")
place_setaspect  (zone, w-3, y, tileset..":mosaic_black")
place_setlandon(zone, w-3, y, "dofile(\"logic/switch_bw_mosaic.lua\")")

y = y-3

place_setaspect  (zone, 2,   y, tileset..":mosaic_b")
place_setlandon(zone, 2,   y, "player_setxy(Player, "..w-3 ..", "..y..")")
place_setaspect  (zone, w-3, y, tileset..":mosaic_b")
place_setlandon(zone, w-3, y, "player_setxy(Player, 2, "..y..")")

y = y-2

build_horizontal_wall(y)
place_setlandon(zone, x_mid, y, "\
player_message(Player, \"* * *\")\
player_message(Player, \"Pour interagir avec un objet, mets-toi devant et entre une commande.\")\
player_message(Player, \"Les commandes commencent par \"/\". Essaye de /lire ce livre.\")\
player_message(Player, \"Tiens-toi devant ce livre, entre '/lire' et valide avec Entrée.\")\
")

y = y-4

place_setaspect(zone, x_mid, y, tileset..":book_a_open")
place_settag(zone, x_mid, y, "text", "Bien joué! Va dans la salle suivante.")

y = y-3

build_horizontal_wall(y)
place_setlandon(zone, x_mid, y, "\
player_message(Player, \"* * *\")\
player_message(Player, \"Les commandes peuvent être enregistrées dans les touches Fx et rapidement réutilisées.\")\
player_message(Player, \"Appuyer sur shift + F1 sauvegarde la commande courante dans F1.\")\
player_message(Player, \"F1 ajoute le texte sauvegardé dans la commande. (Échap nettoie la ligne de commande.\")\
player_message(Player, \"Sauvegarde la commande '/lire' pour lire rapidement ces livres, de gauche à droite. \")\
")

y = y-4

place_setaspect(zone, 1, y, tileset..":book_a_open")
place_settag(zone, 1, y, "text", "Tu")

place_setaspect(zone, 3, y, tileset..":book_a_open")
place_settag(zone, 3, y, "text", "T'en")

place_setaspect(zone, x_mid, y, tileset..":book_a_open")
place_settag(zone, x_mid, y, "text", "Sors")

place_setaspect(zone, w-4, y, tileset..":book_a_open")
place_settag(zone, w-4, y, "text", "Très")

place_setaspect(zone, w-2, y, tileset..":book_a_open")
place_settag(zone, w-2, y, "text", "Bien !")

y = y-3

build_horizontal_wall(y)
place_setlandon(zone, x_mid, y, "\
player_message(Player, \"* * *\")\
player_message(Player, \"Il est possible d'interagir avec certains éléments de façon plus complexe.\")\
player_message(Player, \"Essaye d'/ouvrir et de /fermer ces objets.\")\
player_message(Player, \"Recherche des indices sur les commandes à travers le jeu.\")\
")

y = y-4

local selfclose_duration = 10

loadfile("build/tools/book.lua")(tileset, zone, 3, y, "close")
place_settag(zone, 3, y, "openclose_selfclose", selfclose_duration)
place_settag(zone, 3, y, "text", "Tu peux /fouiller les coffres.")

loadfile("build/tools/coffer.lua")(tileset, zone, w-4, y)
place_settag (zone, w-4, y, "openclose_selfclose", selfclose_duration)
place_settag (zone, w-4, y, "content", "Cookie!")

place_setaspect(zone, 1, y-2, tileset..":roof_lone")
place_setaspect(zone, 1, y-1, tileset..":pillar")
place_setaspect(zone, 1, y,   tileset..":pillar_bot")

place_setaspect(zone, w-2, y-2, tileset..":roof_lone")
place_setaspect(zone, w-2, y-1, tileset..":pillar")
place_setaspect(zone, w-2, y,   tileset..":pillar_bot")

y = y-3

place_setaspect(zone, x_mid-2, y,   tileset..":wall_botlft")
place_setaspect(zone, x_mid-1, y,   tileset..":bigdoor_lft")
place_setaspect(zone, x_mid,   y,   tileset..":bigdoor_closed")
place_setaspect(zone, x_mid+1, y,   tileset..":bigdoor_rgt")
place_setaspect(zone, x_mid+2, y,   tileset..":wall_botrgt")

place_setaspect(zone, x_mid-2, y-1, tileset..":wall_lft")
place_setaspect(zone, x_mid-1, y-1, tileset..":bigdoor_toplft")
place_setaspect(zone, x_mid,   y-1, tileset..":bigdoor_top")
place_setaspect(zone, x_mid+1, y-1, tileset..":bigdoor_toprgt")
place_setaspect(zone, x_mid+2, y-1, tileset..":wall_rgt")

place_setaspect(zone, x_mid-2, y-2, tileset..":roof_endlft")
place_setaspect(zone, x_mid-1, y-2, tileset..":roof_horizontal")
place_setaspect(zone, x_mid,   y-2, tileset..":roof_horizontal")
place_setaspect(zone, x_mid+1, y-2, tileset..":roof_horizontal")
place_setaspect(zone, x_mid+2, y-2, tileset..":roof_endrgt")

place_settag(zone, x_mid, y, "openclose_state", "close")
place_settag(zone, x_mid, y, "openclose_opentile", tileset..":bigdoor")
place_settag(zone, x_mid, y, "openclose_closetile", tileset..":bigdoor_closed")
place_settag(zone, x_mid, y, "openclose_selfclose", selfclose_duration)

place_setlandon(zone, x_mid, y, "player_changezone(Player, \""..lobby_zone.."\", "..lobby_x..", "..lobby_y..")")

return zone, entrance_x, entrance_y
