/// @description Insérez la description ici
// Vous pouvez écrire votre code dans cet éditeur
draw_self();
draw_set_font(ButtonPolice);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_alpha(1);
draw_text(x, y, Button_text);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
col = #FF0000;
draw_set_color(col);
