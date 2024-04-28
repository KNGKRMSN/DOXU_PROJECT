/// @description Insert description here

// Inherit the parent event
event_inherited();

//Gui size on screen
var dis_x = display_get_gui_width();
var dis_y = 1080;

// System Properties
transitiontime = 6;
root_inputmode = obj_PlayerController.IM_transition;

//	Initialise Panels
//	Main
var main_n = 2;
var mainx = (dis_x/3 *2); // - dis_x/40;
var mainy = dis_y/10 * 9.8;		//initial spacing
var mainend = mainy/10 * 8.8 ;		//final spacing
var mainh = 96;
var mainw = 144;
var mainmarging = 192;
var maintext = ["Power","jukeboxs","Special"];

Main_func0 = function()
{
	//Set jukebox
	var _spellref = POWER.spear;
	obj_battlemanager.SetPlayerPower(_spellref);
	obj_battlemanager.TargetType = global.Powers[_spellref].targ_typ;
	obj_battlemanager.spelllifeselectamount = CountAbs();
	
	//obj_UI_target.Main_selectswitch();
	
	Open(Target);
}

Main_func1 = function()
{
	Open(jukebox);
}

Main_func2 = function()
{
	Open(Special);
}

Main_funcopen = function()
{
	// please change this later into proper state machine
	obj_EncounterPlayer.jukeboxp = false;
	obj_Monster.focus = -1;
	//Set heart "state" to Normal
	obj_EncounterPlayer.StateNormal();
	//obj_UI_target.Main_deactivatelifeselect();
}

Main = new UI_Panel([],[], seq_enc_main, noone,,,obj_PlayerController.IM_encountermain,,noone,[]);
UI_Panel_add_buttons(Main, obj_button_encmain,main_n, mainx, mainy, mainmarging,, mainh, mainw, maintext,[Main_func0,Main_func1,Main_func2]);
UI_Panel_add_tweens(Main, main_n, AnimationCurve1, tweenval_y, mainend, 10, 0);

Main.funcopen = Main_funcopen;

// Buttons

// Remove Selected animation to make "selection" not visible
for (var i = 0; i < array_length(Main.buttons); ++i) {
    Main.buttons[@ i].animSelect = [];
}

// Set command sprites
//	set if powerbutton is activated
var haspower = global.GameFlags[@ Act.const, 6];
if (haspower == true)
{
	Main.buttons[@ 0].comm_spr = spr_button_square;
	Main.buttons[@ 0].usable = true;
}
else
{
	//Main.buttons[@ 0].text = "";
	Main.buttons[@ 0].colorBase = c_dkgray;
	Main.buttons[@ 0].colorSelect = c_dkgray;
	Main.buttons[@ 0].usable = false;
	Main.buttons[@ 0].comm_spr = spr_button_square;
}
Main.buttons[@ 1].comm_spr = spr_button_x;
//Main.buttons[@ 2].comm_spr = spr_button_x;


///		jukebox
var jukebox_pool = 6;
jukebox_n = array_length(obj_game.PlayerEquSpells);
var jukeboxx = (dis_x);
var jukeboxx_end = (dis_x/3 *2) - dis_x/11 ;
var jukeboxy = mainy/10 * 7.84;
var jukeboxh = 44 *1.6;
var jukeboxw = 576;
var jukeboxmarging = 48 *1.5;

//	Panel
jukebox = new UI_Panel([],[], seq_enc_jukebox, noone, , ,obj_PlayerController.IM_encounter, true, noone,[]);

//Functions
jukebox_func0 = function()
{
	//Set jukebox
	var _spellref = jukebox.buttons[@ Selection].spellref;
	obj_battlemanager.SetPlayerSpell(_spellref);
	obj_battlemanager.TargetType = jukebox.buttons[@ Selection].selectionType;
	//obj_battlemanager.spelllifeselectamount = abs(jukebox.buttons[@ Selection].effect_value);
	//obj_battlemanager.spelllifeselectamount = 0;
	//obj_battlemanager.spelllifeselectamount = abs(jukebox.buttons[@ Selection].effect_value);
	
	//Open Target
	Open(Target);
}

