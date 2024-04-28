/// @description Insert description here
// You can write your code in this editor
if (o_Windguy.roundsWon == 2)
{
	if (!alarm[0])
		alarm[0] = room_speed * 3;
	draw_set_font(RoundStartPolice);
	draw_set_alpha(1);
	draw_text(200, 300, "PLAYER ONE WINS");
}
if (o_Mokujin.roundsWon == 2)
{
	if (!alarm[0])
		alarm[0] = room_speed * 3;
	draw_set_font(RoundStartPolice);
	draw_set_alpha(1);
	draw_text(200, 300, "PLAYER TWO WINS");
}