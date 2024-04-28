/// @description
// Inherit the parent event
var dis_x = display_get_gui_width();
var dis_y = display_get_gui_height();

_xr = Width/sprite_width;
_yr = Height/sprite_height;

// Outline
if (State == Selected)
{
	// Draw selected outline
	var _nyr = _yr + 0.1;
	var _nxr = _xr + 0.014;
	draw_sprite_ext(sprite_index, 0, x, y-4, _nxr, _nyr, rotation, outline_col, 0.9);
}

event_inherited();

//	parameters
var _tsca = 0.8;
var _sprsca = 0.3;
var _alpha = 0.8;
draw_set_font(fnt_base);
draw_set_color(c_white);

//	On Select Button
if (State == Selected)
{	
	draw_set_alpha(1);
	_alpha = 1;

	if (draw_info == true)
	{
		draw_set_halign(fa_center);
		// info box values
		var _h = 192;
		var _w = 320;
		var infx = (dis_x * 0.2);
		var infy = (dis_y * 0.75);
		var tsca = 0.7;
	
		//	draw info box
		draw_set_font(fnt_base);
		draw_set_color(c_black);
		draw_rectangle(infx - _w, infy, infx + _w, infy + _h, 0);
		draw_set_color(c_white);
		draw_rectangle(infx- _w, infy, infx + _w,infy+ _h,1);
		draw_text_ext_transformed(infx + _w/12,infy +_h/4, spell.info, 64, 896, tsca, tsca,0);
		
		// DRAW COST
		var _cc = abs(cost_value);
	
		if (_cc > 0)
		{
			//draw_set_halign(fa_left);
			draw_text_ext_transformed(infx - _w/2, infy + _h - _h/4,"cost: " + string(_cc), 64, 896, tsca, tsca,0);
			
			var _sca = 0.7;
			var _string = buttype ? "SPIRIT" : "FLESH" ;
			//var _col = buttype ? c_sp : c_fl ;
			var _col = c_white;
			draw_set_color(_col);
			draw_text_ext_transformed(infx - _w/10, infy +_h - _h/4 , _string, 64, 456, _sca, _sca, 0);
			draw_set_color(c_white);
			//draw_set_halign(fa_middle);
			//var _sca = 0.3;
			//var _spr = buttype ? spr_spirit_cost : spr_flesh_cost ;
			//var _col = buttype ? c_sp : c_fl ;
			//draw_sprite_ext(_spr,0,infx + _w/3,infy +_h - _h/4 - (sprite_get_height(_spr)/4 * _sca), _sca, _sca, 0,_col,1);
		}
	
		#region	draw effect
	
		//var _val = abs(effect_value);
		//if (_val > 0)
		//{
		//	var _sca = 0.3;
		//	var _spr = effect_type ? spr_spirit_dmg : spr_flesh_dmg ;
		//	draw_sprite_ext(_spr,0,dis_x/2 - _w/1.2,dis_y/8+_h/4,_sca,_sca,0,c_white,1);
		//	draw_text_ext_transformed(dis_x/2 - _w/1.1,dis_y/8+_h/4,_val,32,128,0.34,0.34,0);
		//}
	
		#endregion
	
		#region	draw target
		//Draw target
		//var _spr = spr_target;
		//var _len = 1;
		//var _sca = 0.15;

		//switch (selectionType) {
		//    case targetType.SNGL:
		//        _len = 1;
		//        break;
		//	case targetType.MASS:
		//        _len = 3;
		//        break;
		//	case targetType.DUO:
		//        _len = 2;
		//        break;
		//    default:
		//        // code here
		//        break;
		//}
		//var _space = 9;
		//for (var i = 0; i < _len; ++i) {
		//	draw_sprite_ext(_spr,0,dis_x/2 - _w/1.28 + (_space*i),dis_y/8+_h/4,_sca,_sca,0,c_white,1);
		//	//draw_sprite_ext(_spr,0,x+Width+cost_width/4,y + (_space*i),_sca,_sca,0,c_white,1);
		//}
	
		#endregion
	}
	draw_set_halign(fa_left);
}

//draw_rectangle(x,y,x+128,y+128,false);

//Draw cost
//parameters
//var _spell = global.Spells[obj_game.PlayerEquSpells[@ butspell]];
//var _actions = _spell.actionsArray;
//var _actlen = array_length(_actions);
//var _margin = 10;
//var tot_w = cost_width -_margin;
//var _sca = 1;
//var _sprsize = 12;
//var _tsca = 0.5;
//var _sprsca = 0.3;
//var _alpha = 0.5;
//draw_set_font(fnt_base);
//draw_set_color(c_white);
//effect on player - COST
//draw rect
//draw_set_color(c_black);
//draw_rectangle(x+Width,y,x+Width+cost_width,y+Height,0);
//draw_set_color(c_white);

