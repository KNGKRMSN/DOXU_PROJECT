/// @description Insert description here
draw_set_font(ButtonPolice);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

_xx = x +(Width/2);
_xr = Width/sprite_width;
_yr = Height/sprite_height;

//FL = window_get_fullscreen();
fscale = 0.5
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

draw_sprite_ext(sprite_index,0,x,y,_xr,_yr,0,color,alpha);

//	DRAW text
draw_set_color(text_color);
var tscale = text_scale * fscale;
draw_text_transformed(_xx,y+(Height/2),text,tscale, tscale,0);

draw_set_font(-1);