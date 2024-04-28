// Script
function scr_input_encountermain(_UI_manager){
	
// Key Inputs
var _PlaCon = obj_PlayerController;
var _keyEnter = _PlaCon.keyEnter;
var _keyBack = _PlaCon.keyBack;

// Movement
var _menuMoveV = _PlaCon.menuMoveV;
var _menuMoveH = _PlaCon.menuMoveH;

obj_UI_target.SetSelection(_menuMoveV + _menuMoveH);
obj_UI_target.Main_monsterselect(_menuMoveV + _menuMoveH);

	 if (_keyBack && array_length(_UI_manager.Stack) > 0)
	 {
		 show_debug_message(_keyBack);
		 _UI_manager.Selection = 0;
		 //_UI_manager.CheckSelection();
		 _UI_manager.Interact(_UI_manager.Selection);
	 }

	if (_keyEnter && array_length(_UI_manager.Stack) > 0)
	 {
		 show_debug_message(_keyEnter);
		 _UI_manager.Selection = 1;
		 //_UI_manager.CheckSelection();
		 _UI_manager.Interact(_UI_manager.Selection);
	 }
}