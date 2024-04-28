// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_input_battleselect_MASS(_UI_manager,_BS){
	// Key Inputs
var _PlaCon = obj_PlayerController;
var _keyEnter = _PlaCon.keyEnter;
var _keyBack = _PlaCon.keyBack;

// Movement UI
var _menuMoveV = _PlaCon.menuMoveH;
var _menuMoveH = _PlaCon.menuMoveV;
if ( _menuMoveV + _menuMoveH != 0) obj_UI_target.Main_monsterselect();
obj_UI_target.Main_updatelifeselect();
//show_debug_message("---Selection Update MASS");


	if(_keyEnter && array_length(_UI_manager.Stack) > 0)
	{
		obj_UI_target.Interact(obj_UI_target.Selection);
	}

	 if (_keyBack && array_length(_UI_manager.Stack) > 0)
	 {
		 obj_UI_encounter.Back();
	 }
}