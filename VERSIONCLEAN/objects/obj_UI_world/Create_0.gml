/// @description Initialise game UI

// Inherit the parent event
event_inherited();

// System Properties
transitiontime = 6;
root_inputmode = obj_PlayerController.IM_character;
currmusic = -1;

//	Initialise Panels		

#region			Main
//		Main
//properties
var mainx = 10;
var mainy = 60;
var mainmarging = 128;
var maintexts = ["Play", "Training","Jukebox", "Story", "Options","Quit"];
var main_n = 6	;						// max buttons

//functions
main_b0func = function()
{
	if (global.UsingFMod == false)
		audio_play_sound(CantSelectSound, 1, 0);
	else
		fmod_system_play_sound(global.UI_CantSelectSound, false);
}

main_b1func = function()
{
	if (global.UsingFMod == false)
		audio_play_sound(SelectedSound, 1, 0);
	else
		fmod_system_play_sound(global.UI_SelectedSound, false);
	audio_play_sound(DRRRRSOUND, 1, 0);
	global.UI_WhereAreWe = 2;
	Open(Training);
}

main_b2func = function()
{
	Open(Jukebox);
	global.UI_WhereAreWe = 3;
	if (global.UsingFMod == false)
		audio_play_sound(SelectedSound, 1, 0);
	else
		fmod_system_play_sound(global.UI_SelectedSound, false);
	audio_play_sound(DRRRRSOUND, 1, 0);
}

main_b3func = function()
{
	if (global.UsingFMod == false)
		audio_play_sound(CantSelectSound, 1, 0);
	else
		fmod_system_play_sound(global.UI_CantSelectSound, false);
}

main_b4func = function()
{
	if (global.UsingFMod == false)
		audio_play_sound(SelectedSound, 1, 0);
	else
		fmod_system_play_sound(global.UI_SelectedSound, false);
	audio_play_sound(DRRRRSOUND, 1, 0);
	global.UI_WhereAreWe = 5;
	Open(Options);
}

main_b5func = function()
{
	QuitGame();
}

//create panel
Main = new UI_Panel([],[],seq_menuDOXU,seq_menuDOXU, noone, noone, obj_PlayerController.IM_worldUI,true);
Main.background = new UI_panel_background(spr_tile_checker, c_ltgray, 0);

//UI_Panel_add_buttons(Main,obj_button_worldmenu,main_n,mainx,mainy,,mainmarging,64,128,maintexts,[main_b0func,main_b1func,main_b2func,main_b3func, main_b4func, main_b5func]);
UI_Panel_add_buttons(Main,obj_button_spell_equip,1,233, 156,,mainmarging,64,128,
["Play"], [main_b0func]);
UI_Panel_add_buttons(Main,obj_button_worldmenu,1,154, 327,,mainmarging,64,128,
["Training"], [main_b1func]);
UI_Panel_add_buttons(Main,obj_button_worldmenu,1,233, 498,,mainmarging,64,128,
["Jukebox"], [main_b2func]);
UI_Panel_add_buttons(Main,obj_button_spell_equip,1,912, 156,,mainmarging,64,128,
["Story"], [main_b3func]);
UI_Panel_add_buttons(Main,obj_button_worldmenu,1,989, 327,,mainmarging,64,128,
["Options"], [main_b4func]);
UI_Panel_add_buttons(Main,obj_button_worldmenu,1,912, 498,,mainmarging,64,128,
["Quit"], [main_b5func]);
UI_Panel_add_tweens(Main,main_n,AnimationCurve1, tweenval_x, 192, 30, 2);

//define buttons
/*
Main.buttons[0].ini_pos = [203, 156];
Main.buttons[1].ini_pos = [124, 327];
Main.buttons[2].ini_pos = [203, 498];
Main.buttons[3].ini_pos = [882, 156];
Main.buttons[4].ini_pos = [959, 327];
Main.buttons[5].ini_pos = [882, 498];
*/
#endregion

#region			Jukebox
//		jukeboxs
//properties
var jukebox_pool = 14;
var jukeboxx = 10;
var jukeboxy = 60;
var jukeboxmarging = 128;
var jukeboxh = 56;
var jukeboxw = 224;
var jukeboxtexts = ["Kaze","Jsp","Fighting Sigg","Musique1","Musique2","Back"];
jukebox_n = 6	// max buttons

