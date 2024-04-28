/// @description Insert description here
// You can write your code in this editor
draw_set_alpha(i2);
draw_set_alpha(1);
draw_sprite(spr_BeginFight, i, 0, 0);

if i >= 68
	hasTheAnimationEnded = 1;
if (hasTheAnimationEnded == 0)
{
	draw_set_alpha(i2);
	draw_set_font(RoundStartPolice);
	draw_set_halign(fa_middle);
	draw_set_valign(fa_middle);
	draw_text(display_get_gui_width()/2, display_get_gui_height()/2, "THE LIGHT IS SHED \nBETWEEN THESE \nBRAVE WARRIORS\n READY ?");
	if (!audio_is_playing(o_WhichAnnouncer._begin_fight_sound) && !audio_is_playing(o_WhichAnnouncer._are_you_ready_sound) && done == 0)
	{
		if (global.WhichMusic == "Magellan")
			global.Music = audio_play_sound(MusicMagellan, 1, 1);
		if (global.WhichMusic == "Kaze" || global.WhichMusic == "")
			global.Music = audio_play_sound(MusicKazeIntro, 1, 0);
		if (global.WhichMusic == "JustFrame")
			global.Music = audio_play_sound(MusicJustFrame, 1, 1);
		done = 1;
		audio_play_sound(o_WhichAnnouncer._are_you_ready_sound, 1, 0);
	}
}
if (hasTheAnimationEnded == 1)
{
	if (!alarm[0])
	{
		audio_play_sound(o_WhichAnnouncer._fight_sound, 1, 0);
		alarm[0] = room_speed * 2;
	}
	draw_set_halign(fa_middle);
	draw_set_valign(fa_middle);
	draw_text(display_get_gui_width()/2, display_get_gui_height()/2, "FIGHT");
}









