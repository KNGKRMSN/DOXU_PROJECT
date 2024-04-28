/// @description Insert description here
// You can write your code in this editor
draw_set_alpha(1);
draw_set_valign(fa_top);
draw_set_halign(fa_top);
draw_sprite(spr_RoundSwitch, i, 0, 0);
if (i >= 0 && i <= 50)
{
	draw_set_font(ComboMeterPolice);
	draw_set_valign(fa_middle);
	draw_set_halign(fa_middle);
	draw_text(display_get_gui_width()/2, display_get_gui_height()/2, "K.O.");
}
if (i >= 51 && i <= 82)
{
	if (i == 51)
		audio_play_sound(o_WhichAnnouncer._are_you_ready_sound, 1, 0);
	draw_set_font(RoundStartPolice);
	draw_set_valign(fa_middle);
	draw_set_halign(fa_middle);
	draw_text(display_get_gui_width()/2, display_get_gui_height()/2, "READY ?");
}
if (i > 82 && i <= 92)
{
	if (i == 83)
		audio_play_sound(o_WhichAnnouncer._fight_sound, 1, 0);
	draw_set_font(RoundStartPolice);
	draw_text(display_get_gui_width()/2, display_get_gui_height()/2, "FIGHT !");
}