// functions
jukebox_func = function()
{
	audio_pause_sound(MusicMenuLoop);
	if (audio_get_name(currmusic) != "MusicKaze")
	{
		audio_stop_sound(currmusic);
		currmusic = audio_play_sound(MusicKaze, 1, 0);
	}
	else
	{
		audio_stop_sound(currmusic);
		audio_resume_sound(MusicMenuLoop);
	}
	
	
}
jukebox_func2 = function()
{
	audio_pause_sound(MusicMenuLoop);
	if (audio_get_name(currmusic) != "MusicSigg")
	{
		audio_stop_sound(currmusic);
		currmusic = audio_play_sound(MusicSigg, 1, 0);
	}
	else
	{
		audio_stop_sound(currmusic);
		audio_resume_sound(MusicMenuLoop);
	}
	
}
jukebox_func3 = function()
{
	audio_pause_sound(MusicMenuLoop);
	if (audio_get_name(currmusic) != "MusicJsp")
	{
		audio_stop_sound(currmusic);
		currmusic = audio_play_sound(MusicJsp, 1, 0);
	}
	else
	{
		audio_stop_sound(currmusic)
		audio_resume_sound(MusicMenuLoop);
	}
}
jukebox_func4 = function()
{
	audio_pause_sound(MusicMenuLoop);
	if (audio_get_name(currmusic) != "MusicMagellan")
	{
		audio_stop_sound(currmusic);
		currmusic = audio_play_sound(MusicMagellan, 1, 0);
	}
	else
	{
		audio_stop_sound(currmusic)
		audio_resume_sound(MusicMenuLoop);
	}
}
jukebox_func5 = function()
{
	audio_play_sound(SelectedSound, 1, 0)
}
jukebox_func6 = function()
{
	if (global.UsingFMod == false)
		audio_play_sound(BackSound, 1, 0);
	else
		fmod_system_play_sound(global.UI_BackSound, false);
	global.UI_WhereAreWe = 0;
	Back()
}

jukebox_extraupdate = function()
{
	var l = obj_game.PlayerSpellSlots;
	for (var i = 0; i < l; ++i) {
	    if (i < array_length(obj_game.PlayerEquSpells))
		{
			var _ref = obj_game.PlayerEquSpells[@ i];
			Jukebox.extra[@ i].text = global.Spells[@ _ref].spellname;
			Jukebox.extra[@ i].SwitchState(Jukebox.extra[@ i].Used);
		}
		else
		{
			Jukebox.extra[@ i].text = "...";
			Jukebox.extra[@ i].SwitchState(Jukebox.extra[@ i].Idle);
		}
	}
	
	var ll = jukebox_n;
	for (var i = 0; i < ll; ++i)
	{
		Jukebox.buttons[@ i].draw_info = false;
	}
	
	Jukebox.buttons[@ Selection].draw_info = true;
}

jukebox_info_update = function()
{
	var ll = jukebox_n;
	for (var i = 0; i < ll; ++i)
	{
		Jukebox.buttons[@ i].draw_info = false;
	}
	
	Jukebox.buttons[@ Selection].draw_info = true;
}

jukebox_funcopen = function()
{
	var pspells = 2;
	if (pspells > jukebox_n)
	{
		
		jukebox_n = pspells;	// max buttons
		
		//Associate buttons and tweens from pool to panel
		var n = jukebox_n;
		//Reset Panel
		Jukebox.buttons = [];
		Jukebox.tweens = [];
		//Set
		for (var i = 0; i < n; ++i)
		{
			// Add buttons & tweens to panel
			array_push(Jukebox.buttons, jukebox_button_pool[@ i]);
			array_push(Jukebox.tweens, jukebox_tween_pool[@ i]);
		}
	}
	
	jukebox_extraupdate();
	
	//update buttons - set equipped - unequipped
	for (var i = 0; i < pspells; ++i)
	{
		var _spellref = 2;
		var _spell = global.Spells[@ _spellref];
		var _spellname = _spell.spellname;
		Jukebox.buttons[@ i].text = _spellname;
		Jukebox.buttons[@ i].spellref = _spellref;
		Jukebox.buttons[@ i].spell = _spell;
		//cost
		var ac = GetAction(_spell, "Action_mod", targetType.SELF);
		if (ac != noone)
		{
			Jukebox.buttons[@ i].cost_value = abs(ac.val);
			Jukebox.buttons[@ i].element = ac.typ;
		}
		
		var spellcheck = 2;
		if (spellcheck != noone )
		{
			Jukebox.buttons[@ i].equip = true;
			Jukebox.buttons[@ i].SetEquip();
			
			Jukebox.buttons[@ Selection].color = Jukebox.buttons[@ Selection].colorSelect;
			Jukebox.buttons[@ Selection].text_color = Jukebox.buttons[@ Selection].text_colorSelect;
		}
	}
}

