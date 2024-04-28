// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function s_ShakeChar(argument0, argument1){
	_player = argument0;
	if (argument1 == 0)
	{
		var start_x = _player.x
	}
	var ran_x = irandom_range(round(_player.x - 6), round(_player.x + 6));
	move_towards_point(round(ran_x), _player.y, 6);
}