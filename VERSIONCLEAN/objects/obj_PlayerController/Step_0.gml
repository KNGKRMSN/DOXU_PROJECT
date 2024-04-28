/// @description Controls
// Gamepad
// axis press
sticklv = input_check("right") - input_check("left");
sticklh = input_check("down") - input_check("up")
axisPresslv = 0;
axisPresslh = 0;
// vertical axis press
if ( sticklv > 0 && last_sticklv <=0)
{
	axisPresslv = 1;
}
if ( sticklv < 0 && last_sticklv >=0)
{
	axisPresslv = -1;
}
// horizontal axis press
if ( sticklh > 0 && last_sticklh <=0)
{
	axisPresslh = 1;
}
if ( sticklh < 0 && last_sticklh >=0)
{
	axisPresslh = -1;
}

// Stick directions
stick_dir = point_direction(-1,-1,sticklh,sticklv);

/// Keys 
keyBack = input_check_pressed("heavy")//keyboard_check_pressed(vk_backspace);
keyEnter = input_check_pressed("special")//keyboard_check_pressed(vk_enter);
keyFace3 = input_check_pressed("light")//keyboard_check_pressed(ord("X"));
keyFace4 = input_check_pressed("medium")//keyboard_check_pressed(ord("C"));
keyShoulderL = keyboard_check_pressed(ord("Q"));
keyShoulderR = input_check_pressed("special2")//keyboard_check_pressed(ord("E"));
keyDown = input_check_pressed("down");//keyboard_check_pressed(vk_down) + axisPresslv;
keyUp = input_check_pressed("up")//eyboard_check_pressed(vk_up) + axisPresslv;
keyRight = input_check_pressed("right")//keyboard_check_pressed(vk_right) + axisPresslh;
keyLeft = input_check_pressed("left")//keyboard_check_pressed(vk_left) + axisPresslh;
//keySpace = keyboard_check_pressed(vk_space);
//keyRrls = keyboard_check_released(vk_shift);
keyR = keyboard_check(vk_shift);
keyMenu = input_check_long("pause")//keyboard_check_pressed(ord("M"));
// chara movement
hInput = (input_check_pressed("right") - input_check_pressed("left"));
			//+ sticklh
			//+ keyboard_check(ord("D")) - keyboard_check(ord("A"));
			
			
vInput = (input_check("down") - input_check("up"));
			//+ sticklv
			//+ keyboard_check(ord("S")) - keyboard_check(ord("W"));
			

//hInput = (keyboard_check(vk_right) - keyboard_check(vk_left)) + gamepad_axis_value(pad_index,gp_axislh);
//vInput = (keyboard_check(vk_down) - keyboard_check(vk_up)) + gamepad_axis_value(pad_index,gp_axislv);
hRelease = input_check_released("right") - input_check_released("left"); //(keyboard_check_released(vk_right) - keyboard_check_released(vk_left));
vRelease = input_check_released("down") - input_check_released("up");//(keyboard_check_released(vk_down) - keyboard_check_released(vk_up));
// UI inputs
menuMoveV = input_check_pressed("down") - input_check_pressed("up"); //keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up)
			//+ axisPresslv
			//+ keyboard_check_pressed(ord("S")) - keyboard_check_pressed(ord("W"));
			
menuMoveH = input_check_pressed("right") - input_check_pressed("left"); //keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left)	
			//+ axisPresslh
			//+ keyboard_check_pressed(ord("D")) - keyboard_check_pressed(ord("A"));


// Inputmode func State
inputmode();
//show_debug_message("PController"+string(inputmode) + string(UI_manager));

// old states
//switch (curr_inputmode) {
//	case inputmodes.battleselect_SNGL:
//		scr_input_battleselect_SNGL(UI_manager,BatSys);
//		break;
//	case inputmodes.battleselect_DUO:
//		scr_input_battleselect_DUO(UI_manager,BatSys);
//		break;
//	case inputmodes.battleselect_SELF:
//		scr_input_battleselect_SELF(UI_manager,BatSys);
//		break;
//	case inputmodes.battleselect_MASS:
//		scr_input_battleselect_MASS(UI_manager,BatSys);
//		break;
//}