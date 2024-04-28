/// @description ib_key_getpos()
/// @param key
function ib_key_getpos(argument0) {

	var key = argument0;

	// Searches in a list the position of the key.
	// If there are more than one matches in the list, it only returns the position of the first.
	// If the key is not on the list, it returns a -1-

	var pos = NOT_FOUND;
	var iterator=0;
	var value_found = false;

	// This loop iterates through each position in the list.
	while (iterator<ds_list_size(self_input.input_buffer) && !value_found) {
		if ib_get( self_input.input_buffer, iterator, 0) == key {
			pos = iterator;
			value_found = true;	
		}
		iterator++;
	}

	return pos


}
