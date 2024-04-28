/// @description Insert description here
// You can write your code in this editor
if pause == true
{
    draw_sprite(Spr_Pause,0,0,0)
    draw_set_font(ComboMeterPolice);
    draw_text(display_get_gui_width()/2 - 800, display_get_gui_height()/2 - 400, "Hold light for help\n Press medium too quit");
	draw_text(display_get_gui_width()/2 - 1200, display_get_gui_height()/2 + 200, "If your controller is deconnected,\n fucking connect it and press start");
	if (input_check("light", 0) || input_check("light", 1))
    {
        draw_sprite(spr_Controls, 0,0, 0);
    }

}




