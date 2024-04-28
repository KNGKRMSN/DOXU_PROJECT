/// @description Insert description here
// You can write your code in this editor
if (place_meeting(o_Mokujin.x, o_Mokujin.y, o_WindHeavyOverHead))
{
	if (o_Mokujin.isblocking == 0)
	{
		o_Mokujin.sprite_index = spr_MokujinHitMark;
		o_Mokujin.image_index = 0;
		o_Mokujin.image_speed = 1;
		o_Mokujin.canblockinair = 1;
		o_Mokujin.verticalspeed -= 100;
		instance_destroy(self);
	}
}

