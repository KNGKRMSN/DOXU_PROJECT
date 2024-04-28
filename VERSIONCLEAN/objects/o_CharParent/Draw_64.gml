/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor
display_set_gui_size(1920, 1080);
if (global.PlayerOne.index == _buttonnb)
{
	_selected[1] = 1;
}
else
	_selected[1] = 0;

if (instance_exists(global.PlayerTwo))
{
	if (global.PlayerTwo.index == _buttonnb)
	{
		_selected[2] = 1;
	}
	else
	_selected[2] = 0;
}

if (instance_exists(global.PlayerThree))
{
	if (global.PlayerThree.index == _buttonnb)
	{
		_selected[3] = 1;
	}
	else
		_selected[3] = 0;
}
if (instance_exists(global.PlayerFour))
{
	if (global.PlayerFour.index == _buttonnb)
	{
		_selected[4] = 1;
	}
	else
		_selected[4] = 0;
}
if (_selected[1] == 1)
{
	var i = 0;
	draw_sprite(_buttonsplashart, i, _splashartJ1x - xOffset, _splashartJ1y);
	i++;
}
if (_selected[2] == 1)
{
	var i = 0;
	draw_sprite(_buttonsplashart, i, _splashartJ2x + xOffset, _splashartJ2y);
	i++;
}
if (_selected[3] == 1)
{
	var i = 0;
	draw_sprite_ext(_buttonsplashart, i, _splashartJ3x, _splashartJ3y, -1, 1, 0, c_white, 1);
	i++;
}
if (_selected[4] == 1)
{
	var i = 0;
	draw_sprite_ext(_buttonsplashart, i, _splashartJ4x, _splashartJ4y, -1, 1, 0, c_white, 1);
	i++;
}


















