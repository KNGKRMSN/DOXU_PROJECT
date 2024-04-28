/// @description ib_key_delete()
/// @arg key
function ib_key_delete(argument0) {

	var key = argument0;

	// This function deletes a key from the input buffer.
	var pos = ib_key_getpos(key);

	if (pos >= 0) {
		ds_list_delete(self_input.input_buffer, pos);	
	} else {
		return NOT_FOUND	
	}


}
