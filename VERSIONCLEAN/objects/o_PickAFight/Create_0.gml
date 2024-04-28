/// @description Insert description here
// You can write your code in this editor
display_set_gui_size(1920, 1080);
players[0] = o_P1;
players[1] = o_P2;
players[2] = o_P3;
players[3] = o_P4;

global.P1spotx = display_get_gui_width()/2 - 300;
global.P1spoty = display_get_gui_height()/2 + 200;
global.P1spotfree = true;

global.P2spotx = display_get_gui_width()/2 - 500;
global.P2spoty = display_get_gui_height()/2 - 200;
global.P2spotfree = true;

global.P3spotx = display_get_gui_width()/2 + 300;
global.P3spoty = display_get_gui_height()/2 + 200;
global.P3spotfree = true;

global.P4spotx = display_get_gui_width()/2 + 500;
global.P4spoty = display_get_gui_height()/2 - 200;
global.P4spotfree = true;

//Set the number of players required to exactly 2
input_join_params_set(1, 2, "heavy", undefined);

//Start the JOIN source mode, enabling automatic device assignment
input_source_mode_set(INPUT_SOURCE_MODE.JOIN);





