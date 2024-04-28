// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_input_battleselect_SELF(_UI_manager,_BS){
	// Key Inputs
var _PlaCon = obj_PlayerController;
var _keyEnter = _PlaCon.keyEnter;
var _keyBack = _PlaCon.keyBack;

// Movement UI
var _menuMoveV = _PlaCon.menuMoveH;
var _menuMoveH = _PlaCon.menuMoveV;

//_BS.iselect += _menuMoveV;
//_BS.iselect += _menuMoveH;
//	//if (keyDown || keyRight)
//	//{
//	//	++_BS.iselect;
//	//	var h = array_length(obj_EncounterLoader.activemonsters)-1;
	
//	//	if (_BS.iselect > h)
//	//	{
//	//		_BS.iselect = 0;
//	//	}
//	//	_BS.selection = obj_EncounterLoader.activemonsters[_BS.iselect];
//	//}

//	//if (keyUp || keyLeft)
//	//{
//	//	--_BS.iselect;
	
//	//	if (_BS.iselect < 0)
//	//	{
//	//		_BS.iselect = array_length(obj_EncounterLoader.activemonsters)-1;
//	//	}
//	//	_BS.selection = obj_EncounterLoader.activemonsters[_BS.iselect];
//	//}

//var h = array_length(obj_EncounterLoader.activemonsters)-1;
	
//if (_BS.iselect > h)
//{
//	_BS.iselect = 0;
//}

//if (_BS.iselect < 0)
//{
//	_BS.iselect = h;
//}

//_BS.selection = obj_EncounterLoader.activemonsters[_BS.iselect];

	if(_keyEnter && array_length(_UI_manager.Stack) > 0)
	{
		//var tarSelFunc = _UI_manager[_UI_manager.CurrentPanel][BUTTONS][0];
		//tarSelFunc();
		//_BS.SetTarget(targetType.SELF,obj_EncounterLoader.Dummies[_BS.selection]);
		//SetTarget(targetType.SELF,player);
		//targetstruct.single = obj_EncounterLoader.Dummies[selection];
		//show_debug_message("target" +"  "+ string(obj_BattleSystem.targetstruct.single));
		
		//show_debug_message("target" +"  "+ string(obj_BattleSystem.Targets[targetType.SNGL]));
		
		//obj_ActionData.UseSpell(global.Spells[SPELL.modfl3_c10]);
	
		_BS.PlayerShowCost();
		_UI_manager.Close();
		obj_PlayerController.curr_inputmode = inputmode.encounter;
		//obj_Shaker.Shake(obj_EncounterLoader.Dummies[r],0.5,12,10,0.4);
		//obj_Shaker.ScreenShake(2,8,1,0.5);
	}

	 if (_keyBack && array_length(_UI_manager.Stack) > 0)
	 {
		 _UI_manager.Back();
		 _BS.state = _BS.PlayerTurn;
		 obj_PlayerController.curr_inputmode = inputmode.encounter;
		 
		 // Set state - reset UI and parameters
		 obj_BattleSystem.SwitchState(obj_BattleSystem.PlayerTurn);
	 }
}