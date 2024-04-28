/// @description Insert description here
// You can write your code in this editor
life--;
if (place_meeting(x, y, global._activeplayers[1]) && owner != global._activeplayers[1])
{
	if (place_meeting(global._activeplayers[1].x, global._activeplayers[1].y+1, o_Ground)  && (global._activeplayers[1].isblocking == 1 || global._activeplayers[1].isblocking == 2))
	{
		global._activeplayers[1].isinblock = true;
		global._activeplayers[1].blockStun = life;
		//audio_play_sound(MusicKaze, 1, 0)
	}
}

if (place_meeting(x, y, global._activeplayers[2]) && owner != global._activeplayers[2])
{
	if (place_meeting(global._activeplayers[2].x, global._activeplayers[2].y+1, o_Ground) && (global._activeplayers[2].isblocking == 1 || global._activeplayers[2].isblocking == 2))
	{
		global._activeplayers[2].isinblock = true;
		global._activeplayers[2].blockStun = life;
		//audio_play_sound(MusicKaze, 1, 0)
	}
}







