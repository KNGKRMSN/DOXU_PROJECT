/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor
/*
if (global.UI_WhereAreWe == 2)
{
	alarm[1] = 60;
}*/

if (!audio_is_playing(MusicMenuStart) && startMusicLoop == 0)
{
	audio_play_sound(MusicMenuLoop, 1, 1);
	startMusicLoop = 1;
}