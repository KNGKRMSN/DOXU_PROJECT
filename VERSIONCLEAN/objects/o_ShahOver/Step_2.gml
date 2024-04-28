/// @description Insert description here
// You can write your code in this editor
 
if (state == 3 && hitbox != -1)
{
	with (hitbox)
	{
		x = other.x + xOffset;
		y = other.y + yOffset;
	    with(o_HurtBox)
		{
            if(place_meeting(x,y,other) && other.owner != owner)
			{
				
                //ignore check
                //checking collision from the hitbox object
                with(other)
				{
                    //check to see if your target is on the ignore list
                    //if it is on the ignore list, dont hit it again
                    for(i = 0; i < ds_list_size(ignoreList); i ++){
                        if(ignoreList[|i] = other.owner){
                            ignore = true;
                            break;
                        }
                    }

                    //if it is NOT on the ignore list, hit it, and add it to
                    //the ignore list
                    if(!ignore)
					{
                        other.owner.gettingHit = true;
                        other.owner.hitBy = id;
						
                        ds_list_add(ignoreList,other.owner);
                    }
                }
            }
        }
	}
}









