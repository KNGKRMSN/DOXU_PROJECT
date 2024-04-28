//obj_game.b_loading = true;
//obj_game.LoadData();
if(!global.GameFlags[@ Act.const, 0])
{
	scr_playtrack(0, mus_minet);
	obj_cutscene.SetCutscene(seq_rule0, Act.const, 2, 0, 1, scr_cutMenuVisible);
	obj_cutscene.StartCutscene();
}
else
{
	scr_cutMenuVisible();
}