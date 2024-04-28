// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function calculate_pushback(angle, magnitude){
	 // Convert angle to radians if it's in degrees
    angle_rad = degtorad(angle);

    // Calculate x and y components using trigonometry
    x_pushback = magnitude * cos(angle_rad);
    y_pushback = magnitude * sin(angle_rad);

    return [x_pushback, y_pushback];
}