//create panel
Jukebox = new UI_Panel([],[],seq_menuDOXUJukebox2,seq_menuDOXUJukeboxOut,noone,noone,obj_PlayerController.IM_worldUI, true);
Jukebox.background = new UI_panel_background(spr_tile_checker, c_red, 1,2,0,2,2);

//	Button and Tween pools
//jukebox_button_pool = make_buttonpool(obj_button_worldmenu, jukebox_pool, jukeboxx, jukeboxy, ,jukeboxmarging, jukeboxh, jukeboxw, "", jukebox_func);
//jukebox_tween_pool = make_tweenpool(jukebox_pool,jukebox_button_pool,AnimationCurve1, tweenval_x, 160, 26, 3);

//UI_Panel_add_buttons(Jukebox,obj_button_spell_equip,5,jukeboxx,jukeboxy,,jukeboxmarging,64,128,
//jukeboxtexts, [jukebox_func, jukebox_func, jukebox_func, jukebox_func, jukebox_func]);

UI_Panel_add_buttons(Jukebox,obj_button_spell_equip,1,203, 156,,jukeboxmarging,64,128,
["Kaze"], [jukebox_func]);
UI_Panel_add_buttons(Jukebox,obj_button_spell_equip,1,124, 327,,jukeboxmarging,64,128,
["Sigg"], [jukebox_func2]);
UI_Panel_add_buttons(Jukebox,obj_button_spell_equip,1,203, 498,,jukeboxmarging,64,128,
["Jsp"], [jukebox_func3]);
UI_Panel_add_buttons(Jukebox,obj_button_spell_equip,1,882, 156,,jukeboxmarging,64,128,
["Magellan"], [jukebox_func4]);
UI_Panel_add_buttons(Jukebox,obj_button_spell_equip,1,959, 327,,jukeboxmarging,64,128,
["Decreasing"], [jukebox_func5]);
UI_Panel_add_buttons(Jukebox,obj_button_spell_equip,1,882, 498,,jukeboxmarging,64,128,
["Back"], [jukebox_func6]);
UI_Panel_add_tweens(Jukebox,jukebox_n,AnimationCurve1,tweenval_x,160,26,3);

//extra
/*
Jukebox.buttons[0].ini_pos = [203, 156];
Jukebox.buttons[1].ini_pos = [124, 327];
Jukebox.buttons[2].ini_pos = [203, 498];
Jukebox.buttons[3].ini_pos = [882, 156];
Jukebox.buttons[4].ini_pos = [959, 327];
Jukebox.buttons[5].ini_pos = [882, 498];*/
var jukebox_extrax = 1536;
/*
array_push(Jukebox.extra, instance_create_layer(jukebox_extrax, 64,"Instances", obj_extra_spellslot));
array_push(Jukebox.extra, instance_create_layer(jukebox_extrax, 128,"Instances", obj_extra_spellslot));
array_push(Jukebox.extra, instance_create_layer(jukebox_extrax, 192,"Instances", obj_extra_spellslot));
*/
#region	old
////create buttons loop
//for (var i = 0; i < n_jukeboxbut; ++i)
//{
//	// Add spell button to spell panel
//	array_push(Jukebox.buttons, createButton(jukeboxx,jukeboxy + (jukeboxmarging*(i+1)),obj_button_worldmenu,64,128,"jukebox", jukebox_func));
//}

////create tweens loop
//for (var i = 0; i < n_jukeboxbut; ++i)
//{
//	// Add tweens to panel
//	var inst = Jukebox.buttons[@ i];
//	array_push(Jukebox.tweens, new tweenjob(inst, inst.ini_pos[0], 192, AnimationCurve1, tweenval_x, 30, 4*i));
//}

////define buttons
//Jukebox.buttons[0].text = "Fire";
#endregion

#endregion

#region			Training
//		trainings
//properties
var training_pool = 14;
var trainingx = 600;
var trainingy = 400;
var trainingmarging = 128;
var trainingh = 56;
var trainingw = 224;
var trainingtexts = ["Start","Back"];
training_n = 2	// max buttons

