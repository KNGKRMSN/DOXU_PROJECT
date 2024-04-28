/// @description Insert description here

// Inherit the parent event
event_inherited();

CheckSelection = function()				// Check if selection is in range of array
{
	// Selection check
	if (Selection < 0) Selection = n_buttons-1;
	if (Selection > n_buttons-1) Selection = 0;

	//Audio
	 if (Selection != last_selection)
	 {
		 //set previous button to idle state
		  if (CurrentPanel.buttons[@ last_selection].State != CurrentPanel.buttons[@ last_selection].Disabled)
		  {
			CurrentPanel.buttons[@ last_selection].SwitchState(CurrentPanel.buttons[@ last_selection].Idle);
		  }
		 //set selected button to selected state
		 if (CurrentPanel.buttons[@ Selection].State != CurrentPanel.buttons[@ Selection].Disabled)
		 {
			CurrentPanel.buttons[@ Selection].SwitchState(CurrentPanel.buttons[@ Selection].Selected);
		 }
		 audio_play_sound(snd_UI_select,1,0);
	 
		 last_selection = Selection;
	 }
}

//Gui size on screen
var dis_x = display_get_gui_width();

// System Properties
transitiontime = 4;
root_inputmode = obj_PlayerController.IM_transition;

///		Main but is actually target
var main_n = 4;
var mainx = dis_x/5;
var mainy = 64;
var mainend = mainy + 64;
var mainh = 32;
var mainw = 32;
var mainmarging = 128;

Main_func0 = function()
{
	//Set main
	// Set target for battlemanager
	var activeref = obj_EncounterLoader.activemonsters[@ Selection];
	obj_battlemanager.SetTarget(obj_battlemanager.TargetType, obj_EncounterLoader.Dummies[@ activeref]);
	
	// Set target RIGHT
	var rray = [];
	//Set all monsters to right from selection
	for (var i = Selection+1; i < n_buttons; ++i) {
	    var actref = obj_EncounterLoader.activemonsters[@ i];
		
		array_push(rray, obj_EncounterLoader.Dummies[@ actref]);
	}
	obj_battlemanager.SetTarget(targetType.RGHT, rray);
	
	//Apply jukebox to target
	//obj_battlemanager.PlayerShowCost();
	Main_deactivatelifeselect();
	
	//Change player control
	obj_PlayerController.inputmode = obj_PlayerController.IM_transition;
	
	Close();
	obj_UI_encounter.Close();
	//PlayerEvent
	obj_battlemanager.PlayerEvent(obj_EncounterLoader.Dummies[@ activeref]);
	//Stop highlight
	obj_EncounterPlayer.hl_start = -4;
	//Reset heart state
	obj_EncounterPlayer.StateNormal();
}

Main_monsterselect = function()		//Set monster selected and healthbar visible
{
		//Unselect monster and button
		var len = array_length(obj_UI_target.Main.buttons);
		for (var i = 0; i < len; ++i) {
		//for (var i = 0; i < array_length(obj_EncounterLoader.activemonsters); ++i) {
		    var activeref = obj_EncounterLoader.activemonsters[@ i];
			obj_EncounterLoader.Dummies[@ activeref].selected = false;
			
			//Set select button state
			if (obj_battlemanager.TargetType != targetType.DUO)
			{
				Main.buttons[@ i].SwitchState(Main.buttons[@ i].Idle);
			}
		}
		
		//Select
		Main_selectswitch();
		
		//Monster life select
		Main_activatelifeselect();
}

Main_selectswitch = function()
{
	//Select
		var _type = obj_battlemanager.TargetType;
		switch (_type)
		{
		case targetType.SELF :
		
			break;
		case targetType.SNGL :
			//Select Single
			activeref = obj_EncounterLoader.activemonsters[@ Selection];
			obj_EncounterLoader.Dummies[@ activeref].selected = true;
			
			//Set select button state
			obj_UI_target.Main.buttons[@ Selection].SwitchState(obj_UI_target.Main.buttons[@ Selection].Selected);
			
			break;
		case targetType.DUO :
			//Select Single
			activeref = obj_EncounterLoader.activemonsters[@ Selection];
			obj_EncounterLoader.Dummies[@ activeref].selected = true;
				
			//Set select button state
			obj_UI_target.Main.buttons[@ Selection].SwitchState(obj_UI_target.Main.buttons[@ Selection].Selected);
			
			break;
		case targetType.MASS :
			//Select Mass
			var _n = array_length(obj_EncounterLoader.activemonsters);
			var activeref = obj_EncounterLoader.activemonsters[@ obj_UI_target.Selection];
			for (var i = 0; i < _n; ++i)
			{
			    activeref = obj_EncounterLoader.activemonsters[@ i];
				//Set monster state
				obj_EncounterLoader.Dummies[@ activeref].selected = true;
				//Set select button state
				obj_UI_target.Main.buttons[@ i].SwitchState(obj_UI_target.Main.buttons[@ i].Selected);
			}

			break;
		}
}

