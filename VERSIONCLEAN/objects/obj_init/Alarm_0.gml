if (texture_is_ready("UI"))
{
	Clouds_create(spr_Clouds, 3, -1200, 200, 1, 1);
	Clouds_create(spr_Clouds, 1, -1200, 500, 0.5, 0.5);
	obj_UI_world.Open(obj_UI_world.Main);
	
	audio_play_sound(DRRRRSOUND, 1, 0);
	global.UI_WhereAreWe = 0;
	audio_play_sound(MusicMenuStart, 1, 0);
	startMusicLoop = 0;
	obj_PlayerController.inputmode = obj_PlayerController.IM_worldUI;
}
else
	alarm[0] = 100;

if (keyboard_check(ord("F")))
	global.UsingFMod = true;