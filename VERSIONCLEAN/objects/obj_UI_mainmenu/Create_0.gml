/// @description

// Inherit the parent event
event_inherited();

// System Properties
transitiontime = 6;
root_inputmode = obj_PlayerController.IM_transition;

//	Initialise Panels		

//		Main
//properties
var mainh = 80;
var mainw = 212;
var mainx = display_get_gui_width()/2 + 320;
var mainy = 320;
var mainend = display_get_gui_width()/2 - mainw/2;
var mainmarging = mainh-6;
var maintexts = ["Continue","New Game","Options","Quit"];
var main_n = 4;	// max buttons

//	Functions

//game utility
NewGame = function()
{
	// Audio Cue
	audio_play_sound(snd_save,1,false);
	//obj_transition_manager.transitiontoroom(room_intro, obj_savepoint ,obj_PlayerController.IM_transition, false, );
	//StartNewGame();
}

ContinueGame = function()
{
	//show_message("Loading game in asnyc system");
	// loading bool
	//var svp = obj_game.playersavedata[0].sp_index;
	//var _sp_struc = global.Savepoints[@ _n];
	//var actt = _sp_struc.act;
	//var svp = ReadSavepoint(_n);
	//FindSavepoint(svp);
	//obj_transition_manager.nextroom = _sp_struc.rm;
	//obj_transition_manager.nextdoor = _sp_struc.inst;
	//obj_transition_manager.state = 0;
	//obj_transition_manager.visible = true;
	//obj_transition_manager.changemus = true;
	//obj_transition_manager.newmus = _sp_struc.mus;
	//obj_transition_manager.ar = obj_transition_manager.loadAct(string("act{0}.json", actt));
	//obj_game.currAct = _sp_struc.act;
	//obj_Dialog.ReadFile(string("story_{0}.json", actt), actt);
	//obj_game.GetRoomNames(actt);
	//obj_game.b_loading = true;
	//obj_game.LoadData();
	
	// testing
	//obj_transition_manager.state = 0;
	//obj_transition_manager.visible = true;
	//obj_transition_manager.changemus = true;
	//obj_game.SwitchMode(obj_game.WorldMode);
	
	//var _sp_struc = global.Savepoints[@ obj_game.playersavedata.sp_index];
	//obj_transition_manager.nextroom = _sp_struc.rm;
	//obj_transition_manager.nextdoor = _sp_struc.inst;
	//obj_transition_manager.state = 0;
	
	//obj_game.SwitchMode(obj_game.WorldMode);
	
	//Audio
	//if(array_length(Stack) > 0) audio_play_sound(snd_UI_open,1,0);
}

main_b0func = function()
{
	//obj_transition_manager.nextinputmode = obj_PlayerController.IM_character;
	ContinueGame();
	Close();
}

main_b1func = function()
{
	NewGame();
	Close();
}

main_b2func = function()
{
	//
}

main_b3func = function()
{
	game_end();
}

//create panel
Main = new UI_Panel([],[],seq_mainmenu,seq_mainmenu, noone, noone,obj_PlayerController.IM_mainmenu,false);
Main.background = new UI_panel_background(spr_tile_checker, c_gray, 1);

UI_Panel_add_buttons(Main,obj_button_worldmenu,main_n,mainx,mainy,,mainmarging, mainh, mainw,maintexts,[main_b0func,main_b1func,main_b2func,main_b3func]);
UI_Panel_add_tweens(Main,main_n,AnimationCurve1, tweenval_x, mainend, 30, 2);

//define buttons
for (var i = 0; i < main_n; ++i) {
    //Main.buttons[i].text_xoffset -= mainw/2;
}
Main.buttons[2].SwitchState(Main.buttons[2].Disabled);
//Main.buttons[2].text = "ah";

//Create
obj_PlayerController.UI_manager = obj_UI_mainmenu;
obj_UI_mainmenu.Open(obj_UI_mainmenu.Main);
obj_PlayerController.inputmode = obj_PlayerController.IM_mainmenu;