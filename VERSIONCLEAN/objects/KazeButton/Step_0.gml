/// @description Insert description here
// You can write your code in this editor
if (instance_exists(MusicSelect))
{
	currpos = posDown;
	title = "Kaze";
	if (MusicSelect.indexpos == 2)
	{
		curralpha = alpha;
		currsizex = sizex;
		currsizey = sizey;
		if (input_check_pressed("light"))
		{
			audio_stop_all()
			audio_play_sound(MusicKaze, 1, 0);
		}
		if (input_check_pressed("special"))
		{
			global.WhichMusic = "NoEyes"
		}
	}
	if (MusicSelect.indexpos == 1)
	{
		if (curralpha != smallalpha)
			curralpha -= 0.05;
		if (currsizex != smallsizex && currsizey != smallsizey)
		{
			 currsizex-=0.5;
			 currsizey-=0.5;
		}
		if (curralpha < smallalpha)
			curralpha = smallalpha;
		if (currsizex < smallsizex)
		{
			currsizex = smallsizex;
			currsizey = smallsizey
		}
	}
	if (MusicSelect.indexpos == 0)
	{
		if (curralpha != smallalpha)
			curralpha -= 0.05;
		if (currsizex != smallsizex && currsizey != smallsizey)
		{
			 currsizex-=0.5;
			 currsizey-=0.5;
		}
		if (curralpha < smallalpha)
			curralpha = smallalpha;
		if (currsizex < smallsizex)
		{
			currsizex = smallsizex;
			currsizey = smallsizey
		}
	}
}







