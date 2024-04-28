// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_input_dialogue(){
	
// Key Inputs
var _PlaCon = obj_PlayerController;
var _Dia = obj_Dialog;
var _keyEnter = _PlaCon.keyEnter;
var _keyBack = _PlaCon.keyBack;
//var _keyMenu = _PlaCon.keyMenu;

// Check button press to go through dialogue
if (_keyEnter or _keyBack)
{
	//set new message style
	//_Dia.button_next = true;
	_Dia.State();
	//_Dia.DrawString();
}

//When Dialogue is done - Switch input mode to character
if (_Dia.done == true)
	{
		obj_PlayerController.inputmode = obj_PlayerController.IM_character;
	}
	 
}