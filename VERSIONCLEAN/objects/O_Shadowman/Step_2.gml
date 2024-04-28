isgettingcomboedpreviouswindguy = isgettingcomboed;
if (isgettingcomboed == 0 && opponent.isgettingcomboed == 0)
{
	global.DamageReduction = 1;
	if (currentHealth < maxHealth && room_get_name(room) == "rm_FightTest")
		currentHealth += 5;
}
if (!place_meeting(x, y + 10, o_Ground) && currentSpecial <= 7.89)
	currentSpecial += 0.010;
if (currentSpecial > 7.89 && currentSpecial < 8)
	currentSpecial += 0.001;

//hurtbox
with(hurtbox){
    x = other.x + xOffset;
    y = other.y + yOffset;
	//if (other.isinswitch == -1)
	//	instance_deactivate_object(self)
}

if (hurtboxshadow != -1)
{
		with(hurtboxshadow){
	    x = other.x + xOffset;
	    y = other.y + yOffset;
	}
}

//hitbox
if(hitbox != -1)
{
    with(hitbox)
	{
		if (typeOfAttack != 6)
		{
		    x = other.x + xOffset;
		    y = other.y + yOffset;
		}
		else
		{
			y = other.y + yOffset;
			speed = 25;
			if (other.facing == 1)
				direction = 0;
			if (other.facing == -1)
				direction = 180;
		}
		if (place_meeting(x, y, o_Hitbox))
		{
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
	                    if(ignoreList[|i] = other.owner){
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
}