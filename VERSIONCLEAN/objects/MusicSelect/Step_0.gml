/// @description Insert description here
// You can write your code in this editor
if (input_check_pressed("down"))
{
	indexpos++;
}
if (input_check_pressed("up"))
{
	indexpos--;
}
if (indexpos > 2)
	indexpos = 0;
if (indexpos < 0)
	indexpos = 2

if (input_check_pressed("heavy"))
{
	o_CameraFollowMenu.y -= 1620;
	instance_activate_object(ButtonSelect);
	global.ButtonSelected = 1;
	instance_deactivate_object(self);
}







