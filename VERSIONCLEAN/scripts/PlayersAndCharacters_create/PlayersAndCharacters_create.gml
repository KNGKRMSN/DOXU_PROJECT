// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayersAndCharacters_create(_player1character, _player1characterID, _player1controllerobject, _player1controllerID,
									_player2character, _player2characterID, _player2controllerobject, _player2controllerID,
									_player3character, _player3characterID, _player3controllerobject, _player3controllerID,
									_player4character, _player4characterID, _player4controllerobject, _player4controllerID,){
	_playersAndCharacters = instance_create_layer(0, 0, "Instances", o_PlayersAndCharacters);
	
	_playersAndCharacters.player1character = _player1character;
	_playersAndCharacters.player1characterID = _player1characterID;
	_playersAndCharacters.player1controllerobject = _player1controllerobject;
	_playersAndCharacters.player1controllerID = _player1controllerID;
	_playersAndCharacters.player2character = _player2character;
	_playersAndCharacters.player2characterID = _player2characterID;
	_playersAndCharacters.player2controllerobject = _player2controllerobject;
	_playersAndCharacters.player2controllerID = _player2controllerID;
	_playersAndCharacters.player3character = _player3character;
	_playersAndCharacters.player3characterID = _player3characterID;
	_playersAndCharacters.player3controllerobject = _player3controllerobject;
	_playersAndCharacters.player3controllerID = _player3controllerID;
	_playersAndCharacters.player4character = _player4character;
	_playersAndCharacters.player4characterID = _player4characterID;
	_playersAndCharacters.player4controllerobject = _player4controllerobject;
	_playersAndCharacters.player4controllerID = _player4controllerID;
	
	return (_playersAndCharacters)
}