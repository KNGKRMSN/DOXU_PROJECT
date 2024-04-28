/// @description
// Inherit the parent event
event_inherited();

var dis_x = display_get_gui_width();
var dis_y = display_get_gui_height();

if (draw_info == true)
{
	// info box values
	var _h = 192;
	var _w = 320;
	var infx = (dis_x/4) *3.2;
	var infy = (dis_y/4) *3;
	
	//	draw info box
	draw_set_font(fnt_base);
	draw_set_color(c_black);
	draw_rectangle(infx - _w, infy, infx + _w, infy + _h, 0);
	draw_set_color(c_white);
	draw_rectangle(infx- _w,infy,infx + _w,infy+ _h,1);
	draw_text_ext_transformed(infx + _w/12,infy +_h/4,spell.info,64,896,0.6,0.6,0);
		
	// DRAW COST
	var _cc = abs(cost_value);
	
	if (_cc > 0)
	{
		draw_text_ext_transformed(infx - _w/4, infy + _h - _h/4,"cost: " + string(_cc),64,896,0.6,0.6,0);
			
		var _sca = 0.6;
		var _string = element ? "SPIRIT" : "FLESH" ;
		//var _spr = element ? spr_spirit_cost : spr_flesh_cost ;
		var _col = element ? c_sp : c_fl ;
		draw_set_color(_col);
		draw_text_ext_transformed(infx + _w/4,infy +_h - _h/4 , _string, 64, 896, _sca, _sca, 0);
		draw_set_color(c_white);
		//draw_sprite_ext(_spr,0,infx + _w/3,infy +_h - _h/4 - (sprite_get_height(_spr)/4 * _sca), _sca, _sca, 0,_col,1);
	}
}

// Draw cost
//if ( buttype != noone)
//{
	
//}

// Draw Value
//var _spr = effect_type ? spr_spirit : spr_flesh;
//scr_draw_sprite_center(x+Width+cost_width,y,effect_width,Height,_spr,_sprsca,c_white,_alpha);
//scr_draw_text_center(x+Width+cost_width,y,effect_width,Height,effect_value,_tsca);