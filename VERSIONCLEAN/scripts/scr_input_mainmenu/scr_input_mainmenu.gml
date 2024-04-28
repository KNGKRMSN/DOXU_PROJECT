// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_input_mainmenu(_UI_main){
	
// Key Inputs
var _PlaCon = obj_PlayerController;
var _keyEnter = obj_PlayerController.keyEnter;
var _keyBack = _PlaCon.keyBack;
var _keyMenu = _PlaCon.keyMenu;

// Movement
var _menuMoveV = _PlaCon.menuMoveV;
var _menuMoveH = _PlaCon.menuMoveH;

_UI_main.SetSelection(_menuMoveV + _menuMoveH);

	 if (_keyBack == true && array_length(_UI_main.Stack) > 1)
	 {
		 _UI_main.Back();
	 }

	if (_keyEnter == true && array_length(_UI_main.Stack) > 0 )
	 {
		 _UI_main.Interact(_UI_main.Selection);
	 }
	 
	 //if (_keyMenu && array_length(_UI_manager.Stack) > 0)
	 //{
		// //
	 //}
	 
}