/// @description Insert description here
// You can write your code in this editor
draw_set_halign(fa_top);
draw_set_valign(fa_top);
textxScale = approach(textxScale,1,0.03);
textyScale = approach(textyScale,1,0.03);
if (pAndC.player1characterID.isgettingcomboed > 1 && pAndC.player1characterID.facing == 1)
{
	draw_set_halign(fa_right);
	draw_set_font(ComboMeterPolice);
	draw_set_alpha(0.5);
	draw_text_ext_transformed(display_get_gui_width() - 70, 450, string(pAndC.player1characterID.isgettingcomboed) + " HITS", 1, 0, textxScale, textyScale, 0);
	if (notatruecombo == 1)
		draw_text(display_get_gui_width() -70, 650, "NOT TRUE");
}
if (pAndC.player1characterID.isgettingcomboed > 1 && pAndC.player1characterID.facing == -1)
{
	draw_set_halign(fa_top);
	draw_set_font(ComboMeterPolice);
	draw_set_alpha(0.5);
	draw_text_ext_transformed(70, 450, string(pAndC.player1characterID.isgettingcomboed) + " HITS", 1, 0, textxScale, textyScale, 0);
	if (notatruecombo == 1)
		draw_text(70, 650, "NOT TRUE");
}

if (pAndC.player1characterID.isgettingcomboed != pAndC.player1characterID.isgettingcomboedpreviouswindguy)
{
	textxScale = 2;
	textyScale = 2;
}


if (done = 1)
{
	done = 0
	if (!audio_is_playing(o_WhichAnnouncer._impressive_combo_sound))
	audio_play_sound(o_WhichAnnouncer._impressive_combo_sound, 1, 0);
}
if (done2 = 1)
{
	done2 = 0;
	if (!audio_is_playing(o_WhichAnnouncer._sweet_combo_sound))
	audio_play_sound(o_WhichAnnouncer._sweet_combo_sound, 1, 0);
}