/// @description Insert description here
// You can write your code in this edi

if (state == 1)
{
	opponent = owner.opponent;
	speed = 0;
	image_angle = 0;
	if (index == 0)
	{
		image_xscale = xscale;
		image_yscale = yscale;
		x = owner.x -360;
		y = owner.y - 550;
	}
	if (index == 2)
	{
		image_xscale = xscale;
		image_yscale = yscale;
		x = owner.x + 360;
		y = owner.y - 200;
	}
	if (index == 4)
	{
		image_xscale = xscale;
		image_yscale = yscale;
		x = owner.x - 120;
		y = owner.y - 400;
	}
	if (index == 6)
	{
		image_xscale = xscale;
		image_yscale = yscale;
		x = owner.x + 120;
		y = owner.y - 250;
	}
}

if (state == 2)
{
	if (sprite_get_name(sprite_index) == "spr_shah")
	{
		sprite_index = spr_ShahTransi;
		image_index = 0;
	}
	if (image_index == 13)
	{
		state = 3;
		sprite_index = spr_ShahProjo;
		image_angle = point_direction(x, y, opponent.x, opponent.y - 350);
		
	}
	/*anglegoalx = approach(anglegoalx, opponent.x, 2);
	anglegoaly = approach(anglegoaly, opponent.y, 2);
	image_angle = point_distance(0, 0, anglegoalx, anglegoaly);*/
}
if (state == 3 && global.BigAssHitStop == 0)
{
	if (hitbox == -1)
	{
		hitbox = 1;
		alarm[0] = room_speed / 4 + (index * 10);
	}
	
	if (x < -1000 || x > 11000 || y > 7000 || y < -500)
	{
		instance_destroy(hitbox);
		instance_destroy(self);
	}
}







