/// @description Insert description here
// You can write your code in this editor
if (o_Pause.pause == false && global.CantPlayYet == 0)
{
	totalSeconds -= (delta_time/1000000); //equals 1 second

	var t,years,days,hours,minutes,seconds,timerDisplay;

	//Integer Math
	t = (1);           

	seconds = (totalSeconds div t);

	if (seconds < 10) seconds = "0"+string(seconds); 
	else              seconds =     string(seconds);

//Combine above strings into one string
	timerDisplay = seconds;

	col = #FFFFFF;
//	draw_sprite(spr_FullMoon, 0, x - 280, y +30);
	draw_set_color(col);

	draw_set_font(RoundStartPolice);
	draw_set_valign(fa_middle);
	draw_set_halign(fa_middle);
	draw_text(display_get_gui_width()/2,y + 150, timerDisplay);
}

if (o_Pause.pause == true)
{
	col = #9E0B0F;
	draw_sprite(spr_FullMoon, 0, x - 280, y +30);
	draw_set_color(col);

	draw_set_font(TimerPolice);

	draw_text(x -320,y + 20, totalSeconds);
}