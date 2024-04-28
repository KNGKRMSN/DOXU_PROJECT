/// @description Insert description here
// You can write your code in this editor
if (global.WhichMusic == "Kaze" || global.WhichMusic == "")
{
	if (index == MUSICSTATE.NONE && audio_sound_get_track_position(global.Music) >= 23.59)
	{
		index = MUSICSTATE.START;
	}
	if (index == MUSICSTATE.START && !audio_is_playing(MusicKazeIntro))
	{
		currentMusic = audio_play_sound(MusicKazeRound1start, 1, 0);
		index = MUSICSTATE.ROUND1;
	}
	if (index == MUSICSTATE.ROUND1 && o_Windguy.roundsWon + o_Mokujin.roundsWon < 2 && !audio_is_playing(MusicKazeRound1start))
	{
		currentMusic = audio_play_sound(MusicKazeRound1loop, 1, 1);
		index = MUSICSTATE.ROUND1LOOP;
	}
	if ((index == MUSICSTATE.ROUND1LOOP || index == MUSICSTATE.ROUND1) && o_Windguy.roundsWon + o_Mokujin.roundsWon == 2 && audio_sound_get_track_position(currentMusic) >= 23.59)
	{
		audio_stop_sound(currentMusic);
		currentMusic =audio_play_sound(MusicKazeTransi, 1, 0);
		index = MUSICSTATE.TRANSI;
	}
	if (index == MUSICSTATE.TRANSI && !audio_is_playing(MusicKazeTransi))
	{
		currentMusic = audio_play_sound(MusicKazeRound3start, 1, 0);
		index = MUSICSTATE.ROUND3;
	}
	if (index == MUSICSTATE.ROUND3 && o_Windguy.roundsWon + o_Mokujin.roundsWon == 2 && !audio_is_playing(MusicKazeRound3start))
	{
		currentMusic =audio_play_sound(MusicKazeRound3loop, 1, 1);
		index = MUSICSTATE.ROUND3LOOP;
	}
}



