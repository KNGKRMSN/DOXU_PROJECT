/// @description Insert description here
// You can write your code in this editor

global.PlayerCount = input_player_connected_count();
PlayersandCharacters.player1 = global.PlayerOne;
PlayersandCharacters.player2 = global.PlayerTwo;
PlayersandCharacters.player3 = global.PlayerThree;
PlayersandCharacters.player4 = global.PlayerFour;

if (room_get_name(room) == "rm_Play")
{
	if (global.PlayerCount == 2)
	{
		if (o_P1.hasselectedachar == 1 && o_P2.hasselectedachar == 1)
		{
			room_goto(rm_TrueFight);
		}
	}
	if (global.PlayerCount == 4)
	{
		if (o_P1.hasselectedachar == 1 && o_P2.hasselectedachar == 1 && o_P3.hasselectedachar == 1 && o_P4.hasselectedachar == 1)
			room_goto(rm_TrueFight);
	}
}

/*if (global._activeplayers[1] != -1)
{
	if ((PandC.player3characterID.isgettingcomboed == 0 && PandC.player3characterID.isgettingcomboedpreviouswindguy >= 5 && PandC.player3characterID.isgettingcomboedpreviouswindguy < 7))
		done = 1;
	if ((PandC.player3characterID.isgettingcomboed == 0 && PandC.player3characterID.isgettingcomboedpreviouswindguy >= 7))
		done2 = 1;
	
	if ((PandC.player1characterID.isgettingcomboed == 0 && PandC.player1characterID.isgettingcomboedpreviouswindguy >= 5 && PandC.player1characterID.isgettingcomboedpreviouswindguy < 7))
		done = 1;
	if ((PandC.player1characterID.isgettingcomboed == 0 && PandC.player1characterID.isgettingcomboedpreviouswindguy >= 7))
		done2 = 1;
}*/
if (global._activeplayers[1] != -1)
{
	if ((input_check_long("assist", PlayersandCharacters.playercontroller2) && global._nonactiveplayers[1] == PlayersandCharacters.characterID2 && global._activeplayers[1].isinswitch == false && canSwitchTeamA) || (global._activeplayers[1].currentHealth <= 0 && global._nonactiveplayers[1].currentHealth > 0))
	{
		alarm[0] = room_speed * 2;
		canSwitchTeamA = false;
		instance_activate_object(global._nonactiveplayers[1])
		global._nonactiveplayers[1].y = 2000;
		global._nonactiveplayers[1].x = global._activeplayers[1].x + (-1000 * global._activeplayers[1].facing);
		global._nonactiveplayers[1].image_alpha = 1;
		var temp = global._activeplayers[1];
		global._activeplayers[1] =global._nonactiveplayers[1];
		global._nonactiveplayers[1] = temp;
		global._activeplayers[1].isinswitch = 1;
		global._nonactiveplayers[1].isinswitch = -1;
	}

	if (input_check_long("assist", PlayersandCharacters.playercontroller1) && global._nonactiveplayers[1] == PlayersandCharacters.characterID1 && global._activeplayers[1].isinswitch == false && canSwitchTeamA|| (global._activeplayers[1].currentHealth <= 0 && global._nonactiveplayers[1].currentHealth > 0))
	{
		alarm[0] = room_speed * 2;
		canSwitchTeamA = false;
		instance_activate_object(global._nonactiveplayers[1])
		global._nonactiveplayers[1].y = 2000;
		global._nonactiveplayers[1].x = global._activeplayers[1].x + (-1000 * global._activeplayers[1].facing);
		global._nonactiveplayers[1].image_alpha = 1;
		var temp = global._activeplayers[1];
		global._activeplayers[1] =global._nonactiveplayers[1];
		global._nonactiveplayers[1] = temp;
		global._activeplayers[1].isinswitch = 1;
		global._nonactiveplayers[1].isinswitch = -1;
	}
	if (input_check_long("assist", PlayersandCharacters.playercontroller3) && global._nonactiveplayers[2] == PlayersandCharacters.characterID3 && global._activeplayers[2].isinswitch == false && canSwitchTeamB|| (global._activeplayers[2].currentHealth <= 0 && global._nonactiveplayers[2].currentHealth > 0))
	{
		alarm[1] = room_speed * 2;
		canSwitchTeamB = false;
		instance_activate_object(global._nonactiveplayers[2])
		global._nonactiveplayers[2].y = 2000;
		global._nonactiveplayers[2].x = global._activeplayers[2].x + (-1000 * global._activeplayers[2].facing);
		global._nonactiveplayers[2].image_alpha = 1;
		var temp = global._activeplayers[2];
		global._activeplayers[2] =global._nonactiveplayers[2];
		global._nonactiveplayers[2] = temp;
		global._activeplayers[2].isinswitch = 1;
		global._nonactiveplayers[2].isinswitch = -1;
	}
	if (input_check_long("assist", PlayersandCharacters.playercontroller4) && global._nonactiveplayers[2] == PlayersandCharacters.characterID4 && global._activeplayers[2].isinswitch == false && canSwitchTeamB|| (global._activeplayers[2].currentHealth <= 0 && global._nonactiveplayers[2].currentHealth > 0))
	{
		alarm[1] = room_speed * 2;
		canSwitchTeamB = false;
		instance_activate_object(global._nonactiveplayers[2])
		global._nonactiveplayers[2].y = 2000;
		global._nonactiveplayers[2].x = global._activeplayers[2].x + (-1000 * global._activeplayers[2].facing);
		global._nonactiveplayers[2].image_alpha = 1;
		var temp = global._activeplayers[2];
		global._activeplayers[2] =global._nonactiveplayers[2];
		global._nonactiveplayers[2] = temp;
		global._activeplayers[2].isinswitch = 1;
		global._nonactiveplayers[2].isinswitch = -1;
	}
}