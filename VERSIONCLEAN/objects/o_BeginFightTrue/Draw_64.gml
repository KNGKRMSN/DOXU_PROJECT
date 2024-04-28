/// @description Insert description here
// You can write your code in this editor

if (state == 0)
{
	state = 1;
	audio_play_sound(VSLOADINGSOUND, 1, 0);
}

if (state == 1)
{
	display_set_gui_size(1920, 1080)
	draw_rectangle_color(0, 0, display_get_gui_width(), display_get_gui_height(), c_black, c_black, c_black, c_black, false);

	if (speed < 5)
	{
		speed += 0.1;
	}
	if (speed >= 5 && speed < 10)
		speed += 0.2;
	if (speed >= 10 && speed < 15)
		speed += 0.4;
	// Draw the blocks
	// Draw the blocks
	draw_rectangle_color(0, startY1, blockWidth, endY1, c_yellow, c_yellow, c_white, c_white, false);
	draw_rectangle_color(display_get_gui_width() - blockWidth, startY2, display_get_gui_width(), endY2, c_white, c_white, c_yellow, c_yellow, false);

	// Update block positions
	if (startY1 > 0) {
	    startY1 -= speed;
	    endY1 -= speed;
	}

	if (endY2 < display_get_gui_height()) {
	    startY2 += speed;
	    endY2 += speed;
	}
	draw_sprite_ext(spr_SheerSelect, 0, 0, endY1 + 20, 1, 1, 0, c_white, alpha);
	draw_sprite_ext(spr_SheerSelect, 0, display_get_gui_width() - 160, endY2, -1, 1, 0, c_white, alpha);
	if (startY1 <= 0)
	{
		draw_sprite_ext(spr_VS, 0, display_get_gui_width()/2 - sprite_get_width(spr_VS) /2, display_get_gui_height()/2 - sprite_get_height(spr_VS) /2, i, i, 0, c_white, 1);
		if i > 1
			i -= 0.2;
	}
	if (i == 1)
	{
		//audio_play_sound(VSBOOMERSOUND, 1, 0);
		texturegroup_load("SheerAttacks");
		if (texture_is_ready("SheerAttacks"))
			texturegroup_load("SheerHitBlockMovement");
		if (texture_is_ready("SheerHitBlockMovement"))
			texturegroup_load("SheerFx");
		input_join_params_set(1, 2, "assistduo", undefined);
		//Start the JOIN source mode, enabling automatic device assignment
		input_source_mode_set(INPUT_SOURCE_MODE.JOIN);
		
	}
}
if (texture_is_ready("SheerFx") && state ==1)
	state = 2;
if (state == 2)
{
	display_set_gui_size(1920, 1080)
	draw_rectangle_color(0, startY1, blockWidth, endY1, c_yellow, c_yellow, c_white, c_white, false);
	draw_rectangle_color(display_get_gui_width() - blockWidth, startY2, display_get_gui_width(), endY2, c_white, c_white, c_yellow, c_yellow, false);
	draw_sprite_ext(spr_SheerSelect, 0, 0, endY1 + 20, 1, 1, 0, c_white, alpha);
	draw_sprite_ext(spr_SheerSelect, 0, display_get_gui_width() - 160, endY2, -1, 1, 0, c_white, alpha);
	draw_sprite_ext(spr_VS, 0, display_get_gui_width()/2 - sprite_get_width(spr_VS) /2, display_get_gui_height()/2 - sprite_get_height(spr_VS) /2, i, i, 0, c_white, alpha);
	if (startY1 < 0) {
	    startY1 -= speed;
	    endY1 -= speed;
	}

	if (endY2 > display_get_gui_height()) {
	    startY2 += speed;
	    endY2 += speed;
	}
	
	if (alpha > 0)
		alpha -= 0.1;
	if (startY1 > 0)
		state = 3
}





