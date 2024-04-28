/// @description Insert description here
// You can write your code in this editor
if (global.UI_WhereAreWe == 0)
{
	x += horizontalspeed;
	if (x > 1900)
	{
		x = -1200;
		y = random_range(0, 720);
		image_index = 0;
	}
}
else
{
	if (x < 1900 && x > 640)
		x+=10;
	if (x > -1200 && x <= 640)
		x-=10;
}
if (image_index == 350)
	image_speed = -1;
if (image_index == 0)
	image_speed = 1;