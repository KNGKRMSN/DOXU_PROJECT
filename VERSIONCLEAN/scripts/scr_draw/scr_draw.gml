// Draw functions
function scr_draw_text_center(_x,_y,_width,_height,_text,_scale,_col = c_white,_alpha = 1)
{
	draw_text_transformed_color(_x + _width/2,_y + _height/2,_text,_scale,_scale,0,_col,_col,_col,_col,_alpha);
}


function scr_draw_sprite_center(_x,_y,_width,_height,_sprite,_scale,_color,_alpha)
{
	var _w = sprite_get_width(_sprite) * _scale;
	var _h = sprite_get_height(_sprite) * _scale;
	draw_sprite_stretched_ext(_sprite,0,_x + _width/2 - _w/2, _y + _height/2 - _h/2,_w,_h,_color,_alpha)
}