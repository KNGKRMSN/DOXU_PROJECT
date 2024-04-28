/// @description Insérez la description ici
// Vous pouvez écrire votre code dans cet éditeur
dash = false;
verticalspeed = 0;
if (!place_meeting(x, y+10, o_Ground))
{
	if (dash_dir == 0)
		horizontalspeed = 35;
	if (dash_dir == 180)
		horizontalspeed = -35;
}
alarm[1] = room_speed / 4;
done1 = 0;








