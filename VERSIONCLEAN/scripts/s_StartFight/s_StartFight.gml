// Script assets have changed for v2.3.0 
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function s_StartFight(){
	global.CantPlayYet = 0;
	o_GameManager.PlayersandCharacters.characterID1 = instance_create_layer(4030, 5695, "Instances", o_Sheer);
	o_GameManager.PlayersandCharacters.characterID1.player = o_GameManager.PlayersandCharacters.playercontroller1;
	o_GameManager.PlayersandCharacters.characterID1.j = 1;
	o_GameManager._activeplayers[1] = o_GameManager.PlayersandCharacters.characterID1;

	o_GameManager.PlayersandCharacters.characterID3 = instance_create_layer(5030, 5695, "Instances", o_Sheer);
	o_GameManager.PlayersandCharacters.characterID3.player = o_GameManager.PlayersandCharacters.playercontroller3;
	o_GameManager.PlayersandCharacters.characterID3.j = 3;
	o_GameManager._activeplayers[2] = o_GameManager.PlayersandCharacters.characterID3;

	return (o_GameManager.PlayersandCharacters);
}