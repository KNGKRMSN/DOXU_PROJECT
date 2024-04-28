/// @description Initialise
Height = 64;
Width = 256;

State = 0;
ini_pos = [0,0];
ini_sca = [0,0];

animUsed = [];

//text
text = "...";
text_colorIdle = c_black;
text_colorUsed = c_white;
text_color = text_colorIdle;
text_scale_idle = 1.8;
text_scale_used = 2;
text_scale = text_scale_idle;

colorIdle = c_ltgray;
colorUsed = c_dkgray;
color = colorIdle;
alpha = 1;
Flip = false;

//extra
spellref = noone;

Idle = function()
{
	color = colorIdle;
	text_color = text_colorIdle;
	text_scale = text_scale_idle;
	sprite_index = spr_butt_spell;
	//Height = ini_sca[@ 0];
	//Width = ini_sca[@ 1];
	var _l = array_length(animUsed);
	for (var i = 0; i < _l; ++i) {
		obj_tweener.RemoveJob(animSelect[@ i]);
	}
}

Used = function()
{
	sprite_index = spr_button_base;
	color = colorUsed;
	text_color = text_colorUsed;
	text_scale = text_scale_used;
	var _l = array_length(animUsed);
	for (var i = 0; i < _l; ++i) {
	    obj_tweener.ResetTween(animUsed[@ i]);
		obj_tweener.AddJob(animUsed[@ i]);
	}
}

function SwitchState(_newstate)
{
	State = _newstate;
	State();
}

//Set
State = Idle;