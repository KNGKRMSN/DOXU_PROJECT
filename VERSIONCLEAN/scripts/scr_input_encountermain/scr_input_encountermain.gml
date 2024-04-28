// Script
function scr_input_encountermain(_UI_manager){
	
// Key Inputs
var _PlaCon = obj_PlayerController;
var _keyEnter = _PlaCon.keyEnter;
var _keyBack = _PlaCon.keyBack;
var _keyFace3 = _PlaCon.keyFace3;

// Movement
var _menuMoveV = _PlaCon.menuMoveV;
var _menuMoveH = _PlaCon.menuMoveH;
var _shoulderR = _PlaCon.keyShoulderR;
var _shoulderL = - _PlaCon.keyShoulderL;
var _shoulders = _shoulderL + _shoulderR;
var bpower = global.GameFlags[@ Act.const, 6];

if ( _menuMoveV + _menuMoveH + _shoulders != 0) obj_UI_target.SetSelection(_menuMoveV + _menuMoveH + _shoulders);
if ( _menuMoveV + _menuMoveH + _shoulders != 0) obj_UI_target.Main_monsterselect(_menuMoveV + _menuMoveH + _shoulders);
//obj_UI_target.Main_deactivatelifeselect();

	 if (bpower && _keyFace3 && array_length(_UI_manager.Stack) > 0)
	 {
		 //show_debug_message(_keyBack);
		 _UI_manager.Selection = 0;
		 _UI_manager.Interact(_UI_manager.Selection);
	 }

	if (_keyEnter && array_length(_UI_manager.Stack) > 0)
	 {
		 //show_debug_message(_keyEnter);
		 _UI_manager.Selection = 1;
		 _UI_manager.Interact(_UI_manager.Selection);
	 }
}