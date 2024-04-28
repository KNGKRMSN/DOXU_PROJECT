/// @description Insert description here
// You can write your code in this editor
global.PlayerCount = 0;
global.PlayerOne = 0;
global.PlayerTwo = 0;
global.PlayerThree = 0;
global.PlayerFour = 0;
global.P1startX = 4030;
global.P3startX = 5030;
global.PstartY = 5500//5695

textxScale = 1;
textyScale = 1;

if (room_get_name(room) == "rm_FightTest")
{
	PlayersandCharacters =
	{
		player1 : global.PlayerOne,
		playercontroller1 : 0,
		character1 : o_Sheer,
		characterID1 : instance_create_layer(global.P1startX, global.PstartY, "Instances", o_Sheer),
		player2 : global.PlayerTwo,
		playercontroller2 : 0,
		character2 : o_Sheer,
		characterID2 : instance_create_layer(global.P1startX, global.PstartY, "Instances", o_Sheer),
		player3 : global.PlayerThree,
		playercontroller3 : 1,
		character3 : o_Sheer,
		characterID3 : instance_create_layer(global.P3startX, global.PstartY, "Instances", o_Sheer),
		player4 : global.PlayerFour,
		playercontroller4 : 3,
		character4 : o_Sheer,
		characterID4 : instance_create_layer(global.P3startX, global.PstartY, "Instances", o_Sheer)
	
	}
	global._activeplayers[1] = PlayersandCharacters.characterID1;
	global._activeplayers[2] = PlayersandCharacters.characterID3;
	global._nonactiveplayers[1] = PlayersandCharacters.characterID2;
	global._nonactiveplayers[2] = PlayersandCharacters.characterID4;
	instance_deactivate_object(global._nonactiveplayers[1]);
	instance_deactivate_object(global._nonactiveplayers[2]);
	instance_deactivate_object(global._nonactiveplayers[1].hurtbox);
	instance_deactivate_object(global._nonactiveplayers[2].hurtbox);

	_canplay1v1 = false;
	_canplay2v2 = false;

	PandC = PlayersAndCharacters_create(PlayersandCharacters.character1, PlayersandCharacters.characterID1, PlayersandCharacters.player1, PlayersandCharacters.playercontroller1,
								PlayersandCharacters.character2, PlayersandCharacters.characterID2, PlayersandCharacters.player2, PlayersandCharacters.playercontroller2,
								PlayersandCharacters.character3, PlayersandCharacters.characterID3, PlayersandCharacters.player3, PlayersandCharacters.playercontroller3,
								PlayersandCharacters.character4, PlayersandCharacters.characterID4, PlayersandCharacters.player4, PlayersandCharacters.playercontroller4)

	PandC.player1characterID.opponent = PandC.player3characterID;
	PandC.player1characterID.player = PandC.player1controllerID;
	PandC.player1characterID.j = 1;

	PandC.player2characterID.opponent = PandC.player3characterID;
	PandC.player2characterID.player = PandC.player2controllerID;
	PandC.player2characterID.j = 2;
	
	PandC.player3characterID.opponent = PandC.player1characterID;
	PandC.player3characterID.player = PandC.player3controllerID;
	PandC.player3characterID.j = 3;
	
	PandC.player4characterID.opponent = PandC.player1characterID;
	PandC.player4characterID.player = PandC.player4controllerID;
	PandC.player4characterID.j = 1;
}

else 
{
	PlayersandCharacters =
	{
		player1 : global.PlayerOne,
		playercontroller1 : 0,
		character1 : o_Sheer,
		characterID1 : -1,
		player2 : global.PlayerTwo,
		playercontroller2 : 2,
		character2 : o_Sheer,
		characterID2 : 0,
		player3 : global.PlayerThree,
		playercontroller3 : 0,
		character3 : o_Sheer,
		characterID3 : -1,
		player4 : global.PlayerFour,
		playercontroller4 : 3,
		character4 : o_Sheer,
		characterID4 : 0
	
	}
	global._activeplayers[1] = PlayersandCharacters.characterID1;
	global._activeplayers[2] = PlayersandCharacters.characterID3;
	global._nonactiveplayers[1] = PlayersandCharacters.characterID2;
	global._nonactiveplayers[2] = PlayersandCharacters.characterID4;


	_canplay1v1 = false;
	_canplay2v2 = false;

	PandC = PlayersAndCharacters_create(PlayersandCharacters.character1, PlayersandCharacters.characterID1, PlayersandCharacters.player1, PlayersandCharacters.playercontroller1,
								PlayersandCharacters.character2, PlayersandCharacters.characterID2, PlayersandCharacters.player2, PlayersandCharacters.playercontroller2,
								PlayersandCharacters.character3, PlayersandCharacters.characterID3, PlayersandCharacters.player3, PlayersandCharacters.playercontroller3,
								PlayersandCharacters.character4, PlayersandCharacters.characterID4, PlayersandCharacters.player4, PlayersandCharacters.playercontroller4)
}
done = 0;
done2 = 0;
canSwitchTeamA = true;
canSwitchTeamB = true;
invert = shader_invert;
//shadertest = shader_test;