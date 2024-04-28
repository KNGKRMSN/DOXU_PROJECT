/// @description 
// Inherit the parent event
event_inherited();

sprite_index = noone;
sld_val = 1;
sld_gap = 0.10;
sld_getmethod = undefined;
sld_method = undefined;
Height = 64;
Width = 64;
colorSelect = c_white;
text_colorBase = c_ltgray
text_colorPress = c_white;
colorPress = c_abs;

function Set(_val)
{
	var vol = sld_val;
	vol += (sld_gap * _val);
	vol = clamp(vol,0,1);
	sld_val = vol;
	sld_method();
	audio_play_sound(SelectedSound,0,false);
}