Main_setposition = function()
{
	//Position selector on top of dummies
	var _n = array_length(Main.buttons);
		for (var i = 0; i < _n; ++i)
		{
		    var activeref = obj_EncounterLoader.activemonsters[@ i];
			UI_Panel_set_button_position(Main.buttons[@ i], obj_EncounterLoader.Dummies[@ activeref].x * 1.5 , );
		}
}

Main_activatelifeselect = function()
{
	//Unselect
	var len = array_length(obj_battlemanager.previouslifeblocs);
	for (var i = 0; i < len; ++i) {
	    var _bloc = obj_battlemanager.previouslifeblocs[@ i]
		_bloc.select = false;
		_bloc.colr = _bloc.basecolr;
		_bloc.spr = spr_lifebloc;
		_bloc.timer = 0;
	}
	obj_battlemanager.previouslifeblocs = [];
	
	//	Select
	if (obj_battlemanager.spelllifeselectamount > 0)
	{
		var _len = array_length(obj_EncounterLoader.activemonsters);
		for (var n = 0; n < _len; ++n)
		{
		    var activeref = obj_EncounterLoader.activemonsters[@ n];
			var lifestk = obj_EncounterLoader.Dummies[@ activeref].lifestack;
			var lifelen = array_length(lifestk);
			var lifemin = lifelen - obj_battlemanager.spelllifeselectamount;
			if (lifemin < 0) lifemin = 0;
			for (var i = lifelen-1; i >= lifemin; --i) {
				lifestk[@ i].select = true;
				//push in array
				array_push(obj_battlemanager.previouslifeblocs, lifestk[@ i]);
			}
		}
	}
}

Main_updatelifeselect = function()
{
	//	Update life Select
	var hl_bloctimer = 16;
			
		var llen = array_length(obj_battlemanager.previouslifeblocs);
		for (var f = 0; f < llen; ++f)
		{
			var bloc = obj_battlemanager.previouslifeblocs[@ f];
			bloc.timer += 1;
			if (bloc.timer > hl_bloctimer)
			{
				if (bloc.colr == bloc.basecolr) 
				{
					obj_Monster.SetDamage(bloc, obj_battlemanager.AtkType);
					//bloc.colr = c_white;
					//bloc.colr = bloc.basecolr;
					bloc.timer = 0;
				}
				else 
				{
					bloc.colr = bloc.basecolr;
					//bloc.colr = c_white;
					bloc.spr = spr_lifebloc;
					bloc.timer = 0;
				}
			}
		}
}

Main_deactivatelifeselect = function()
{
	//Unselect
	var len = array_length(obj_battlemanager.previouslifeblocs);
	for (var i = 0; i < len; ++i) {
	    var _bloc = obj_battlemanager.previouslifeblocs[@ i]
		_bloc.select = false;
		_bloc.colr = _bloc.basecolr;
		_bloc.spr = spr_lifebloc;
		_bloc.timer = 0;
	}
	obj_battlemanager.previouslifeblocs = [];
	obj_battlemanager.spelllifeselectamount = 0;
	
}


//	Button and Tween pools
main_button_pool = make_buttonpool(obj_button_target, main_n, mainx, mainy,mainmarging,,mainh,mainw, "", Main_func0);
main_tween_pool = make_tweenpool(main_n,main_button_pool, AnimationCurve1, tweenval_y, mainend, 10, 0);

Main = new UI_Panel([],[],noone, noone,,,obj_PlayerController.IM_encounterselect,,noone,[]);

Main_funcopen = function()
{
	var n_mains = array_length(obj_EncounterLoader.activemonsters);
	UI_Panel_associate(Main, main_button_pool,main_tween_pool, n_mains);
	Main_setposition();
	
	////	RESET select amount
	//obj_battlemanager.spelllifeselectamount = 0;
	
	//	Unselect life blocs
	//var _len = array_length(obj_EncounterLoader.activemonsters);
	//for (var n = 0; n < _len; ++n)
	//{
	//	var activeref = obj_EncounterLoader.activemonsters[@ n];
	//	var lifestk = obj_EncounterLoader.Dummies[@ activeref].lifestack;
	//	var lifelen = array_length(lifestk) -1;
	//	var lifemin = lifelen - obj_battlemanager.spelllifeselectamount;
	//	for (var i = lifelen; i > lifemin; --i) {
	//	lifestk[@ i].select = false;
	//	}
	//}
}

Main_funcpostopen = function()
{
	//MONSTER HIGHLIGHT
	//if (obj_battlemanager.currentSpell != noone) obj_battlemanager.TargetType = global.Powers[obj_battlemanager.playerSpell].targ_typ;
	
	obj_UI_target.Main_monsterselect();
}

//	Set Main
Main.funcopen = Main_funcopen;
Main.funcpostopen = Main_funcpostopen;