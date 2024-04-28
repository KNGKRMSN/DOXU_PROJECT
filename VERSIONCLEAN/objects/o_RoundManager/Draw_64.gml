/// @description Insert description here
// You can write your code in this editor
draw_set_halign(fa_middle);
draw_set_valign(fa_middle);
if (alarm[0])
{
	if (done == 0)
	{
		done = 1;
		audio_play_sound(o_WhichAnnouncer._ko_sound, 1, 0);
	}
	draw_set_font(ComboMeterPolice)
	draw_set_alpha(1);
	draw_text(display_get_gui_width()/2, display_get_gui_height()/2, "K.O.")
}

if (alarm[1])
{
	if (done == 0)
	{
		done = 1;
		audio_play_sound(o_WhichAnnouncer._team_1_win_sound, 1, 0);
	}
	draw_set_font(ComboMeterPolice)
	draw_set_alpha(1);
	draw_text(display_get_gui_width()/2, display_get_gui_height()/2, "PLAYER ONE WINS");
}
if (alarm[2])
{
	if (done == 0)
	{
		done = 1;
		audio_play_sound(o_WhichAnnouncer._team_2_win_sound, 1, 0);
	}
	draw_set_font(ComboMeterPolice)
	draw_set_alpha(1);
	draw_text(display_get_gui_width()/2, display_get_gui_height()/2, "PLAYER TWO WINS");
}