jukebox_targetupdate = function()
{
	//Set select type
	obj_battlemanager.TargetType = jukebox.buttons[@ Selection].selectionType;
	obj_battlemanager.spelllifeselectamount = abs(jukebox.buttons[@ Selection].effect_value);
	obj_battlemanager.AtkType = jukebox.buttons[@ Selection].effect_type;
		
	// set UI focus side
	obj_EncounterPlayer.focus = jukebox.buttons[@ Selection].buttype; //? 0 : 1;
	obj_Monster.focus = jukebox.buttons[@ Selection].effect_type;
	
	var btype = jukebox.buttons[@ Selection].buttype;
	var _cvalue = jukebox.buttons[@ Selection].cost_value;
	var _cost = ( btype ? _cvalue : -_cvalue); //? 0 : 1;
	obj_EncounterPlayer.SetCostHighlight(_cost);
	obj_EncounterPlayer.SetColorHighlight(_cost, btype);
	
	obj_EncounterPlayer.jukeboxp = true;
	obj_EncounterPlayer.jukeboxp_side = btype;// ? 0 : 1;
	//obj_balance.sel_spellcost = jukebox.buttons[@ Selection].cost_value;
}

//	Button and Tween pools
jukebox_button_pool = make_buttonpool(obj_button_spell, jukebox_pool, jukeboxx, jukeboxy, ,jukeboxmarging, jukeboxh, jukeboxw, "", jukebox_func0);
jukebox_tween_pool = make_tweenpool(jukebox_pool,jukebox_button_pool,AnimationCurve1, tweenval_x, jukeboxx_end, 10, 0);

//Update function
jukebox_funcopen = function()
{
	//Associate buttons and tweens from pool to panel
	var n = jukebox_n;
	//Reset Panel
	jukebox.buttons = [];
	jukebox.tweens = [];
	//Set
	for (var i = 0; i < n; ++i)
	{
		// Add buttons & tweens to panel
		array_push(jukebox.buttons, jukebox_button_pool[@ i]);
		array_push(jukebox.tweens, jukebox_tween_pool[@ i]);
	}

	//Update buttons in panel
	for (var i = 0; i < n; ++i)
	{
		var _spellref = obj_game.PlayerEquSpells[i];
		var _spell = global.Spells[@ _spellref];
		var _spellname = _spell.spellname;
		jukebox.buttons[@ i].text = _spellname;
		jukebox.buttons[@ i].spellref = _spellref;
		jukebox.buttons[@ i].selectionType = _spell.targ_typ;
		jukebox.buttons[@ i].spell = _spell;
		//jukebox.buttons[@ i].text_xoffset = -(jukebox.buttons[@ i].ini_pos[0]/4);
		jukebox.buttons[@ i].text_xoffset = -(jukebox.buttons[@ i].Width/3.4);
		//UI
		var ac = GetAction(_spell, "Action_mod", targetType.SNGL);
		if (ac == noone)
		{
			ac = GetAction(_spell, "Action_mod", targetType.MASS);
		}
		
		if (ac != noone)
		{
			jukebox.buttons[@ i].effect_value =+ ac.val;
			jukebox.buttons[@ i].effect_type = ac.typ;
		}
		
		var cost = GetAction(_spell, "Action_mod", targetType.SELF);
		if (cost != noone)
		{
			jukebox.buttons[@ i].cost_value = abs(cost.val);
			jukebox.buttons[@ i].buttype = cost.typ;
		}
		else
		{
			jukebox.buttons[@ i].buttype = noone;
		}
		
	}
	
	//Start highlight alarm
	obj_EncounterPlayer.alarm[1] = obj_EncounterPlayer.hl_timer;
	obj_button_spell.draw_info = true;
	
	//Set heart "state" to jukebox
	obj_EncounterPlayer.StateBig();
}

jukebox_funcclose = function()
{
	obj_Monster.focus = -1;
	obj_EncounterPlayer.jukeboxp = false;
	//Stop highlight
	obj_EncounterPlayer.hl_start = -4;
	obj_EncounterPlayer.alarm[1] = -1;
	
	obj_battlemanager.spelllifeselectamount = 0;
	obj_UI_target.Main_monsterselect();
	
	//Set heart "state" to Normal
	obj_EncounterPlayer.StateNormal();
}

