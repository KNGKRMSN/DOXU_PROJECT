/// @description Initialise game UI

// System Properties
Margin = 40;
transitiontime = 6;
root_inputmode = obj_PlayerController.IM_character;

// Variables
Stack = [];
CurrentPanel = 0;
Selection = 0;
n_buttons = 0;
last_selection = 0;
last_position = 0;
layersequence = noone;


///	CORE FUNCTIONS
Close = function()						// Close all - Empty UI stack
{	
	SetVisibility(0);
	Stack = [];
	CurrentPanel = noone;
	//Selection = 0;
	//last_selection = 0;
	
	// Reset save selection
	Main.saveselection = 0;
	
	//background
	var bg = layer_get_id("UI_background");
	layer_set_visible(bg,false);
		
	//transition
	if (layer_sequence_exists("UI_seq",layersequence))
	{
		obj_PlayerController.inputmode = obj_PlayerController.IM_transition;
		alarm[0] = transitiontime + 2;
	}
		
	//alarms
	alarm[1] = -1;
	alarm[2] = -1;
}

Open = function (_panel)			// Set curr panel visible to false and open new panel
{
	//Check layer needed for background and sequence to work
	//sequence
	var seqlayer = layer_get_id("UI_seq");
	if (layer_exists(seqlayer) == false)
	{
		layer_create(-100,"UI_seq");
	}
	
	//background	check if exists
	//var bglayer = layer_get_id("UI_background");
	//if (!layer_exists(bglayer))
	//{
	//	//create
	//	layer_create(-3100,"UI_background");
	//}
	
	if (array_length(Stack) > 0)
	{
		SetVisibility(false);
	}
	Add(_panel);
	
	//call opening transition
	alarm[1] = transitiontime;
	
	//use post-open function
	//panel opening update function
	if (_panel.funcpostopen != undefined)
	{
		_panel.funcpostopen();
	}
}

Interact = function(_selection)			// Use button function
{
	//set input mode to not receive input
	obj_PlayerController.inputmode = obj_PlayerController.IM_transition;
	
	var currButton = CurrentPanel.buttons[@ _selection];
	//show_debug_message(string(currButton)+ "__"+string(Selection));
	currButton.SwitchState(currButton.Pressed);
	//currButton.func();
	
	alarm[2] = transitiontime - 2;		//Interact delay
}

Add = function (_panel)					// Add panel to screen
{
	//set input mode to not receive input
	obj_PlayerController.inputmode = obj_PlayerController.IM_transition;
	
	//panel opening update function
	if (_panel.funcopen != noone)
	{
		_panel.funcopen();
	}
	
	//is there a previous panel ?
	if (array_length(Stack) > 0)
	{
		//play animation sequence out
		show_debug_message("layer sequence exists");
		layer_sequence_headdir(layersequence,seqdir_left);
		layer_sequence_play(layersequence);
		//call destroy after transition
		alarm[0] = transitiontime;
	}
	
	//set selection if memorise selection
	var prev_panel = array_peek(Stack);
	if(prev_panel != noone)
	{
		if (prev_panel.memoriseselection == true)
		{
			prev_panel.saveselection = Selection;
		}
	}
	
	//adding panel to stack and GUI
	array_push(Stack,_panel);
	CurrentPanel = _panel;
	SetVisibility(1);
	n_buttons = array_length(CurrentPanel.buttons);
	
	RememberSelection(CurrentPanel);
	
	//set button state
	if (n_buttons > 0)
	{
		CurrentPanel.buttons[@ Selection].SwitchState(CurrentPanel.buttons[@ Selection].Selected);
		
	}
	
	//do ease and tween on buttons
	var _len = array_length(_panel.buttons);
	if (_len > 0)
	{
		for (var i = 0; i < _len; ++i)
		{	
			////add jobs
			var _job = _panel.tweens[@ i];
			obj_tweener.ResetTween(_job);
		
			var inst = _panel.buttons[@ i];
			inst.x = inst.ini_pos[0];
		
			obj_tweener.AddJob(_job);
		}
	}
	
	//background panel
	SetBackground(_panel.background);
	
	//Audio
	//if(array_length(Stack) > 1) audio_play_sound(snd_UI_open,1,0);
}

