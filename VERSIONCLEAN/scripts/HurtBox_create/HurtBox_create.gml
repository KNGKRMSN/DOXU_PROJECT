// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function HurtBox_create(argument0, argument1, argument2, argument3){
	_hurtbox = instance_create_layer(x, y, "Instances", o_HurtBox);
	_hurtbox.owner = id;
	_hurtbox.image_xscale = argument0;
	_hurtbox.image_yscale = argument1;
	_hurtbox.xOffset = argument2;
	_hurtbox.yOffset = argument3;

	return _hurtbox;
}