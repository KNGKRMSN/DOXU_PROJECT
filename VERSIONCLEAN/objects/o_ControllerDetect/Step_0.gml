/// @description Insert description here
// You can write your code in this editor
if (array_length(input_players_get_status().new_disconnections) > 0)
{
    input_source_mode_set(INPUT_SOURCE_MODE.JOIN);
    PauseGame();
}

if (input_join_is_finished())
{
    if (input_check_pressed("pause", 0) || input_check_pressed("pause", 1))
    {
        input_source_mode_set(INPUT_SOURCE_MODE.FIXED);
		o_Pause.pause = false;
    }
}









