/// @description ib_key_check_ext()
/// @param key
/// @param mintime
function ib_key_check_ext(argument0, argument1) {

	var key = argument0;
	var minimum = argument1;

	// Check if a key is inside the input_buffer.
	var key_index = ib_key_check( key);

	if key_index == -1 
		return NOT_FOUND

	// Check if the key lifetime is greater than the minimum.
	if (current_time - ib_get(self_input.input_buffer, key_index, 1) > minimum) {
		return true
	} else {
		return false
	}


}
