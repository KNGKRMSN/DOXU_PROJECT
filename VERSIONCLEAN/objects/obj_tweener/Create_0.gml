/// @description Insert description here

function Tween(_job)
{
	var curve = animcurve_get_channel(_job.curve_asset,"curve1");
	var position = animcurve_channel_evaluate(curve,_job.percent);
	
	var _start = _job.start_value;
	var _end = _job.end_value;
	var _distance = _end - _start;
	
	//with(_job.inst)
	//{
	//	x = _start + (_distance * position);
	//}
	
	_job.valscript(_job.inst,_start,_distance,position);
	
	//show_debug_message(position);
}

function AddJob(_job)
{
	array_push(joblist,_job);
	//show_debug_message("job added");
}

function RemoveJob(_job)
{
	//_job.percent = 1.1;
	var _index = array_find(joblist,_job);
	if _index != noone
	{
		array_delete(joblist,_index,1);
	}
}

function ResetTween(_tween)
{
	_tween.percent = 0;
	_tween.delay = _tween.delay_reset;
}

// variables
joblist = [];