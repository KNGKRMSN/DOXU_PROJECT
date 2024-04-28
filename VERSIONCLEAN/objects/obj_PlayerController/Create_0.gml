/// @description Init Controls
//	Setup
enum inputmodes
{
	battleselect_SNGL,
	battleselect_DUO,
	battleselect_SELF,
	battleselect_MASS
}

//	Gamepad Variables
pad_index[0] = 0;

axisPresslv = 0;
axisPresslh = 0;

last_sticklv = 0;
last_sticklh = 0;

//	References
//character = obj_Player;
UI_world = obj_UI_world;
UI_encounter = obj_UI_encounter;
UI_manager = UI_world;
//BatSys = obj_battlemanager;


// Input mode - States
IM_worldUI = function()
{
	scr_input_UI(UI_manager);
	//show_debug_message("inputmode - World UI");
}

IM_Worldjukebox = function()
{
	scr_input_world_jukebox(UI_manager);
}

IM_slider = function()
{
	scr_input_slider(obj_UI_world);
}

IM_character = function()
{
	//character.image_speed = 1;
	scr_input_character();
	//show_debug_message("inputmode - Character");
}

IM_transition = function()
{
	//character.image_speed = 0;
	//show_debug_message("inputmode - transition");
}

IM_cutscene = function()
{
	scr_input_cutscene(obj_UI_world);
}

IM_dialogue = function()
{
	scr_input_dialogue();
}

IM_encountermain = function()
{
	scr_input_encountermain(UI_manager);
}

IM_encounter = function()
{
	scr_input_encounter(UI_manager);
}

IM_encounterselect = function()
{
	//	Use an input script based on Target type in Battlemanager
	
	var _type = obj_battlemanager.TargetType;
		switch (_type)
		{
		case targetType.SELF :
			scr_input_battleselect_SNGL(UI_manager,BatSys);
			break;
		case targetType.SNGL :
			scr_input_battleselect_SNGL(UI_manager,BatSys);
			break;
		case targetType.DUO :
			scr_input_battleselect_DUO(UI_manager,BatSys);
			break;
		case targetType.MASS :
			scr_input_battleselect_MASS(UI_manager,BatSys);
			break;
		}
}

IM_encounterend = function()
{
	scr_input_encounterend(obj_UI_encounter);
}

IM_mainmenu = function()
{
	//scr_input_mainmenu(UI_manager);
	//show_debug_message("inputmode - Mainmenu");
}
show_debug_message("GAMEMODE : WORLD");
    obj_UI_world.visible = true;
    obj_PlayerController.UI_manager = obj_UI_world;
// Set	

//inputmode = IM_mainmenu;		//root inputmode
inputmode = IM_character;		//root inputmode
