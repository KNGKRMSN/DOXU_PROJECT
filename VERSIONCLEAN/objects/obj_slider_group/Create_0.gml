/// @description Insert description here
// Inherit the parent event
event_inherited();
sld_group = undefined;

sld_getmethod = function()
{
	var v = 0;
	if (is_array(sld_group))
	{
		var v = audio_group_get_gain(sld_group[@ 0]);
	}
	else
	{
		var v = audio_group_get_gain(sld_group);
	}
	
	sld_val = v;
}

sld_method = function()
{
	if (is_array(sld_group))
	{
		var le = array_length(sld_group);
		for (var i = 0; i < le; ++i) {
		    audio_group_set_gain(sld_group[i], sld_val, 2);
		}
	}
	else audio_group_set_gain(sld_group, sld_val, 2);
}

