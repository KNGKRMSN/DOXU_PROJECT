/// @description Insert description here
// You can write your code in this editor
draw_sprite_ext(spr_SheerTrainingL, 0, x, y, 1, 1, 0, c_white, 1);

// Appliquer le masque de collision circulaire pour le dessin du personnage
draw_set_circle_precision(32); // Définir la précision du cercle pour le masque de collision
draw_circle(x, y, 242, false);