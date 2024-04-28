/// @description Insert description here
// You can write your code in this editor
if (o_Pause.pause == false && global.CantPlayYet == 0)
{
	down = input_check("down", player);
	mediumattack = input_check_pressed("medium", player);
	heavyattack = input_check("heavy", player);
	specialattack = input_check("special", player);
	right = input_check("right", player);
	left = input_check("left", player);
	jump = input_check("up", player);
	lightattack = input_check_pressed("light", player);
	special2 = input_check("special2", player);
	
	
	if (state == SHADOWSTATE.GRAB)
	{
		
	}
	if (state == SHADOWSTATE.GUARD)
	{
		if (master.hurtboxshadow == -1)
		{
			with (master)
				hurtboxshadow = HurtBox_create(300,300,-150,-600)
		}
		if (left && !down && currguard != CURRGUARD.LU)
		{
			currguard = CURRGUARD.LU;
			master.hurtboxshadow.xOffset = hbbaseposx;
			master.hurtboxshadow.yOffset = hbbaseposy;
			master.hurtboxshadow.xOffset -= 200;
			if (master.facing == -1)
			{
				master.isblocking = 2;
			}
			else
				master.isblocking = 0;
		}
		if (left && down && currguard != CURRGUARD.LD)
		{
			currguard = CURRGUARD.LD;
			master.hurtboxshadow.xOffset = hbbaseposx;
			master.hurtboxshadow.yOffset = hbbaseposy;
			master.hurtboxshadow.xOffset -= 200;
			master.hurtboxshadow.yOffset += 300;
			if (master.facing == -1)
			{
				master.isblocking = 3;
			}
			else
				master.isblocking = 0;
		}
		if (right && !down && currguard != CURRGUARD.RU)
		{
			currguard = CURRGUARD.RU;
			master.hurtboxshadow.xOffset = hbbaseposx;
			master.hurtboxshadow.yOffset = hbbaseposy;
			master.hurtboxshadow.xOffset += 200;
			if (master.facing == 1)
			{
				master.isblocking = 2;
			}
			else
				master.isblocking = 0;
		}
		if (right && down && currguard != CURRGUARD.RD)
		{
			currguard = CURRGUARD.RD;
			master.hurtboxshadow.xOffset = hbbaseposx;
			master.hurtboxshadow.yOffset = hbbaseposy;
			master.hurtboxshadow.xOffset += 200;
			master.hurtboxshadow.yOffset += 300;
			if (master.facing == 1)
			{
				master.isblocking = 3;
			}
			else
				master.isblocking = 0;
		}
		if (!right && !down && !left)
		{
			currguard = CURRGUARD.NONE;
			master.hurtboxshadow.xOffset = hbbaseposx;
			master.hurtboxshadow.yOffset = hbbaseposy;
			if (master.state == STATE.SANSSWORD)
				master.isblocking = 0;
		}
		if (special2)
		{
			state = SHADOWSTATE.MOBIL;
			Canswitchstate = false;
			alarm[0] = room_speed;
		}
	}
	if (state == SHADOWSTATE.MOBIL)
	{
		if (special2)
		{
			state = SHADOWSTATE.GRAB;
		}
	}
	if (state == SHADOWSTATE.OTC)
	{}
	
}