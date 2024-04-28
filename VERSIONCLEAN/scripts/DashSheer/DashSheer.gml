// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function DashSheer(dir, dash_spd, dashlen){
	var dash_dir = 0;
	if (dir == "right")
		dash_dir = 0;
	if (dir == "left")
		dash_dir = 180;
	if (dir == "down")
		dash_dir = 90;
	if (dir == "up")
		dash_dir = 270;
}