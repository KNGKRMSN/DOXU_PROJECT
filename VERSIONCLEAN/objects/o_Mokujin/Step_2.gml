	/// @description Insert description here
// You can write your code in this editor
isgettingcomboedpreviousmokujin = isgettingcomboed;
if (isgettingcomboed == 0 && o_Windguy.isgettingcomboed == 0)
{
	global.DamageReduction = 1;
	o_ComboMeter.notatruecombo = 0;
}
if (!place_meeting(x, y + 10, o_Ground) && global.CurrentSpecialJ2 <= 7.89)
	global.CurrentSpecialJ2 += 0.010;
if (global.CurrentSpecialJ2 > 7.89 && global.CurrentSpecialJ2 < 8)
	global.CurrentSpecialJ2 += 0.001;