// Draw Effect
if ( buttype != noone)
{
	var sca = 1;
	var _rot = 2;
	if (State == Selected) sca = 1.2; _tsca = 1.6; var _rot = 6;
	var _spr = spr_efbreak;
	if (selectionType == targetType.MASS)
	{
		_spr = spr_efbreak;
	}
	var _col = effect_type ? c_sp : c_fl;
	if (State == Idle) _col = c_ltgray;
	
	//if (selectionType == targetType.MASS)
	//{
	//	draw_sprite_ext(_spr, 0, x +6, y +16, - sca, - sca, -6, _col, _alpha);
	//	draw_sprite_ext(_spr, 0, x +18, y +16, - sca, - sca, -6, _col, _alpha);
	//	draw_sprite_ext(_spr, 0, x +30, y +16, - sca, - sca, -6, _col, _alpha);
	//}
	//else draw_sprite_ext(_spr, 0, x +6, y +16, - sca, - sca, -6, _col, _alpha);
	draw_sprite_ext(_spr, 0, _xx + effect_width +16, y+12, sca, sca, 0, _col, _alpha);
	//black outline
	draw_text_transformed_color(_xx + effect_width-1, y+16, abs(effect_value), _tsca+0.3, _tsca+0.2, _rot,c_black,c_black,c_black,c_black,_alpha);
	//text
	draw_text_transformed_color(_xx + effect_width, y+16, abs(effect_value), _tsca, _tsca, _rot,c_white,c_white,c_white,c_white,_alpha);
	//scr_draw_text_center(_xx + effect_width, y, effect_width, Height, abs(effect_value), _tsca, c_white , _alpha);
	
	//scr_draw_sprite_center(_xx + cost_width + 32, y, cost_width, Height, _spr, _sprsca/1.15, _col, _alpha); ???
}

// Draw COST
var _val = abs(cost_value);
if (_val > 0)
{
	var ttsca = 0.8;
	var sca = 0.36;
	var xoff = 48;
	if (State == Selected)
	{
		sca = 0.52;
		ttsca = 1.4;
		var xoff = 80;
	}
	
	var _spr = buttype ? spr_cost_spirit : spr_cost_flesh;
	var _col = buttype ? c_fl : c_sp;
	//var _spr = buttype ? spr_cost_flesh : spr_cost_spirit;
	//var _col = buttype ? c_fl : c_sp;
	if (State == Idle) _col = c_ltgray; xoff = 32;
	scr_draw_sprite_center(x + cost_width + xoff + 12, y -18, cost_width, Height, _spr, sca, _col, _alpha);
	//draw_text_transformed_color(_xx + cost_width, y , _val, _tsca, _tsca, 0, _col,_col,_col,_col,_alpha);
	scr_draw_text_center(x + cost_width + xoff -64, y -12, cost_width, Height, _val, ttsca, _col, _alpha);
}

#region
//for (var i = 0; i < _actlen; ++i)
//{
//	var _action = _actions[i];
//	if (_action.actionmethod == obj_ActionData.ModValue && _action.targ == targetType.SELF)
//	{
//		cost = true;
		
//		for (var n = 0; n < abs(_action.val); ++n)
//		{
//			var _x = tot_w/(abs(_action.val)+1);
			
//			if (_action.typ > 0)
//			{
//				//draw_sprite_ext(spr_circle_sp,0,x+Width+_margin/2+(_x *n+1),y+Height/2,_sca,_sca,0,c_white,1);
//				draw_sprite_ext(spr_circle_sp,0,x+_margin/2+Width+_x*(n+1) - _sprsize/2,y+Height/2 - _sprsize/2,_sca,_sca,0,c_white,1);
//			}
//			else
//			{
//				draw_sprite_ext(spr_circle_fl,0,x+_margin/2+Width+_x*(n+1) - _sprsize/2,y+Height/2 - _sprsize/2,_sca,_sca,0,c_white,1);
//			}
//		}
//	}
//}
#endregion

#region	draw effect - COST test
	
	//var _val = abs(cost_value);
	//if (_val > 0)
	//{
	//	var _sca = 0.5;
	//	var _spr = effect_type ? spr_cost_spirit : spr_cost_flesh;
	//	var _col = effect_type ? c_sp : c_fl;
		
	//	draw_sprite_ext(_spr,0,_xx - effect_width, y+20, _sca, _sca, 0, c_white, 1);
	//	draw_text_ext_transformed_color(_xx - effect_width,y+18,_val,32,128,0.45,0.45,0,c_black,c_black,c_black,c_black,1);
	//}
	
#endregion


// Draw Effect Value
//var _spr = effect_type ? spr_spirit_dmg : spr_flesh_dmg;
//var _scale = _sprsca/2;
//var _len = abs(effect_value);
//var _space = 18;

//for (var i = 0; i < _len; ++i) {
//	scr_draw_sprite_center(x+Width+cost_width + target_width + (_space*i),y,effect_width,Height,_spr,_scale,c_white,1);
//}


//scr_draw_sprite_center(x+Width+cost_width,y,effect_width,Height,_spr,_sprsca,c_white,_alpha);
//scr_draw_text_center(x+Width+cost_width,y,effect_width,Height,effect_value,_tsca);

//var _actlen = array_length(spell.actionsArray);

//for (var i = 0; i < _actlen; ++i)
//{
//	var _action = _actions[i];
//	if (_action.actionmethod == obj_ActionData.ModValue && _action.targ != targetType.SELF)
//	{
//		for (var n = 0; n < abs(_action.val); ++n)
//		{
//			scr_draw_sprite_center(x-effect_width,y,effect_width,Height,_spr,_scale,c_white,_alpha);
//		}
//	}
//}

//draw text
draw_set_font(-1);

//var t_height = 20;
//draw_text(x+Width/2,y-t_height,"Spell");

// Cost
//var _spr = buttype ? spr_spirit : spr_flesh;
//scr_draw_sprite_center(x+Width,y-t_height - Height/2,cost_width,Height,_spr,_sprsca,c_white,_alpha);
//draw_text(x+Width+cost_width/2,y-t_height,"Cost");
//draw_text(x+Width+cost_width+effect_width/2,y-t_height,"Effect");