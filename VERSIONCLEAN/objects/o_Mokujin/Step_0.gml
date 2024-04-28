///WEIRD ASS CAMERA STUFF

var _hor = input_check("right", 1) - input_check("left", 1);
var _ver = input_check("down", 1) - input_check("right", 1);

var _viewX = camera_get_view_x(view_camera[0]);
var _viewY = camera_get_view_y(view_camera[0]);
var _viewW = camera_get_view_width(view_camera[0]);
var _viewH = camera_get_view_height(view_camera[0]);

var _gotoX = x + (_hor * 200) - (_viewW * 0.5);
var _gotoY = y + (_ver * 150) - (_viewH * 0.5);

_newX = lerp(_viewX, _gotoX, 0.05);
_newY = lerp(_viewY, _gotoY, 0.05);

 
camera_set_view_pos(view_camera[0], _newX, _newY - 36);
camera_set_view_size(view_camera[0], _viewW, _viewH)
if (o_Pause.pause == false && global.CantPlayYet == 0)
{
	left = input_check("left", 1);
	right = input_check("right", 1);
	jump = input_check("up", 1);
	down = input_check("down", 1);
	draw_set_alpha(1);
	if ((input_check_pressed("dash", 1)|| input_check_pressed("dashu", 1)|| input_check_pressed("dashd", 1)|| input_check_pressed("dashl", 1)|| input_check_pressed("dashr", 1)) && can_dash && (isDownHeavying == 1 || isAttacking == 17)  && isinhit == 0 && isinblock == 0)
	{
		isAttacking = 0;
		done2 = 0;
		
		dash = true;
		alarm[0] = room_speed / 16; // dash for eight of a second
		if input_check("right", 1)
		{
			dash_dir = 0;
		}
		else if  input_check("left", 1) 
		{
			dash_dir = 180;
		}
		else if  input_check("up", 1) 
		{
			dash_dir = 90;
		}
		else if  input_check("down", 1)
		{

			dash_dir = 270;
			if (y < 5100)
			{
				verticalspeed = 0;
				alarm[0] = room_speed / 2;
			}
		}
	}
	if (dash)
	{
		if dash && down && place_meeting(x , y +1, o_Ground)
			dash = false;
		if dash && right && place_meeting(x +1 , y, o_Ground)
			dash = false;	
		if dash && right && place_meeting(x +1 , y, o_Sheer)
			dash = false;
		if dash && left && place_meeting(x - 1 , y, o_Ground)
			dash = false;	
		if dash && left && place_meeting(x - 1 , y, o_Sheer)
			dash = false;
	}
	if dash && isDownHeavying == 1
	{
		isDownHeavying = 0;
		horizontalspeeddownheavy = 0;
		if (dash_dir= 0 && done1 == 0)
		{
			done1 = 1;
			sprite_index = spr_DashHor;
			audio_play_sound(DashSoundF, 1, 0);
			instance_create_layer(x, y - 200, "Instances_1", o_DashEffect);
		}
		if (dash_dir = 180 && done1 == 0)
		{
			done1 = 1;
			sprite_index = spr_DashHor;
			audio_play_sound(DashSoundB, 1, 0);
			instance_create_layer(x, y - 200, "Instances_1", o_DashEffect);
		}
		if (dash_dir = 90 && done1 == 0)
		{
			done1 = 1;
			sprite_index = spr_DashVer;
			audio_play_sound(DashSoundB, 1, 0);
			instance_create_layer(x - 80, y -30, "Instances_1", o_DoubleJump);
		}
		if (dash_dir = 270 && done1 == 0)
		{
			done1 = 1;
			audio_play_sound(DashSoundF, 1, 0);
			sprite_index = spr_DashVer;
			instance_create_layer(x - 80, y - 200, "Instances_1", o_DashEffectDownUp);
		}
		can_dash = 0;
		// DASH CODE
		x += lengthdir_x(dash_spd, dash_dir);
		y += lengthdir_y(dash_spd, dash_dir);

		// DASH COLLISION
		if place_meeting(x+lengthdir_x(dash_spd, dash_dir), y+lengthdir_y(dash_spd, dash_dir), o_Ground)
		{
			dash = false; // disable dashing
			done1 = 0;
			alarm[0] = -1; // disable the previously set alarm
			alarm[1] = room_speed / 4;
        
			// make it pixel perfect
			repeat(ceil(abs(dash_spd)))
			{
			    if !place_meeting(x+lengthdir_x(1, dash_dir), y+lengthdir_y(1, dash_dir), o_Ground)
			    {
			        x += lengthdir_x(1, dash_dir);
			        y += lengthdir_y(1, dash_dir);
			        }
			    else break;
			    }
		}

	}
	if (isDownHeavying ==1 && global.HitStop == 0)
	{
		if (place_meeting(x + horizontalspeeddownheavy +(30 * facing), y , o_Ground))
		{
			while (!place_meeting(x+ sign(horizontalspeeddownheavy) +(30*facing), y, o_Ground))
			{
				x = x + sign(horizontalspeeddownheavy);
			}
			horizontalspeeddownheavy = 0;
			audio_play_sound(ThumpSound, 1, 0);
		}
		if (isDownHeavying)
		{
			x = x + horizontalspeeddownheavy;
			if (horizontalspeeddownheavy > 0)
				horizontalspeeddownheavy--;
			if (horizontalspeeddownheavy < 0)
				horizontalspeeddownheavy++;
			if (horizontalspeeddownheavy == 0)
				isDownHeavying = 0;
		}
	}
	if (place_meeting(x, y, o_Ground) && facing == -1)
		x-=1;
	if (place_meeting(x, y, o_Ground) && facing == 1)
		x+=1;
	if (hasplacedamark == -1 && done == 0)
	{
		done = 1;
		alarm[3] = room_speed / 16;
	}
	
	left = input_check("left", 1);
	right = input_check("right", 1);
	jump = input_check("up", 1);
	down = input_check("down", 1);
	specialattack = input_check("special", 1);

	if (facing == 1 && input_check_pressed("hadoukenL", 1) && !down && (isAttacking == 0 || isAttacking == 19) && global.CurrentSpecialJ2 >= 2 && place_meeting(x, y +10, o_Ground) && isinblock == 0 && isinhit == 0)
	{
		sprite_index = spr_WindGuySpecialZaeshRStart;
		global.CurrentSpecialJ2 -= 2;
		if (CanSpecialCancel)
		{
			image_index = 37;
			audio_play_sound(InstantTeleportSound, 1, 0);
		}
		isAttacking = 15;
	}
	if (facing == 1 && input_check_pressed("dragonpunchR", 1) && (isAttacking == 0 || isAttacking == 5|| isAttacking == 12 || isAttacking == 19) && place_meeting(x, y +10, o_Ground) && isinblock == 0 && isinhit == 0 && global.CurrentSpecialJ2 >= 2)
	{
		sprite_index = spr_WindGuySpecialZaeshRUStart;
		image_index = 0;
		global.CurrentSpecialJ2 -= 2;
		isAttacking = 15;
	}
	if (facing == 1 && input_check_pressed("hadoukenL", 1) &&  isinblock == false && isinhit == false &&(isAttacking == 0 || (isAttacking == 6|| isAttacking == 12 || isAttacking == 19 && hit == 4 )) && !place_meeting(x, y+10, o_Ground) && global.CurrentSpecialJ2 >= 2)
	{
		global.BigAssHitStop = 0;
		sprite_index = spr_WindGuySpecialZaeshRDStart;
		image_index = 0;
		global.CurrentSpecialJ2 -= 2;
		if (CanSpecialCancel)
		{
			image_index = 37;
			horizontalspeed = 0;
			verticalspeed = 0;
			audio_play_sound(InstantTeleportSound, 1, 0);
		}
		isAttacking = 16;
	}
	if (facing == -1 && input_check_pressed("hadoukenR", 1)&& !down && (isAttacking == 0 || isAttacking == 19) && global.CurrentSpecialJ2 >= 2 && place_meeting(x, y +10, o_Ground) && isinblock == 0 && isinhit == 0)
	{
		sprite_index = spr_WindGuySpecialZaeshLStart;
		global.CurrentSpecialJ2 -= 2;
		if (CanSpecialCancel)
		{
			image_index = 37;
			audio_play_sound(InstantTeleportSound, 1, 0);
		}
		isAttacking = 15;
	}
	if (facing == -1 && input_check_pressed("dragonpunchL", 1)	&& (isAttacking == 0 || isAttacking == 5 || isAttacking == 12 || isAttacking == 19) && place_meeting(x, y +10, o_Ground) && isinblock == 0 && isinhit == 0 && global.CurrentSpecialJ2 >= 2)
	{
		sprite_index = spr_WindGuySpecialZaeshLUStart;
		image_index = 0;
		global.CurrentSpecialJ2 -= 2;
		isAttacking = 15;
	}
	if (facing == -1 && input_check_pressed("hadoukenR", 1) &&  isinblock == false && isinhit == false &&(isAttacking == 0 || (isAttacking == 6|| isAttacking == 12 || isAttacking == 19 && hit == 4 )) && !place_meeting(x, y+10, o_Ground) && global.CurrentSpecialJ2 >= 2)
	{
		global.BigAssHitStop = 0;
		sprite_index = spr_WindGuySpecialZaeshLDStart;
		image_index = 0;
		global.CurrentSpecialJ2 -= 2;
		if (CanSpecialCancel)
		{
			image_index = 37;
			horizontalspeed = 0;
			verticalspeed = 0;
			audio_play_sound(InstantTeleportSound, 1, 0);
		}
		isAttacking = 16;
	}


	if (sprite_get_name(sprite_index) == "spr_WindGuySpecialZaeshRStart")
	{
		image_speed = 1;
		if (image_index >= 0 && image_index <= 34)
		{
			if image_index == 0
			{
				horizontalspeed = 0;
				audio_play_sound(TeleportSound, 1, 0);
			}
			if (!place_meeting(x+ horizontalspeed -0.1, y, o_Ground))
				horizontalspeed -= 0.1;
		}
	//Part DASH
		if (image_index >= 35 && image_index <= 39 && toutvabien = 1)  
		{
			if (image_index == 35)
			{
				horizontalspeed = 0;
			}
			else
				horizontalspeed += 260;
			if (place_meeting(o_Sheer.x + 10, o_Sheer.y -100, o_Ground))
			{
				if (place_meeting(x + horizontalspeed, y -10, o_Sheer))
				{
					while (!place_meeting(x+ sign(horizontalspeed), y, o_Sheer)&& horizontalspeed != 0)
					{
						x = x + sign(horizontalspeed);
					}
					horizontalspeed = 0;
				}
			}
			if (image_index == 39 && x < o_Sheer.x)
			{
				sprite_index = spr_WindGuySpecialZaeshEndF;
				horizontalspeed = 0;
			}
			if (image_index == 39 && x > o_Sheer.x)
			{
				sprite_index = spr_WindGuySpecialZaeshEndB;
				horizontalspeed = 0;
			}
		}
	//Recovery DashTP
		if (place_meeting(x + horizontalspeed, y-10, o_Ground))
		{
			while (!place_meeting(x+ sign(horizontalspeed), y-10, o_Ground)&& horizontalspeed != 0)
			{
				x = x + sign(horizontalspeed);
			}
			horizontalspeed = 0;
		}
		x += horizontalspeed;
	}
	if (sprite_get_name(sprite_index) == "spr_WindGuySpecialZaeshLStart")
	{
		image_speed = 1;
		if (image_index >= 0 && image_index <= 34)
		{
			if image_index == 0
			{
				horizontalspeed = 0;
				audio_play_sound(TeleportSound, 1, 0);
			}
			if (!place_meeting(x+ horizontalspeed -0.1, y, o_Ground))
				horizontalspeed += 0.1;
		}
		if (image_index >= 35 && image_index <= 39 && toutvabien = 1)
		{
			if (image_index == 35)
			{
				horizontalspeed = 0;
			}
			else
				horizontalspeed -= 260;
			if (place_meeting(o_Sheer.x - 10, o_Sheer.y -100, o_Ground))
			{
				if (place_meeting(x + horizontalspeed, y-10, o_Sheer))
				{
					while (!place_meeting(x+ sign(horizontalspeed), y, o_Sheer)  && horizontalspeed != 0)
					{
						x = x + sign(horizontalspeed);
					}
					horizontalspeed = 0;
				}
			}
			if (image_index == 39 && x < o_Sheer.x)
			{
				sprite_index = spr_WindGuySpecialZaeshEndB;
				horizontalspeed = 0;
			}
			if (image_index == 39 && x > o_Sheer.x)
			{
				sprite_index = spr_WindGuySpecialZaeshEndF;
				horizontalspeed = 0;
			}
		}
		if (place_meeting(x + horizontalspeed, y-10, o_Ground))
		{
			while (!place_meeting(x+ sign(horizontalspeed), y-10, o_Ground)  && horizontalspeed != 0)
			{
				x = x + sign(horizontalspeed);
			}
			horizontalspeed = 0;
		}
		x += horizontalspeed;
	}
	if (sprite_get_name(sprite_index) == "spr_WindGuySpecialZaeshEndF")
	{
		if (global.BigAssHitStop == 0 && global.HitStop == 0)
			image_speed = 1;
		if (image_index == 0)
		{
			if (facing == -1)
			{
				horizontalspeed = -30;
				instance_create_layer(x + 1200, y, "Instances", o_WindZaeshHor2)
			}
			if (facing == 1)
			{
				horizontalspeed = 30;
				instance_create_layer(x - 1200, y, "Instances", o_WindZaeshHor2);
			}
		}
		if (image_index == 4)
		{
			instance_destroy(o_WindZaeshHor2);
		}
		if (!place_meeting(x + horizontalspeed, y, o_Ground))
		{
			if (facing == 1 && !place_meeting(o_Sheer.x +10, o_Sheer.y, o_Ground))
				x = x + horizontalspeed;
			if (facing ==- 1 && !place_meeting(o_Sheer.x -10, o_Sheer.y, o_Ground))
				x = x + horizontalspeed;
		}
		if (horizontalspeed < 0 && facing == -1)
			horizontalspeed++;
		if (horizontalspeed > 0 && facing == 1)
			horizontalspeed--;
		if (image_index == 33)
		{
			isAttacking = 0;
			haschargedenough = 0;
			horizontalspeed = 0;
			CanSpecialCancel = 0;
			sprite_index = spr_WindGuy;
		}
	}
	if (sprite_get_name(sprite_index) == "spr_WindGuySpecialZaeshEndB")
	{
		if (global.BigAssHitStop == 0 && global.HitStop == 0)
			image_speed = 1;
		if (image_index == 0)
		{
			if (facing == -1)
			{
				horizontalspeed = -30;
				instance_create_layer(x + 1200, y, "Instances", o_WindZaeshHor2)
			}
			if (facing == 1)
			{
				horizontalspeed = 30;
				instance_create_layer(x - 1200, y, "Instances", o_WindZaeshHor2);
			}
		}
		if (image_index == 4)
		{
			instance_destroy(o_WindZaeshHor2);
		}
		if (!place_meeting(x + horizontalspeed, y, o_Ground))
			{
			if (facing == 1 && !place_meeting(o_Sheer.x +10, o_Sheer.y, o_Ground))
				x = x + horizontalspeed;
			if (facing ==- 1 && !place_meeting(o_Sheer.x -10, o_Sheer.y, o_Ground))
				x = x + horizontalspeed;
		}
		if (horizontalspeed < 0 && facing == -1)
			horizontalspeed++;
		if (horizontalspeed > 0 && facing == 1)
			horizontalspeed--;
		if (image_index == 33)
		{
			isAttacking = 0;
			haschargedenough = 0;
			horizontalspeed = 0;
			CanSpecialCancel = 0;
			sprite_index = spr_WindGuy;
		}
	}
	if (sprite_get_name(sprite_index) == "spr_WindGuySpecialZaeshRUStart")
	{
		image_speed = 1;
		if (image_index >= 0 && image_index <= 12)
		{
			if image_index == 0
			{
				horizontalspeed = 0;
				audio_play_sound(TeleportSound, 1, 0);
			}
			if (!place_meeting(x+ horizontalspeed -0.1, y, o_Ground))
				horizontalspeed -= 0.1;
		}
		if (image_index >= 13 && image_index <= 16 && toutvabien = 1)
		{
			if (image_index == 13 || image_index == 16)
			{
				horizontalspeed = 0;
				verticalspeed = 0;
			}
			else
				horizontalspeed += 260;
			y -= 380;
			if (place_meeting(o_Sheer.x + 10, o_Sheer.y -100, o_Ground))
			{
				if (place_meeting(x + horizontalspeed, y, o_Sheer))
				{
					while (!place_meeting(x+ sign(horizontalspeed), y, o_Sheer) && horizontalspeed != 0)
					{
						x = x + sign(horizontalspeed);
					}
					horizontalspeed = 0;
				}
			}
			if (image_index == 16 && x < o_Sheer.x)
			{
				sprite_index = spr_WindGuySpecialZaeshUEndF;
				image_index = 0;
				horizontalspeed = 0;
			}
			if (image_index == 16 && x > o_Sheer.x)
			{
				sprite_index = spr_WindGuySpecialZaeshUEndB;
				image_index = 0;
				horizontalspeed = 0;
			}
		}
		if (place_meeting(x + horizontalspeed, y, o_Ground))
		{
			while (!place_meeting(x+ sign(horizontalspeed), y, o_Ground) && horizontalspeed != 0)
			{
				x = x + sign(horizontalspeed);
			}
			horizontalspeed = 0;
		}
		x += horizontalspeed;
		y += verticalspeed;
	}
	if (sprite_get_name(sprite_index) == "spr_WindGuySpecialZaeshLUStart")
	{
		image_speed = 1;
		if (image_index >= 0 && image_index <= 12)
		{
			if image_index == 0
			{
				horizontalspeed = 0;
				audio_play_sound(TeleportSound, 1, 0);
			}
			if (!place_meeting(x+ horizontalspeed +0.1, y, o_Ground))
				horizontalspeed += 0.1;
		}
		if (image_index >= 13 && image_index <= 16 && toutvabien = 1)
		{
			if (image_index == 13 || image_index == 16)
			{
				horizontalspeed = 0;
			}
			else
				horizontalspeed -= 260;
			y -= 380;
			if (place_meeting(o_Sheer.x + 10, o_Sheer.y -100, o_Ground))
			{
				if (place_meeting(x + horizontalspeed, y, o_Sheer))
				{
					while (!place_meeting(x+ sign(horizontalspeed), y, o_Sheer)  && horizontalspeed != 0)
					{
						x = x + sign(horizontalspeed);
					}
					horizontalspeed = 0;
				}
			}
			if (image_index == 16 && x < o_Sheer.x)
			{
				sprite_index = spr_WindGuySpecialZaeshUEndB;
				image_index = 0;
				horizontalspeed = 0;
			}
			if (image_index == 16 && x > o_Sheer.x)
			{
				sprite_index = spr_WindGuySpecialZaeshUEndF;
				image_index = 0;
				horizontalspeed = 0;
			}
		}
		if (place_meeting(x + horizontalspeed, y-10, o_Ground))
		{
			while (!place_meeting(x+ sign(horizontalspeed), y, o_Ground) && horizontalspeed != 0)
			{
				x = x + sign(horizontalspeed);
			}
			horizontalspeed = 0;
		}
		x += horizontalspeed;
		y += verticalspeed;
	}
	if (sprite_get_name(sprite_index) == "spr_WindGuySpecialZaeshUEndF")
	{
		if (global.BigAssHitStop == 0 && global.HitStop == 0)
			image_speed = 1;
		if (image_index == 0)
		{
			if (facing == -1)
			{
				horizontalspeed = -30;
				instance_create_layer(x + 800, y -300,"Instances", o_WindZaeshVerL2)
			}
			if (facing == 1)
			{
				horizontalspeed = 30;
				instance_create_layer(x - 800, y -300,"Instances", o_WindZaeshVerR2)
			}
		}
		if (image_index == 4)
		{
			instance_destroy(o_WindZaeshVerR2);
			instance_destroy(o_WindZaeshVerL2);
		}
		if (!place_meeting(x + horizontalspeed, y, o_Ground))
		{
			if (facing == 1 && !place_meeting(o_Sheer.x +10, o_Sheer.y, o_Ground))
				x = x + horizontalspeed;
			if (facing ==- 1 && !place_meeting(o_Sheer.x -10, o_Sheer.y, o_Ground))
				x = x + horizontalspeed;
		}
		if (horizontalspeed < 0 && facing == -1)
			horizontalspeed++;
		if (horizontalspeed > 0 && facing == 1)
			horizontalspeed--;
		if (image_index == 33)
		{
			isAttacking = 0;
			haschargedenough = 0;
			horizontalspeed = 0;
			CanSpecialCancel = 0;
			sprite_index = spr_WindGuy;
		}
	}
	if (sprite_get_name(sprite_index) == "spr_WindGuySpecialZaeshUEndB")
	{
		if (global.BigAssHitStop == 0 && global.HitStop == 0)
			image_speed = 1;
		if (image_index == 0)
		{
			if (facing == -1)
			{
				horizontalspeed = -30;
				instance_create_layer(x + 800, y -300,"Instances", o_WindZaeshVerL2)
			}
			if (facing == 1)
			{
				horizontalspeed = 30;
				instance_create_layer(x - 800, y -300,"Instances", o_WindZaeshVerR2)
			}
		}
		if (image_index == 4)
		{
			instance_destroy(o_WindZaeshVerL2);
			instance_destroy(o_WindZaeshVerR2);
		}
		if (!place_meeting(x + horizontalspeed, y, o_Ground))
		{
			if (facing == 1 && !place_meeting(o_Sheer.x +10, o_Sheer.y, o_Ground))
				x = x + horizontalspeed;
			if (facing ==- 1 && !place_meeting(o_Sheer.x -10, o_Sheer.y, o_Ground))
				x = x + horizontalspeed;
		}
		if (horizontalspeed < 0 && facing == -1)
			horizontalspeed++;
		if (horizontalspeed > 0 && facing == 1)
			horizontalspeed--;
		if (image_index == 33)
		{
			isAttacking = 0;
			haschargedenough = 0;
			horizontalspeed = 0;
			CanSpecialCancel = 0;
			sprite_index = spr_WindGuy;
		}
	}
	if (sprite_get_name(sprite_index) == "spr_WindGuySpecialZaeshRDStart")
	{
		image_speed = 1;
		if (image_index >= 0 && image_index <= 35)
		{
			if image_index == 0
			{
				horizontalspeed = 0;
				verticalspeed = 0;
				audio_play_sound(TeleportSound, 1, 0);
			}
			if (!place_meeting(x+ horizontalspeed -0.1, y, o_Ground))
			{
				horizontalspeed -= 0.1;
				verticalspeed -= 0.1;
			}
		}
		if (image_index >= 36 && image_index <= 39 && toutvabien = 1)
		{
			if (image_index == 37 || x > 8512)
			{
				horizontalspeed = 0;
			}
			else
			{
				horizontalspeed += 260;
			}
			while (!place_meeting(x, y+400, o_Ground))
				y += 400;
			if (place_meeting(x, y +400, o_Ground))
			{
				while (!place_meeting(x, y +20, o_Ground))
					y+=20;
			}
			if (image_index == 39 && x < o_Sheer.x)
			{
				sprite_index = spr_WindGuySpecialZaeshDEndF;
				horizontalspeed = 0;
				image_index = 0;
			}
			if (image_index == 39 && x > o_Sheer.x)
			{
				sprite_index = spr_WindGuySpecialZaeshDEndB;
				horizontalspeed = 0;
				image_index = 0;
			}
		}
		if (place_meeting(x + horizontalspeed, y, o_Ground))
		{
			while (!place_meeting(x+ sign(horizontalspeed), y, o_Ground) && horizontalspeed != 0)
			{
				x = x + sign(horizontalspeed);
			}

			horizontalspeed = 0;
		}
		x += horizontalspeed;
		y += verticalspeed;
	}
	if (sprite_get_name(sprite_index) == "spr_WindGuySpecialZaeshLDStart")
	{
		image_speed = 1;
		if (image_index >= 0 && image_index <= 35)
		{
			if image_index == 0
			{
				horizontalspeed = 0;
				verticalspeed = 0;
				audio_play_sound(TeleportSound, 1, 0);
			}
			if (!place_meeting(x+ horizontalspeed -0.1, y, o_Ground))
			{
				horizontalspeed += 0.1;
				verticalspeed -= 0.1;
			}
		}
		if (image_index >= 36 && image_index <= 39 && toutvabien = 1)
		{
			if (image_index == 36 || x < 1600)
			{
				horizontalspeed = 0;
			}
			else
			{
				horizontalspeed -= 260;
			}
			while (!place_meeting(x, y+400, o_Ground))
				y += 400;
			if (place_meeting(x, y +400, o_Ground))
			{
				while (!place_meeting(x, y +20, o_Ground))
					y+=20;
			}
			if (image_index == 39 && x < o_Sheer.x)
			{
				sprite_index = spr_WindGuySpecialZaeshDEndB;
				horizontalspeed = 0;
				image_index = 0;
			}
			if (image_index == 39 && x > o_Sheer.x)
			{
				sprite_index = spr_WindGuySpecialZaeshDEndF;
				horizontalspeed = 0;
				image_index = 0;
			}
		}
		if (place_meeting(x + horizontalspeed, y, o_Ground))
		{
			while (!place_meeting(x+ sign(horizontalspeed), y, o_Ground) && horizontalspeed != 0)
			{
				x = x + sign(horizontalspeed);
			}
			horizontalspeed = 0;
		}
		x += horizontalspeed;
		y += verticalspeed;
	}
	if (sprite_get_name(sprite_index) == "spr_WindGuySpecialZaeshDEndF" || sprite_get_name(sprite_index) == "spr_WindGuySpecialZaeshDEndB")
	{
		image_speed = 1;
		if (image_index == 0)
		{
			if (facing == -1)
			{
				horizontalspeed = -30;
				instance_create_layer(x + 1000, y - 2000, "Instances", o_WindZaeshVerLD2);
			}
			if (facing == 1)
			{
				horizontalspeed = 30;
				instance_create_layer(x -1000, y - 2000, "Instances", o_WindZaeshVerRD2);
				o_WindZaeshVerRD.image_xscale = -1
			}
		}
		if (image_index == 4)
		{
			instance_destroy(o_WindZaeshVerLD2);
			instance_destroy(o_WindZaeshVerRD2);
		}
		if (!place_meeting(x + horizontalspeed, y, o_Ground))
		{
			if (facing == 1 && !place_meeting(o_Sheer.x +10, o_Sheer.y, o_Ground))
				x = x + horizontalspeed;
			if (facing ==- 1 && !place_meeting(o_Sheer.x -10, o_Sheer.y, o_Ground))
				x = x + horizontalspeed;
		}
		while (!place_meeting(x, y+1, o_Ground))
			y += 1;
		if (horizontalspeed < 0 && facing == -1)
			horizontalspeed++;
		if (horizontalspeed > 0 && facing == 1)
			horizontalspeed--;
		if (image_index == 33)
		{
			isAttacking = 0;
			haschargedenough = 0;
			horizontalspeed = 0;
			CanSpecialCancel = 0;
			sprite_index = spr_WindGuy;
		}
	}

	if (global.HitStop == 1 || global.BigAssHitStop == 1)
	{
		left = input_check("left", 1);
		right = input_check("right", 1);
		jump = input_check("up", 1);
		down = input_check("down", 1);
		specialattack = input_check("special", 1);
		specialattack = keyboard_check(ord("I"));
		mediumattack = input_check("medium", 1);
		lightattack = input_check("light", 1);
		heavyattack = input_check("heavy", 1);
		
		if (isAttacking == 5 && input_check_pressed("up", 1))
		{
			jumpduringhitstop = 1;
		}
		if (isinhit)
		{
			if (hasstartedshake == 0)
			{
				shakestartx = x;
				hasstartedshake = 1;
			}
			var ran_x = irandom_range(round(x - 6), round(x + 6));
			move_towards_point(round(ran_x), y, 6);
		}
		if (sprite_get_name(sprite_index) != "spr_MokujinBlockTrue")
			image_speed = 0;
		if (down && mediumattack && (isAttacking == 0 || isAttacking == 6) && isdoinglecouprelou == 0 && isinhit == 0 && isinblock == 0)
		{
			global.BigAssHitStop = 0;
			sprite_index = spr_WindGuyMediumDownAir;
			image_index = 10;
			isdoinglecouprelou = 1;
			isAttacking = 12;
		}
		if (heavyattack && (isAttacking == 0 || isAttacking == 6 ) && done2 == 0 && isinhit == 0 && isinblock == 0)
		{
			done2 = 1;
			global.BigAssHitStop = 0;
			sprite_index = spr_WindGuyHeavyDownAir;
			image_index = 0;
			isAttacking = 13;
		}
		if (facing == 1)
		{
			if (left && heavyattack && (isAttacking == 0 || isAttacking == 6 || isAttacking == 13) && isinhit == 0 && isinblock == 0)
			{
				global.BigAssHitStop = 0;
				sprite_index = spr_WindGuyGrabAir;
				image_index =0;
				isdoingledeuxiemecouprelou = 0;
				isAttacking = 11;
			}
			if (left && mediumattack && (isAttacking == 0 || isAttacking == 6 || isAttacking == 13) && isinhit == 0 && isinblock == 0)
			{
				global.BigAssHitStop = 0;
				sprite_index = spr_WindGuyMediumBackAir;
				image_index = 0;
				isAttacking = 17;
			}
		}
		if (facing == -1)
		{
			if (right && heavyattack && (isAttacking == 0 || isAttacking == 6 || isAttacking == 13) && isinhit == 0 && isinblock == 0)
			{
				global.BigAssHitStop = 0;
				sprite_index = spr_WindGuyGrabAir;
				image_index = 0;
				isAttacking = 11;
			}
			if (right && mediumattack && (isAttacking == 0 || isAttacking == 6 || isAttacking == 13) && isinhit == 0 && isinblock == 0)
			{
				global.BigAssHitStop = 0;
				sprite_index = spr_WindGuyMediumBackAir;
				image_index = 0;
				isAttacking = 17;
			}
		}
		if (facing == 1 && left && specialattack && !down && (isAttacking == 0||isAttacking == 6 || isAttacking == 13) && isinhit == 0 && isinblock == 0)
		{
			sprite_index = spr_WindGuySpecialZaeshRStart;
			image_index = 29;
			isAttacking = 15;
		}
	}
	if (global.HitStop == 0 && global.BigAssHitStop == 0 && isAttacking != 15 && isAttacking != 16 && isDownHeavying == 0)
	{
		left = input_check("left", 1);
		right = input_check("right", 1);
		jump = input_check("up", 1);
		down = input_check("down", 1);
		specialattack = input_check("special", 1);
		mediumattack = input_check("medium", 1);
		lightattack = input_check("light", 1);
		heavyattack = input_check("heavy", 1);
		speed = 0;
		if (sprite_get_name(sprite_index) == "spr_WindGuyCrouch")
		{
			isAttacking = 0;
		}
		if (hasstartedshake == 1)
		{
			x = shakestartx;
			hasstartedshake = 0;
		}
		if (x - o_Sheer.x > 0)
		{
			facing = -1;
			hitDirectionModifier = 300;
			mediumHitDirectionModifier = 480;
		}
		if (x - o_Sheer.x < 0)
		{
			facing = 1;
			hitDirectionModifier = 1;
			mediumHitDirectionModifier = 1;
		}

		if facing == 1
			image_xscale = 1;
		else if facing == -1
			image_xscale = -1;

		image_speed = 1;

		if ((input_check_pressed("dash", 1)|| input_check_pressed("dashu", 1)|| input_check_pressed("dashd", 1)|| input_check_pressed("dashl", 1)|| input_check_pressed("dashr", 1)) && can_dash && isStartingJump == 0	&& (isAttacking == 0 || isAttacking == 13) && isinhit == 0 && isinblock == 0)
		{
			isAttacking = 0;
			done2 = 0;
			
		    dash = true;
			if (place_meeting(x, y + 10, o_Ground) &&input_check_pressed("dashu", 1))
				dash = false
			if (!place_meeting(x, y +10, o_Ground))
				hasdashedinair = 1;
		    alarm[0] = room_speed / 16; // dash for eight of a second
			if  input_check("right", 1) 
			{
				dash_dir = 0;
				if (place_meeting(x, y+10, o_Ground))
					alarm[0] = room_speed / 8;
			}
		    else if  (input_check("up", 1) && place_meeting(x, y+10, o_Ground))
			{
				dash = false
			}
		    else if  input_check("down", 1) 
			{

				dash_dir = 270;
				if (y < 5100)
				{
					verticalspeed = 0;
					alarm[0] = room_speed / 2;
				}
			}
			else if (facing == 1 && !left && !right && !down)
			{
				dash_dir = 0;
				if (place_meeting(x, y+10, o_Ground))
					alarm[0] = room_speed / 8;
			}
			else if (facing == -1  && !left && !right && !down)
			{
				dash_dir = 180;
				if (place_meeting(x, y+10, o_Ground))
					alarm[0] = room_speed / 8;
			}
		}
		if (o_Sheer.facing == 1 && dash_dir = 0 && global.CurrentDistance + dash_spd > global.MaxDistance)
			dash = false;
		if (o_Sheer.facing == -1 && dash_dir = 180 && global.CurrentDistance + dash_spd > global.MaxDistance)
			dash = false;
		if dash && dash_dir == 270 && place_meeting(x , y + dash_spd, o_Ground)
			dash = false;
		if dash && dash_dir == 270 && place_meeting(x , y + dash_spd, o_Sheer)
		{
			if (x < o_Sheer.x)
			{
				while ( place_meeting(x , y + dash_spd, o_Sheer))
				{
					if (!place_meeting(x - 5, y, o_Ground))
						x -= 5;
					else
						o_Sheer.x += 5;
				}
			}
			if (x > o_Sheer.x)
			{
				while ( place_meeting(x , y + dash_spd, o_Sheer))
				{
					if (!place_meeting(x + 5, y, o_Ground))
						x += 5;
					else
						o_Sheer.x -= 5;
				}
			}
		}
		if dash && dash_dir == 0 && place_meeting(x + dash_spd , y, o_Ground)
			dash = false;	
		if dash && dash_dir == 0 && place_meeting(x + dash_spd , y - 100, o_Sheer)
			dash = false;
		if dash && dash_dir == 180 && place_meeting(x - dash_spd , y, o_Ground)
			dash = false;	
		if dash && dash_dir == 180 && place_meeting(x - dash_spd , y - 100, o_Sheer)
			dash = false;
		if (place_meeting(x, y +10, o_Ground) && global.CurrentSpecialJ2 >= 1 && dash == true && done1 == 0)
			global.CurrentSpecialJ2 -= 1;
		else if (place_meeting(x, y +10, o_Ground) && global.CurrentSpecialJ2 < 1 && done1 == 0)
			dash = false;
		if dash 
		{
			if (dash_dir= 0 && done1 == 0)
			{
				done1 = 1;
				sprite_index = spr_DashHor;
				audio_play_sound(DashSoundF, 1, 0);
				instance_create_layer(x, y - 200, "Instances_1", o_DashEffect);
			}
			if (dash_dir = 180 && done1 == 0)
			{
				done1 = 1;
				sprite_index = spr_DashHor;
				audio_play_sound(DashSoundB, 1, 0);
				instance_create_layer(x, y - 200, "Instances_1", o_DashEffect);
			}
			if (dash_dir = 90 && done1 == 0)
			{
				done1 = 1;
				sprite_index = spr_DashVer;
				audio_play_sound(DashSoundB, 1, 0);
				instance_create_layer(x - 80, y -30, "Instances_1", o_DoubleJump);
			}
			if (dash_dir = 270 && done1 == 0)
			{
				done1 = 1;
				audio_play_sound(DashSoundF, 1, 0);
				sprite_index = spr_DashVer;
				instance_create_layer(x - 80, y - 200, "Instances_1", o_DashEffectDownUp);
			}
			can_dash = 0;
		    // DASH CODE
		    x += lengthdir_x(dash_spd, dash_dir);
		    y += lengthdir_y(dash_spd, dash_dir);

		    // DASH COLLISION
			if (place_meeting(x, y, o_WindTornado2))
			{
				dash = false; // disable dashing
				done1 = 0;
		        alarm[0] = -1; // disable the previously set alarm
				alarm[1] = room_speed / 4;
				verticalspeed -= 100;
				hasdashedinair = 1;
				if (facing == 1)
					horizontalspeed = 40;
				else
					horizontalspeed = - 40;
			}
		    if place_meeting(x+lengthdir_x(dash_spd, dash_dir), y+lengthdir_y(dash_spd, dash_dir), o_Ground)
		    {
		        dash = false; // disable dashing
				done1 = 0;
		        alarm[0] = -1; // disable the previously set alarm
				alarm[1] = room_speed / 4;
        
		        // make it pixel perfect
		        repeat(ceil(abs(dash_spd)))
		        {
		            if !place_meeting(x+lengthdir_x(1, dash_dir), y+lengthdir_y(1, dash_dir), o_Ground)
		            {
		                x += lengthdir_x(1, dash_dir);
		                y += lengthdir_y(1, dash_dir);
		                }
		            else break;
		            }
			}

		}
		else
		{
			if (isAttacking != 0)
			{
				audio_stop_sound(WindBoostSoundP2);
				windboost = 1;
			}
			var move = right - left;
			if (hasdashedinair == 0)
				horizontalspeed = move * movespeed * windboost;
			verticalspeed = verticalspeed + grv;
		
/*			if (place_meeting(x - 2, y, o_Ground))
					x += 2;
			if (place_meeting(x + 2, y, o_Ground))
					x -= 2;*/
			if (place_meeting(x + horizontalspeed, y, o_Ground))
			{
				while (!place_meeting(x+ sign(horizontalspeed), y, o_Ground))
				{
					x = x + sign(horizontalspeed);
				}
				horizontalspeed = 0;
			}
			if (place_meeting(x + 1, y, o_Sheer) && right && facing == 1)
			{
				if (!place_meeting(o_Sheer.x + 10, o_Sheer.y, o_Ground))
				{
					x += 10;
					o_Sheer.x += 10;
				}
				horizontalspeed = 0;
			}
			if (place_meeting(x - 1, y, o_Sheer) && left && facing == -1)
			{
				if (!place_meeting(o_Sheer.x -10, o_Sheer.y, o_Ground))
				{
					x -= 10;
					o_Sheer.x -= 10;
				}
				horizontalspeed = 0
			}
			if (place_meeting(x, y + verticalspeed, o_Sheer) && y < o_Sheer.y)
			{
				if (x < o_Sheer.x)
				{
					while (place_meeting(x, y + verticalspeed, o_Sheer))
					{
						if (!place_meeting(x - 10, y, o_Ground))
							x -= 10;
						if (!place_meeting(o_Sheer.x + 10, o_Sheer.y, o_Ground))
							o_Sheer.x += 10;
					}
				}
				if (x > o_Sheer.x)
				{
					while (place_meeting(x, y + verticalspeed, o_Sheer))
					{
						if (!place_meeting(x + 10, y, o_Ground))
							x += 10;
						if (!place_meeting(o_Sheer.x + 10, o_Sheer.y, o_Ground))
							o_Sheer.x -= 10;
					}
				}
				if (x == o_Sheer.x)
				{
					if (x > 3000)
						x -= 10
					else 
						x += 10
				}
			}
			if (!place_meeting(x, y +10, o_Ground) && isAttacking == 0  && sprite_get_name(sprite_index) != "spr_MokujinBlockTrue" && sprite_get_name(sprite_index) != "spr_MokujinHitDownHeavyAirTrue" && sprite_get_name(sprite_index) != "spr_MokujinHitTrue" && sprite_get_name(sprite_index) != "spr_MokujinHitGrabTrue" && sprite_get_name(sprite_index) != "spr_MokujinHitHeavyChargeTrue" && sprite_get_name(sprite_index) != "spr_MokujinHitHeavyStandTrue" && sprite_get_name(sprite_index) != "spr_MokujinHitLightAirTrue" && sprite_get_name(sprite_index) != "spr_MokujinHitMarkTrue" && sprite_get_name(sprite_index) != "spr_MokujinHitMediumStandTrue" && sprite_get_name(sprite_index) != "spr_MokujinHitZaeshTrue" && sprite_get_name(sprite_index) != "spr_MokujinHitWallTrue"  && sprite_get_name(sprite_index) != "spr_MokujinHitGroundTrue" && sprite_get_name(sprite_index) != "spr_MokujinHitBackMediumAirTrue" && sprite_get_name(sprite_index) != "spr_WindGuyLand" && sprite_get_name(sprite_index) != "spr_MokujinBlockCrouchTrue" && sprite_get_name(sprite_index) != "spr_WindGuySpecialFakeProjo" && sprite_get_name(sprite_index) != "spr_MokujinBlockMediumTrue" && sprite_get_name(sprite_index) != "spr_MokujinBlockMediumCrouchTrue" && sprite_get_name(sprite_index) != "spr_WindGuyHeavyStandLight" && sprite_get_name(sprite_index) != "spr_WindGuyHeavyStandMedium" && sprite_get_name(sprite_index) != "spr_WindGuyJumpStart")
			{
				IsJumpingN = 1;
				done3lol = 0;
				isgettingcomboed = 0;
				isinblock = 0;
				isinhit = 0;
				sprite_index = spr_WindGuyJump;
			}
			if (place_meeting(x, y +1, o_Ground) && isAttacking == 0 && !down && sprite_get_name(sprite_index) != "spr_MokujinBlockTrue" && sprite_get_name(sprite_index) != "spr_MokujinHitDownHeavyAirTrue" && sprite_get_name(sprite_index) != "spr_MokujinHitTrue" && sprite_get_name(sprite_index) != "spr_MokujinHitGrabTrue" && sprite_get_name(sprite_index) != "spr_MokujinHitHeavyChargeTrue" && sprite_get_name(sprite_index) != "spr_MokujinHitHeavyStandTrue" && sprite_get_name(sprite_index) != "spr_MokujinHitLightAirTrue" && sprite_get_name(sprite_index) != "spr_MokujinHitMarkTrue" && sprite_get_name(sprite_index) != "spr_MokujinHitMediumStandTrue" && sprite_get_name(sprite_index) != "spr_MokujinHitZaeshTrue" && sprite_get_name(sprite_index) != "spr_MokujinHitWallTrue"  && sprite_get_name(sprite_index) != "spr_MokujinHitGroundTrue" && sprite_get_name(sprite_index) != "spr_MokujinHitBackMediumAirTrue" && sprite_get_name(sprite_index) != "spr_WindGuyLand" && sprite_get_name(sprite_index) != "spr_MokujinBlockCrouchTrue" && sprite_get_name(sprite_index) != "spr_WindGuySpecialFakeProjo" && sprite_get_name(sprite_index) != "spr_MokujinBlockMediumTrue" && sprite_get_name(sprite_index) != "spr_MokujinBlockMediumCrouchTrue"&& sprite_get_name(sprite_index) != "spr_WindGuyHeavyStandLight" && sprite_get_name(sprite_index) != "spr_WindGuyHeavyStandMedium"&& sprite_get_name(sprite_index) != "spr_WindGuyJumpStart")
			{
				isgettingcomboed = 0;
				done3lol = 0;
				hasdashedinair = 0;
				canjumpcancel = 0;
				isinblock = 0;
				isinhit = 0;
				sprite_index = spr_WindGuy;
			}
			if (place_meeting(x + horizontalspeed, y, o_Sheer))
			{
				while (!place_meeting(x+ sign(horizontalspeed), y, o_Sheer))
				{
					x = x + sign(horizontalspeed);
				}
				horizontalspeed = 0;
			}

			if (place_meeting(x, y + verticalspeed, o_Ground))
			{
				while (!place_meeting(x, y+ sign(verticalspeed), o_Ground))
				{
					y = y + sign(verticalspeed);
				}
				verticalspeed = 0;
			}
			if (place_meeting(x, y+1, o_Ground))
			{
				if (landed == 0 && IsJumpingN)
				{
					audio_play_sound(LandingSound, 1, 0);
					landed = 1;
				}
				if (landed == 0 && (isJumpingL || isJumpingR))
				{
					audio_play_sound(LandingSound02, 1, 0);
					landed = 1;
				}
				isJumpingR = 0;
				IsJumpingN = 0;
				isJumpingL = 0;
				hasdashedinair = 0;
				isdoinglecouprelou = 0;
				CanSpecialCancel = 0;
				
				isdoingledeuxiemecouprelou = 0;
				if (alarm_get(1) == 0 || (!alarm[1] && !alarm[2]))
				can_dash = 1;
				if (lightattack && !down && isAttacking == 0 && isinhit == false && isinblock == false)
				{
					hit = 0;
					sprite_index = spr_WindGuyLightStand;
					image_index = 0;
					isAttacking = 1;
				}
				if (mediumattack && !down && isAttacking == 0 && isinhit == false && isinblock == false)
				{
					sprite_index = spr_WindGuyMediumStand;
					image_index = 0;
					isAttacking = 4;
				}
				if (down && sprite_get_name(sprite_index) == "spr_WindGuy")
				{
					sprite_index = spr_WindGuyCrouch;
					isCrouching = 1;
				}
				if (down && lightattack && isAttacking == 0 && isinhit == false && isinblock == false)
				{
					sprite_index = spr_WindGuyLightCrouch;
					image_index = 0;
					isCrouching = 1;
					isAttacking = 2;
				}
				if (down && mediumattack && isAttacking == 0 && isinhit == false && isinblock == false)
				{
					sprite_index = spr_WindGuyMediumCrouch;
					image_index = 0;
					isCrouching = 1;
					isAttacking = 5;
				}
				if (down && heavyattack && isAttacking == 0 && isinhit == false && isinblock == false)
				{
					sprite_index = spr_WindGuyHeavyCrouch;
					image_index = 0;
					heavycharge = 0;
					isCrouching = 1;
					isAttacking = 8;
				}
			
				if (facing = 1)
				{
					if (input_check_pressed("hadoukenR", 1) && isAttacking == 0 && isinblock == false && isinhit == false)
					{
						sprite_index = spr_WindGuySpecialProjo;
						image_index = 0;
						isAttacking = 14;
					}
					if (heavyattack && !right && !down && isAttacking == 0 && isinblock == false && isinhit == false)
					{
					sprite_index = spr_WindGuyHeavyStand;
					image_index = 0;
					isAttacking = 7;
					}
					if (heavyattack && right && isAttacking == 0 && isinblock == false && isinhit == false)
					{
						sprite_index = spr_WindGuyHeavyOverHead;
						image_index = 0;
						isAttacking = 9;
					}
					if (specialattack && !right && left && isAttacking == 0 && isinblock == false && isinhit == false)	//Add some cancels to that bitch
					{
						sprite_index = spr_WindGuySpecialFakeProjo;
						image_index = 0;
						isAttacking = 19;
					}
				}
				if (facing = -1)
				{
					if (input_check_pressed("hadoukenL", 1) && isAttacking == 0 && isinblock == false && isinhit == false)
					{
						sprite_index = spr_WindGuySpecialProjo;
						image_index = 0;
						isAttacking = 14;
					}
					if (heavyattack && !left && !down && isAttacking == 0 && isinblock == false && isinhit == false)
					{
						sprite_index = spr_WindGuyHeavyStand;
						image_index = 0;
						isAttacking = 7;
					}
					if (heavyattack && left && isAttacking == 0 && isinblock == false && isinhit == false)
					{
						sprite_index = spr_WindGuyHeavyOverHead;
						image_index = 0;
						isAttacking = 9;
					}
					if (specialattack && right && !left && isAttacking == 0 && isinblock == false && isinhit == false)	//Add some cancels to that bitch
					{
						sprite_index = spr_WindGuySpecialFakeProjo;
						image_index = 0;
						isAttacking = 19;
					}
				}
				if (!down && sprite_get_name(sprite_index) == "spr_WindGuyCrouch" && isinblock == false && isinhit == false && isAttacking == 0)
				{
					sprite_index = spr_WindGuy;
					isCrouching = 0;
					heavycharge = 0;
				}
			}
			if ((place_meeting(x, y+1, o_Ground)) && input_check_pressed("up", 1, 0.5) && (sprite_get_name(sprite_index) == "spr_WindGuy"|| (isAttacking == 5 && hit == 4)))
			{
				alarm[2] = room_speed / 16;
				can_dash = 0;
				landed = 0;
				sprite_index = spr_WindGuyJumpStart;
				isStartingJump = 1;
				if (input_check_pressed("superjump", 1))
					isStartingJump = 2;
				image_index = 0;
			}
			if ((sprite_get_name(sprite_index)== "spr_WindGuyJumpStart" && image_index > 4) || (isAttacking == 12 && hit == 4 && jump) || (canjumpcancel && hasdashedinair) || jumpduringhitstop == 1)
			{
				sprite_index = spr_WindGuyJump;
				y-=100;
				jumpduringhitstop = 0;
				if (isAttacking == 0)
				{
					verticalspeed = -100;
					if (isStartingJump == 2)
						verticalspeed = -115;
				}
				if ((isAttacking == 5 && canjumpcancel) && hit == 4 )
				{
					CanSpecialCancel = 0;
					canjumpcancel = 0;
					verticalspeed = -100;
					sprite_index = spr_WindGuyJump;
				}
				if (hasdashedinair && canjumpcancel)
				{
					canjumpcancel = 0;
					verticalspeed = -100;
					sprite_index = spr_WindGuyJump;
				}
				if ((isAttacking == 12)&& hit == 4 )
				{
					CanSpecialCancel = 0;
					verticalspeed = -100;
					instance_create_layer(x - 80, y -30, "Instances_1", o_DoubleJump);
					sprite_index = spr_WindGuyJump;
				}
				if (right && verticalspeed != 0)
				{
					isJumpingR = 1;
					if (isStartingJump == 2)
						isJumpingR = 2;
				}
				else if (left && verticalspeed != 0)
				{
					isJumpingL = 1;
					if (isStartingJump == 2)
						isJumpingL = 2;
				}
				else if (!left && !right && verticalspeed != 0)
				{
					IsJumpingN = 1;
				}
				isStartingJump = 0;
			}
		
			///IS DOING STUF
	
			//IS DOING JUMP
			if (isJumpingR == 1 && !place_meeting(x + 12, y, o_Ground)&& !place_meeting(x + 12, y, o_Sheer) && hasdashedinair == 0)
			{
				if (facing == -1 && global.CurrentDistance +12 < global.MaxDistance)
					x += 12;
				if (facing == 1)
					x += 12;
				if (verticalspeed < 0  && sprite_get_name(sprite_index) == "spr_WindGuyJump")
					image_index = 0;
				if (verticalspeed > 0  && sprite_get_name(sprite_index) == "spr_WindGuyJump")
					image_index = 1;
				if (verticalspeed > 0 && y > 5330 && IsJumpingN)
				{
					sprite_index = spr_WindGuyLand;
					isAttacking = 0
				}
			}
			if (isJumpingR == 2 && !place_meeting(x + 24, y, o_Ground)&& !place_meeting(x + 24, y, o_Sheer) && hasdashedinair == 0)
			{
				if (facing == -1 && global.CurrentDistance +24 < global.MaxDistance)
					x += 24;
				if (facing == 1)
					x += 24;
				if (verticalspeed < 0  && sprite_get_name(sprite_index) == "spr_WindGuyJump")
					image_index = 0;
				if (verticalspeed > 0  && sprite_get_name(sprite_index) == "spr_WindGuyJump")
					image_index = 1;
				if (verticalspeed > 0 && y > 5330 && IsJumpingN)
				{
					sprite_index = spr_WindGuyLand;
					isAttacking = 0
				}
			}
			if (isJumpingL == 1 && !place_meeting(x - 12, y, o_Ground) && !place_meeting(x - 12, y, o_Sheer)&& hasdashedinair == 0)
			{
				if (facing == 1 && global.CurrentDistance -12 < global.MaxDistance)
					x -= 12;
				if (facing == -1)
					x -= 12;
				if (verticalspeed < 0  && sprite_get_name(sprite_index) == "spr_WindGuyJump")
					image_index = 0;
				if (verticalspeed > 0 && sprite_get_name(sprite_index) == "spr_WindGuyJump")
					image_index = 1;
				if (verticalspeed > 0 && y > 5330 && IsJumpingN)
				{
					sprite_index = spr_WindGuyLand;
					isAttacking = 0
				}
			}
			if (isJumpingL == 2 && !place_meeting(x - 24, y, o_Ground) && !place_meeting(x - 24, y, o_Sheer)&& hasdashedinair == 0)
			{
				if (facing == 1 && global.CurrentDistance -24 < global.MaxDistance)
					x -= 24;
				if (facing == -1)
					x -= 24;
				if (verticalspeed < 0  && sprite_get_name(sprite_index) == "spr_WindGuyJump")
					image_index = 0;
				if (verticalspeed > 0 && sprite_get_name(sprite_index) == "spr_WindGuyJump")
					image_index = 1;
				if (verticalspeed > 0 && y > 5330 && IsJumpingN)
				{
					sprite_index = spr_WindGuyLand;
					isAttacking = 0
				}
			}
			if (IsJumpingN == 1 && sprite_get_name(sprite_index) == "spr_WindGuyJump")
			{
				if (verticalspeed < 0)
					image_index = 0;
				if (verticalspeed > 0)
					image_index = 1;
				if (verticalspeed > 0 && y > 5330 && IsJumpingN)
				{
					sprite_index = spr_WindGuyLand;
					isAttacking = 0
				}
			}
			//IS JUMPING AND ATTACKING 
			if (isJumpingL || IsJumpingN || isJumpingR)
			{
				if (lightattack && (isAttacking == 0 || isAttacking == 5) && isinblock == false && isinhit == false)
				{
					sprite_index = spr_WindGuyLightAir;
					isAttacking = 3;
				}
				if (mediumattack && !down && (isAttacking == 0 || isAttacking == 5|| isAttacking == 3) && isinblock == false && isinhit == false)
				{
					sprite_index = spr_WindGuyMediumAir;
					image_index = 0;
					isAttacking = 6;
				}
				if (mediumattack && down && !left && (isAttacking == 0 || isAttacking == 6) && isdoinglecouprelou == 0 && isinblock == false && isinhit == false)
				{
					sprite_index = spr_WindGuyMediumDownAir;
					image_index = 0;
					isAttacking = 12;
					isdoinglecouprelou = 1;
				}
			
				if (heavyattack && down && !left && (isAttacking == 0 || isAttacking == 6) && isinblock == false && isinhit == false)
				{
					sprite_index = spr_WindGuyHeavyAir;
					isAttacking = 10;
				}
				if (facing = 1)
				{
					if (mediumattack && !down && left && !right && (isAttacking == 0 || isAttacking == 6) && isinblock == false && isinhit == false)
					{
						sprite_index = spr_WindGuyMediumBackAir;
						image_index = 0;
						isAttacking = 17;
					}
					if (heavyattack && left && isAttacking == 0 && isdoingledeuxiemecouprelou == 0 && isinblock == false && isinhit == false)
					{
						sprite_index = spr_WindGuyGrabAir;
						image_index = 0;
						isAttacking = 11;
						isdoingledeuxiemecouprelou = 1;
					}
				}
				if (facing == -1)
				{
					if (mediumattack && !down && !left && right && (isAttacking == 0 || isAttacking == 6) && isinblock == false && isinhit == false)
					{
						sprite_index = spr_WindGuyMediumBackAir;
						image_index = 0;
						isAttacking = 17;
					}
					if (heavyattack && right && isAttacking == 0 && isdoingledeuxiemecouprelou == 0 && isinblock == false && isinhit == false)
					{
						sprite_index = spr_WindGuyGrabAir;
						image_index = 0;
						isAttacking = 11;
						isdoingledeuxiemecouprelou = 1;
					}
				}
			if (heavyattack && !left && !down && (isAttacking == 0||isAttacking == 6) && isinblock == false && isinhit == false)
				{
					sprite_index = spr_WindGuyHeavyDownAir;
					isAttacking = 13;
				}
			}
			//IS DOING SLIDE
			if (isGlissade == 1)
				x += 8;
			//IS ATTACKING
			if (sprite_get_name(sprite_index) == "spr_WindGuy" ||sprite_get_name(sprite_index) == "spr_WindGuyJump" )
			{
				isAttacking = 0;
				done2 = 0;
			}
			if (hit != 0)
			{
				canblockinair = 1;
				if (instance_exists(O_MarkLow))
					instance_destroy(O_MarkLow);
				if (instance_exists(O_MarkMid))
					instance_destroy(O_MarkMid);
				if (instance_exists(O_MarkOverHead))
					instance_destroy(O_MarkOverHead);
			}
			if (o_Sheer.facing == -1 && horizontalspeed < 0 && global.CurrentDistance + horizontalspeed > global.MaxDistance)
				horizontalspeed = 0;
			if (o_Sheer.facing == 1 && horizontalspeed > 0 && global.CurrentDistance + horizontalspeed > global.MaxDistance)
				horizontalspeed = 0;
			if (place_meeting(x, y+1, o_Ground) && (sprite_get_name(sprite_index) == "spr_WindGuy" ||sprite_get_name(sprite_index) == "spr_WindGuyJump" ))
			{
				x = x + horizontalspeed;
			}
			else if (hasdashedinair == 1)
				x = x + horizontalspeed;
			else if (speedbonus > 0 && !place_meeting(x + (speedbonus * -facing), y, o_Ground))
			{
				x = x - (speedbonus * facing);
				speedbonus--;
			}
			y = y + verticalspeed;
			if (isAttacking	!= 0)
	{
			if (sprite_get_name(sprite_index) == "spr_WindGuyLightStand")
			{
				image_speed = 1;
				if (image_index == 10)
				{
					audio_play_sound(WhooshSound, 1, 0);
					instance_create_layer(x + ((240 + hitDirectionModifier) * facing), y - 646, "Instances", o_WindLightStand2);
				}
				if (image_index >= 12)
				{
					if (instance_exists(o_WindLightStand2))
						instance_destroy(o_WindLightStand2);
					if (lightattack && hit == 1 && image_index >= 13)
					{
						image_index = 0;
						isAttacking = 1;
						hit = 0;
					}
					if (mediumattack && hit == 1 && image_index >= 13)
					{
						sprite_index = spr_WindGuyMediumStand;
						image_index = 0;
						isAttacking = 4;
					}
				}
				if (image_index >= 21)
					sprite_index = spr_WindGuy;
			}
			if (sprite_get_name(sprite_index) == "spr_WindGuyLightCrouch")
			{
				image_speed = 1;
				if (image_index == 10)
				{
					audio_play_sound(WhooshSound, 1, 0);
					instance_create_layer(x +((240 + hitDirectionModifier) * facing), y -340, "Instances", o_WindLightStand2);
				}
				if (image_index == 12)
					instance_destroy(o_WindLightStand2);
				if (image_index >= 16)
				{
					sprite_index = spr_WindGuy;
					if (down)
						sprite_index = spr_WindGuyCrouch;
				}
		
			}
			if (sprite_get_name(sprite_index) == "spr_WindGuyLightAir")
			{
				image_speed = 1;
				if (image_index == 6)
				{
					audio_play_sound(WhooshSound, 1, 0);
					instance_create_layer(x + ((240 +hitDirectionModifier) * facing), y - 646, "Instances", o_WindLightStand2);
				}
				if (image_index >= 6 && image_index <= 10 && instance_exists(o_WindLightStand2))
				{
					o_WindLightStand2.x = x + ((240 + hitDirectionModifier) * facing);
					o_WindLightStand2.y = y - 550;
				}
				if (image_index == 10)
					instance_destroy(o_WindLightStand2);
				if (image_index >= 12 && mediumattack && hit == 1)
					sprite_index = spr_WindGuyMediumAir;
				if (image_index >= 21)
					sprite_index = spr_WindGuy;
			}
			if (sprite_get_name(sprite_index) == "spr_WindGuyMediumStand")
			{
				image_speed = 1;
				if (image_index == 13)
				{
					audio_play_sound(WhooshMediumSound, 1, 0);
					instance_create_layer(x +((120 + mediumHitDirectionModifier) * facing), y -646, "Instances", o_WindMediumStand2);
				}
				if (image_index == 15)
					instance_destroy(o_WindMediumStand2);
				if (image_index >= 17 && heavyattack && hit == 4)
				{
					sprite_index = spr_WindGuyHeavyStand;
					image_index = 0;
					isAttacking = 7;
				}
				if (image_index >= 17 && mediumattack && down && hit == 4)
				{
					sprite_index = spr_WindGuyMediumCrouch;
					image_index = 0;
					isAttacking = 12;
				}
				if (image_index >= 29)
				{
					sprite_index = spr_WindGuy;
				}
		
			}
			if (sprite_get_name(sprite_index) == "spr_WindGuyMediumBackAir")
			{
				image_speed = 1;
				if (image_index == 13)
				{
					audio_play_sound(WhooshMediumSound, 1, 0);
					if (facing == 1)
						instance_create_layer(x - 250, y + 440, "Instances", o_WindMediumBackAir2);
					if (facing == -1)
						instance_create_layer(x - 250, y + 440, "Instances", o_WindMediumBackAir2);
				}
				if (image_index == 17)
					instance_destroy(o_WindMediumBackAir2);
				if (image_index >= 29)
				{
					sprite_index = spr_WindGuy;
				}
		
			}
			if (sprite_get_name(sprite_index) == "spr_WindGuyMediumCrouch")
			{
				image_speed = 1;
				if (image_index == 14)
				{
					audio_play_sound(WhooshMediumSound, 1, 0);
					instance_create_layer(x + ((240 + hitDirectionModifier) * facing), y - 820, "Instances", o_WindMediumCrouch2);
				}
				if (image_index == 18)
				{
					instance_destroy(o_WindMediumCrouch2);
					CanSpecialCancel = 1;
				}
				if (image_index >= 44)
				{
					sprite_index = spr_WindGuy;
					if (down)
						sprite_index = spr_WindGuyCrouch;
					isGlissade = 0;
				}
				if (image_index > 8 && image_index < 23)
					isGlissade = 0;
				if (image_index >= 23)
					isGlissade = 0;
			}
		
			if (sprite_get_name(sprite_index) == "spr_WindGuyMediumDownAir")
			{
				if (image_index == 12)
				{
					audio_play_sound(WhooshMediumSound, 1, 0);
					instance_create_layer(x + ((240 + hitDirectionModifier) * facing), y - 820, "Instances", o_WindMediumCrouch2)
				}
				image_speed = 1;
				if (image_index == 15)
				{
					CanSpecialCancel = 1;
					instance_destroy(o_WindMediumCrouch2);
				}
				if (image_index >= 27)
				{
					sprite_index = spr_WindGuy;
					if (down)
						sprite_index = spr_WindGuyCrouch;
					isGlissade = 0;
				}
			}
		
		
			if (sprite_get_name(sprite_index) == "spr_WindGuyMediumAir")
			{
				image_speed = 1;
				if (image_index == 13)
				{
					audio_play_sound(WhooshMediumSound, 1, 0);
					instance_create_layer(x +((240 +hitDirectionModifier) * facing), y -200, "Instances", o_WindMediumAir2);
				}
				if (image_index >= 13 && image_index <= 15&& instance_exists(o_WindMediumAir2))
				{
					o_WindMediumAir2.x = x + ((240 +hitDirectionModifier) * facing);
					o_WindMediumAir2.y = y -200;
				}
				if (image_index == 15)
					instance_destroy(o_WindMediumAir2);
				if (image_index >= 17 && mediumattack && down)
				{
					sprite_index = spr_WindGuyMediumDownAir;
					image_index = 0;
					image_speed = 0;
					isAttacking = 12;
				}
				if (image_index >= 23)
				{
					sprite_index = spr_WindGuy;
				}
		
			}
			if (sprite_get_name(sprite_index) == "spr_WindGuyHeavyDownAir")
			{
				image_speed = 1;
				if (image_index == 13)
				{
					audio_play_sound(WhooshMediumSound, 1, 0);
					instance_create_layer(x +((240 +hitDirectionModifier) * facing), y -346, "Instances", o_WindHeavyDownAir2);
				}
				if (image_index == 15)
					instance_destroy(o_WindHeavyDownAir2);
				if (image_index >= 38)
				{
					if (place_meeting(x, y + 10, o_Ground))
						sprite_index = spr_WindGuy;
					else
						sprite_index = spr_WindGuyJump;
				}
		
			}
			if (sprite_get_name(sprite_index) == "spr_WindGuyHeavyStand")
			{
				image_speed = 1;
				if (image_index <= 28 && !heavyattack)
				{
					if (image_index == 12)
					{
						heavycharge = 1;
						sprite_index = spr_WindGuyHeavyStandLight;
						image_index = 0;
					}
					if (image_index > 12 && image_index <= 24)
					{
						heavycharge = 2;
						sprite_index = spr_WindGuyHeavyStandMedium;
						image_index = 0;
					}
					if (image_index > 24 && image_index <= 28)
					{
						heavycharge = 0;
						image_index = 29;
					}
				}
				if (image_index == 29)
				{
					heavycharge = 0;
					audio_play_sound(WhooshHeavySound, 1, 0);
					instance_create_layer(x + ((1200 + hitDirectionModifier) * facing), y - 646, "Instances", o_WindHeavyStand2);
				}
				if (image_index == 30)
				{
					instance_destroy(o_WindHeavyStand2);
				}
				if (image_index >= 54)
				{
					sprite_index = spr_WindGuy;
				}
		
			}
			if (sprite_get_name(sprite_index) == "spr_WindGuyHeavyStandLight")
			{
				if (image_index == 0)
				{
					audio_play_sound(WhooshHeavySound, 1, 0);
					instance_create_layer(x + ((620 + hitDirectionModifier) * facing), y - 646, "Instances", o_WindHeavyStand2);
				}
				if (image_index == 1)
				{
					instance_destroy(o_WindHeavyStand2);
				}
				if (image_index == 26)
				{
					sprite_index = spr_WindGuy;
				}
			}
			if (sprite_get_name(sprite_index) == "spr_WindGuyHeavyStandMedium")
			{
				if (image_index == 0)
				{
					audio_play_sound(WhooshHeavySound, 1, 0);
					instance_create_layer(x + ((860 + hitDirectionModifier) * facing), y - 646, "Instances", o_WindHeavyStand2);
				}
				if (image_index == 1)
				{
					instance_destroy(o_WindHeavyStand2);
				}
				if (image_index == 26)
				{
					sprite_index = spr_WindGuy;
				}
			}
			if (sprite_get_name(sprite_index) == "spr_WindGuyHeavyOverHead")
			{
				image_speed = 1;
				if (image_index <= 28 && !heavyattack)
				{
					if (image_index <= 9)
					{
						heavycharge = 1;
						image_index = 30;
					}
					if (image_index > 9 && image_index <= 18)
					{
						heavycharge = 2;
						image_index = 29;
					}
					if (image_index > 18 && image_index <= 28)
					{
						heavycharge = 0;
						image_index = 28;
					}
				}
				if (image_index == 28 && heavycharge == 0)
				{
					audio_play_sound(WhooshHeavySound, 1, 0);
					instance_create_layer(x + ((1100 + hitDirectionModifier) * facing), y - 646, "Instances", o_WindHeavyOverHead2);
				}
				if (image_index == 29 && heavycharge == 2)
				{
					audio_play_sound(WhooshHeavySound, 1, 0);
					if (instance_exists(o_WindHeavyOverHead2))
						instance_destroy(o_WindHeavyOverHead2)
					instance_create_layer(x + ((860 + hitDirectionModifier) * facing), y - 646, "Instances", o_WindHeavyOverHead2);
				}
				if (image_index == 30 && heavycharge == 1)
				{
					audio_play_sound(WhooshHeavySound, 1, 0);
					if (instance_exists(o_WindHeavyOverHead2))
						instance_destroy(o_WindHeavyOverHead2)
					instance_create_layer(x + ((620 + hitDirectionModifier) * facing), y - 646, "Instances", o_WindHeavyOverHead2);
				}
				if (image_index == 31)
				{
					instance_destroy(o_WindHeavyOverHead2);
				}
				if (image_index >= 57)
				{
					sprite_index = spr_WindGuy;
				}
		
			}
			if (sprite_get_name(sprite_index) == "spr_WindGuyHeavyCrouch")
			{
				image_speed = 1;
				if (image_index <= 28 && !heavyattack)
				{
					if (image_index <= 9)
					{
						heavycharge = 1;
						image_index = 30;
					}
					if (image_index > 9 && image_index <= 18)
					{
						heavycharge = 2;
						image_index = 29;
					}
					if (image_index > 18 && image_index <= 28)
					{
						heavycharge = 0;
						image_index = 28;
					}
				}
				if (image_index == 28 && heavycharge == 0)
				{
					audio_play_sound(WhooshHeavySound, 1, 0);
					instance_create_layer(x + ((720 + hitDirectionModifier) * facing), y - 340, "Instances", o_WindHeavyCrouch2);
				}
				if (image_index == 29 && heavycharge == 2)
				{
					audio_play_sound(WhooshHeavySound, 1, 0);
					if (instance_exists(o_WindHeavyCrouch2))
						instance_destroy(o_WindHeavyCrouch2)
					instance_create_layer(x + ((540 + hitDirectionModifier) * facing), y - 340, "Instances", o_WindHeavyCrouch2);
				}
				if (image_index == 30 && heavycharge == 1)
				{
					audio_play_sound(WhooshHeavySound, 1, 0);
					if (instance_exists(o_WindHeavyStand2))
						instance_destroy(o_WindHeavyStand2)
					instance_create_layer(x + ((360 + hitDirectionModifier) * facing), y - 340, "Instances", o_WindHeavyCrouch2);
				}
				if (image_index == 31)
				{
					instance_destroy(o_WindHeavyCrouch2);
				}
				if (image_index >= 56)
				{
					sprite_index = spr_WindGuy;
					if (down)
						sprite_index = spr_WindGuyCrouch;
				}
		
			}
			if (sprite_get_name(sprite_index) == "spr_WindGuyHeavyAir")
			{
				image_speed = 1;
				if (image_index <= 28 && !heavyattack)
				{
					if (image_index <= 9)
					{
						heavycharge = 1;
						image_index = 30;
					}
					if (image_index > 9 && image_index <= 18)
					{
						heavycharge = 2;
						image_index = 29;
					}
					if (image_index > 18 && image_index <= 28)
					{
						heavycharge = 0;
						image_index = 28;
					}
				}
				if (image_index == 28 && heavycharge == 0)
				{
					audio_play_sound(WhooshHeavySound, 1, 0);
					instance_create_layer(x + ((1100 + hitDirectionModifier) * facing), y + 100, "Instances", o_WindHeavyStand2);
				}
				if (image_index == 29 && heavycharge == 2)
				{
					audio_play_sound(WhooshHeavySound, 1, 0);
					if (instance_exists(o_WindHeavyStand2))
						instance_destroy(o_WindHeavyStand2)
					instance_create_layer(x + ((860 + hitDirectionModifier) * facing), y - 100, "Instances", o_WindHeavyStand2);
				}
				if (image_index == 30 && heavycharge == 1)
				{
					audio_play_sound(WhooshHeavySound, 1, 0);
					if (instance_exists(o_WindHeavyStand2))
						instance_destroy(o_WindHeavyStand2)
					instance_create_layer(x + ((620 + hitDirectionModifier) * facing), y - 200, "Instances", o_WindHeavyStand2);
				}
				if (image_index == 31)
				{
					instance_destroy(o_WindHeavyStand2);
				}
				if (image_index >= 50)
				{
					if (place_meeting(x, y +1, o_Ground))
						sprite_index = spr_WindGuy;
					if (!place_meeting(x, y +1, o_Ground))
						sprite_index = spr_WindGuyJump;
				}
		
			}
		if (sprite_get_name(sprite_index) == "spr_WindGuyGrabAir")
			{
				image_speed = 1
				if (image_index >= 0 && image_index <= 108)
					verticalspeed = 0;
				if (image_index == 4)
				{
					audio_play_sound(WhooshMediumSound, 1, 0);
					instance_create_layer(x +((240 + hitDirectionModifier) * facing), y + 200, "Instances", o_Grab2);
				}
				if (image_index == 8 && hit != 6)
				{
					instance_destroy(o_Grab);
				}
				if (hit == 6 && image_index <= 8)
				{
					image_index = 54;
				}
				if (image_index == 109)
				{
					verticalspeed = -80;
					speedbonus = 60;
					global.BigAssHitStop = 1;
					o_Sheer.backmediumed = 1;
					o_Sheer.verticalspeedbackmedium = 100;
					instance_create_layer(o_Sheer.x -210, o_Sheer.y - 688, "Instances_1", o_HitEffect);
					audio_play_sound(HitSound, 1, 0);
				}
				if (image_index == 53)
				{
					sprite_index = spr_WindGuyJump;
				}
				if (image_index >= 122)
				{
					sprite_index = spr_WindGuyJump;
				}
		
			}
			if (sprite_get_name(sprite_index) == "spr_WindGuySpecialProjo")
			{
				image_speed = 1;
				if (image_index == 0)
				{
					_canshootprojo = 0;
					audio_play_sound(ProjoSound, 1, 0);
				}
				if (image_index <= 59 && !specialattack)
				{
					if (image_index <= 10)
					{
						image_index = 65;
					}
					if (image_index > 10 && image_index <= 20)
					{
						image_index = 64;
					}
					if (image_index > 20 && image_index <= 30)
					{
						image_index = 63;
					}
					if (image_index > 30 && image_index <= 40)
					{
						image_index = 62;
					}
					if (image_index > 40 && image_index <= 50)
					{
						image_index = 61;
					}
					if (image_index > 50 && image_index <= 59)
					{
						image_index = 60;
					}
				}
				if (image_index > 59)
				{
					audio_stop_sound(ProjoSound);
					if (done3lol == 0)
					{
						if (global.CurrentSpecialJ2 >= 2)
						{
							_canshootprojo = 1;
							global.CurrentSpecialJ2 -= 2;
						}
						done3lol = 1;
					}
				}
				if (image_index == 65 && _canshootprojo == 1)
				{
					audio_play_sound(AirSlash01Sound, 1, 0);
					instance_create_layer(x + ((240 + hitDirectionModifier) * facing), y - 646, "Instances", o_SpecialProjo01);
				}
				if (image_index == 64 && _canshootprojo == 1)
				{
					audio_play_sound(AirSlash02Sound, 1, 0);
					instance_create_layer(x + ((240 + hitDirectionModifier) * facing), y - 646, "Instances", o_SpecialProjo02);
				}
				if (image_index == 63 && _canshootprojo == 1)
				{
					audio_play_sound(AirSlash03Sound, 1, 0);
					instance_create_layer(x + ((240 + hitDirectionModifier) * facing), y - 646, "Instances", o_SpecialProjo03);
				}
				if (image_index == 62 && _canshootprojo == 1)
				{
					audio_play_sound(AirSlash04Sound, 1, 0);
					instance_create_layer(x + ((240 + hitDirectionModifier) * facing), y - 646, "Instances", o_SpecialProjo04);
				}
				if (image_index == 61 && _canshootprojo == 1)
				{
					audio_play_sound(AirSlash05Sound, 1, 0);
					instance_create_layer(x + ((240 + hitDirectionModifier) * facing), y - 646, "Instances", o_SpecialProjo05);
				}
				if (image_index == 60 && _canshootprojo == 1)
				{
					audio_play_sound(AirSlash06Sound, 1, 0);
					instance_create_layer(x + ((240 + hitDirectionModifier) * facing), y - 646, "Instances", o_SpecialProjo06);
				}
				if (image_index >= 77)
				{
					_canshootprojo = 0;
					sprite_index = spr_WindGuy;
				}
		
			}
			if (sprite_get_name(sprite_index) == "spr_WindGuySpecialFakeProjo")
			{
				if (image_index == 0)
					audio_play_sound(ProjoSound, 1, 0);
				if (!left)
				{
					audio_stop_sound(ProjoSound);
					sprite_index = spr_WindGuy;
					isAttacking = 0;
				}
			}
		}
		}
		image_speed = 1;

		if (downheavied ==1)
		{
			if (place_meeting(x + horizontalspeeddownheavyhit, y , o_Ground))
			{
				while (!place_meeting(x+ sign(horizontalspeeddownheavyhit), y, o_Ground))
				{
					x = x + sign(horizontalspeeddownheavyhit);
				}
				sprite_index = spr_MokujinHitWallTrue;
				horizontalspeeddownheavyhit = -horizontalspeeddownheavyhit;
				global.BigAssHitStop = 1;
				audio_play_sound(ThumpSound, 1, 0);
			}
		}
		if (backmediumed == 1)
		{
			if (place_meeting(x, y + verticalspeedbackmedium, o_Ground))
			{
				while (!place_meeting(x, y + sign(verticalspeedbackmedium), o_Ground))
				{
					y = y + sign(verticalspeedbackmedium);
				}
				verticalspeedbackmedium = -verticalspeedbackmedium div 2;
				sprite_index = spr_MokujinHitGroundTrue;
				audio_play_sound(ThumpSound, 1, 0);
			}
		}
		if (sprite_get_name(sprite_index) == "spr_MokujinHitZaeshTrue")
		{
			verticalspeed = 0;
			isinhit = true;
		}

		if (sprite_get_name(sprite_index) == "spr_MokujinHitTrue" && image_index >= 18)
		{
			sprite_index = spr_WindGuy;
			image_index = 0;
			neutralguard = 1;
			o_Sheer.hit = 0;
			isinhit = false;
		}
	
		if (sprite_get_name(sprite_index) == "spr_MokujinHitZaeshTrue" && image_index >= 59)
		{
			sprite_index = spr_WindGuy;
			image_index = 0;
			neutralguard = 1;
			o_Sheer.hit = 0;
			isinhit = false;
		}
		if (sprite_get_name(sprite_index) == "spr_MokujinBlockTrue")
			isinblock = true;
		if (sprite_get_name(sprite_index) == "spr_MokujinBlockTrue" && image_index >= 18)
		{
			sprite_index = spr_WindGuy;
			image_index = 0;
			o_Sheer.hit = 0;
			isinblock = false;
		}
		if (sprite_get_name(sprite_index) == "spr_MokujinBlockMediumTrue" && image_index >= 26)
		{
			sprite_index = spr_WindGuy;
			image_index = 0;
			o_Sheer.hit = 0;
			isinblock = false;
		}
		if (sprite_get_name(sprite_index) == "spr_MokujinBlockMediumTrue")
			isinblock = true;
		
		if (sprite_get_name(sprite_index) == "spr_MokujinBlockCrouchTrue" && image_index >= 18)
		{
			sprite_index = spr_WindGuy;
			verticalspeed = 0;
			image_index = 0;
			o_Sheer.hit = 0;
			isinblock = false;
		}
		if (sprite_get_name(sprite_index) == "spr_MokujinBlockCrouchTrue")
			isinblock = true;
		if (sprite_get_name(sprite_index) == "spr_MokujinBlockMediumCrouchTrue" && image_index >= 26)
		{
			sprite_index = spr_WindGuy;
			image_index = 0;
			o_Sheer.hit = 0;
			isinblock = false;
		}
		if (sprite_get_name(sprite_index) == "spr_MokujinBlockMediumCrouchTrue")
			isinblock = true;
		if (sprite_get_name(sprite_index) == "spr_MokujinHitMediumStandTrue" && image_index >= 18)
		{
			sprite_index = spr_WindGuy;
			image_index = 0;
			neutralguard = 1;
			o_Sheer.hit = 0;
			isinhit = false;
		}
		if (sprite_get_name(sprite_index) == "spr_MokujinHitHeavyStandTrue")
			image_speed = 1;
		if (sprite_get_name(sprite_index) == "spr_MokujinHitHeavyStandTrue" && image_index >= 47)
		{
			sprite_index = spr_WindGuy;
			image_index = 0;
			neutralguard = 1;
			o_Sheer.hit = 0;
			isinhit = false;
		}
	
		if (sprite_get_name(sprite_index) == "spr_MokujinHitLightAirTrue" && image_index >= 35)
		{
			sprite_index = spr_WindGuy;
			image_index = 0;
			neutralguard = 1;
			o_Sheer.hit = 0;
			isinhit = false;
		}
		if (sprite_get_name(sprite_index) == "spr_MokujinHitWallTrue" && image_index >= 29)
		{
			sprite_index = spr_WindGuy;
			image_index = 0;
			neutralguard = 1;
			o_Sheer.hit = 0;
			isinhit = false;
		}
	//	if (sprite_get_name(sprite_index) == "spr_MokujinHitGroundTrue" && image_index == 25)
	//		 = 1;
		if (sprite_get_name(sprite_index) == "spr_MokujinHitGroundTrue" && image_index >= 95)
		{
			sprite_index = spr_WindGuy;
			image_index = 0;
			neutralguard = 1;
			o_Sheer.hit = 0;
			isinhit = false;
		}
			if (sprite_get_name(sprite_index) == "spr_WindGuyLand" && image_index >= 10)
		{
			sprite_index = spr_WindGuy;
			image_index = 0;
		}
		if (sprite_get_name(sprite_index) == "spr_MokujinHitDownHeavyAirTrue" && image_index >= 35)
		{
			sprite_index = spr_WindGuy;
			image_index = 0;
			neutralguard = 1;
			o_Sheer.hit = 0;
			isinhit = false;
		}
		if (sprite_get_name(sprite_index) == "spr_MokujinHitBackMediumAirTrue" && image_index >= 95)
		{
			sprite_index = spr_WindGuy;
			image_index = 0;
			neutralguard = 1;
			o_Sheer.hit = 0;
			isinhit = false;
		}
		if (sprite_get_name(sprite_index) == "spr_MokujinHitGrabTrue" && image_index >= 0 && image_index <= 60)
		{
			isinhit = true;
			verticalspeed = 0;
			if (image_index > 9 && image_index < 22)
			{
				verticalspeedbackmedium = 0;
				if (facing == -1 && (o_Sheer.x +40 - o_Mokujin.x < 0))
					move_towards_point(o_Sheer.x, o_Sheer.y + 75, 40);
				if (facing == 1 && (o_Sheer.x -40 - o_Mokujin.x > 0))
					move_towards_point(o_Sheer.x, o_Sheer.y + 75, 40);
			}
		}
		if (sprite_get_name(sprite_index) == "Spr_SpotDodge" && image_index >= 10)
		{
			sprite_collision_mask(Spr_SpotDodge, false, 2, 548, 50, 848, 750, 0, 0);
			
			if (sprite_get_name(sprite_index) == "Spr_SpotDodge" && image_index >= 19)
			{
				sprite_index = spr_WindGuy;
				image_index = 0;
				neutralguard = 1;
				o_Sheer.hit = 0;
				isinhit = false
			}
		}
		if (sprite_get_name(sprite_index) == "Spr_SpotDodge" && image_index < 10)
		{
			sprite_collision_mask(Spr_SpotDodge, false, 2, 548, 749, 848, 750, 0, 0);
		}
		if (sprite_get_name(sprite_index) == "spr_MokujinHitGrabTrue" && image_index >= 127)
		{
			sprite_index = spr_WindGuy;
			image_index = 0;
			neutralguard = 1;
			o_Sheer.hit = 0;
			isinhit = false;
		}
		if (sprite_get_name(sprite_index) == "spr_MokujinHitBackMediumAirTrue" || sprite_get_name(sprite_index) == "spr_MokujinHitDownHeavyAirTrue" || sprite_get_name(sprite_index) == "spr_MokujinHitGroundTrue" || sprite_get_name(sprite_index) == "spr_MokujinHitWallTrue" || sprite_get_name(sprite_index) == "spr_MokujinHitLightAirTrue" || sprite_get_name(sprite_index) == "spr_MokujinHitHeavyStandTrue" || sprite_get_name(sprite_index) == "spr_MokujinHitMediumStandTrue" || sprite_get_name(sprite_index) == "spr_MokujinHitTrue")
			isinhit = true;
			
		if (isinblock || isinhit)
		{
			isStartingJump = 0;
			haschargedenough = 0;
			_canshootprojo = 0;
		}
		if (downheavied && global.BigAssHitStop == 0)
		{
			x = x + horizontalspeeddownheavyhit;
			if (horizontalspeeddownheavyhit > 0)
				horizontalspeeddownheavyhit-=3;
			if (horizontalspeeddownheavyhit < 0)
				horizontalspeeddownheavyhit+=3;
			if (horizontalspeeddownheavyhit <= 10 && horizontalspeeddownheavyhit >= -10)
				downheavied = 0;
		}
		if (backmediumed && global.BigAssHitStop == 0)
		{
			y = y + verticalspeedbackmedium;
			if (verticalspeedbackmedium > 0)
				verticalspeedbackmedium--;
			if (verticalspeedbackmedium < 0)
				verticalspeedbackmedium++;
			if (verticalspeedbackmedium == 0)
			{
				backmediumed = 0;
				sprite_index = spr_WindGuy;
			}
		}
		if (facing == 1 && left && isAttacking == 0 && isinhit == 0)
			isblocking = 1;
		if (facing == -1 && right && isAttacking == 0 && isinhit == 0)
			isblocking = 1;
		if (facing == 1 && left && down && isAttacking == 0 && isinhit == 0)
			isblocking = 2;
		if (facing == -1 && right && down && isAttacking == 0 && isinhit == 0)
			isblocking = 2;
		if ((facing == 1 && !left) || isinhit != 0 || isAttacking != 0)
			isblocking = 0;
		if ((facing == -1 && !right) || isinhit != 0 || isAttacking != 0)
			isblocking = 0;
		/*if (right && !down && facing == -1 && ((sprite_get_name(sprite_index) == "spr_WindGuy"||  sprite_get_name(sprite_index) == "spr_WindGuyJump"|| sprite_get_name(sprite_index) == "spr_MokujinBlockTrue" || sprite_get_name(sprite_index) == "spr_MokujinBlockCrouchTrue" || sprite_get_name(sprite_index) == "spr_MokujinBlockHeavyCrouchTrue" || sprite_get_name(sprite_index) == "spr_MokujinBlockHeavyTrue"|| sprite_get_name(sprite_index) == "spr_MokujinBlockMediumCrouchTrue"|| sprite_get_name(sprite_index) == "spr_MokujinBlockMediumTrue")))
		 isblocking = 1;
		if (left && !down && facing == 1 && ((sprite_get_name(sprite_index) == "spr_WindGuy"||  sprite_get_name(sprite_index) == "spr_WindGuyJump"|| sprite_get_name(sprite_index) == "spr_MokujinBlockTrue" || sprite_get_name(sprite_index) == "spr_MokujinBlockCrouchTrue"|| sprite_get_name(sprite_index) == "spr_MokujinBlockHeavyCrouchTrue" || sprite_get_name(sprite_index) == "spr_MokujinBlockHeavyTrue"|| sprite_get_name(sprite_index) == "spr_MokujinBlockMediumCrouchTrue"|| sprite_get_name(sprite_index) == "spr_MokujinBlockMediumTrue")))
		 isblocking = 1;
		if (right && down && facing == -1&& place_meeting(x, y + 10, o_Ground) && ((sprite_get_name(sprite_index) == "spr_WindGuyCrouch"||sprite_get_name(sprite_index) == "spr_WindGuy"||  sprite_get_name(sprite_index) == "spr_WindGuyJump"|| sprite_get_name(sprite_index) == "spr_MokujinBlockTrue" || sprite_get_name(sprite_index) == "spr_MokujinBlockCrouchTrue"|| sprite_get_name(sprite_index) == "spr_MokujinBlockTrue" || sprite_get_name(sprite_index) == "spr_MokujinBlockCrouchTrue" || sprite_get_name(sprite_index) == "spr_MokujinBlockHeavyCrouchTrue" || sprite_get_name(sprite_index) == "spr_MokujinBlockHeavyTrue"|| sprite_get_name(sprite_index) == "spr_MokujinBlockMediumCrouchTrue"|| sprite_get_name(sprite_index) == "spr_MokujinBlockMediumTrue")))
			isblocking = 2;
		if (left && down && facing == 1&& place_meeting(x, y + 10, o_Ground) && ((sprite_get_name(sprite_index) == "spr_WindGuyCrouch"||sprite_get_name(sprite_index) == "spr_WindGuy"||  sprite_get_name(sprite_index) == "spr_WindGuyJump"|| sprite_get_name(sprite_index) == "spr_MokujinBlockTrue" || sprite_get_name(sprite_index) == "spr_MokujinBlockCrouchTrue"|| sprite_get_name(sprite_index) == "spr_MokujinBlockHeavyCrouchTrue" || sprite_get_name(sprite_index) == "spr_MokujinBlockHeavyTrue"|| sprite_get_name(sprite_index) == "spr_MokujinBlockMediumCrouchTrue"|| sprite_get_name(sprite_index) == "spr_MokujinBlockMediumTrue")))
			isblocking = 2;
		if ((!left && facing == 1) || (sprite_get_name(sprite_index) != "spr_WindGuy" && sprite_get_name(sprite_index) == "spr_WindGuyCrouch"&&  sprite_get_name(sprite_index) != "spr_WindGuyJump" && sprite_get_name(sprite_index) != "spr_MokujinBlockTrue" && sprite_get_name(sprite_index) != "spr_MokujinBlockCrouchTrue" && sprite_get_name(sprite_index) != "spr_MokujinBlockHeavyCrouchTrue" && sprite_get_name(sprite_index) != "spr_MokujinBlockHeavyTrue" && sprite_get_name(sprite_index) != "spr_MokujinBlockMediumCrouchTrue" && sprite_get_name(sprite_index) != "spr_MokujinBlockMediumTrue"))
			isblocking = 0;
		if ((!right && facing == -1)  || (sprite_get_name(sprite_index) != "spr_WindGuy" && sprite_get_name(sprite_index) != "spr_WindGuyCrouch" &&sprite_get_name(sprite_index) != "spr_WindGuyJump" && sprite_get_name(sprite_index) != "spr_MokujinBlockTrue" && sprite_get_name(sprite_index) != "spr_MokujinBlockCrouchTrue" && sprite_get_name(sprite_index) != "spr_MokujinBlockHeavyCrouchTrue" && sprite_get_name(sprite_index) != "spr_MokujinBlockHeavyTrue" && sprite_get_name(sprite_index) != "spr_MokujinBlockMediumCrouchTrue" && sprite_get_name(sprite_index) != "spr_MokujinBlockMediumTrue"))
			isblocking = 0;
		if (canblockinair == 0 && !place_meeting(x, y +10, o_Ground))
			isblocking = 0;*/
	}

	if (isgettingcomboed != isgettingcomboedpreviousmokujin)
	{
		if (isgettingcomboed > 1 && global.DamageReduction > 0.3)
			global.DamageReduction -= 0.2;
	}
	if (isgettingcomboed != 0)
	{
		global.WindGuyLightAttackStandDamage = 25 * global.DamageReduction;
		global.WindGuyLightAttackCrouchDamage = 25* global.DamageReduction;
		global.WindGuyLightAttackAirDamage = 25* global.DamageReduction;
		global.WindGuyMediumAttackStandDamage = 50* global.DamageReduction;
		global.WindGuyMediumAttackCrouchDamage = 100* global.DamageReduction;
		global.WindGuyMediumAttackAirDamage = 50* global.DamageReduction;
		global.WindGuyMediumAttackBackAirDamage = 100* global.DamageReduction;
		global.WindGuyHeavyAttackStandDamage = 100* global.DamageReduction;
		global.WindGuyHeavyAttackCrouchDamage = 100* global.DamageReduction;
		global.WindGuyHeavyAttackOverHeadDamage = 100* global.DamageReduction;
		global.WindGuyHeavyAttackAirDamage = 100* global.DamageReduction;
		global.WindGuyHeavyAttackBackAirDamage = 100* global.DamageReduction;
		global.WindGuyProjoDamage = 20* global.DamageReduction;
		global.WindGuyZaeshDamage = 150* global.DamageReduction;
		global.WindGuyTornadoDamage = 100* global.DamageReduction;
	}
}