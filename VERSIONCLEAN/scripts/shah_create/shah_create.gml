// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function shah_create(_x, _y, _xscale, _yscale, _under, _owner, _index){
	if _under == true
	{
		var _shah = instance_create_layer(_x, _y, "Instances_shadows",o_ShahUnder);
	}
	else
		var _shah = instance_create_layer(_x, _y, "Instances_1",o_ShahOver);
	_shah.xscale = _xscale;
	_shah.yscale = _yscale;
	_shah.owner = _owner;
	_shah.index = _index;
	return(_shah);
}