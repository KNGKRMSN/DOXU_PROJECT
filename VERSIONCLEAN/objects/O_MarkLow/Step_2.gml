/// @description Insert description here
// You can write your code in this editor
if (place_meeting(o_Mokujin.x, o_Mokujin.y, o_WindHeavyCrouch))
{
	if (o_Mokujin.isblocking == 0)
	{
		instance_destroy(self);
	}
}

