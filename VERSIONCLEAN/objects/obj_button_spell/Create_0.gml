/// @description Insert description here
event_inherited();

//Variables
//butspell = 0;		//Reference to player equipped slots
fscale = 0.8;
halign = fa_left;
selectionType = targetType.SNGL;
spellref = 0;
buttype = 0;
//parameters
//cost
cost_width = 12;
cost_value = 0;
//target
//target_width = 32;
target_type = targetType.SNGL;
//effect
effect_width = 224;
effect_value = 0;
effect_type = 0;
//	info
draw_info = false;

colorBase = c_grayblack;
colorSelect = c_black;
colorPress = c_white;
text_color = c_white;
text_colorBase = c_gray;
outline_col = c_ltgray;
text_scale_select = 1.2;
text_scale_idle = 1;
rotation = 2.4;
color = colorBase;
text_yoffset = -16;
text_xoffset = 64;
text_angle = 2;

//Set if button is usable - condition is target enough enemy
CheckCondition = function()
{
	
}

ConditionActive = function(_selectiontype, _activemonsters, _index)
{
	// Spell button colors
	//active
	var ColActBase = c_ltgray;
	var ColActSel = c_aqua;
	//disabled
	var ColDisBase = c_dkgray;
	var ColDisSel = c_gray;

	if (_selectiontype != targetType.SNGL || _selectiontype != targetType.SELF)
	{
		switch (_selectiontype) {
		    case targetType.DUO:
		        if (array_length(_activemonsters) >= 2)
				{
					//Active
					//Set draw active
					colorBase = ColActBase;
					colorSelect = ColActSel;
					//Set interact to "open"
					//obj_UI_Manager.Panels[@ UI_panels.encSpells][@ BUTTONS][@_index].func = obj_UI_Manager.EncSpellOpen;
				}
				else
				{
					//Deactivate
					//Set draw disabled
					colorBase = ColDisBase;
					colorSelect = ColDisSel;
					//Set interact to "disabled"
					obj_UI_Manager.Panels[@ UI_panels.encSpells][@ BUTTONS][@_index].func = obj_UI_Manager.EncSpellDisabled;
				}
		        break;
			//case targetType.TRI:
			//    if (_activemonsters >= 2)
			//	{
			//		//Active
			//	}
			//	else
			//	{
			//		//Deactivate
			//	}
			//    break;
		    default:
		        // code here
		        break;
		}
	}
}