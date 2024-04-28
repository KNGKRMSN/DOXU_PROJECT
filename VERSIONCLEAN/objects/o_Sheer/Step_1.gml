/// @opponent check
// You can write your code in this editor
if (global._activeplayers[1] == id)
{
	opponent = global._activeplayers[2];
}
if (global._activeplayers[2] == id)
{
	opponent = global._activeplayers[1];
}

if (keyboard_check_pressed(ord("F")))
	global.UsingFMod = !global.UsingFMod;






