// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_input_slider(_UI_manager){
	
// Key Inputs
var _PlaCon = obj_PlayerController;
var _keyEnter = _PlaCon.keyEnter;
var _keyBack = _PlaCon.keyBack;
var _keyMenu = _PlaCon.keyMenu or _PlaCon.keyFace4;

// Movement
var _menuMoveV = _PlaCon.menuMoveV;
var _menuMoveH = _PlaCon.menuMoveH;

//_UI_manager.SetSelection(_menuMoveV+_menuMoveH);
//_UI_manager.SetSelection(_menuMoveH);

	if (_menuMoveH != 0)
	{
		//	Slider event or func	
		var _sel = _UI_manager.Selection;
		_UI_manager.CurrentPanel.buttons[@ _sel].Set(_menuMoveH);
	}

	 if (_keyBack - _keyEnter && array_length(_UI_manager.Stack) > 0)
	 {
		 //Set slider state to selected
		 var _sel = _UI_manager.Selection;
		 _UI_manager.CurrentPanel.buttons[@ _sel].SwitchState(_UI_manager.CurrentPanel.buttons[@ _sel].Selected);
		
		obj_PlayerController.inputmode = obj_PlayerController.IM_worldUI;
		audio_play_sound(ClickUpSound,0,false);
		//_UI_manager.Back();
		//if (array_length(UI_manager.Stack) == 0)
		//{
		//	_UI_manager.Close();
		//	obj_PlayerController.inputmode = obj_PlayerController.IM_character;
		//	obj_Player.depth = -obj_Player.y;
		//}
	 }

	if (_keyEnter - _keyBack && array_length(_UI_manager.Stack) > 0 && _UI_manager.Selection >= 0)
	 {
		 //Set slider state to selected
		 var _sel = _UI_manager.Selection;
		 _UI_manager.CurrentPanel.buttons[@ _sel].SwitchState(_UI_manager.CurrentPanel.buttons[@ _sel].Selected);
		 
		 obj_PlayerController.inputmode = obj_PlayerController.IM_worldUI;
		 audio_play_sound(ClickDownSound,0,false);
		 //_UI_manager.Interact(_UI_manager.Selection);
	 }
	 
	 //if (_keyMenu && array_length(_UI_manager.Stack) > 0) //Close Menu
	 //{
		// _UI_manager.Close();
		// obj_PlayerController.inputmode = obj_PlayerController.IM_character;
		// obj_Player.depth = -obj_Player.y;
	 //}
}