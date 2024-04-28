/// @description Insert description here
draw_set_font(ButtonPolice);
draw_set_halign(halign);
draw_set_valign(valign);

_xx = x +(Width/2);
_xr = Width/sprite_width;
_yr = Height/sprite_height;

//FL = window_get_fullscreen();
//if (FL == true)
//{
//	fscale = 0.46;
//}

//	draw with FLIP
if (Flip == true)
{
	_xx = x -(Width/2);
	_xr = - Width/sprite_width;
}

if (sprite_index != noone)
{
	draw_sprite_ext(sprite_index,0,x,y,_xr,_yr, rotation,color,alpha);
}

//	DRAW text
draw_set_color(text_color);
//var _s = 12;
var tscale = text_scale * fscale;
//if (_s * string_length(text) > Width)
//{
//	tscale -= 0.12;
//}
draw_text_transformed(_xx + text_xoffset, y+(Height/2)+ text_yoffset,text,tscale, tscale, text_angle);

draw_set_font(-1);