// functions
training_func = function()
{
	if (global.UsingFMod == false)
		audio_play_sound(SelectedSound, 1, 0);
	else
		fmod_system_play_sound(global.UI_SelectedSound, false);
	Open(Controls2);
}
training_func2 = function()
{
	if (global.UsingFMod == false)
		audio_play_sound(BackSound, 1, 0);
	else
		fmod_system_play_sound(global.UI_BackSound, false);
	global.UI_WhereAreWe = 0;
	Back()
}


//create panel
Training = new UI_Panel([],[],seq_menuDOXUtraining,seq_menuDOXUtraining,noone,noone,obj_PlayerController.IM_worldUI, true);
Training.background = new UI_panel_background(spr_tile_checker, c_red, 1,2,0,2,2);

//	Button and Tween pools
//training_button_pool = make_buttonpool(obj_button_worldmenu, training_pool, trainingx, trainingy, ,trainingmarging, trainingh, trainingw, "", training_func);
//training_tween_pool = make_tweenpool(training_pool,training_button_pool,AnimationCurve1, tweenval_x, 160, 26, 3);

UI_Panel_add_buttons(Training,obj_button_spell_equip,2,trainingx,trainingy,,trainingmarging,64,128,
trainingtexts, [training_func, training_func2]);
UI_Panel_add_tweens(Training,training_n,AnimationCurve1,tweenval_x,160,26,3);

#region	old
////create buttons loop
//for (var i = 0; i < n_jukeboxbut; ++i)
//{
//	// Add spell button to spell panel
//	array_push(Jukebox.buttons, createButton(jukeboxx,jukeboxy + (jukeboxmarging*(i+1)),obj_button_worldmenu,64,128,"jukebox", jukebox_func));
//}

////create tweens loop
//for (var i = 0; i < n_jukeboxbut; ++i)
//{
//	// Add tweens to panel
//	var inst = Jukebox.buttons[@ i];
//	array_push(Jukebox.tweens, new tweenjob(inst, inst.ini_pos[0], 192, AnimationCurve1, tweenval_x, 30, 4*i));
//}

////define buttons
//Jukebox.buttons[0].text = "Fire";
#endregion

#endregion


#region			Options
//		Options
//properties
var optx = 656;
var opty = 260;
var optmarging = 128;
var opttexts = ["Display","Audio","Controls","Back"];
var opt_n = 4;						// max buttons

//functions
opt_b0func = function()
{
	if (global.UsingFMod == false)
		audio_play_sound(CantSelectSound, 1, 0);
	else
		fmod_system_play_sound(global.UI_CantSelectSound, false);
	//Open(Display);
}

opt_b1func = function()
{
	if (global.UsingFMod == false)
		audio_play_sound(SelectedSound, 1, 0);
	else
		fmod_system_play_sound(global.UI_SelectedSound, false);
	Open(Audio);
}

opt_b2func = function()
{
	if (global.UsingFMod == false)
		audio_play_sound(SelectedSound, 1, 0);
	else
		fmod_system_play_sound(global.UI_SelectedSound, false);
	Open(Controls);
}

opt_b3func = function()
{
	if (global.UsingFMod == false)
		audio_play_sound(BackSound, 1, 0);
	else
		fmod_system_play_sound(global.UI_BackSound, false);
	Back();
	global.UI_WhereAreWe = 0;
}

//create panel
Options = new UI_Panel([],[],seq_menuDOXUOptions,seq_menuDOXUOptions, noone, noone, obj_PlayerController.IM_worldUI, true);
Options.background = new UI_panel_background(spr_tile_checker, c_ltgray, 1);

UI_Panel_add_buttons(Options,obj_button_spell_equip,1,203, 156,,optmarging,64,128,
["Display"], [opt_b0func]);
UI_Panel_add_buttons(Options,obj_button_worldmenu,1,203, 498,,optmarging,64,128,
["Audio"], [opt_b1func]);
UI_Panel_add_buttons(Options,obj_button_worldmenu,1,882, 156,,optmarging,64,128,
["Controls"], [opt_b2func])
UI_Panel_add_buttons(Options,obj_button_worldmenu,1,882, 498,,optmarging,64,128,
["Back"], [opt_b3func]);

UI_Panel_add_tweens(Options,opt_n,AnimationCurve1, tweenval_x, 192, 30, 2);

//define buttons
//Opt.buttons[2].fscale -= 0.04;
//Opt.buttons[3].fscale = 0.42;
#endregion

#region			Audio
//		Audio
//properties
var audiox = 256;
var audioy = 160;
var audiotexts = ["Master","Music","SFX"];
var audio_h = 128;
var audio_w = 256;
var audiomarging = audio_h + 6;
var audio_n = 3;
sliderinst = undefined;

