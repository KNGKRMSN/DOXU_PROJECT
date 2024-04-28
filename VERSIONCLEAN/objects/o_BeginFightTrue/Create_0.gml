/// @description Insert description here
// Create Event
display_set_gui_size(1920, 1080)
blockWidth = display_get_gui_width() / 2; // Set the width of each block
blockHeight = display_get_gui_height();
// Set the height of each block
speed = 2; // Set the speed of the blocks

// Draw the blocks

// Block on the left (moves from bottom to top)
startY1 = display_get_gui_height();
endY1 = startY1 + blockHeight;

// Block on the right (moves from top to bottom)
startY2 = - blockHeight - 1;
endY2 = startY2 + blockHeight;


i = 10;
alpha = 1;
state = 0;


