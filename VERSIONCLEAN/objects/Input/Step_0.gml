// Inserts keys into the input buffer.
if keyboard_check_pressed(vk_anykey) {
	ds_list_add(input_buffer, [keyboard_key, current_time]);
}

// Checks if an element inside the list surpases the input_buffer max time.
// If it so, it deletes the element from the ds_list.
if ds_list_size(input_buffer) > 0 {
	while(current_time - ib_get( input_buffer, 0, 1) > IB_MAX_TIME) {
		ds_list_delete(input_buffer, 0);
		if ds_list_size(input_buffer) == 0 break;
	}
}