// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Clouds_create(_sprite_index, _speed, _x, _y, _xscale, _yscale){
	var _clouds = instance_create_layer(_x, _y, "Instances_1", obj_clouds);
	_clouds.sprite_index = _sprite_index;
	_clouds.horizontalspeed = _speed;
	_clouds.image_xscale = _xscale;
	_clouds.image_yscale = _yscale;
	
	return(_clouds);
}