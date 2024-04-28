// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ProximityBox_create(_imagexscale, _imageyscale, _life){
	_hitbox = instance_create_layer(x, y, "Instances", o_ProximityBox);
	_hitbox.image_xscale = _imagexscale;
	_hitbox.image_yscale = _imageyscale;
	_hitbox.life = _life;
	_hitbox.owner = id;
}