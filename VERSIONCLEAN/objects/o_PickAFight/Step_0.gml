/// @description Insert description here
// You can write your code in this editor


if (global.P1spotfree == false && global.P3spotfree == false && input_check_long("special"))
{
	input_source_mode_set(INPUT_SOURCE_MODE.FIXED);
	for (var _inst = 0; _inst < input_player_connected_count(); _inst++)
	{
		if (players[_inst].x == global.P1spotx && players[_inst].y == global.P1spoty)
			global.PlayerOne = players[_inst];
		if (players[_inst].x == global.P2spotx && players[_inst].y == global.P2spoty)
			global.PlayerTwo = players[_inst];
		if (players[_inst].x == global.P3spotx && players[_inst].y == global.P3spoty)
			global.PlayerThree = players[_inst];
		if (players[_inst].x == global.P4spotx && players[_inst].y == global.P4spoty)
			global.PlayerFour = players[_inst];
	}
	room_goto(rm_Play);
}

if (input_check_long("pause"))
{
	if instance_exists(o_P1)
		instance_destroy(o_P1)
	if instance_exists(o_P2)
		instance_destroy(o_P2)
	if instance_exists(o_P3)
		instance_destroy(o_P3)
	if instance_exists(o_P4)
		instance_destroy(o_P4)
	room_goto(rm_Menu);
}







