
function scr_input_cutscene(_UI_manager){
	
// Key Inputs
var _PlaCon = obj_PlayerController;
var _Dia = obj_Dialog;
var _keyEnter = _PlaCon.keyEnter;
var _keyBack = _PlaCon.keyBack;
var _keyMenu = _PlaCon.keyMenu or _PlaCon.keyFace4;

	 if (_keyEnter - _keyBack && _Dia.State == _Dia.Finished)
	 {
		// go to next line - Resume cutscene
		_Dia.State();
		obj_cutscene.ResumeCutscene();
	 }
	 
	 if (_keyEnter - _keyBack && _Dia.State == _Dia.Done)
	 {
		// keep playing
		_Dia.State();
		obj_cutscene.ResumeCutscene();
	 }
	 
	 if (_keyEnter - _keyBack && _Dia.State == _Dia.Ready)
	 {
		// keep playing
		//_Dia.State();
		obj_cutscene.ResumeCutscene();
	 }
}