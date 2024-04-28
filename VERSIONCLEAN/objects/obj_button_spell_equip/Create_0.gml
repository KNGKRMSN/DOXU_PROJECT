/// @description Insert description here
event_inherited();

equip = false;
spellref = 0;
spell = noone;
element = 0;
draw_info = false;
//cost
cost_width = 96;
cost_value = 0;

//unequipped color scheme
une_text_colorBase = text_colorBase;
une_text_colorSelect = text_colorSelect;
une_text_colorPress = text_colorPress;

une_colorBase = c_dkgray;
une_colorSelect = colorSelect;
une_colorPress = colorPress;

//equipped color scheme
equ_text_colorBase = merge_color(text_colorBase, c_dkgray,0.7);
equ_text_colorSelect = merge_color(text_colorSelect, c_dkgray,0.7);
equ_text_colorPress = merge_color(text_colorPress, c_dkgray,0.7);

equ_colorBase = merge_color(colorBase, c_dkgray,0.7);
equ_colorSelect = merge_color(colorSelect, c_dkgray,0.7);
equ_colorPress = merge_color(colorPress,c_dkgray,0.7);

//override
Pressed = function()
{
	equip = !equip;
	
	SetEquip();
		
	color = colorPress;
	text_color = text_colorPress;
}

//functions
SetEquip = function()
{
	if (equip == true)
	{
		text_colorBase = equ_text_colorBase;
		text_colorSelect = equ_text_colorSelect;
		text_colorPress = equ_text_colorPress;

		colorBase = equ_colorBase;
		colorSelect = equ_colorSelect;
		colorPress = equ_colorPress;
	}
	else
	{
		text_colorBase =	une_text_colorBase;
		text_colorSelect =	une_text_colorSelect;
		text_colorPress =	une_text_colorSelect;
	
		colorBase =			une_colorBase;
		colorSelect =		une_colorSelect;
		colorPress =		une_colorSelect;
	}
	
	color = colorBase;
	text_color = text_colorBase;
}

////Variables
//selectionType = targetType.SNGL;
//equip = false;
//spell = 0;
//buttype = 0;
////parameters
////cost
//cost_width = 60;
//cost_value = 0;
////effect
//effect_width = 60;
//effect_value = 0;
//effect_type = 0;