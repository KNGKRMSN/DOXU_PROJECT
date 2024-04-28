// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_input_encounter(_UI_manager){
	
// Key Inputs
var _PlaCon = obj_PlayerController;
var _keyEnter = _PlaCon.keyEnter;
var _keyBack = _PlaCon.keyBack;
var _keyFace3 = _PlaCon.keyFace3;

// Movement
var _menuMoveV = _PlaCon.menuMoveV;
var _menuMoveH = _PlaCon.menuMoveH;

//var _BS = obj_BattleSystem;
//_BS.iselect += _menuMoveH;

_UI_manager.SetSelection(_menuMoveV + _menuMoveH);
//Set Targetype for jukebox panel
_UI_manager.jukebox_targetupdate();
if ( _menuMoveV + _menuMoveH != 0) obj_UI_target.Main_monsterselect();
obj_UI_target.Main_updatelifeselect();

//Select monster

	 if (_keyBack && array_length(_UI_manager.Stack) > 1)
	 {
		 _UI_manager.Back();
	 }

	if (_keyEnter && array_length(_UI_manager.Stack) > 0)
	 {
		 _UI_manager.Interact(_UI_manager.Selection);
	 }
	 
	 if (_keyFace3 && array_length(_UI_manager.Stack) > 1)
	 {
		 obj_button_spell.draw_info = !obj_button_spell.draw_info;
	 }

	 //	monster selection clamp
	 //var h = array_length(obj_EncounterLoader.activemonsters)-1;
	
	 //if (_BS.iselect > h)
	 //{
	 //	_BS.iselect = 0;
	 //}
	 
	 //if (_BS.iselect < 0)
	 //{
	 //	_BS.iselect = h;
	 //}
	 
	 //var _EL = obj_EncounterLoader;
	 ////Audio
	 //if (_BS.state == _BS.PlayerTurn and _BS.iselect != _BS.selection)
	 //{
		// obj_Monster.selected = false;
		// //audio_play_sound(snd_base_bleep,1,0);
	 //}
	 
	 ////Set selection
	 //if (array_length(obj_EncounterLoader.activemonsters) > 0)
	 //{
		// _BS.selection = obj_EncounterLoader.activemonsters[_BS.iselect];
		// _EL.Dummies[@ _BS.selection].selected = true;
	 //}
	 
}