/// @description Insert description here
// You can write your code in this editor

if (room_get_name(room) == "rm_PickASide")
{
	if (x == startposx)
	{
		if (input_check_pressed("left", player))
		{
			if (global.P1spotfree == true)
			{
				x = global.P1spotx;
				y = global.P1spoty;
				global.P1spotfree = false;
			}
			else if (global.P2spotfree == true)
			{
				x = global.P2spotx;
				y = global.P2spoty;
				global.P2spotfree = false;
			}
		}
		if (input_check_pressed("right", player))
		{
			if (global.P3spotfree == true)
			{
				x = global.P3spotx;
				y = global.P3spoty;
				global.P3spotfree = false;
			}
			else if (global.P4spotfree == true)
			{
				x = global.P4spotx;
				y = global.P4spoty;
				global.P4spotfree = false;
			}
		}
	}
	if (x == global.P1spotx && y == global.P1spoty)
	{
		if (input_check_pressed("up", player))
		{
			if (global.P2spotfree == true)
			{
				x = global.P2spotx;
				y = global.P2spoty;
				global.P2spotfree = false;
				global.P1spotfree = true;
			}
		}
		if (input_check_pressed("right", player))
		{
			x = startposx;
			y = startposy;
			global.P1spotfree = true;
		}
	}
	if (x == global.P2spotx && y == global.P2spoty)
	{
		if (input_check_pressed("down", player))
		{
			if (global.P1spotfree == true)
			{
				x = global.P1spotx;
				y = global.P1spoty;
				global.P2spotfree = true;
				global.P1spotfree = false;
			}
		}
		if (input_check_pressed("right", player))
		{
			x = startposx;
			y = startposy;
			global.P2spotfree = true;
		}
	}

	if (x == global.P3spotx && y == global.P3spoty)
	{
		if (input_check_pressed("up", player))
		{
			if (global.P4spotfree == true)
			{
				x = global.P4spotx;
				y = global.P4spoty;
				global.P4spotfree = false;
				global.P3spotfree = true;
			}
		}
		if (input_check_pressed("left", player))
		{
			x = startposx;
			y = startposy;
			global.P3spotfree = true;
		}
	}

	if (x == global.P4spotx && y == global.P4spoty)
	{
		if (input_check_pressed("down", player))
		{
			if (global.P3spotfree == true)
			{
				x = global.P3spotx;
				y = global.P3spoty;
				global.P3spotfree = false;
				global.P4spotfree = true;
			}
		}
		if (input_check_pressed("left", player))
		{
			x = startposx;
			y = startposy;
			global.P4spotfree = true;
		}
	}
	if (!input_player_connected(player))
	{
		if (x == global.P4spotx && y == global.P4spoty)
			global.P4spotfree = true;
		else if (x == global.P3spotx && y == global.P3spoty)
			global.P3spotfree = true;
		else if (x == global.P2spotx && y == global.P2spoty)
			global.P2spotfree = true;
		else if (x == global.P1spotx && y == global.P1spoty)
			global.P1spotfree = true;
		instance_destroy(self);
	}
}
if (room_get_name(room) == "rm_Play")
{
	if (!done)
	{
		if (global.PlayerOne == self)
			index = 0;
		if (global.PlayerTwo == self)
			index = 1;
		if (global.PlayerThree == self)
			index = 2;
		if (global.PlayerFour == self)
			index = 3;
		done = true;
	}
	sprite_index = spr_CharSelect;
	if (index == 0)
	{
		x = o_CharButton1._buttonxpos;
		y = o_CharButton1._buttonypos;
		if (input_check_pressed("special", player))
		{
			if (global.PlayerOne == self)
				o_GameManager.PlayersandCharacters.character1 = o_Windguy;
			if (global.PlayerTwo == self)
				o_GameManager.PlayersandCharacters.character2 = o_Windguy;
			if (global.PlayerThree == self)
				o_GameManager.PlayersandCharacters.character3 = o_Windguy;
			if (global.PlayerFour == self)
				o_GameManager.PlayersandCharacters.character4 = o_Windguy;
			hasselectedachar = true;
		}
	}
	if (index == 1)
	{
		x = o_CharButton2._buttonxpos;
		y = o_CharButton2._buttonypos;
		if (input_check_pressed("special", player))
		{
			if (global.PlayerOne == self)
				o_GameManager.PlayersandCharacters.character1 = o_IceDude;
			if (global.PlayerTwo == self)
				o_GameManager.PlayersandCharacters.character2 = o_IceDude;
			if (global.PlayerThree == self)
				o_GameManager.PlayersandCharacters.character3 = o_IceDude;
			if (global.PlayerFour == self)
				o_GameManager.PlayersandCharacters.character4 = o_IceDude;
			hasselectedachar = true;
		}
	}
	if (index == 2)
	{
		x = o_CharButton3._buttonxpos;
		y = o_CharButton3._buttonypos;
		if (input_check_pressed("special", player))
		{
			if (global.PlayerOne == self)
				o_GameManager.PlayersandCharacters.character1 = o_FireGirl;
			if (global.PlayerTwo == self)
				o_GameManager.PlayersandCharacters.character2 = o_FireGirl;
			if (global.PlayerThree == self)
				o_GameManager.PlayersandCharacters.character3 = o_FireGirl;
			if (global.PlayerFour == self)
				o_GameManager.PlayersandCharacters.character4 = o_FireGirl;
			hasselectedachar = true;
		}
	}
	if (index == 3)
	{
		x = o_CharButton4._buttonxpos;
		y = o_CharButton4._buttonypos;
		if (input_check_pressed("special", player))
		{
			if (global.PlayerOne == self)
				o_GameManager.PlayersandCharacters.character1 = o_FireGirl;
			if (global.PlayerTwo == self)
				o_GameManager.PlayersandCharacters.character2 = o_FireGirl;
			if (global.PlayerThree == self)
				o_GameManager.PlayersandCharacters.character3 = o_FireGirl;
			if (global.PlayerFour == self)
				o_GameManager.PlayersandCharacters.character4 = o_FireGirl;
			hasselectedachar = true;
		}
	}
	if (input_check_pressed("right", player))
	{
		index++;
		if (index > 3)
			index = 0;
	}
	if (input_check_pressed("left", player))
	{
		index--;
		if (index < 0)
			index = 3;
	}
	if (input_check_pressed("heavy", player) && hasselectedachar == true)
	{
		if (global.PlayerOne == self)
			o_GameManager.PlayersandCharacters.character1 = 0
		if (global.PlayerTwo == self)
			o_GameManager.PlayersandCharacters.character2 =0
		if (global.PlayerThree == self)
			o_GameManager.PlayersandCharacters.character3 = 0
		if (global.PlayerFour == self)
			o_GameManager.PlayersandCharacters.character4 =0
		hasselectedachar = false;
	}
	if (input_check_pressed("heavy", player) && hasselectedachar == false)
	{
		room_goto(rm_PickASide);
	}
}