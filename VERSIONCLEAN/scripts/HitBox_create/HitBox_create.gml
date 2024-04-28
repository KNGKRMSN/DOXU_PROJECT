// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function HitBox_create(_imagexscale, _imageyscale, _xOffset, _yOffset, _life, _xPushBack, _yPushBack, _typeOfAttack, _placeOfAttack, _damage, _hitStun, _blockStun){
	_hitbox = instance_create_layer(x, y, "Instances", o_Hitbox);
	_hitbox.owner = id;
	_hitbox.image_xscale = _imagexscale;
	_hitbox.image_yscale = _imageyscale;
	_hitbox.xOffset = _xOffset;
	_hitbox.yOffset = _yOffset;
	_hitbox.life = _life;
	_hitbox.xPushBack = _xPushBack;
	_hitbox.yPushBack = _yPushBack;
	_hitbox.typeOfAttack = _typeOfAttack;
	_hitbox.placeOfAttack = _placeOfAttack;
	_hitbox.damage = _damage;
	_hitbox.hitStun = _hitStun;
	_hitbox.blockStun = _blockStun;
	
	return _hitbox;
}