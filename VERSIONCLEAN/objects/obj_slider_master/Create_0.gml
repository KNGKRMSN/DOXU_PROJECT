/// @description Insert description here
// Inherit the parent event
event_inherited();

sld_getmethod = function()
{
	sld_val = audio_get_master_gain(0);
}

sld_method = function()
{
	audio_master_gain(sld_val);
}

