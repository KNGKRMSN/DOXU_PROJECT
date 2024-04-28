/// @description Insert description here
// You can write your code in this editor
dash = false;
verticalspeed = 0;
if (!place_meeting(x, y+10, o_Ground))
{
	sprite_index = spr_WindGuyJump;
	if (dash_dir == 0)
		horizontalspeed = 50;
	if (dash_dir == 180)
		horizontalspeed = -50;
}
alarm[1] = room_speed / 4;
done1 = 0;










