/// @description Insert description here
// You can write your code in this editor
owner = -1;
state = 1;
xscale = 0;
yscale = 0;
movespeed = -400;
image_xscale = xscale;
image_yscale = yscale;
speed = 0;
hitbox = -1;
index = 0;
startx = 0;
starty = 0;
anglegoalx = 0;
anglegoaly = 0;
max_turn = 8;
opponent = -1;
magnitude = 40;

var A1_x = -360;
var A1_y = -550;
var A2_x = 360;
var A2_y = -200;

// Calcul de la distance totale entre A1 et A2
var distance_totale = point_distance(A1_x, A1_y, A2_x, A2_y);

// Diviser la distance totale en trois segments égaux
var segment_length = distance_totale / 3;

// Calculer les coordonnées des deux points intermédiaires
var point_intermediaire1_x = lerp(A1_x, A2_x, segment_length / distance_totale);
var point_intermediaire1_y = lerp(A1_y, A2_y, segment_length / distance_totale);

var point_intermediaire2_x = lerp(A1_x, A2_x, (2 * segment_length) / distance_totale);
var point_intermediaire2_y = lerp(A1_y, A2_y, (2 * segment_length) / distance_totale);








