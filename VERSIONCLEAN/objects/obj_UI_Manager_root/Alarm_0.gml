/// @description Close-transition
	//destroy sequence
	layer_sequence_destroy(layersequence);
		
	//set input back to panel
	//change inputmode
	if (array_length(Stack) > 0) obj_PlayerController.inputmode = CurrentPanel.inputmode;
	else obj_PlayerController.inputmode = root_inputmode;