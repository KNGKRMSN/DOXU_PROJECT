// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Fx_create(_fx, _xoffset, _yoffset, _follow=true, _dontswitch=false){
	var fx = instance_create_layer(x + _xoffset, y+_yoffset, "Instances_1", o_Fx);
	fx.sprite_index = _fx;
	fx.xOffset = _xoffset;
	fx.yOffset = _yoffset;
	fx.follow = _follow;
	fx.dontswitch = _dontswitch;
	fx.owner = id;
	
	return (fx);
}