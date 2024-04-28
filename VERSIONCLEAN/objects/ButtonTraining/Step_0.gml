/// @description Insert description here
// You can write your code in this editor
if (global.ButtonSelected == 1)
{
	image_xscale = 1.6;
	image_yscale = 1.6;
	if (input_check_pressed("special") && input_player_connected_count() == 1 )
	{
		input_source_mode_set(INPUT_SOURCE_MODE.FIXED);
		audio_stop_all()
		instance_destroy(o_GameManager)
		alarm[0] = room_speed /2;
		//instance_create_layer(0, 0, "Instances_1", o_GameManager)
	}
}
if (global.ButtonSelected != 1)
{
	image_xscale = 1.3;
	image_yscale = 1.3;
}










