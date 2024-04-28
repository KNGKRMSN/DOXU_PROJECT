/// @description Insert description here
// You can write your code in this editor

if (instance_exists(MusicSelect))
{
	draw_set_halign(fa_middle)
	draw_set_valign(fa_middle)
	draw_set_font(ButtonPolice);
	draw_set_alpha(curralpha);
	draw_text_transformed(display_get_gui_width()/2, currpos, title, currsizex, currsizey, 0);
	if (curralpha == 1)
	{
		if (global.WhichMusic == "Magellan" && MusicSelect.indexpos == 1)
			draw_sprite(spr_MusicOptions, 1, display_get_gui_width()/2 - 200, currpos + 40);
		if (global.WhichMusic == "NoEyes" && MusicSelect.indexpos == 2)
			draw_sprite(spr_MusicOptions, 1, display_get_gui_width()/2 - 200, currpos + 40);
		if (global.WhichMusic == "JustFrame" && MusicSelect.indexpos == 0)
		draw_sprite(spr_MusicOptions, 1, display_get_gui_width()/2 - 200, currpos + 40);
		if (global.WhichMusic == "" || global.WhichMusic == "Magellan" && MusicSelect.indexpos != 1 || global.WhichMusic == "NoEyes" && MusicSelect.indexpos != 2 ||global.WhichMusic == "JustFrame" && MusicSelect.indexpos != 0)
			draw_sprite(spr_MusicOptions, 0, display_get_gui_width()/2 - 200, currpos + 40);
	}
}








