/// @description Insert description here
// You can write your code in this editor
if (global.ButtonSelected == 3)
{
	image_xscale = 1.6;
	image_yscale = 1.6;
	if (input_check_pressed("special"))
		game_end();
}
if (global.ButtonSelected != 3)
{
	image_xscale = 1.3;
	image_yscale = 1.3;
}










