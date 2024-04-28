/// @description
// Inherit the parent event
event_inherited();

//	Draw command to use button
var com_sca = 0.8;
var com_col = c_white;

if(usable==false) com_col = c_gray;

draw_sprite_ext(comm_spr, 0, x -24, y-24, com_sca, com_sca,0,com_col,1);

if(usable==false)
{
	draw_sprite_ext(spr_unusable, 0, x, y, 1, 1,0,c_dkgray,1);
}