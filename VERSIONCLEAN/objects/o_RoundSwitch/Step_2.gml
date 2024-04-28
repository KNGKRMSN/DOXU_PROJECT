/// @description Insert description here
// You can write your code in this editor
if (i < 93)
i += 0.5;
if (i >= 93)
{
	global.CantPlayYet = 0;
	instance_destroy(self);
}