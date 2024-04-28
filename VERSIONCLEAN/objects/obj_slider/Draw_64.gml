/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

var n = 1/sld_gap;
var _d = 64 + 8;
var _of = 264;

for (var i = 0; i < n; ++i) {
	var img = 1;
	if (i/n >= sld_val) img = 0;
    draw_sprite_ext(spr_slider, img, x + _of + (_d*i), y + (Height/2), 1, 1, 0, color ,1);
}

if (State == Pressed)
{
	var _xof = 64;
	draw_sprite_ext(spr_smtriangle, 0, x, y + (Height/2), 1, 1, 90, color ,1);
	draw_sprite_ext(spr_smtriangle, 0, x + _of + _d*n + _xof, y + (Height/2), 1, 1, 270, color ,1);
}

