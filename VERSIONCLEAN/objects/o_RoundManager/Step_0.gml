/// @description Insert description here
// You can write your code in this editor
if (global.CantPlayYet == 0)
{
	if (O_Timer.totalSeconds <= 0)
	{
		if (global.CurrentHealthJ1 > global.CurrentHealthJ2)
		{
			Pwin = 1;
			if (!alarm[0])
				alarm[0] = room_speed * 2;
		}
		else
		{
			Pwin = 2;
			if (!alarm[0])
				alarm[0] = room_speed * 2;
		}
	}
	if (global.CurrentHealthJ2 <= 0)
	{
		Pwin = 1;
			if (!alarm[0])
				alarm[0] = room_speed * 2;
	}
	if (global.CurrentHealthJ1 <= 0)
	{
		Pwin = 2;
			if (!alarm[0])
				alarm[0] = room_speed * 2;
	}
}

if (o_Windguy.roundsWon == 2)
{
	if (!alarm[1])
		alarm[1] = room_speed * 2;
}








