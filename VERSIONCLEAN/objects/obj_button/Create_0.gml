/// @description Initialise
Height = 100;
Width = 100;
halign = fa_center;
valign = fa_middle;

State = 0;
ini_pos = [0,0];
ini_sca = [0,0];

animSelect = [];
animPress = 0;
animDisable = 0;
func = undefined;
//text
fscale = 0.5;
text = "button";
text_colorBase = c_black;
text_colorSelect = c_white;
text_colorPress = c_black;
text_colorDisable = c_dkgray;
text_color = c_gray;
text_scale_idle = 1;
text_scale_select = 1.2;
text_scale = text_scale_idle;
text_xoffset = 0;
text_yoffset = 0;
text_angle = 0;

colorBase = c_ltgray;
colorSelect = c_dkgray;
colorPress = c_red;
colorDisable = c_dkgray;
color = colorBase;
alpha = 1;
alphaIdle = 1;
alphaPress = 1;
alphaSelect = 1;
alphaDisable = 0.4;
Flip = false;

rotation = 0;

Idle = function()
{
	color = colorBase;
	text_color = text_colorBase;
	text_scale = text_scale_idle;
	//Scale
	Height = ini_sca[@ 0];
	Width = ini_sca[@ 1];
	//Position
	x = ini_pos[@ 0];
	y = ini_pos[@ 1];
	//Alpha
	alpha = alphaIdle;
	
	var _l = array_length(animSelect);
	for (var i = 0; i < _l; ++i) {
		obj_tweener.RemoveJob(animSelect[@ i]);
	}
}

Selected = function()
{
	color = colorSelect;
	text_color = text_colorSelect;
	text_scale = text_scale_select;
	//Alpha
	alpha = alphaSelect;
	
	var _l = array_length(animSelect);
	for (var i = 0; i < _l; ++i) {
	    obj_tweener.ResetTween(animSelect[@ i]);
		obj_tweener.AddJob(animSelect[@ i]);
	}
}

Pressed = function()
{
	color = colorPress;
	text_color = text_colorPress;
	//Alpha
	alpha = alphaPress;
	
	var _w = Width;
	var _h = Height;
	Width = _w + 42;
	Height = _h - 24;
}

Disabled = function()
{
	color = colorDisable;
	text_color = text_colorDisable;
	text_scale = text_scale_idle;
	//Alpha
	alpha = alphaDisable;
}

function SwitchState(_newstate)
{
	State = _newstate;
	State();
}

//Set
State = Idle;