jukebox_postopen = function()
{
	//MONSTER HIGHLIGHT
	jukebox_targetupdate();
	obj_UI_target.Main_monsterselect();
}

//Setting Panel
jukebox.funcopen = jukebox_funcopen;
jukebox.funcclose = jukebox_funcclose;
jukebox.funcpostopen = jukebox_postopen;


///		Target
Target = new UI_Panel([],[],seq_enc_target ,noone,,,obj_PlayerController.IM_encounterselect, ,noone,[]);

Target_funcopen = function()
{
	// please change this later into proper state machine
	//obj_EncounterPlayer.jukeboxp = true;
	//obj_Monster.focus = -1;
	obj_UI_target.Main_monsterselect();
	//Set heart "state" to Normal
}

Target_funcclose = function()
{
	//empty
}

Target.funcopen = Target_funcopen;
Target.funcclose = Target_funcclose;


///		Victory
var victory_n = 1;
var victoryx = display_get_gui_width()/2 - 620;
var victoryy = 896;
var victoryend = 1664;
var victoryh = 48;
var victoryw = 72;
var victorymarging = 126;
var victorytext = ["->"];

Victory = new UI_Panel([],[], seq_enc_victory, noone, , ,obj_PlayerController.IM_encounterend, ,noone,[]);

//Functions
Victory_func = function()
{	
	//Set playerlife
	obj_EncounterPlayer.SetLifeGame();
	
	//Finish encounter on victory
	obj_transition_manager.nextroom = obj_transition_manager.previousroom;
	obj_transition_manager.transitiontoroom(obj_transition_manager.nextroom, obj_door, undefined, obj_PlayerController.IM_character, false,);
	//obj_transition_manager.w_gotoroom();
	Close();
	obj_game.SwitchMode(obj_game.WorldMode);
}

//Setting Panel

//extra
victory_extra = instance_create_layer( display_get_gui_width()/2, 256 * 1.5, "Instances", obj_extra_info);
victory_extra.text = "Mind at Peace";
victory_extra.text_scale = 2;
victory_extra.Width = 720;
victory_extra.Height = 128;
victory_extra.x -= victory_extra.Width/2;///2;
//victory_extra.text_scale_idle = 3;
array_push(Victory.extra, victory_extra);

UI_Panel_add_buttons(Victory,obj_button_next,victory_n,victoryx,victoryy,victorymarging,,victoryh,victoryw,victorytext,[Victory_func]);
UI_Panel_add_tweens(Victory,victory_n,AnimationCurve1, tweenval_x, victoryend, 10, 0);



///		Defeat
var defeat_n = 1;
var defeatx = display_get_gui_width()/2 -32;
var defeaty = 480;
var defeatend = 576;
var defeath = 32;
var defeatw = 64;
var defeatmarging = 126;
var defeattext = ["Proceed"];

Defeat = new UI_Panel([],[], seq_enc_defeat, noone, , ,obj_PlayerController.IM_encounterend, ,noone,[]);

//Functions
Defeat_func = function()
{
	//Finish encounter on defeat
	obj_PlayerController.inputmode = obj_PlayerController.IM_transition;
	Close();
	//obj_UI_target.Close();
	obj_game.SwitchMode(obj_game.MainMenu);
	obj_game.b_loading = true;
	obj_game.LoadData();
	//Load game
}

//Defeat_funcopen = function()
//{
	//
//}

//Setting Panel
UI_Panel_add_buttons(Defeat,obj_button,defeat_n,defeatx,defeaty,defeatmarging,,defeath,defeatw,defeattext,[Defeat_func]);
UI_Panel_add_tweens(Defeat,defeat_n,AnimationCurve1, tweenval_y, defeatend, 10, 0);

//Defeat.funcopen = Defeat_funcopen;

//extra
defeat_extra = instance_create_layer(display_get_gui_width()/2, 256 *1.5,"Instances", obj_extra_info);
defeat_extra.text = "Love was never found";
defeat_extra.text_scale = 2;
defeat_extra.Width = 720;
defeat_extra.Height = 128;
defeat_extra.text_color = c_white;
defeat_extra.x -= victory_extra.Width/2;///2;
array_push(Defeat.extra, defeat_extra);