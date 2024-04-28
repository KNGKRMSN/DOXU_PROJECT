// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function createButton(_x,_y,_obj,_height,_width,_text,_func)
{
	var inst = instance_create_layer(_x,_y,"Instances",_obj);
	inst.Height = _height;
	inst.Width = _width;
	inst.ini_sca[@ 0] = _height;
	inst.ini_sca[@ 1] = _width;
	inst.text = _text;
	inst.func = _func;
	inst.ini_pos[@ 0] = _x;
	inst.ini_pos[@ 1] = _y;

	//inst.animSelect = [];
	//array_push(inst.animSelect, new tweenjob(inst, _height, _height * 1.25, AC_overshoot, tweenval_h,12));
	//array_push(inst.animSelect, new tweenjob(inst, _width, _width * 1.25, AC_overshoot, tweenval_w,12));
						
	inst.animSelect = [ new tweenjob(inst, _height, _height * 1.25, AC_overshoot, tweenval_h,12),
						new tweenjob(inst, _width, _width * 1.25, AC_overshoot, tweenval_w,12)];
	
	inst.visible = 0;
	return inst;
}

function createButtonMain(_x,_y,_obj,_height,_width,_text,_func,_comm_spr)
{
	var inst = instance_create_layer(_x,_y,"Instances",_obj);
	inst.Height = _height;
	inst.Width = _width;
	inst.text = _text;
	inst.func = _func;
	inst.comm_spr = _comm_spr;
	
	inst.visible = 0;
	return inst;
}