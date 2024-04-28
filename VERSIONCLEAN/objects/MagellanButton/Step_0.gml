/// @description Insert description here
// You can write your code in this editor
if (instance_exists(MusicSelect))
{
	title = "Magellan";
	currpos = posMid;
	if (MusicSelect.indexpos == 1)
	{
		curralpha = alpha;
		currsizex = sizex;
		currsizey = sizey;
		if (input_check_pressed("light"))
		{
			audio_stop_all()
			audio_play_sound(MusicMagellan, 1, 0);
		}
		if (input_check_pressed("special"))
		{
			global.WhichMusic = "Magellan"
		}
	}
	if (MusicSelect.indexpos == 2)
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








