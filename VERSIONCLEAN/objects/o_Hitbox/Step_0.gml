/// @description Life of HitBox
// You can write your code in this editor
if (dothestep && global.BigAssHitStop = 0)
{
	if (typeOfAttack != 6)
	{
		x = owner.x + xOffset;
		y = owner.y + yOffset;
	}
	else
	{
		y = owner.y + yOffset;
		speed = 25;
		if (owner.facing == 1)
			direction = 0;
		if (owner.facing == -1)
			direction = 180;
	}
	if (place_meeting(x, y, o_Hitbox))
	{
		with (other)
			if (other.owner == owner)
				 ds_list_add(ignoreList,owner);
			//check to see if your target is on the ignore list
	            //if it is on the ignore list, dont hit it again
		for(i = 0; i < ds_list_size(ignoreList); i ++){
			if(ignoreList[|i] = owner){
				ignore = true;
	                    break;
			}
		}
		if (!ignore)
		{
			global.BigAssHitStop = 1;
			
			if (owner.facing == 1)
			{
				if (!instance_exists(o_Glass))
					instance_create_layer((owner.x + owner.opponent.x) / 2, y, "Instances", o_Glass)
			}
			if (owner.facing == -1)
			{
				if (!instance_exists(o_Glass))
					instance_create_layer((owner.opponent.x + owner.x) / 2, y, "Instances", o_Glass)
			}
			instance_destroy(self)
				
		}
			
	}
	//check to see if the hurtbox is touching your hitbox        
	with(o_HurtBox)
	{
		var PandC = instance_find(o_GameManager, 0);
		if(place_meeting(x,y,other) && other.owner != owner)
		{
		    //ignore check
		    //checking collision from the hitbox object
		    with(other)
			{
		        //check to see if your target is on the ignore list
		        //if it is on the ignore list, dont hit it again
		        for(i = 0; i < ds_list_size(ignoreList); i ++){
		            if(ignoreList[|i] == other.owner){
		                ignore = true;
		                break;
		            }
		        }
		        //if it is NOT on the ignore list, hit it, and add it to
		        //the ignore list
					
		        if(!ignore)
				{
					//WHAT IF KND
					
					other.owner.hitBy = id;
					if (!instance_exists(o_Glass))
					other.owner.gettingHit = true
					owner.hit = owner.isAttacking;
			        ds_list_add(ignoreList,other.owner);
		        }
		    }
		}
	}
}
life --;









