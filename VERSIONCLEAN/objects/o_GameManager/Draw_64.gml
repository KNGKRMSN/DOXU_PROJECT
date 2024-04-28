/// @description Insert description here
// You can write your code in this editor
/*draw_set_font(ButtonPolice);

draw_text(display_get_gui_width()/2, display_get_gui_height()/2, string(global._activeplayers[2].opponent)+ " " + string(PandC.player3characterID))
*/
display_set_gui_size(2560, 1440)
if (global._activeplayers[1] != -1)
{
	draw_set_halign(fa_top);
	draw_set_valign(fa_top);
	draw_set_alpha(1);
	textxScale = approach(textxScale,1,0.03);
	textyScale = approach(textyScale,1,0.03);

	if (global._activeplayers[2].isgettingcomboed > 1 && global._activeplayers[2].facing == 1)
	{
		draw_set_halign(fa_right);
		draw_set_font(ComboMeterPolice);
		draw_set_alpha(0.5);
		draw_text_ext_transformed(display_get_gui_width() - 70, 450, string(global._activeplayers[2].isgettingcomboed) + " HITS", 1000, 1000, textxScale, textyScale, 0);
	}
	if (global._activeplayers[2].isgettingcomboed > 1 && global._activeplayers[2].facing == -1)
	{
		draw_set_halign(fa_top);
		draw_set_font(ComboMeterPolice);
		draw_set_alpha(0.5);
		draw_text_ext_transformed(70, 450, string(global._activeplayers[2].isgettingcomboed) + " HITS", 1000, 1000, textxScale, textyScale, 0);
	}

	if (global._activeplayers[1].isgettingcomboed > 1 && global._activeplayers[1].facing == 1)
	{
		draw_set_halign(fa_right);
		draw_set_font(ComboMeterPolice);
		draw_set_alpha(0.5);
		draw_text_ext_transformed(display_get_gui_width() - 70, 450, string(global._activeplayers[1].isgettingcomboed) + " HITS", 1000, 1000, textxScale, textyScale, 0);
	}
	if (global._activeplayers[1].isgettingcomboed > 1 && global._activeplayers[1].facing == -1)
	{
		draw_set_halign(fa_top);
		draw_set_font(ComboMeterPolice);
		draw_set_alpha(0.5);
		draw_text_ext_transformed(70, 450, string(global._activeplayers[1].isgettingcomboed) + " HITS", 1000, 1000, textxScale, textyScale, 0);
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

	if (global.CantPlayYet == 0)
	{
		col = draw_get_color()
		draw_set_alpha(1);
		//UI J1
		draw_sprite(spr_LifebarJ1, global._activeplayers[1].currentSpecial, 0, 0);
		//draw_sprite(Spr_UltimateBarJ1, 0, global.UltibarJ1xborder, global.UltibarJ1yborder); //Spe UI
		//draw_sprite(spr_SheerMiniJ1, 0, global.CharingameJ1x, global.CharingameJ1y); 
		draw_sprite_stretched(spr_healthbarcontent, 0, 278, 197, (global._activeplayers[1].currentHealth / global._activeplayers[1].maxHealth) * global.healthbarw, global.healthbarh); //Hp
		//Spe
		//draw_sprite_stretched(spr_Ultimatebarcontent, 0, global.UltibarJ1x, display_get_height(), (global.CurrentUltiJ1 / global.UltiJ1) * global.Ultibarw, global.Ultibarh); // Ult
		draw_sprite(spr_LifebarJ1Top, 0, 0, 0);

		/*if (global.CurrentHealthJ1 == global.HealthJ1)
		{
			draw_sprite( spr_healthbarcontentshineP1, i, 135, 40);
			i++;
			if (i = 74)
				i = 0;
		}
		if (global.CurrentUltiJ1 == global.UltiJ1)
		{
			draw_set_color(c_blue);
			draw_sprite_ext(spr_ultibarcontentshineP1, i, global.UltibarJ1x, global.Ultibary + 5, 1, 1, 1, #00FFFF, 255)
			draw_set_color(col);
		}*/
		// UI J2
		//Hp UI
		draw_sprite(spr_LifebarJ2, global._activeplayers[2].currentSpecial, 0, 0);
	//	draw_sprite(Spr_UltimateBarJ2, 0, global.UltibarJ2xborder, global.UltibarJ2yborder); //Ult UI
	//	draw_sprite(spr_SheerMiniJ2, 0, global.CharingameJ2x, global.CharingameJ2y); 
		draw_sprite_stretched(spr_healthbarcontent, 0, 1492, 197,(global._activeplayers[2].currentHealth / global._activeplayers[2].maxHealth) * global.healthbarw, global.healthbarh); //Hp
		//draw_sprite_stretched(spr_Ultimatebarcontent, 0, global.UltibarJ2x, display_get_height(), (global.CurrentUltiJ2 / global.UltiJ2) * global.Ultibarw, global.Ultibarh); //Ult
		draw_sprite(spr_LifebarJ2Top, 0, 0, 0)
	/*	if (global.CurrentHealthJ2 == global.HealthJ2)
		{
	
			draw_sprite( spr_healthbarcontentshineP2, i, global.healthbarJ2x, 40)
		}

		if (global.CurrentUltiJ2 == global.UltiJ2)
		{
	
			draw_sprite_ext( spr_ultibarcontentshineP2, i, global.UltibarJ2x, global.Ultibary, 1, 1, 1, #00FFFF, 255)
		}*/
	}
}




