/// @description Insert description here
var _jobs= array_length(joblist);

if (_jobs > 0)
{
	for (var i = 0; i < _jobs; ++i)
	{	
		if (joblist[@ i].delay > 0)
		{
			//Add to delay
			joblist[@ i].delay -= 1;
		}
		else
		{			
			//Work on job
			Tween(joblist[@ i]);
		
		    //Add percent to job
			var _time = joblist[@ i].time;
			joblist[@ i].percent += 1/_time;
		
			//when job is done 100% - remove from list
			if (joblist[@ i].percent > 1)
			{
				array_delete(joblist,i,1);
				break;
			}
		}
	}
}