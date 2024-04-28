/// @description Insert description here
// You can write your code in this editor
image_angle = point_direction(x, y, opponent.x, opponent.y - 350);
direction = image_angle;
speed = 200;
var pushback = calculate_pushback(image_angle, magnitude);
var x_pushback = pushback[0];
var y_pushback = pushback[1];
show_debug_message("X Pushback: " + string(x_pushback) + ", Y Pushback: " + string(y_pushback));
hitbox = instance_create_layer(x, y, "Instances", o_Hitbox);
hitbox.owner = owner;
hitbox.image_xscale = 64;
hitbox.image_yscale = 64;
hitbox.xOffset = 0;
hitbox.yOffset = 0;
hitbox.life = 10000;
hitbox.xPushBack = 0;
hitbox.yPushBack = -y_pushback;
hitbox.typeOfAttack = 1;
hitbox.placeOfAttack = 2;
hitbox.damage = 1;
hitbox.hitStun =  15;
hitbox.blockStun = 10;
hitbox.dothestep = false;
var rand = random_range(0, 3);
if (rand == 0)
	audio_play_sound(ShahShoot01Sound, 1, 0);
if (rand == 1)
	audio_play_sound(ShahShoot02Sound, 1, 0);
else
	audio_play_sound(ShahShoot03Sound, 1, 0);








