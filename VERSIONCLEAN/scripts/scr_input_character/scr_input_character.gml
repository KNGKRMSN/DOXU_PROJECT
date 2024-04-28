/// character Inputs
function scr_input_character(){
//var chara = _character;
	// Movement Update
var _PlaCon = obj_PlayerController;
var _hInput = _PlaCon.hInput
var _vInput = _PlaCon.vInput;
var _keyMenu = _PlaCon.keyMenu or _PlaCon.keyFace4;
var _keyEnter = _PlaCon.keyEnter;
//var _shoulderR = _PlaCon.keyShoulderR;
var _keyR = _PlaCon.keyR;
//var _keyRrls = _PlaCon.keyRrls;
//var _shoulderL = - _PlaCon.keyShoulderL;
//var _hrel = _PlaCon.hRelease;
//var _vrel = _PlaCon.vRelease;

// On move input move 
//if(_hInput != 0 or _vInput != 0)
//{
	// Set Character Depth
	//chara.depth = -chara.y;
	/*
	chara.dir = (point_direction(0,0,_hInput,_vInput) div 45) *45;
	chara.moveX = lengthdir_x(chara.spd, chara.dir);
	chara.moveY = lengthdir_y(chara.spd, chara.dir);
	
	//CAMERA INPUT
	obj_camera.followdiv -= 0.40;
	obj_camera.followdiv = clamp(obj_camera.followdiv, 4, obj_camera.followdivmax);
	
	// Check collision
	var bbox_sidex;
	var bbox_sidey;
	
	// Horizontal collision
	//set bbox side
	if (chara.moveX > 0)
	{
		bbox_sidex = chara.bbox_right;
	}
	else
	{
		bbox_sidex = chara.bbox_left;
	}
	
	//set var solid collision
	var _solidcollx = ( position_meeting(bbox_sidex + chara.moveX, chara.bbox_top, obj_solid)) + (position_meeting(bbox_sidex + chara.moveX, chara.bbox_bottom, obj_solid));
	if ( tilemap_get_at_pixel(chara.tiles, bbox_sidex + chara.moveX, chara.bbox_top) != 0 || tilemap_get_at_pixel(chara.tiles, bbox_sidex + chara.moveX, chara.bbox_bottom) != 0 || _solidcollx )
	{
		if (chara.moveX > 0) x = x - (x mod 32) + 31 - (bbox_right - x);
		else x = x + 32 - (bbox_right - x)
		
		chara.moveX = 0;
	}
	
	// Cells X
	//var cell_x_max = tilemap_get_cell_x_at_pixel(chara.tiles,chara.bbox_right + chara.moveX, chara.bbox_top);
	//var cell_y_max = tilemap_get_cell_y_at_pixel(chara.tiles,chara.bbox_left + chara.moveX, chara.bbox_bottom);
	//var cell_x_min = cell_x_max - 1;
	//var cell_y_min = cell_y_max - 1;
	
	//for (var i = cell_x_min; i <= cell_x_max; ++i)
	//{
	//	for (var f = cell_y_min; f <= cell_y_max; ++f) {
	//	    var _check_x = tilemap_get(chara.tiles,i,f);
			
	//		if (_check_x != 0 or _solidcollx)
	//		{
	//			chara.moveX = 0;
	//		}
	//	}
	//}

	
	// Set X
	chara.x += (chara.moveX);

	// Vertical collision
	//set bbox side
	if (chara.moveY > 0)
	{
		bbox_sidey = chara.bbox_bottom;
	}
	else
	{
		bbox_sidey = chara.bbox_top;
	}
	
	//Check Y
	
	//for (var i = cell_x_min; i <= cell_x_max; ++i)
	//{
	//	for (var f = cell_y_min; f <= cell_y_max; ++f) {
	//	    var _check_x = tilemap_get(chara.tiles,i,f);
			
	//		if (_check_x != 0 or _solidcolly)
	//		{
	//			chara.moveY = 0;
	//		}
	//	}
	//}
	
	//set var solid collision
	var _solidcolly = position_meeting(chara.bbox_left, bbox_sidey + chara.moveY, obj_solid) + position_meeting(chara.bbox_right, bbox_sidey + chara.moveY,obj_solid);
	if (tilemap_get_at_pixel(chara.tiles, chara.bbox_left, bbox_sidey + chara.moveY) != 0 || tilemap_get_at_pixel(chara.tiles, chara.bbox_right, bbox_sidey + chara.moveY) != 0 || _solidcolly )
	{
		if (chara.moveY > 0) y = y - (y mod 32) + 31 - (bbox_right - y);
		else y = y - +32 - (bbox_right - y);
		chara.moveY = 0;
	}
	
	//Set Y
	chara.y += (chara.moveY);
	
	//Shadows
	if (tilemap_get_at_pixel(chara.ombretiles, bbox_sidex + chara.moveX, chara.bbox_top) != 0 || tilemap_get_at_pixel(chara.tiles, bbox_sidex + chara.moveX, chara.bbox_bottom) != 0 || tilemap_get_at_pixel(chara.tiles, chara.bbox_left, bbox_sidey + chara.moveY) != 0 || tilemap_get_at_pixel(chara.tiles, chara.bbox_right, bbox_sidey + chara.moveY) != 0 )
	{
		chara.ombre = c_ltgray;
	}
	else chara.ombre = c_white;
	
	
	//Set Character state
	if (_keyR)
	{
		chara.SetState(chara.Walk);
	}
	else
	{
		chara.SetState(chara.Run);
	}
	//if (_keyRrls) chara.SetState(chara.Walk);
}
else 
{
	//Set Character state
	chara.SetState(chara.Idle);
	
	//Camera follow value reset
	obj_camera.followdiv = obj_camera.followdivmax;
}


//Run Character State
chara.SetDirection();

// INTERACTION
// get interact list
var _intLen = array_length(obj_Player.interactList);
// Interact
if (_keyEnter && _intLen > 0)
	 {	 
		 //Set interaction dialogue
		 var _diaIndex = obj_Player.interactList[@ _intLen-1].diaIndex;
		 var _act = obj_Player.interactList[@ _intLen-1].act;
		 if (_diaIndex != undefined)
		 {
			 scr_dialogue_open(_act,_diaIndex);
		 }
		 
		 var _scr = obj_Player.interactList[@ _intLen-1].scriptmethod;
		 //var _arg = obj_Player.interactList[@ _intLen-1].arguments;
		 
		 if (_scr != noone)
		 {
			//_scr = obj_Player.interactList[@ _intLen-1].scriptmethod;
			var _arg = obj_Player.interactList[@ _intLen-1].arguments;
		 
			_scr(_arg);
		 }
	 }
*/
if (_keyMenu && array_length(obj_UI_world.Stack) <= 0)
	 {
		 //Open Menu func
		 obj_UI_world.Open(obj_UI_world.Main);
		 obj_PlayerController.inputmode = obj_PlayerController.IM_worldUI;
		 
		 //Set Character state
		//chara.SetState(chara.Idle);
		//chara.SetDirection();
		
		//depth
		//obj_Player.depth = 300;
		
		//	set camera to stop
		//obj_camera.follow = noone;
	 }
}