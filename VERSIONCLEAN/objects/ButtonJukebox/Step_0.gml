/// @description Insert description here
// You can write your code in this editor
if (global.ButtonSelected == 2)
{
	image_xscale = 1.6;
	image_yscale = 1.6;
	if (input_check_pressed("special"))
	{
		o_CameraFollowMenu.y += 1080 + 540;
		instance_deactivate_object(ButtonSelect);
		global.ButtonSelected = -1;
		instance_activate_object(MusicSelect);
	}
}
if (global.ButtonSelected != 2)
{
	image_xscale = 1.3;
	image_yscale = 1.3;
}










