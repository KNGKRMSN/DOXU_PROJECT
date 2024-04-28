/// @description Interact delay
//set input mode to receive input
//change inputmode
if (array_length(Stack) > 0)
{
	obj_PlayerController.inputmode = CurrentPanel.inputmode;
	//else obj_PlayerController.inputmode = root_inputmode;
	
	var currButton = CurrentPanel.buttons[@ Selection];
	currButton.func();
}