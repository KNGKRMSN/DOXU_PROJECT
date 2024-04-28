// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function s_Counter(argument0, argument1)
{
	var character = argument0;
	var attack = argument1;
	
	audio_play_sound(o_WhichAnnouncer._counter_sound, 1, 0);
	if (character <= 0 || character > 4)
		return;
	if (character == 1)
	{
		if (o_Windguy.facing == 1)
		{
			draw_set_font(ComboMeterPolice);
			draw_set_alpha(0.5);
			draw_text(70, 180, "COUNTER");
		}
		else
		{
			draw_set_font(ComboMeterPolice);
			draw_set_alpha(0.5);
			draw_text(700, 180, "COUNTER");
		}
	}
	if (character == 2)
	{
		if (o_Windguy.facing == 1)
		{
			draw_set_font(ComboMeterPolice);
			draw_set_alpha(0.5);
			draw_text(700, 180, "COUNTER");
		}
		else
		{
			draw_set_font(ComboMeterPolice);
			draw_set_alpha(0.5);
			draw_text(70, 180, "COUNTER");
		}
	}
	if (attack >= 1 && attack <= 3)
	{
		global.CounterBonus += 0.1;
	}
	if (attack > 3 && attack <= 6)
	{
		global.CounterBonus += 0.2;
	}
	if (attack > 6 && attack <= 10)
	{
		global.CounterBonus += 0.3;
	}
	if (attack >= 12 && attack <= 17)
	{
		global.CounterBonus += 0.2;
	}
	if (attack == 19)
		global.CounterBonus += 0.1;
	if (global.BigAssHitStop == 0)
		global.BigAssHitStop = 1;
}