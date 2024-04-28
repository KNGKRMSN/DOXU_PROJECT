/// @description ib_key_check()
/// @param key
function ib_key_check(argument0) {

	var key = argument0;

	// This function checks if a key is inside the input buffer.
	if ib_key_getpos(key) >= 0 {
		return true	
	} else {
		return false
	}

}
