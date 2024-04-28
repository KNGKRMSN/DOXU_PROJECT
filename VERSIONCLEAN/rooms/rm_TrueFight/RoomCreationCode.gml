	PlayersandCharacters =
		{
			player1 : global.PlayerOne,
			playercontroller1 : 0,
			character1 : o_Sheer,
			characterID1 : instance_create_layer(global.P1startX, global.PstartY, "Instances", o_Sheer),
			player2 : global.PlayerTwo,
			playercontroller2 : 2,
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
	instance_create_layer(0, 0, "Instances_1", o_BeginFightTrue)