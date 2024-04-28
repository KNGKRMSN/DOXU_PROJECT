/// @description Insert description here
// You can write your code in this editor
display_set_gui_size(1920, 1080);
for (var _player = 0; _player < INPUT_MAX_PLAYERS; _player++)
{
    if (input_player_connected(_player))
    {
		if (!instance_exists(players[_player]))
			instance_create_layer(display_get_gui_width()/2 - 50, display_get_gui_height()/2 - 400 + (100 * _player), "Instances_1", players[_player]);
    }
    else
    {
        draw_sprite(spr_player_disconnected_icon, 0, display_get_gui_width()/2 - 50, display_get_gui_height()/2 - 400 + (100 * _player));
    }
}

draw_text(display_get_gui_width() -1000, display_get_gui_height() - 200, "Hold Start to go back to menu \n Press Heavy to disconnect")







