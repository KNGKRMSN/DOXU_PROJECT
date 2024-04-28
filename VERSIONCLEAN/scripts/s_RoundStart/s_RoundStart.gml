// Script assets have changed for v2.3.0 see
// @param 1 for P1, 2 for P2 won...
function s_RoundStart(argument0=0)
{
	var whoWon = argument0;
	if (whoWon == 0)
		instance_create_layer(3500, 4000, "Instances", O_BeginFight);
	if (whoWon > 0)
		instance_create_layer(3500, 4000, "Instances", o_RoundSwitch);
	global.CurrentHealthJ1 = global.HealthJ1;
	global.CurrentHealthJ2 = global.HealthJ2;
	O_Timer.totalSeconds = 99;
	o_Windguy.x = 4030;
	o_Windguy.y = 5695;

	o_Windguy.image_speed = 0;
	
	o_Windguy.isAttacking = 0;
	o_Windguy.isgettingcomboed = 0;
	o_Windguy.sprite_index = spr_WindGuy;
	
	//o_RoundManager.done = 0;
}