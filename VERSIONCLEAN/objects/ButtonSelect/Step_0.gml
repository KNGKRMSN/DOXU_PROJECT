/// @description Insert description here
// You can write your code in this editor
if (input_check_pressed("up"))
{
	global.ButtonSelected--;
	if (global.ButtonSelected < 0)
		global.ButtonSelected = 3;
}
if (input_check_pressed("down"))
{
	global.ButtonSelected++;
	if (global.ButtonSelected > 3)
		global.ButtonSelected = 0;
}









