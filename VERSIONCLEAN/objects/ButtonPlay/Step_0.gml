/// @description Insert description here
// You can write your code in this editor
if (global.ButtonSelected == 0)
{
	image_xscale = 1.6;
	image_yscale = 1.6;
	if (input_check_pressed("special"))
	{
		audio_stop_all()
		room_goto(rm_PickASide);
		global.Music = 0;
	}
}
if (global.ButtonSelected != 0)
{
	image_xscale = 1.3;
	image_yscale = 1.3;
}










