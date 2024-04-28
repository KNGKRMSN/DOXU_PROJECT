/// @description Insert description here
// You can write your code in this editor
//draw_set_font(ButtonPolice)
//draw_text(100, display_get_gui_height() /2 - 200, "isinswitch = " + string(isinswitch))
/// @description Insert description here
// You can write your code in this editor
draw_set_font(ButtonPolice)
draw_set_color(c_white)
//draw_text(display_get_gui_width()/2, display_get_gui_height()/2, "cam = "+string(global.MediumAssHitStop) + "dph = " + string(display_get_gui_height()));
/*

if (playseq == true)
{
	var rect_color = c_gray; // Assuming c_gray is defined somewhere in your code
	var screen_width = display_get_gui_width(); // Get the width of the screen
	
	// Calculate the width of the rectangle (stop at 3/4 of the screen)
	var max_width = screen_width * 3 / 4;
	var max_height = 400;
	
	// Calculate the current width of the rectangle (based on time, for example)
	if (framecounter < 16)
		var current_width = max_width * (framecounter / 16); 
	else 
		var current_width = max_width// Adjust current_time and total_time as needed
	//var current_height = max_height * (framecounter / 13);
	// Draw the rectangle
	draw_set_color(rect_color);
	draw_rectangle(0, display_get_gui_height()/2 + 200, current_width, 400, true);
	framecounter++;
	if (framecounter >= 30)
	{
		framecounter = 0;
		global.GetShaedJ1 = true;
		playseq = false;
	}
}
if (global.GetShaedJ1)
{
	var rect_color = c_gray; // Assuming c_gray is defined somewhere in your code
	var screen_width = display_get_gui_width(); // Get the width of the screen

	// Calculate the width of the rectangle (stop at 3/4 of the screen)
	var max_width = screen_width * 3 / 4;
	
	// Calculate the current width of the rectangle (based on time, for example)
	var current_width = max_width - (max_width * (framecounter / 15)); // Adjust current_time and total_time as needed

	// Draw the rectangle
	draw_set_color(rect_color);
	draw_rectangle(0, display_get_gui_height()/2 + 200, current_width, 400, false);
	framecounter++;
	if (framecounter >= 15)
	{
		framecounter = 0;
		global.GetShaedJ1 = false;

	}
}*/

var dis_x = camera_get_view_x(view_camera[0]);
var dis_y = camera_get_view_y(view_camera[0]);
var dis_x2 = camera_get_view_width(view_camera[0]);
var dis_y2 = camera_get_view_height(view_camera[0]);
if (playseq == true)
{
	audio_play_sound(CROSSEXSOUND, 1, 0);
	playseq = false;
	var _sequ = seq_SheerCrossEx;
	var _layer = "UI_seq";
	
	var camera_x = camera_get_view_x(view_camera[0]);
	var camera_y = camera_get_view_y(view_camera[0]);
	if (_sequ != noone)
	{
		layersequence = layer_sequence_create(_layer, dis_x + dis_x2/2, dis_y + dis_y2/2,_sequ);
	}
}
if (layersequence != 0)
{
layer_sequence_x(layersequence, dis_x + dis_x2/2);
layer_sequence_y(layersequence, dis_y + dis_y2/2);
}

if (layer_sequence_is_finished(layersequence))
{
	global.GetShaedJ1 = false;
	layersequence = 0;
}