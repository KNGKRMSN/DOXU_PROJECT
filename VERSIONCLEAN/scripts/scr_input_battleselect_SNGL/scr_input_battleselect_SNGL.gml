// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_input_battleselect_SNGL(_UI_manager,_BS){
	// Key Inputs
var _PlaCon = obj_PlayerController;
var _keyEnter = _PlaCon.keyEnter;
var _keyBack = _PlaCon.keyBack;

// Movement UI
var _menuMoveV = _PlaCon.menuMoveV;
var _menuMoveH = _PlaCon.menuMoveH;
var _shoulderR = _PlaCon.keyShoulderR;
var _shoulderL = - _PlaCon.keyShoulderL;
var _shoulders = _shoulderL + _shoulderR;

if ( _menuMoveV + _menuMoveH + _shoulders != 0) obj_UI_target.SetSelection(_menuMoveV + _menuMoveH + _shoulders);
if ( _menuMoveV + _menuMoveH + _shoulders != 0) obj_UI_target.Main_monsterselect(_menuMoveV + _menuMoveH + _shoulders);
obj_UI_target.Main_updatelifeselect();


	if(_keyEnter && array_length(_UI_manager.Stack) > 0)
	{
		obj_UI_target.Interact(obj_UI_target.Selection);

	}

	 if (_keyBack && array_length(obj_UI_encounter.Stack) > 0)
	 {
		 obj_UI_encounter.Back();
		 
		 // Set state - reset UI and parameters
	 }
}