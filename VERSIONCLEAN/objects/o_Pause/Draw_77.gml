/// @description Insert description here
// You can write your code in this editor
gpu_set_blendenable(false);

if (pause)
{
    surface_set_target(application_surface);
        if (surface_exists(pauseSurf)) draw_surface(pauseSurf,0,0);
        else
        {
            pauseSurf = surface_create(resW,resH);
            buffer_set_surface(pauseSurfBuffer,pauseSurf,0);
        }
    surface_reset_target();
    if (input_check_pressed("medium", 0) || input_check_pressed("medium", 1))
    {
        room_goto(rm_Menu);
    }
}
if ((input_check_pressed("pause", 0) || input_check_pressed("pause", 1)) && pause)
    {
        pause = false;
        instance_activate_all();
        if (surface_exists(pauseSurf)) surface_free(pauseSurf);
        if (buffer_exists(pauseSurfBuffer)) buffer_delete(pauseSurfBuffer);
    }
if (input_check_long("pause", 0) || input_check_long("pause", 1))
{
	if (!pause)
	{
       PauseGame()
	}
}

gpu_set_blendenable(true);