//functions
audio_b0func = function()
{
	//sliderinst = Audio.buttons[@ Selection];
	obj_PlayerController.inputmode = obj_PlayerController.IM_slider;
	//Open(Slider);
}

audio_funcopen = function()
{
	var l = array_length(Audio.buttons);
	
	for (var i = 0; i < l; ++i) {
	    Audio.buttons[@ i].sld_getmethod();
	}
	//Audio.buttons
	//obj_slider.sld_getmethod();
	//obj_slider_group.sld_getmethod();
	//obj_slider_group.sld_getmethod();
}

//create panel
Audio = new UI_Panel([],[],seq_menu, seq_menu, audio_funcopen, noone, obj_PlayerController.IM_worldUI, false);
Audio.background = new UI_panel_background(spr_tile_checker, c_ltgray, 1);

UI_Panel_add_buttons(Audio,[obj_slider_master, obj_slider_group, obj_slider_group] ,audio_n ,audiox ,audioy,,audiomarging,audio_h,audio_w,audiotexts,[audio_b0func, audio_b0func,audio_b0func]);
UI_Panel_add_tweens(Audio,audio_n,AnimationCurve1, tweenval_x, 192, 30, 2);

Audio.buttons[@ 1].sld_group = [Musicgroup];
Audio.buttons[@ 2].sld_group = [SFXgroup];

#endregion

#region			Slider
//		Slider
//properties
var sliderx = 256;
var slidery = 160;
var slidertexts = ["-","-","-"];
var slider_h = 128;
var slider_w = 256;
var slidermarging = slider_h + 6;
var slider_n = 0;						// max buttons

//functions
slider_b0func = function()
{
	//open slider (selection)
}

//create panel
Slider = new UI_Panel([],[],noone,noone, noone, noone, obj_PlayerController.IM_slider, false);
Slider.background = new UI_panel_background(spr_tile_checker, c_ltgray, 1);

UI_Panel_add_buttons(Slider,obj_button_worldmenu,slider_n,sliderx,slidery,,slidermarging,slider_h,slider_w,slidertexts,[slider_b0func, slider_b0func,slider_b0func]);
UI_Panel_add_tweens(Slider,slider_n,AnimationCurve1, tweenval_x, 192, 30, 2);

#endregion

#region			Display



#endregion

#region			Controls

controls_b0func = function()
{
	if (global.UsingFMod == false)
		audio_play_sound(BackSound, 1, 0);
	else
		fmod_system_play_sound(global.UI_BackSound, false);
	Back();
}

Controls = new UI_Panel([],[],seq_menuDOXUControls,seq_menuDOXUControls, noone, noone, obj_PlayerController.IM_worldUI, true);
Controls.background = new UI_panel_background(spr_tile_checker, c_ltgray, 1);

UI_Panel_add_buttons(Controls,obj_button_spell_equip,1,1000,600,,,64,128,
["Back"], [controls_b0func]);
UI_Panel_add_tweens(Controls,1,AnimationCurve1, tweenval_x, 192, 30, 2);
#endregion

#region			Controls2

controls2_b0func = function()
{
	if (global.UsingFMod == false)
		audio_play_sound(SelectedSound, 1, 0);
	else
		fmod_system_play_sound(global.UI_SelectedSound, false);
	if (alarm[3] == -1)
		alarm[3] = room_speed;
	Close();
}

Controls2 = new UI_Panel([],[],seq_menuDOXUControls,seq_menuDOXUControls, noone, noone, obj_PlayerController.IM_worldUI, true);
Controls2.background = new UI_panel_background(spr_tile_checker, c_ltgray, 1);

UI_Panel_add_buttons(Controls2,obj_button_spell_equip,1,1000,600,,,64,128,
["Start"], [controls2_b0func]);
UI_Panel_add_tweens(Controls2,1,AnimationCurve1, tweenval_x, 192, 30, 2);
#endregion

///	Other Stuff
//Reset Data
ResetDat = function()
{
	obj_game.ResetSaveData();
	Back();
	obj_PlayerController.curr_inputmode = inputmode.character;
	// Audio
	//var _snd = audio_play_sound(snd_save,1,false);
	//audio_sound_pitch(_snd, 0.4);
	
	obj_game.b_loading = true;
	obj_game.LoadData();
}

//Reset Data
QuitGame = function()
{
	game_end();
}

/// Settings

// Setup data