Back = function()						// Go back to previous panel in stack
{
	//hide current panel
	SetVisibility(0);
	
	//panel closing update function
	if (CurrentPanel.funcclose != noone)
	{
		CurrentPanel.funcclose();
	}
	
	//panel closing set saveselection
	if (CurrentPanel.memoriseselection == true)
	{
		CurrentPanel.saveselection = Selection;
	}
	
	
	//hide current background
	var panbg = CurrentPanel.background;
	if (panbg != noone)
	{
		//layer
		//var bglayer = layer_get_id("UI_background");
		//play animation OUT
		
		//layer_set_visible(bglayer,false);
	}
	
	//stop and remove all ease and tween
	obj_tweener.joblist = [];
	
	//play animation out
	if (layer_sequence_exists("UI_seq",layersequence))
	{
		show_debug_message("layer sequence exists");
		layer_sequence_headdir(layersequence,seqdir_left);
		layer_sequence_play(layersequence);
		
		//change inputmode
		obj_PlayerController.inputmode = obj_PlayerController.IM_transition;
		
		alarm[0] = transitiontime;
	}
	else
	{
		show_debug_message("layer sequence DOES NOT exists");
	}
	
	//remove panel from stack and GUI
	array_pop(Stack);
	var _panel = array_peek(Stack);

	if(_panel != noone)
	{
		//set
		CurrentPanel = _panel;
		SetVisibility(1);
		n_buttons = array_length(_panel.buttons);
		
		RememberSelection(_panel);
		
		alarm[1] = transitiontime;
		
		//background
		var panbg = CurrentPanel.background;
		SetBackground(panbg);
		
		//set button state
		CurrentPanel.buttons[@ Selection].SwitchState(CurrentPanel.buttons[@ Selection].Selected);
		//set variables
		obj_PlayerController.inputmode = _panel.inputmode;
	}

	//Audio
	//audio_play_sound(snd_UI_back,1,0);
	
	//Set & Check selection
	//CheckSelection();
}

SetVisibility = function (_b)			// Set visibility for all instances in currentpanel
{
	var l_but = array_length(CurrentPanel.buttons);
	if (l_but > 0)
	{
		for (var i = 0; i < l_but; ++i) {
		    var inst = CurrentPanel.buttons[@ i];
		
			inst.visible = _b;
			inst.SwitchState(CurrentPanel.buttons[@ i].Idle);
		}
	}
	
	var l_extra = array_length(CurrentPanel.extra);
	if (l_extra > 0)
	{
		for (var i = 0; i < l_extra; ++i) {
		    var inst = CurrentPanel.extra[@ i];
		
			inst.visible = _b;
		}
	}
}

SetSelection = function (_value)		// Add or Remove a Value from Selection
{
	var nextsel = Selection;
	nextsel += _value;
	// Selection check
	if (nextsel < 0) nextsel = n_buttons-1;
	if (nextsel > n_buttons-1) nextsel = 0;
	//Skip Disabled
	if (CurrentPanel.buttons[@ nextsel].State == CurrentPanel.buttons[@ nextsel].Disabled) nextsel += _value;
	Selection = nextsel;
	
	CheckSelection();
}

CheckSelection = function()				// Check if selection is in range of array
{
	// Selection check
	if (Selection < 0) Selection = n_buttons-1;
	if (Selection > n_buttons-1) Selection = 0;

	//Audio
	 if (Selection != last_selection)
	 {
		 //set previous button to idle state
		 CurrentPanel.buttons[@ last_selection].SwitchState(CurrentPanel.buttons[@ last_selection].Idle);
		 //set selected button to selected state
		 CurrentPanel.buttons[@ Selection].SwitchState(CurrentPanel.buttons[@ Selection].Selected);
		 //audio_play_sound(snd_UI_select,1,0);
	 
		 last_selection = Selection;
	 }
}

RememberSelection = function(_panel)	// If memorise selection is true - Set Selection
{
	if(_panel.memoriseselection == true) 
	{
		Selection = _panel.saveselection;
		last_selection = _panel.saveselection;
	}
	else 
	{
		Selection = 0;
		last_selection = 0;
	}
	CheckSelection();
}

SetBackground = function(_background)	// Set background visible and set all parameters
{
	var panbg = _background;
	if (panbg != noone)
	{
		//layer
		var bglayer = layer_get_id("UI_background");
		
		//if (!layer_background_exists(bglayer,bg))		//check if exists
		//{
		//	//create
		//	bg = layer_background_create(bglayer,panbg.sprite);
		//}
		
		//background layer
		var bg = layer_background_get_id(bglayer);
		
		layer_set_visible(bglayer,true);
		//play animation IN - set variables
		layer_background_htiled(bg,true);
		layer_background_vtiled(bg,true);
		layer_background_sprite(bg,panbg.sprite);
		layer_background_blend(bg,panbg.blend);
		layer_background_alpha(bg,panbg.alpha);
		layer_hspeed(bglayer,panbg.hspd);
		layer_vspeed(bglayer,panbg.vspd);
		layer_background_xscale(bg,panbg.xscale);
		layer_background_yscale(bg,panbg.yscale);
	}
}

////	Initialise Panels in children