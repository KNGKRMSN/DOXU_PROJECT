// UI V.2

// Core

function UI_Panel (_buttons,_tweens,_animopen,_animclose,_updateopen = noone,_updateclose = noone,_inputmode,_memoriseselection = false,_background,_extra = []) constructor{
	buttons = _buttons;
	tweens = _tweens;
	animclose = _animclose;
	animopen = _animopen;
	funcopen = _updateopen;
	funcclose = _updateclose;
	funcpostopen = undefined;
	memoriseselection = _memoriseselection;
	saveselection = 0;
	inputmode = _inputmode;
	background = _background;
	extra = _extra;
}

function UI_Panel_add_buttons (_panel, _button, _n_buttons, _x, _y, _marging_x = 0, _marging_y = 0, _h, _w, _texts, _functions)
{
	//create buttons loop
	for (var i = 0; i < _n_buttons; ++i)
	{
		if (is_array(_button))
		{
			array_push(_panel.buttons, createButton(_x + (_marging_x*(i)), _y + (_marging_y*(i)), _button[i], _h, _w, _texts[@ i], _functions[@ i]));
		}
		else
		{
			// Add spell button to panel
			array_push(_panel.buttons, createButton(_x + (_marging_x*(i)), _y + (_marging_y*(i)), _button, _h, _w, _texts[@ i], _functions[@ i]));
		}
	}
}

function UI_Panel_add_tweens (_panel, _n_buttons, _tweencurve, _tweenscript, _end, _time, _delay)
{
	//create tweens loop
	for (var i = 0; i < _n_buttons; ++i)
	{
		// Add tweens to panel
		var inst = _panel.buttons[@ i];
		array_push(_panel.tweens, new tweenjob(inst, inst.ini_pos[0], _end, _tweencurve, _tweenscript, _time, _delay*i));
	}
}

function UI_Panel_set_button_position (_button, _x = _button.x, _y = _button.y)
{
	_button.ini_pos[@ 0] = _x;
	_button.ini_pos[@ 1] = _y;
	_button.x = _x;
	_button.y = _y;
}

function UI_Panel_associate (_panel, _buttonpool, _tweenpool, _ncheck)
{
	//Associate buttons and tweens from pool to panel
	var n = _ncheck;
	//Reset Panel
	_panel.buttons = [];
	_panel.tweens = [];
	//Set
	for (var i = 0; i < n; ++i)
	{
		// Add buttons & tweens to panel
		array_push(_panel.buttons, _buttonpool[@ i]);
		array_push(_panel.tweens, _tweenpool[@ i]);
	}
}

function UI_Panel_add_functions(_panel, _postopenfunction)
{
	_panel.funcpostopen = _postopenfunction;
}


// panel background
function UI_panel_background (_sprite,_colorblend,_alpha,_hspeed = 0,_vspeed = 0, _xscale = 1, _yscale = 1) constructor
{
	sprite = _sprite;
	blend = _colorblend;
	alpha = _alpha;
	hspd = _hspeed;
	vspd = _vspeed;
	xscale = _xscale;
	yscale = _yscale;
}

#region	Pool
// Pool functions

function make_buttonpool(_button, _n, _x, _y, _marging_x = 0, _marging_y = 0, _h, _w, _text, _function)
{
	var pool = [];
	//create buttons loop
	for (var i = 0; i < _n; ++i)
	{
	// Add spell button to spell panel
		array_push(pool, createButton(_x + (_marging_x*(i)), _y + (_marging_y*(i)), _button, _h, _w, _text, _function));
	}
	
	return pool;
}

function make_tweenpool(_n, _buttonpool, _tweencurve, _tweenscript, _end, _time, _delay)
{
	var pool = [];
	
	//create tweens loop
	for (var i = 0; i < _n; ++i)
	{
		// Add tweens to panel
		var inst = _buttonpool[@ i];
		array_push(pool, new tweenjob(inst, inst.ini_pos[0], _end, _tweencurve, _tweenscript, _time, _delay*i));
	}
	
	return pool;
}

#endregion


// Tween & Ease
function tweenjob(_inst,_start,_end,_curve_asset,_valscript,_time,_delay = 0) constructor
{
	inst = _inst;
	start_value = _start;
	end_value = _end;
	percent = 0;
	curve_asset = _curve_asset;
	valscript = _valscript;
	time = _time;
	delay = _delay;
	delay_reset = _delay;
}

function tweenval_x(_inst,_start,_distance,_position)
{
	_inst.x = _start + (_distance * _position);
}

function tweenval_y(_inst,_start,_distance,_position)
{
	_inst.y = _start + (_distance * _position);
}

function tweenval_w(_inst,_start,_distance,_position)
{
	_inst.Width = _start + (_distance * _position);
}

function tweenval_h(_inst,_start,_distance,_position)
{
	_inst.Height = _start + (_distance * _position);
}
