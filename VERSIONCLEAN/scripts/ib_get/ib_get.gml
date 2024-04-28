/// @description ib_get()
/// @param list
/// @param list_index
/// @param array_index
function ib_get(argument0, argument1, argument2) {

	var ib = argument0;
	var index = argument1;
	var keyortime = argument2;

	// This function goes to the input buffer and gets the array.
	// It also returns an element inside the array contained by the list.

	// Checks if the list is greater than zero.
	if (ds_list_size(ib) > index) {
	
		var aux = ds_list_find_value( ib, index);
		return aux[keyortime]
	
	} else {
	
		// If the index is bigger than the list, it returns a -1.
		return NOT_FOUND
	}


}
