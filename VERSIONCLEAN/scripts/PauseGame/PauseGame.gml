// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PauseGame(){
		o_Pause.pause = true;


        o_Pause.pauseSurf = surface_create(o_Pause.resW,o_Pause.resH);
        surface_set_target(o_Pause.pauseSurf);
            draw_surface(application_surface,0,0);
        surface_reset_target();

        if (buffer_exists(o_Pause.pauseSurfBuffer)) buffer_delete(o_Pause.pauseSurfBuffer);
        o_Pause.pauseSurfBuffer = buffer_create(o_Pause.resW * o_Pause.resH * 4, buffer_fixed, 1);
        buffer_get_surface(o_Pause.pauseSurfBuffer, o_Pause.pauseSurf, 0);
    }