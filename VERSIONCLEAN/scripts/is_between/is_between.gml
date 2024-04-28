/// @description is_between()
/// @param value
/// @param min
/// @param max
function is_between(argument0, argument1, argument2) {

	var value = argument0;
	var min_value = argument1;
	var max_value = argument2;

	// Check if a variable is between 2 values.

	var a = value > min_value;
	var b = value < max_value;

	return a&b


}
