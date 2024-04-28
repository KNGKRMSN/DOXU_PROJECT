// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function scr_input_battleselect_DUO(_UI_manager,_BS){
	//Keys
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

	if(_keyEnter)
	{
		if (_BS.target1 == noone)
		{
			//NEW
			//Set target
			_BS.target1 = obj_EncounterLoader.Dummies[@ obj_UI_target.Selection];
			_BS.removedindex = obj_UI_target.Selection;
			//Disable button		
			obj_UI_target.Main.buttons[@ obj_UI_target.Selection].SwitchState(obj_UI_target.Main.buttons[@ obj_UI_target.Selection].Disabled);
			//obj_UI_target.Selection += 1;
			//obj_UI_target.last_selection = 0;
			//Audio
			audio_play_sound(snd_UI_open,1,0);
			
			/// OLD
			// Copy of active monsters pool
			//var len = array_length(obj_EncounterLoader.activemonsters);
			//array_copy(_BS.availableSelection,0,obj_EncounterLoader.activemonsters,0,len);
			
			////Set target
			//var available = _BS.availableSelection[@ obj_UI_target.Selection];
			//_BS.target1 = obj_EncounterLoader.Dummies[@ available];
			//_BS.removedbut = obj_UI_target.Main.buttons[@ obj_UI_target.Selection];
			//_BS.removedindex = obj_UI_target.Selection;
			////remove button
			//array_delete(obj_UI_target.Main.buttons,obj_UI_target.Selection,1);
			//obj_UI_target.n_buttons = array_length(obj_UI_target.Main.buttons);
			//obj_UI_target.Selection = 0;
			//obj_UI_target.last_selection = 0;
			////remove monster from clone list
			//var ind = _BS.GetIndexFromList(_BS.removedindex);
			//array_delete(_BS.availableSelection,ind,1);
		}
		else
		{
			//var available = _BS.availableSelection[@ obj_UI_target.Selection];
			_BS.target2 = obj_EncounterLoader.Dummies[@ obj_UI_target.Selection];
			obj_UI_target.Interact(obj_UI_target.Selection);
			
			
			
			//_BS.removedbut.visible = false;
			//obj_UI_target.Selection = 0;
			//obj_UI_target.last_selection = 0;
			//_BS.SetTarget(targetType.DUO,[_BS.target1,obj_EncounterLoader.Dummies[_BS.selection]]);
			
			//_BS.nSelected = 0;
			//_BS.targSelected = noone;
			//_BS.snd = false;
		}
	}

	 if (_keyBack)
	 {
		 if (_BS.target1 == noone)
		{
			 obj_UI_encounter.Back();
			 
			 //_BS.targSelected = noone;
			 //_BS.nSelected = 0;
		}
		else
		{
			var but = obj_UI_target.Main.buttons[@ _BS.removedindex];
			but.SwitchState(but.Idle);
			//array_insert(obj_UI_target.Main.buttons,_BS.removedindex,_BS.removedbut);
			//obj_UI_target.n_buttons = array_length(obj_UI_target.Main.buttons);
			//obj_UI_target.Selection = 0;
			//obj_UI_target.last_selection = 0;
			_BS.target1 = noone;
			//_BS.nSelected = 0;
			//Audio
			audio_play_sound(snd_UI_back,1,0);
		}
	 }
}