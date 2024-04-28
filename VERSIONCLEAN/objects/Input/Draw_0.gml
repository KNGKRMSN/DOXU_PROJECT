// Check the Visible checkbox in order to see the content of the input_buffer.
draw_set_color(c_black);
for(var i=0; i<ds_list_size(input_buffer); i++) {
	draw_text(x+50*i, y, ib_get(input_buffer, i, 0));
	draw_text(x+50*i, y+20, ib_get(input_buffer, i, 1));
}
draw_set_color(c_white);