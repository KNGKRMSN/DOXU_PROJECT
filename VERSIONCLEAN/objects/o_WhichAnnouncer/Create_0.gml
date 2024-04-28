/// @description Insert description here
// You can write your code in this editor
randomize()
_which_announcer = random_range(0, 2);
if (_which_announcer <= 1)
{
	_are_you_ready_sound = AreYouReadySound;
	_begin_fight_sound = BeginFightSound;
	_counter_sound = CounterSound;
	_fight_sound = FightSound;
	_impressive_combo_sound = ImpressiveComboSound;
	_ko_sound = KOSound;
	_sweet_combo_sound = SWEETCOMBOSOUND;
	_team_1_win_sound = Team1WinSound;
	_team_2_win_sound =Team2WinSound;
	//_need_a_break_sound = NeedABreakSound;
}

if (_which_announcer > 1)
{
	_are_you_ready_sound = AreYouReadySoundJ;
	_begin_fight_sound = BeginFightSoundJ;
	_counter_sound = CounterSoundJ;
	_fight_sound = FightSoundJ;
	_impressive_combo_sound = ImpressiveComboSoundJ;
	_ko_sound = KOSoundJ;
	_sweet_combo_sound = SWEETCOMBOSOUNDJ;
	_team_1_win_sound = Team1WinSoundJ;
	_team_2_win_sound =Team2WinSoundJ;
	//_need_a_break_sound = NeedABreakSoundJ;
}








