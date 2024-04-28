/// @description Camera Stuff
// You can write your code in this editor

/*if (hit != 13)
{
var _hor = input_check("right", player) - input_check("left", player);
var _ver = input_check("down", player) - input_check("up", player);

var _viewX = camera_get_view_x(view_camera[0]);
var _viewY = camera_get_view_y(view_camera[0]);
var _viewW = camera_get_view_width(view_camera[0]);
var _viewH = camera_get_view_height(view_camera[0]);


var _gotoX = x + (_hor * 200) - (_viewW * 0.5);
var _gotoY = y + (_ver * 150) - (_viewH * 0.5);

_newX = lerp(_viewX, _gotoX, 0.05);
_newY = lerp(_viewY, _gotoY, 0.05);

camera_set_view_pos(view_camera[0], _newX, _newY - 33);
}*/


if player = 1       
{
	image_blend = c_orange;
	horrifi_enable(false);
}


if (o_Pause.pause == false && global.CantPlayYet == 0)
{
	/// @description Input Collection
	down = input_check("down", player);
	mediumattack = input_check_pressed("medium", player);
	heavyattack = input_check("heavy", player);
	specialattack = input_check("special", player);
	right = input_check("right", player);
	left = input_check("left", player);
	jump = input_check("up", player);
	lightattack = input_check_pressed("light", player);
	special2 = input_check("special2", player);
	
	if (isinswitch == -1)
	{
		instance_deactivate_object(hurtbox);
		sprite_index = spr_DashHor;
		image_alpha -= 0.1;
		if (image_alpha <= 0)
		{
			if (global._activeplayers[1].isinswitch == 0)
			{
				instance_deactivate_object(self);
				isinswitch = 0;
			}
			
		}
	}
	
	if (isinswitch == 1)
	{
		if (x - opponent.x > 0)		
		{
			facing = -1;
		}
		if (x - opponent.x < 0)
		{
			facing = 1;
		}
		if facing == 1 && isinhit == 0
			image_xscale = 1;
		else
			image_xscale = -1;
		instance_activate_object(hurtbox)
		if (!place_meeting(x + speed , y + 300, o_Ground))
		{
			sprite_index = spr_WindGuyMediumForwardStart;
			image_speed = 0;
			image_index = 33;
			speed = 100;
			direction = point_direction(x, y, opponent.x - (400 * facing), opponent.y + 350);
		}
		else if (place_meeting(x, y + 300, o_Ground))
		{
			speed = 0;
			while (!place_meeting(x, y + 1, o_Ground))
				y += 1;
			image_speed = 1;
		}
		if (image_index == 33 && hitbox == -1)
		{
			hitbox = HitBox_create(500 * facing, 500, 300 * facing, - 400, 20, 30, 0, 1,2, global.WindGuyMediumAttackStandDamage, 20, 30);
			ProximityBox_create(500 * facing, -500, 20);
		}
		if (image_index == 48)
			isinswitch = false
	}
	/// @description During HitStop
	if (global.HitStop == 1 || global.BigAssHitStop == 1 || global.MediumAssHitStop == 1)
	{	
		if (isinstartingframes == true)
			isinstartingframes = false;
		if (special2 && canShah && currentSpecial >= 1)
		{
			var under = false;
			if ((instance_number(o_ShahOver) + instance_number(o_ShahUnder)) % 2 == 0)
			{
				under = false;
				
			}
			else
				under = true;
			shah_create(x, y, 0.7, 0.7, under, id, instance_number(o_ShahOver) + instance_number(o_ShahUnder));
			canShah = false;
			currentSpecial -= 1;
		}
		if ((isAttacking == 5 || isAttacking == 12) && input_check("up", player))
		{
			jumpduringhitstop = 1;
		}
		image_speed = 0;
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
		if (down && mediumattack && (isAttacking == 0 || isAttacking == 6) && isinhit == 0 && isinblock == 0)
		{
			global.BigAssHitStop = 0;
			sprite_index = spr_WindGuyMediumDownAir;
			image_index = 0;
			isAttacking = 12;
		}
		if (hit == 13 || hit == 17)
		{
			if (input_check_pressed("reversehadoukenL", player))
			{
				sprite_index = spr_WindGuyJump;
				image_index = 0;
				isAttacking = 0;
				horizontalspeed = -40;
				verticalspeed = -70;
				hascommandjumped = 1;
				fx3 = Fx_create(spr_FxCmdJump, 0, 0, false, true)
			}
			if (input_check_pressed("reversehadoukenR", player))
			{
				sprite_index = spr_WindGuyJump;
				image_index = 0;
				isAttacking = 0;
				horizontalspeed = 40;
				verticalspeed = -70;
				hascommandjumped = 1;
				fx3 = Fx_create(spr_FxCmdJump, 0, 0, false, true);
				fx3.image_xscale = -1;
			}
		}
		if (!down && mediumattack && (isAttacking == 3) && isinhit == 0 && isinblock == 0)
		{
			global.BigAssHitStop = 0;
			sprite_index = spr_WindGuyMediumAir;
			image_index = 0;
			isAttacking = 6;
		}
		if (heavyattack && !down && (isAttacking == 0 || isAttacking == 6 ) && done2 == 0  && isinhit == 0 && isinblock == 0)
		{
			done2 = 1;
			global.BigAssHitStop = 0;
			sprite_index = spr_WindGuyHeavyDownAir;
			image_index = 10;
			isAttacking = 13;
		}
		if (heavyattack && down && (isAttacking == 0 || isAttacking == 6 ) && done2 == 0  && isinhit == 0 && isinblock == 0)
		{
			done2 = 1;
			global.BigAssHitStop = 0;
			sprite_index = spr_WindGuyHeavySpikeStart;
			image_index = 0;
			isAttacking = 20;
		}
		if (facing == 1)
		{
			if (left && heavyattack && (isAttacking == 0 || hit == 6 || hit == 13)  && isinhit == 0 && isinblock == 0) ///A changer pour ne pas le faire au sol pendant un hitstop
			{
				global.BigAssHitStop = 0;
				sprite_index = spr_WindGuyGrabAir;
				image_index = 0;
				isdoingledeuxiemecouprelou = 0;
				isAttacking = 11;
			}
			if (left && mediumattack && (isAttacking == 0 || isAttacking == 6 || isAttacking == 13)  && isinhit == 0 && isinblock == 0) ///A changer pour ne pas le faire au sol pendant un hitstop
			{
				global.BigAssHitStop = 0;
				sprite_index = spr_WindGuyMediumBackAir;
				image_index = 0;
				isAttacking = 17;
			}
			if (input_check_pressed("hadoukenL", player) && currentSpecial >= 1 && (hit == 6 || hit == 3 || hit == 13 || hit == 17))
			{
				sprite_index = spr_WindGuySpecialZaeshRDStart;
				image_index = 0;
				if (global.UsingFMod == false)
					audio_play_sound(TeleportSound, 1, 0);
				else
					fmod_system_play_sound(global.Sheer_SpecialZaeshDashAirSound, false);
				currentSpecial -= 1;
				isAttacking = 16;
			}
			if (input_check_pressed("hadoukenL", player) && currentSpecial >= 1 && (hit == 1 || hit == 2 || hit == 4 || hit == 5|| hit == 7 || hit == 8))
			{
				sprite_index = spr_WindGuySpecialZaeshRStart;
				image_index = 0;
				if (global.UsingFMod == false) 
					audio_play_sound(TeleportSound, 1, 0);
				else
					fmod_system_play_sound(global.Sheer_SpecialZaeshDashGroundSound, false);
				currentSpecial -= 1;
				isAttacking = 15;
			}
		}
		if (facing == -1)
		{
			if (right && heavyattack && (isAttacking == 0 || isAttacking == 6 || isAttacking == 13)  && isinhit == 0 && isinblock == 0) ///A changer pour ne pas le faire au sol pendant un hitstop
			{
				global.BigAssHitStop = 0;
				sprite_index = spr_WindGuyGrabAir;
				image_index = 0;
				isAttacking = 11;
			}
			if (right && mediumattack && (isAttacking == 0 || isAttacking == 6 || isAttacking == 13) && isinhit == 0 && isinblock == 0) ///A changer pour ne pas le faire au sol pendant un hitstop
			{
				global.BigAssHitStop = 0;
				sprite_index = spr_WindGuyMediumBackAir;
				image_index = 0;
				isAttacking = 17;
			}
			if (input_check_pressed("hadoukenR", player) && currentSpecial >= 1 && (hit == 6 || hit == 3 || hit == 13 || hit == 17))
			{
				sprite_index = spr_WindGuySpecialZaeshLDStart;
				if (global.UsingFMod == false) 
					audio_play_sound(TeleportSound, 1, 0);
				else
					fmod_system_play_sound(global.Sheer_SpecialZaeshDashAirSound, false);
				image_index = 0;
				currentSpecial -= 1;
				isAttacking = 16;
			}
			if (input_check_pressed("hadoukenR", player) && currentSpecial >= 1 && (hit == 1 || hit == 2 || hit == 4 || hit == 5 || hit == 7 || hit == 8))
			{
				sprite_index = spr_WindGuySpecialZaeshLStart;
				if (global.UsingFMod == false) 
					audio_play_sound(TeleportSound, 1, 0);
				else
					fmod_system_play_sound(global.Sheer_SpecialZaeshDashGroundSound, false);
				image_index = 0;
				currentSpecial -= 1;
				isAttacking = 15;
			}
		}
	}
	
	/// @description When no Hitstop
	if (global.HitStop == 0 && global.BigAssHitStop == 0 && global.MediumAssHitStop == 0 && isinswitch = 0)
	{	
	/// IF ON THE GROUND AND IN NEUTRAL
		if (place_meeting(x, y + 1, o_Ground) && isAttacking == 0 && isinhit == 0 && isinblock == 0 && isknockeddown == false)
		{
			if (sprite_get_name(mask_index) == "spr_SheerFlingCollisionMask")
				mask_index = spr_SheerCollisionMask;
			if ((input_check_pressed("assist", player)|| input_check_pressed("dashu", player)|| input_check_pressed("dashd", player)|| input_check_pressed("dashl", player)|| input_check_pressed("dashr", player)) && can_dash && isStartingJump == 0 && dash == false)
			{
				isAttacking = 0;
				done2 = 0;
			    dash = true;
			
			    alarm[0] = room_speed / 16; // dash for eight of a second
				if input_check("right", player) 
				{
					dash_dir = 0;
					if (place_meeting(x, y+10, o_Ground))
						alarm[0] = room_speed / 6;
				}
			    else if input_check("left", player)
				{
					dash_dir = 180;
					if (place_meeting(x, y+10, o_Ground))
						alarm[0] = room_speed / 6;
				}
				else if  (input_check("up", player) && place_meeting(x, y+10, o_Ground))
				{
					dash = false
				}
			    else if input_check("down", player)
				{

					dash_dir = 270;
					if (y < 5900)
					{
						verticalspeed = 0;
						alarm[0] = room_speed / 2;
					}
				}
				else if (facing == 1 && !input_check("down", player) && !input_check("left", player) && !input_check("right", player))
				{
					dash_dir = 0;
					if (place_meeting(x, y+10, o_Ground))
						alarm[0] = room_speed / 6;
				}
				else if (facing == -1 && !input_check("down", player) && !input_check("left", player) && !input_check("right", player))
				{
					dash_dir = 180;
					if (place_meeting(x, y+10, o_Ground))
						alarm[0] = room_speed / 6;
				}
				if (facing == -1 && dash_dir = 0 && global.CurrentDistance + dash_spd > global.MaxDistance)
				dash = false;
				if (facing == 1 && dash_dir = 180 && global.CurrentDistance + dash_spd > global.MaxDistance)
					dash = false;
				if dash && dash_dir == 270 && place_meeting(x , y + dash_spd, o_Ground)
					dash = false;
				if dash && dash_dir == 270 && place_meeting(x , y + dash_spd, opponent)
				{
					if (x < opponent.x)
					{
						while ( place_meeting(x , y + dash_spd, opponent))
						{
							if (!place_meeting(x - 5, y, o_Ground))
								x -= 5;
							else
								opponent.x += 5;
						}
					}
					if (x > opponent.x)
					{
						while ( place_meeting(x , y + dash_spd, opponent))
						{
							if (!place_meeting(x + 5, y, o_Ground))
								x += 5;
							else
								opponent.x -= 5;
						}
					}
				}
				if dash && dash_dir == 0 && place_meeting(x + dash_spd , y - 10, o_Ground)
					dash = false;	
				if dash && dash_dir == 0 && place_meeting(x + dash_spd , y, opponent)
					dash = false;
				if dash && dash_dir == 180 && place_meeting(x - dash_spd , y, o_Ground)
					dash = false;	
				if dash && dash_dir == 180 && place_meeting(x - dash_spd, y, opponent)
					dash = false;
				if (currentSpecial >= 1 && dash == true)
						currentSpecial -= 1;
				else
					dash = false;
				if (dash == false)
					alarm[0] = -1;
				}
			
			if dash 
			{
				if (dash_dir= 0 && done1 == 0)
				{
					done1 = 1;
					if (facing == 1)
					{
						sprite_index = spr_WindGuyDashForwardGround;
						fx4 = Fx_create(spr_FxDashForward, 0, 0, false, true);
					}	
					else
					{
						sprite_index = spr_WindGuyDashBackGround;
						fx4 = Fx_create(spr_FxDashForward, 0, 0, false, true);
					}
					if (global.UsingFMod == false) 
						audio_play_sound(DashSoundF, 1, 0);
					else
						fmod_system_play_sound(global.Sheer_DashGroundSound, false);
					fx3 = Fx_create(spr_DashEffect, 300 * facing, 0, false, true);
				}
				if (dash_dir = 180 && done1 == 0)
				{
					done1 = 1;
					if (facing == 1)
					{
						sprite_index = spr_WindGuyDashBackGround;
						fx4 = Fx_create(spr_FxDashForward, 0, 0, false, true);
						fx4.image_xscale = -1;
					}
					else
					{
						sprite_index = spr_WindGuyDashForwardGround;
						fx4 = Fx_create(spr_FxDashForward, 0, 0, false, true);
						fx4.image_xscale = -1;
					}
					if (global.UsingFMod == false) 
						audio_play_sound(DashSoundB, 1, 0);
					else
						fmod_system_play_sound(global.Sheer_DashGroundSound, false);
					fx3 = Fx_create(spr_DashEffect, -300 * facing, 0, false, true);
					fx3.image_xscale = -1;
				}
				if (dash_dir = 90 && done1 == 0)
				{
					done1 = 1;
					sprite_index = spr_DashVer;
					if (global.UsingFMod == false) 
						audio_play_sound(DashSoundB, 1, 0);
					else
						fmod_system_play_sound(global.Sheer_DashGroundSound, false);
					instance_create_layer(x - 80, y -30, "Instances_1", o_DoubleJump);
				}
				if (dash_dir = 270 && done1 == 0)
				{
					done1 = 1;
					if (global.UsingFMod == false) 
						audio_play_sound(DashSoundF, 1, 0);
					else
						fmod_system_play_sound(global.Sheer_DashGroundSound, false);
					sprite_index = spr_DashVer;
					
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
			else 
			{
				var move = right - left;
				hascommandjumped = 0;
				pushbackwhileattacking = false;
				hit = 0;
				bouncedagainstwall = false;
				bouncedagainstground = false;
				isAutoComboing = false;
				if (hasdashedinair == 0)
					horizontalspeed = (move * movespeed * windboost);
				if (lightattack && !down)
				{
					sprite_index = spr_WindGuyLightStand;
					image_index = 0;
					isAttacking = 1;
				}
				if (mediumattack && !down && !left && !right)
				{
					sprite_index = spr_WindGuyMediumStand;
					image_index = 0;
					isAttacking = 4;
				}
				if (down && !lightattack && !mediumattack && !heavyattack)
				{
					sprite_index = spr_WindGuyCrouch;
					image_index = 0;
					isCrouching = 1;
				}
				if (down && lightattack)
				{
					sprite_index = spr_WindGuyLightCrouch
					image_index = 0;
					isCrouching = 1;
					isAttacking = 2;
				}
				if (down && mediumattack)
				{
					sprite_index = spr_WindGuyMediumCrouch;
					image_index = 0;
					isCrouching = 1;
					isAttacking = 5;
				}
				if (down && heavyattack)
				{
					sprite_index = spr_WindGuyHeavyCrouch;
					image_index = 0;
					heavycharge = 0;
					isCrouching = 1;
					isAttacking = 8;
				}
				if (facing == 1)
				{
					if (input_check_pressed("hadoukenR", player))
					{
						sprite_index = spr_WindGuySpecialProjo;
						image_index = 0;
						isAttacking = 14;
					}
					if (heavyattack && !right && !down)
					{
						sprite_index = spr_WindGuyHeavyStand;
						image_index = 0;
						isAttacking = 7;
					}
					if (heavyattack && right)
					{
						sprite_index = spr_WindGuyHeavyOverHead;
						image_index = 0;
						isAttacking = 9;
					}
					if (special2 && !right && left)
					{
						isAttacking = 19;
						sprite_index = spr_WindGuySpecialFakeProjo;
						image_index = 0;
					}
					if (input_check_pressed("hadoukenL", player) && currentSpecial >= 2)
					{
						sprite_index = spr_WindGuySpecialZaeshRStart;
						image_index = 0;
						currentSpecial -= 2;
						if (CanSpecialCancel)
						{
							image_index = 37;
							if (global.UsingFMod == false) 
								audio_play_sound(InstantTeleportSound, 1, 0);
							else
								fmod_system_play_sound(global.Sheer_SpecialZaeshDashGroundSound, false);
						}
						isAttacking = 15;
					}
					if (input_check_pressed("dragonpunchR", player) && currentSpecial >= 2)
					{
						sprite_index = spr_WindGuySpecialZaeshRUStart;
						image_index = 0;
						currentSpecial -= 2;
						isAttacking = 16;
					}
					if (right && mediumattack)
					{
						sprite_index = spr_WindGuyMediumForwardStart;
						isAttacking = 21;
						image_index = 0;
					}
				}
				if (facing == -1)
				{
					if (input_check_pressed("hadoukenL", player))
					{
						sprite_index = spr_WindGuySpecialProjo;
						image_index = 0;
						isAttacking = 14;
					}
					
					if (heavyattack && !left && !down)
					{
						sprite_index = spr_WindGuyHeavyStand;
						image_index = 0;
						isAttacking = 7;
					}
					if (heavyattack && left)
					{
						sprite_index = spr_WindGuyHeavyOverHead;
						image_index = 0;
						isAttacking = 9;
					}
					if (special2 && right && !left)
					{
						isAttacking = 19;
						sprite_index = spr_WindGuySpecialFakeProjo;
						image_index = 0;
					}
					if (input_check_pressed("hadoukenR", player) && currentSpecial >= 2)
					{
						sprite_index = spr_WindGuySpecialZaeshLStart;
						image_index = 0;
						currentSpecial -= 2;
						if (CanSpecialCancel)
						{
							image_index = 37;
							if (global.UsingFMod == false) 
								audio_play_sound(InstantTeleportSound, 1, 0);
							else
								fmod_system_play_sound(global.Sheer_SpecialZaeshDashGroundSound, false);
						}
						isAttacking = 15;
					}
					if (input_check_pressed("dragonpunchL", player) && currentSpecial >= 2)// A MODIFIER QUAND Y'AURA JUMP STARTUP
					{
						sprite_index = spr_WindGuySpecialZaeshLUStart;
						image_index = 0;
						currentSpecial -= 2;
						isAttacking = 16;
					}
					if (left && mediumattack)
					{
						sprite_index = spr_WindGuyMediumForwardStart;
						isAttacking = 21;
						image_index = 0;
					}
				}
				if (!down && sprite_get_name(sprite_index) == "spr_WindGuyCrouch")
				{
					sprite_index = spr_WindGuy;
					isCrouching = 0;
					heavycharge = 0;								///a changer 
				}
				if (!place_meeting(x, y +1, o_Ground) && isAttacking == 0 && sprite_get_name(sprite_index) != "spr_MokujinBlockTrue" && sprite_get_name(sprite_index) != "spr_MokujinBlockCrouchTrue" && sprite_get_name(sprite_index) != "spr_MokujinHitMediumStandTrue" && sprite_get_name(sprite_index) != "spr_MokujinBlockMediumTrue" && sprite_get_name(sprite_index) != "spr_MokujinBlockMediumCrouchTrue" && sprite_get_name(sprite_index) != "spr_MokujinHitTrue" && sprite_get_name(sprite_index) != "spr_MokujinHitGrabTrue" && sprite_get_name(sprite_index) != "spr_MokujinHitHeavyChargeTrue" && sprite_get_name(sprite_index) != "spr_MokujinHitHeavyStandTrue" && sprite_get_name(sprite_index) != "spr_MokujinHitLightAirTrue" && sprite_get_name(sprite_index) != "spr_MokujinHitMarkTrue" && sprite_get_name(sprite_index) != "spr_MokujinMediumStandTrue" && sprite_get_name(sprite_index) != "spr_MokujinHitZaeshTrue" && sprite_get_name(sprite_index) != "spr_MokujinHitWallTrue" && sprite_get_name(sprite_index) != "spr_MokujinHitGroundTrue" && sprite_get_name(sprite_index) != "spr_MokujinHitBackMediumAirTrue" && sprite_get_name(sprite_index) != "spr_WindGuyLand" && sprite_get_name(sprite_index) != "spr_WindGuySpecialFakeProjo" && sprite_get_name(sprite_index) != "spr_WindGuyHeavyStandLight" && sprite_get_name(sprite_index) != "spr_WindGuyHeavyStandMedium" && sprite_get_name(sprite_index) != "spr_WindGuyJumpStart" && sprite_get_name(sprite_index) != "Spr_SpotDodge"&& sprite_get_name(sprite_index) != "spr_WindGuySpecialZaeshDEndB" && sprite_get_name(sprite_index) != "spr_WindGuySpecialZaeshDEndF"&& sprite_get_name(sprite_index) != "spr_WindGuySpecialZaeshLDStart"&& sprite_get_name(sprite_index) != "spr_WindGuySpecialZaeshRDStart"&& sprite_get_name(sprite_index) != "spr_WindGuySpecialZaeshUEndB"&& sprite_get_name(sprite_index) != "spr_WindGuySpecialZaeshUEndF")
				{
					sprite_index = spr_WindGuyJump;
					IsJumpingN = 1;
					done3lol = 0;
					isinblock = 0;
					isinhit = 0;
				
					isgettingcomboed = 0;
				}
				if (place_meeting(x, y +1, o_Ground) && isAttacking == 0 && sprite_get_name(sprite_index) != "spr_MokujinBlockTrue" && sprite_get_name(sprite_index) != "spr_MokujinBlockCrouchTrue" && sprite_get_name(sprite_index) != "spr_MokujinHitTrue" && sprite_get_name(sprite_index) != "spr_MokujinHitGrabTrue" && sprite_get_name(sprite_index) != "spr_MokujinHitHeavyChargeTrue" && sprite_get_name(sprite_index) != "spr_MokujinHitMediumStandTrue" && sprite_get_name(sprite_index) != "spr_MokujinBlockMediumTrue" && sprite_get_name(sprite_index) != "spr_MokujinBlockMediumCrouchTrue" && sprite_get_name(sprite_index) != "spr_MokujinHitHeavyStandTrue" && sprite_get_name(sprite_index) != "spr_MokujinHitLightAirTrue" && sprite_get_name(sprite_index) != "spr_MokujinHitMarkTrue" && sprite_get_name(sprite_index) != "spr_WindGuyCrouch" && sprite_get_name(sprite_index) != "spr_MokujinMediumStandTrue" && sprite_get_name(sprite_index) != "spr_MokujinHitZaeshTrue" && sprite_get_name(sprite_index) != "spr_MokujinHitWallTrue" && sprite_get_name(sprite_index) != "spr_MokujinHitGroundTrue" && sprite_get_name(sprite_index) != "spr_MokujinHitBackMediumAirTrue" && sprite_get_name(sprite_index) != "spr_WindGuyLand"&& sprite_get_name(sprite_index) != "spr_MokujinBlockCrouchTrue" && sprite_get_name(sprite_index) != "spr_WindGuySpecialFakeProjo" && sprite_get_name(sprite_index) != "spr_WindGuyHeavyStandLight" && sprite_get_name(sprite_index) != "spr_WindGuyHeavyStandMedium" && sprite_get_name(sprite_index) != "spr_WindGuyJumpStart" && sprite_get_name(sprite_index) != "Spr_SpotDodge" && sprite_get_name(sprite_index) != "spr_WindGuySpecialZaeshDEndB" && sprite_get_name(sprite_index) != "spr_WindGuySpecialZaeshDEndF"&& sprite_get_name(sprite_index) != "spr_WindGuySpecialZaeshLDStart"&& sprite_get_name(sprite_index) != "spr_WindGuySpecialZaeshRDStart"&& sprite_get_name(sprite_index) != "spr_WindGuySpecialZaeshUEndB"&& sprite_get_name(sprite_index) != "spr_WindGuySpecialZaeshUEndF")
				{
					sprite_index = spr_WindGuy;
					done3lol = 0;
					hasdashedinair = 0;
					canjumpcancel = 0;
					isgettingcomboed = 0;
					isinblock = 0;
					isinhit = 0;
				}
				///Code Jump
				if (input_check_pressed("up",player, 0.5) && sprite_get_name(sprite_index) == "spr_WindGuy")
				{
					alarm[2] = room_speed / 16;
					can_dash = 0;
					landed = 0;
					sprite_index = spr_WindGuyJumpStart;
					isStartingJump = 1;
					instance_create_layer(x, y + 200, "Instances_1", o_FxJump);
					if (input_check_pressed("superjump", player))
						isStartingJump = 2;
					image_index = 0;
				}
				if ((sprite_get_name(sprite_index)== "spr_WindGuyJumpStart" && image_index > 4))
				{
					sprite_index = spr_WindGuyJump;
					jumpduringhitstop = 0;
					y-=100;
					if (isAttacking == 0)
					{
						verticalspeed = jumpheight;
						if (isStartingJump == 2)
							verticalspeed = superjumpheight;
					}
					if ((isAttacking == 5 && canjumpcancel) && hit == 4 )
					{
						CanSpecialCancel = 0;
						canjumpcancel = 0;
						verticalspeed = jumpheight;
						if (isStartingJump == 2)
							verticalspeed = superjumpheight;
					}
					if (hasdashedinair && canjumpcancel)
					{
						canjumpcancel = 0;
						verticalspeed = jumpheight;
						if (isStartingJump == 2)
							verticalspeed = superjumpheight;
					}
					if ((isAttacking == 12)&& hit == 4 )
					{
						CanSpecialCancel = 0;
						verticalspeed = jumpheight;
						if (isStartingJump == 2)
							verticalspeed = superjumpheight;
						instance_create_layer(x - 80, y -30, "Instances_1", o_DoubleJump);
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
						if (isStartingJump == 2)
							IsJumpingN = 2;
					}
					isStartingJump = 0;
				}
			}
		}
	/// IF IN THE AIR AND IN NEUTRAL	
		if (!place_meeting(x, y + 1, o_Ground) && isAttacking == 0 && isinhit == 0 && isinblock == 0 && isknockeddown == false)
		{
			hit = 0;
			if (sprite_get_name(mask_index) == "spr_SheerFlingCollisionMask")
				mask_index = spr_SheerCollisionMask;
			if ((input_check_pressed("assist", player) || input_check_pressed("dashu", player)|| input_check_pressed("dashd", player)|| input_check_pressed("dashl", player)|| input_check_pressed("dashr", player)) && isStartingJump == 0 && (isAttacking == 0 || isAttacking == 13) && dash == false)
			{
				isAttacking = 0;
				done2 = 0;
			    dash = true;
				
			    alarm[0] = room_speed / 16; // dash for eight of a second
				if input_check("right", player) 
				{
					dash_dir = 0;
					if (place_meeting(x, y+10, o_Ground))
						alarm[0] = room_speed / 8;
				}
			    else if input_check("left", player)
				{
					dash_dir = 180;
					if (place_meeting(x, y+10, o_Ground))
						alarm[0] = room_speed / 8;
				}
				 else if  (input_check("up", player) && place_meeting(x, y+10, o_Ground))
				{
					dash = false
				}
			    else if input_check("down", player)
				{

					dash_dir = 270;
					if (y < 5900)
					{
						verticalspeed = 0;
						alarm[0] = room_speed / 2;
					}
				}
				else if (facing == 1 && !input_check("down", player) && !input_check("left", player) && !input_check("right", player))
				{
					dash_dir = 0;
					if (place_meeting(x, y+10, o_Ground))
						alarm[0] = room_speed / 8;
				}
				else if (facing == -1 && !input_check("down", player) && !input_check("left", player) && !input_check("right", player))
				{
					dash_dir = 180;
					if (place_meeting(x, y+10, o_Ground))
						alarm[0] = room_speed / 8;
				}
			}
			if (facing == -1 && dash_dir = 0 && global.CurrentDistance + dash_spd > global.MaxDistance)
				dash = false;
			if (facing == 1 && dash_dir = 180 && global.CurrentDistance + dash_spd > global.MaxDistance)
				dash = false;
			if dash && dash_dir == 270 && place_meeting(x , y + dash_spd, o_Ground)
				dash = false;
			if dash && dash_dir == 270 && place_meeting(x , y + dash_spd, opponent)
			{
				if (x < opponent.x)
				{
					while ( place_meeting(x , y + dash_spd, opponent))
					{
						if (!place_meeting(x - 5, y, o_Ground))
							x -= 5;
						else
							opponent.x += 5;
					}
				}
				if (x > opponent.x)
				{
					while ( place_meeting(x , y + dash_spd, opponent))
					{
						if (!place_meeting(x + 5, y, o_Ground))
							x += 5;
						else
							opponent.x -= 5;
					}
				}
			}
			if dash && dash_dir == 0 && place_meeting(x + dash_spd , y - 10, o_Ground)
				dash = false;	
			if dash && dash_dir == 0 && place_meeting(x + dash_spd , y, opponent)
				dash = false;
			if dash && dash_dir == 180 && place_meeting(x - dash_spd , y, o_Ground)
				dash = false;	
			if dash && dash_dir == 180 && place_meeting(x - dash_spd, y, opponent)
				dash = false;
			if (can_dash == 0 && currentSpecial >= 1 && dash == true && done1 == 0)
					currentSpecial -= 1;
			else if (can_dash == 0 && currentSpecial < 1 && done1 == 0)
				dash = false;
			if (!place_meeting(x, y +10, o_Ground) && dash == true)
					hasdashedinair = 1;
			if (dash == false)
				alarm[0] = -1;
			if dash 
			{
				if (dash_dir= 0 && done1 == 0)
				{
					done1 = 1;
					if (facing == 1)
					{
						sprite_index = spr_WindGuyDashForwardAir;
						fx3 = Fx_create(spr_DashSmearForward, 0, 0, false, true);
					}
					else
					{
						sprite_index = spr_WindGuyBackDashAir;
						fx3 = Fx_create(spr_DashSmearBackDash, 0, 0, false, true);
					}
					if (global.UsingFMod == false) 
						audio_play_sound(DashSoundF, 1, 0);
					else
						fmod_system_play_sound(global.Sheer_DashAirSound, false);
					
				}
				if (dash_dir = 180 && done1 == 0)
				{
					done1 = 1;
					if (facing == -1)
					{
						sprite_index = spr_WindGuyDashForwardAir;
						fx3 = Fx_create(spr_DashSmearForward, 0, 0, false, true);
					}
					else
					{
						sprite_index = spr_WindGuyBackDashAir;
						fx3 = Fx_create(spr_DashSmearBackDash, 0, 0, false, true);
					}
					if (global.UsingFMod == false) 
						audio_play_sound(DashSoundB, 1, 0);
					else
						fmod_system_play_sound(global.Sheer_DashGroundSound, false);
					
				}
				if (dash_dir = 90 && done1 == 0)
				{
					done1 = 1;
					sprite_index = spr_DashVer;
					if (global.UsingFMod == false) 
						audio_play_sound(DashSoundB, 1, 0);
					else
						fmod_system_play_sound(global.Sheer_DashGroundSound, false);
					instance_create_layer(x - 80, y -30, "Instances_1", o_DoubleJump);
				}
				if (dash_dir = 270 && done1 == 0)
				{
					done1 = 1;
					if (global.UsingFMod == false)
						audio_play_sound(DashSoundF, 1, 0);
					else
						fmod_system_play_sound(global.Sheer_DashGroundSound, false);
					sprite_index = spr_DashVer;
					
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
			else
			{
				pushbackwhileattacking = false;
				if (isJumpingL || IsJumpingN || isJumpingR)
				{
					if (lightattack && (isAttacking == 0 || isAttacking == 5) && isinblock == false && isinhit == false)
					{
						sprite_index = spr_WindGuyLightAir;
						isAttacking = 3;
					}
					if (mediumattack && !down && (isAttacking == 0 || isAttacking == 5|| isAttacking == 3) && isinblock == false && isinhit == false && isAutoComboing == false)
					{
						sprite_index = spr_WindGuyMediumAir;
						image_index = 0;
						isAttacking = 6;
					}
					if (mediumattack && !down && !left && !right && isAutoComboing == true)
					{
							isAutoComboing = true;
							isAttacking = 6;
							image_index = 0;
							sprite_index = spr_WindGuyMediumAir;
					}
					if (mediumattack && down && !left && (isAttacking == 0 || isAttacking == 6) && isdoinglecouprelou == 0 && isinblock == false && isinhit == false)
					{
						sprite_index = spr_WindGuyMediumDownAir;
						image_index = 0;
						isAttacking = 12;
					}
					if (input_check_pressed("reversehadoukenL", player) && hascommandjumped == 0)
					{
						horizontalspeed = -40;
						verticalspeed = -70;
						hascommandjumped = 1;
						fx3 = Fx_create(spr_FxCmdJump, 0, 0, false, true);
						fx3.image_xscale = -1;

					}
					if (input_check_pressed("reversehadoukenR", player) && hascommandjumped == 0)
					{
						horizontalspeed = 40;
						verticalspeed = -70;
						hascommandjumped = 1;
						fx3 = Fx_create(spr_FxCmdJump, 0, 0, false, true);
						
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
						if (input_check_pressed("dragonpunchR", player) && currentSpecial >= 2)
						{
							sprite_index = spr_WindGuySpecialZaeshRUStart;
							image_index = 0;
							currentSpecial -= 2;
							isAttacking = 16;
						}
						if (input_check_pressed("hadoukenL", player) && currentSpecial >= 2)
						{
							global.BigAssHitStop = 0;
							sprite_index = spr_WindGuySpecialZaeshRDStart;
							image_index = 0;
							currentSpecial -= 2;
							if (CanSpecialCancel)
							{
								image_index = 0;
								horizontalspeed = 0;
								verticalspeed = 0;
								if (global.UsingFMod == false) 
									audio_play_sound(InstantTeleportSound, 1, 0);
								else
									fmod_system_play_sound(global.Sheer_SpecialZaeshDashAirSound, false);
							}
							isAttacking = 16;
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
						if (input_check_pressed("dragonpunchL", player) && currentSpecial >= 2)// A MODIFIER QUAND Y'AURA JUMP STARTUP
						{
							sprite_index = spr_WindGuySpecialZaeshLUStart;
							image_index = 0;
							currentSpecial -= 2;
							isAttacking = 16;
						}
						if (input_check_pressed("hadoukenR", player) && currentSpecial >= 2)
						{
							global.BigAssHitStop = 0;
							sprite_index = spr_WindGuySpecialZaeshLDStart;
							image_index = 0;
							currentSpecial -= 2;
							if (CanSpecialCancel)
							{
								image_index = 0;
								horizontalspeed = 0;
								verticalspeed = 0;
								if (global.UsingFMod == false) 
									audio_play_sound(InstantTeleportSound, 1, 0);
								else
									fmod_system_play_sound(global.Sheer_SpecialZaeshDashAirSound, false);
							}
							isAttacking = 16;
						}
					}
					if (heavyattack && !left && !down && (isAttacking == 0||isAttacking == 6) && isinblock == false && isinhit == false)
					{
						sprite_index = spr_WindGuyHeavyDownAir;
						image_index = 0;
						isAttacking = 13;
					}
					if (heavyattack && !left && down && (isAttacking == 0||isAttacking == 6) && isinblock == false && isinhit == false)
					{
						sprite_index = spr_WindGuyHeavySpikeStart;
						image_index = 0;
						isAttacking = 20;
					}
				}
				if (!place_meeting(x, y +1, o_Ground) && isAttacking == 0 && sprite_get_name(sprite_index) != "spr_MokujinBlockTrue" && sprite_get_name(sprite_index) != "spr_MokujinBlockCrouchTrue" && sprite_get_name(sprite_index) != "spr_MokujinHitMediumStandTrue" && sprite_get_name(sprite_index) != "spr_MokujinBlockMediumTrue" && sprite_get_name(sprite_index) != "spr_MokujinBlockMediumCrouchTrue" && sprite_get_name(sprite_index) != "spr_MokujinHitTrue" && sprite_get_name(sprite_index) != "spr_MokujinHitGrabTrue" && sprite_get_name(sprite_index) != "spr_MokujinHitHeavyChargeTrue" && sprite_get_name(sprite_index) != "spr_MokujinHitHeavyStandTrue" && sprite_get_name(sprite_index) != "spr_MokujinHitLightAirTrue" && sprite_get_name(sprite_index) != "spr_MokujinHitMarkTrue" && sprite_get_name(sprite_index) != "spr_MokujinMediumStandTrue" && sprite_get_name(sprite_index) != "spr_MokujinHitZaeshTrue" && sprite_get_name(sprite_index) != "spr_MokujinHitWallTrue" && sprite_get_name(sprite_index) != "spr_MokujinHitGroundTrue" && sprite_get_name(sprite_index) != "spr_MokujinHitBackMediumAirTrue" && sprite_get_name(sprite_index) != "spr_WindGuyLand" && sprite_get_name(sprite_index) != "spr_WindGuySpecialFakeProjo" && sprite_get_name(sprite_index) != "spr_WindGuyHeavyStandLight" && sprite_get_name(sprite_index) != "spr_WindGuyHeavyStandMedium" && sprite_get_name(sprite_index) != "spr_WindGuyJumpStart" && sprite_get_name(sprite_index) != "Spr_SpotDodge"&& sprite_get_name(sprite_index) != "spr_WindGuySpecialZaeshDEndB" && sprite_get_name(sprite_index) != "spr_WindGuySpecialZaeshDEndF"&& sprite_get_name(sprite_index) != "spr_WindGuySpecialZaeshLDStart"&& sprite_get_name(sprite_index) != "spr_WindGuySpecialZaeshRDStart"&& sprite_get_name(sprite_index) != "spr_WindGuySpecialZaeshUEndB"&& sprite_get_name(sprite_index) != "spr_WindGuySpecialZaeshUEndF")
				{
					sprite_index = spr_WindGuyJump;
					IsJumpingN = 1;
					done3lol = 0;
					isinblock = 0;
					isinhit = 0;
				
					isgettingcomboed = 0;
				}
				if (place_meeting(x, y +1, o_Ground) && isAttacking == 0 && sprite_get_name(sprite_index) != "spr_MokujinBlockTrue" && sprite_get_name(sprite_index) != "spr_MokujinBlockCrouchTrue" && sprite_get_name(sprite_index) != "spr_MokujinHitTrue" && sprite_get_name(sprite_index) != "spr_MokujinHitGrabTrue" && sprite_get_name(sprite_index) != "spr_MokujinHitHeavyChargeTrue" && sprite_get_name(sprite_index) != "spr_MokujinHitMediumStandTrue" && sprite_get_name(sprite_index) != "spr_MokujinBlockMediumTrue" && sprite_get_name(sprite_index) != "spr_MokujinBlockMediumCrouchTrue" && sprite_get_name(sprite_index) != "spr_MokujinHitHeavyStandTrue" && sprite_get_name(sprite_index) != "spr_MokujinHitLightAirTrue" && sprite_get_name(sprite_index) != "spr_MokujinHitMarkTrue" && sprite_get_name(sprite_index) != "spr_MokujinMediumStandTrue" && sprite_get_name(sprite_index) != "spr_MokujinHitZaeshTrue" && sprite_get_name(sprite_index) != "spr_MokujinHitWallTrue" && sprite_get_name(sprite_index) != "spr_MokujinHitGroundTrue" && sprite_get_name(sprite_index) != "spr_MokujinHitBackMediumAirTrue" && sprite_get_name(sprite_index) != "spr_WindGuyLand"&& sprite_get_name(sprite_index) != "spr_MokujinBlockCrouchTrue" && sprite_get_name(sprite_index) != "spr_WindGuySpecialFakeProjo" && sprite_get_name(sprite_index) != "spr_WindGuyHeavyStandLight" && sprite_get_name(sprite_index) != "spr_WindGuyHeavyStandMedium" && sprite_get_name(sprite_index) != "spr_WindGuyJumpStart" && sprite_get_name(sprite_index) != "Spr_SpotDodge" && sprite_get_name(sprite_index) != "spr_WindGuySpecialZaeshDEndB" && sprite_get_name(sprite_index) != "spr_WindGuySpecialZaeshDEndF"&& sprite_get_name(sprite_index) != "spr_WindGuySpecialZaeshLDStart"&& sprite_get_name(sprite_index) != "spr_WindGuySpecialZaeshRDStart"&& sprite_get_name(sprite_index) != "spr_WindGuySpecialZaeshUEndB"&& sprite_get_name(sprite_index) != "spr_WindGuySpecialZaeshUEndF")
				{
					sprite_index = spr_WindGuy;
					done3lol = 0;
					hasdashedinair = 0;
					canjumpcancel = 0;
					isgettingcomboed = 0;
					isinblock = 0;
					isinhit = 0;
				}
			}
		}
	/// IF IS ATTACKING
		if (isAttacking != 0)
		{
			if (instance_exists(o_ShahUnder))
			{
				if (o_ShahUnder.state == 2)
					o_ShahUnder.state = 1;
			}
			if (instance_exists(o_ShahOver))
			{
				if (o_ShahOver.state == 2)
					o_ShahOver.state = 1;
			}
			if ((input_check_pressed("assist", player)|| input_check_pressed("dashu", player)|| input_check_pressed("dashd", player)|| input_check_pressed("dashl", player)|| input_check_pressed("dashr", player)) && can_dash && isStartingJump == 0 && (isAttacking == 17 || isAttacking == 13 || isAttacking == 16) && (hit == 13 || hit == 17 || hit == 16))
			{
				isAttacking = 0;
				done2 = 0;
			    dash = true;
			
				if (!place_meeting(x, y +10, o_Ground))
					hasdashedinair = 1;
			    alarm[0] = room_speed / 16; // dash for eight of a second
				if input_check("right", player) 
				{
					dash_dir = 0;
					if (place_meeting(x, y+10, o_Ground))
						alarm[0] = room_speed / 8;
				}
			    else if input_check("left", player)
				{
					dash_dir = 180;
					if (place_meeting(x, y+10, o_Ground))
						alarm[0] = room_speed / 8;
				}
				 else if  (input_check("up", player) && place_meeting(x, y+10, o_Ground))
				{
					dash = false
				}
			    else if input_check("down", player)
				{

					dash_dir = 270;
					if (y < 5100)
					{
						verticalspeed = 0;
						alarm[0] = room_speed / 2;
					}
				}
				else if (facing == 1 && !input_check("down", player) && !input_check("left", player) && !input_check("right", player))
				{
					dash_dir = 0;
					if (place_meeting(x, y+10, o_Ground))
						alarm[0] = room_speed / 8;
				}
				else if (facing == -1 && !input_check("down", player) && !input_check("left", player) && !input_check("right", player))
				{
					dash_dir = 180;
					if (place_meeting(x, y+10, o_Ground))
						alarm[0] = room_speed / 8;
				}
			}
			if (facing == -1 && dash_dir = 0 && global.CurrentDistance + dash_spd > global.MaxDistance)
				dash = false;
			if (facing == 1 && dash_dir = 180 && global.CurrentDistance + dash_spd > global.MaxDistance)
				dash = false;
			if dash && dash_dir == 270 && place_meeting(x , y + dash_spd, o_Ground)
				dash = false;
			if dash && dash_dir == 270 && place_meeting(x , y + dash_spd, opponent)
			{
				if (x < opponent.x)
				{
					while ( place_meeting(x , y + dash_spd, opponent))
					{
						if (!place_meeting(x - 5, y, o_Ground))
							x -= 5;
						else
							opponent.x += 5;
					}
				}
				if (x > opponent.x)
				{
					while ( place_meeting(x , y + dash_spd, opponent))
					{
						if (!place_meeting(x + 5, y, o_Ground))
							x += 5;
						else
							opponent.x -= 5;
					}
				}
			}
			if dash && dash_dir == 0 && place_meeting(x + dash_spd , y - 10, o_Ground)
				dash = false;	
			if dash && dash_dir == 180 && place_meeting(x - dash_spd , y, o_Ground)
				dash = false;	
			if (place_meeting(x, y +10, o_Ground) && currentSpecial >= 1 && dash == true && done1 == 0)
					currentSpecial -= 1;
			else if (place_meeting(x, y +10, o_Ground) && currentSpecial < 1 && done1 == 0)
				dash = false;
			if dash 
			{
				if (dash_dir= 0 && done1 == 0)
				{
					done1 = 1;
					sprite_index = spr_DashHor;
					if (global.UsingFMod == false) 
						audio_play_sound(DashSoundF, 1, 0);
					else
						fmod_system_play_sound(global.Sheer_DashAirSound, false);
					
				}
				if (dash_dir = 180 && done1 == 0)
				{
					done1 = 1;
					sprite_index = spr_DashHor;
					if (global.UsingFMod == false) 
						audio_play_sound(DashSoundB, 1, 0);
					else
						fmod_system_play_sound(global.Sheer_DashAirSound, false);
					
				}
				if (dash_dir = 90 && done1 == 0)
				{
					done1 = 1;
					sprite_index = spr_DashVer;
					if (global.UsingFMod == false) 
						audio_play_sound(DashSoundB, 1, 0);
					else
						fmod_system_play_sound(global.Sheer_DashAirSound, false);
					instance_create_layer(x - 80, y -30, "Instances_1", o_DoubleJump);
				}
				if (dash_dir = 270 && done1 == 0)
				{
					done1 = 1;
					if (global.UsingFMod == false) 
						audio_play_sound(DashSoundF, 1, 0);
					else
						fmod_system_play_sound(global.Sheer_DashAirSound, false);
					sprite_index = spr_DashVer;
					
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
			else
			{
				if ((input_check_pressed("up",player, 0.5) && hasjumpcanceled == 0 && (isAttacking == 5 || isAttacking == 12) && (hit == 5 || hit == 12)))
				{
					alarm[2] = room_speed / 16;
					can_dash = 0;
					landed = 0;
					sprite_index = spr_WindGuyJumpStart;
					isStartingJump = 1;
					if (input_check_pressed("superjump", player))
						isStartingJump = 2;
					image_index = 0;
				}
				if ((sprite_get_name(sprite_index)== "spr_WindGuyJumpStart" && image_index > 4)|| (jumpduringhitstop == 1 && hasjumpcanceled == 0))
				{
					if (!place_meeting(x, y + 1, o_Ground))
						hasjumpcanceled = 1;
					sprite_index = spr_WindGuyJump;
					jumpduringhitstop = 0;
					y-=100;
					CanSpecialCancel = 0;
					canjumpcancel = 0;
					verticalspeed = jumpheight;
					if (isStartingJump == 2)
						verticalspeed = superjumpheight;
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
						if (isStartingJump == 2)
							IsJumpingN = 2;
					}
					isStartingJump = 0;
				}
				if (sprite_get_name(sprite_index) == "spr_WindGuyLightStand")		//1
				{
					image_speed = 1;  /// a voir ???
					if (image_index == 0)
					{
						ProximityBox_create(880 * facing, -500, 12)
						canShah = true;
						isinstartingframes = true;
					}
					if (image_index == 10)
					{
						
						if (global.UsingFMod == false) 
							audio_play_sound(WhooshSound, 1, 0);
						else
							fmod_system_play_sound(global.Sheer_LightWhiffSound, false);
						//instance_create_layer(x + ((240 + hitDirectionModifier) * facing), y - 646, "Instances", o_WindLightStand);
						hitbox = HitBox_create(240* facing, 120, 240 * facing, -646, 2, global.LightAttackPushBack *facing, 0, 1, 2, global.WindGuyLightAttackStandDamage, 19, 12);
					}
					if (hit == 1)
					{
						if ((lightattack || lightattackhs) && hit == 1 && image_index >= 10 && isAutoComboing == false)
						{
							sprite_index = spr_WindGuyMediumStand;
							image_index = 0;
							isAttacking = 4;
							isAutoComboing = true;
						}
						if ((mediumattack || mediumattackhs) && hit == 1 && image_index >= 13)
						{
							sprite_index = spr_WindGuyMediumStand;
							image_index = 0;
							isAttacking = 4;
						}
						if (facing == 1)
						{
							if (input_check_pressed("dragonpunchR", player) && currentSpecial >= 2)
							{
								sprite_index = spr_WindGuySpecialZaeshRUStart;
								image_index = 0;
								currentSpecial -= 2;
								isAttacking = 16;
							}
							if (input_check_pressed("hadoukenL", player) && currentSpecial >= 1 && (hit == 1 || hit == 2 || hit == 4 || hit == 5|| hit == 7 || hit == 8))
							{
								sprite_index = spr_WindGuySpecialZaeshRStart;
								image_index = 0;
								if (global.UsingFMod == false) 
									audio_play_sound(TeleportSound, 1, 0);
								else
									fmod_system_play_sound(global.Sheer_SpecialZaeshDashGroundSound, false);
								currentSpecial -= 1;
								isAttacking = 15;
							}
						}
						if (facing == -1)
						{
							if (input_check_pressed("hadoukenR", player) && currentSpecial >= 1 && (hit == 1 || hit == 2 || hit == 4 || hit == 5 || hit == 7 || hit == 8))
							{
								sprite_index = spr_WindGuySpecialZaeshLStart;
								if (global.UsingFMod == false) 
									audio_play_sound(TeleportSound, 1, 0);
								else
									fmod_system_play_sound(global.Sheer_SpecialZaeshDashGroundSound, false);
								image_index = 0;
								currentSpecial -= 1;
								isAttacking = 15;
							}
							if (input_check_pressed("dragonpunchL", player) && currentSpecial >= 2)// A MODIFIER QUAND Y'AURA JUMP STARTUP
							{
								sprite_index = spr_WindGuySpecialZaeshLUStart;
								image_index = 0;
								currentSpecial -= 2;
								isAttacking = 16;
							}
						}
					}
					if (image_index >= 21 && sprite_get_name(sprite_index) == "spr_WindGuyLightStand")
						sprite_index = spr_WindGuy;
				}
				if (sprite_get_name(sprite_index) == "spr_WindGuyLightCrouch")		//2
				{
					image_speed = 1; // a voir ???
					if (image_index == 0)
					{
						canShah = true;
						isinstartingframes = true;
					}
					if (image_index == 10)
					{
						
						if (global.UsingFMod == false) 
							audio_play_sound(WhooshSound, 1, 0);
							else
					fmod_system_play_sound(global.Sheer_LightWhiffSound, false);
						hitbox = HitBox_create(240* facing , 120, 240* facing, -346, 2, global.LightAttackPushBack *facing, 0, 1, 2, global.WindGuyLightAttackStandDamage, 19, 12);
						ProximityBox_create(880 * facing, -500, 12);
					}
					if (hit == 2)
					{
						if (facing == 1)
						{
							if (input_check_pressed("dragonpunchR", player) && currentSpecial >= 2)
							{
								sprite_index = spr_WindGuySpecialZaeshRUStart;
								image_index = 0;
								currentSpecial -= 2;
								isAttacking = 16;
							}
							if (input_check_pressed("hadoukenL", player) && currentSpecial >= 1 && (hit == 1 || hit == 2 || hit == 4 || hit == 5|| hit == 7 || hit == 8))
							{
								sprite_index = spr_WindGuySpecialZaeshRStart;
								image_index = 0;
								if (global.UsingFMod == false) 
									audio_play_sound(TeleportSound, 1, 0);
								else
									fmod_system_play_sound(global.Sheer_SpecialZaeshDashGroundSound, false);
								currentSpecial -= 1;
								isAttacking = 15;
							}
						}
						if (facing == -1)
						{
							if (input_check_pressed("hadoukenR", player) && currentSpecial >= 1 && (hit == 1 || hit == 2 || hit == 4 || hit == 5 || hit == 7 || hit == 8))
							{
								sprite_index = spr_WindGuySpecialZaeshLStart;
								if (global.UsingFMod == false) 
									audio_play_sound(TeleportSound, 1, 0);
								else
									fmod_system_play_sound(global.Sheer_SpecialZaeshDashGroundSound, false);
								image_index = 0;
								currentSpecial -= 1;
								isAttacking = 15;
							}
							if (input_check_pressed("dragonpunchL", player) && currentSpecial >= 2)// A MODIFIER QUAND Y'AURA JUMP STARTUP
							{
								sprite_index = spr_WindGuySpecialZaeshLUStart;
								image_index = 0;
								currentSpecial -= 2;
								isAttacking = 16;
							}
						}
					}
					if (image_index >= 21)
					{
						sprite_index = spr_WindGuy;
						if (down)
							sprite_index = spr_WindGuyCrouch;
					}
		
				}
				if (sprite_get_name(sprite_index) == "spr_WindGuyLightAir")			//3
				{
					if (image_index == 0)
					{
						canShah = true;
						isinstartingframes = true;
						ProximityBox_create(880 * facing, -500, 8)
					}
					image_speed = 1;
					if (image_index == 6)
					{
						
						if (global.UsingFMod == false) 
							audio_play_sound(WhooshSound, 1, 0);
							else
					fmod_system_play_sound(global.Sheer_LightWhiffSound, false);
						hitbox = HitBox_create(240 * facing, 120, 240 * facing, -446, 2, global.LightAttackPushBack *facing, 0, 1, 1, global.WindGuyLightAttackStandDamage, 20, 12);
						
					}
					if (hit == 3)
					{
						if (lightattack || lightattackhs)
						{
							sprite_index = spr_WindGuyLightAir;
							isAttacking = 3;
							image_index= 0;
						}
						if (mediumattack || mediumattackhs) 
						{
							sprite_index = spr_WindGuyMediumAir;
							isAttacking = 6;
							image_index = 0;
						}
						if (facing == 1)
						{
							if (input_check_pressed("dragonpunchR", player) && currentSpecial >= 2)
							{
								sprite_index = spr_WindGuySpecialZaeshRUStart;
								image_index = 0;
								currentSpecial -= 2;
								isAttacking = 16;
							}
							if (input_check_pressed("hadoukenL", player) && currentSpecial >= 1 && (hit == 6 || hit == 3 || hit == 13 || hit == 17))
							{
								sprite_index = spr_WindGuySpecialZaeshRDStart;
								image_index = 0;
								if (global.UsingFMod == false)
									audio_play_sound(TeleportSound, 1, 0);
								else
									fmod_system_play_sound(global.Sheer_SpecialZaeshDashAirSound, false);
								currentSpecial -= 1;
								isAttacking = 16;
							}
						}
						if (facing == -1)
						{
							if (input_check_pressed("dragonpunchL", player) && currentSpecial >= 2)// A MODIFIER QUAND Y'AURA JUMP STARTUP
							{
								sprite_index = spr_WindGuySpecialZaeshLUStart;
								image_index = 0;
								currentSpecial -= 2;
								isAttacking = 16;
							}
							if (input_check_pressed("hadoukenR", player) && currentSpecial >= 1 && (hit == 6 || hit == 3 || hit == 13 || hit == 17))
							{
								sprite_index = spr_WindGuySpecialZaeshLDStart;
								if (global.UsingFMod == false) 
									audio_play_sound(TeleportSound, 1, 0);
								else
									fmod_system_play_sound(global.Sheer_SpecialZaeshDashAirSound, false);
								image_index = 0;
								currentSpecial -= 1;
								isAttacking = 16;
							}
						}
					}
					if (image_index >= 21 && sprite_get_name(sprite_index) == "spr_WindGuyLightAir")
						sprite_index = spr_WindGuy;
				}
				if (sprite_get_name(sprite_index) == "spr_WindGuyMediumStand")		//4
				{
					if (image_index == 0)
					{
						canShah = true;
						isinstartingframes = true;
						ProximityBox_create(880 * facing, -500, 17)
						fx = Fx_create(spr_FxMedium, 400 * facing, -700, true)
					}
					image_speed = 1;
					if (image_index == 13)
					{
						
						if (global.UsingFMod == false) 
							audio_play_sound(WhooshMediumSound, 1, 0);
							else
					fmod_system_play_sound(global.Sheer_MediumHitSound, false);
						hitbox = HitBox_create(370* facing , 120, 40 * facing , -646, 4, global.MediumAttackPushBack * facing, -50, 1, 2, global.WindGuyMediumAttackStandDamage, 25, 15);
						
					}
					if (hit == 4)
					{
						
						if (lightattack && !down && !left && !right && isAutoComboing == true)
						{
							sprite_index = spr_WindGuyHeavyStand;
							image_index = 0;
							isAttacking = 7;
						}
						if (mediumattack && !down && !left && !right)
						{
							isAutoComboing = true;
							isAttacking = 5;
							image_index = 0;
							sprite_index = spr_WindGuyMediumCrouch;
						}
						if (image_index >= 14 && (heavyattack || heavyattackhs))
						{
							sprite_index = spr_WindGuyHeavyStand;
							image_index = 0;
							isAttacking = 7;
						}
						if (image_index >= 14 && ((mediumattack && down) || (mediumattackhs && downhs)))
						{
							sprite_index = spr_WindGuyMediumCrouch;
							image_index = 0;
							isAttacking = 12;
						}
						if (facing == 1)
						{
							if (input_check_pressed("dragonpunchR", player) && currentSpecial >= 2)
							{
								sprite_index = spr_WindGuySpecialZaeshRUStart;
								image_index = 0;
								currentSpecial -= 2;
								isAttacking = 16;
							}
							if (input_check_pressed("hadoukenL", player) && currentSpecial >= 1 && (hit == 1 || hit == 2 || hit == 4 || hit == 5|| hit == 7 || hit == 8))
							{
								sprite_index = spr_WindGuySpecialZaeshRStart;
								image_index = 0;
								if (global.UsingFMod == false) 
									audio_play_sound(TeleportSound, 1, 0);
								else
									fmod_system_play_sound(global.Sheer_SpecialZaeshDashGroundSound, false);
								currentSpecial -= 1;
								isAttacking = 15;
							}
						}
						if (facing == -1)
						{
							if (input_check_pressed("hadoukenR", player) && currentSpecial >= 1 && (hit == 1 || hit == 2 || hit == 4 || hit == 5 || hit == 7 || hit == 8))
							{
								sprite_index = spr_WindGuySpecialZaeshLStart;
								if (global.UsingFMod == false) 
									audio_play_sound(TeleportSound, 1, 0);
								else
									fmod_system_play_sound(global.Sheer_SpecialZaeshDashGroundSound, false);
								image_index = 0;
								currentSpecial -= 1;
								isAttacking = 15;
							}
							if (input_check_pressed("dragonpunchL", player) && currentSpecial >= 2)// A MODIFIER QUAND Y'AURA JUMP STARTUP
							{
								sprite_index = spr_WindGuySpecialZaeshLUStart;
								image_index = 0;
								currentSpecial -= 2;
								isAttacking = 16;
							}
						}
					}
					if (image_index >= 29 && sprite_get_name(sprite_index) == "spr_WindGuyMediumStand")
					{
						sprite_index = spr_WindGuy;
					}
		
				}
				if (sprite_get_name(sprite_index) == "spr_WindGuyMediumBackAir")	//17
				{
					if (image_index == 0)
					{
						canShah = true;
						isinstartingframes = true;
						ProximityBox_create(880 * facing, -500, 17)
						fx = Fx_create(spr_FxMediumBackAIr, 0, -200, true);
					}
					image_speed = 1;
					if (image_index == 13)
					{
						
						if (global.UsingFMod == false) 
							audio_play_sound(WhooshMediumSound, 1, 0);
							else
					fmod_system_play_sound(global.Sheer_MediumBackAirWhiffSound, false);
						hitbox = HitBox_create(440* facing, 440, -150 *facing, 0, 5, 0, 180, 2, 1, global.WindGuyMediumAttackBackAirDamage, 800);
						
					}
					if (image_index > 13 && hit == 17)
					{
						if (input_check_pressed("reversehadoukenL", player))
						{
							sprite_index = spr_WindGuyJump;
							image_index = 0;
							isAttacking = 0;
							horizontalspeed = -40;
							verticalspeed = -70;
							hascommandjumped = 1;
							fx3 = Fx_create(spr_FxCmdJump, 0, 0, false, true);
							fx3.image_xscale = -1;
						}
						if (input_check_pressed("reversehadoukenR", player))
						{
							sprite_index = spr_WindGuyJump;
							image_index = 0;
							isAttacking = 0;
							horizontalspeed = 40;
							verticalspeed = -70;
							hascommandjumped = 1;
							fx3 = Fx_create(spr_FxCmdJump, 0, 0, false, true);
						}
					}
					if (image_index >= 29)
					{
						sprite_index = spr_WindGuy;
					}
		
				}
				if (sprite_get_name(sprite_index) == "spr_WindGuyMediumCrouch")		//5
				{
					if (image_index == 0)
					{
						canShah = true;
						isinstartingframes = true;
						ProximityBox_create(680 * facing, -500, 15);
						fx3 = Fx_create(spr_FxDownMedium, 150*facing, 0, true)
					}
					image_speed = 1;
					if (image_index == 14)
					{
						
						if (global.UsingFMod == false) 
							audio_play_sound(WhooshMediumSound, 1, 0);
							else
					fmod_system_play_sound(global.Sheer_MediumWhiffSound, false);
						if (isAutoComboing == false)
							hitbox = HitBox_create(340 * facing, -500, 150 *facing, 0, 4, 0, jumpheight, 1, 3, global.WindGuyMediumAttackCrouchDamage, 40, 19);
						if (isAutoComboing == true)
							hitbox = HitBox_create(340 * facing, -500, 150 *facing, 0, 4, 0, superjumpheight, 1, 3, global.WindGuyMediumAttackCrouchDamage, 40, 19);
					
					}
					if (hit == 5)
					{
						if (mediumattack && !down && !left && !right && isAutoComboing == true)
						{
							verticalspeed = superjumpheight;
							isAttacking = 0;
							y -= 100;
							if (facing == 1)
								isJumpingR = 1;
							else 
								isJumpingL = 1;
							sprite_index = spr_WindGuyJump;
						}
						if (facing == 1)
						{
							if (input_check_pressed("dragonpunchL", player) && currentSpecial >= 3)
							{
								audio_play_sound(TeleportSound, 1, 0);
								x = opponent.x;
								y = opponent.y - 1000;
								sprite_index = spr_WindGuyJump;
								isAttacking = 0;
								IsJumpingN = 1;
								verticalspeed = opponent.verticalspeed;
							}
							if (right && mediumattack)
							{
								sprite_index = spr_WindGuyMediumForwardStart;
								image_index = 0;
								isAttacking = 21;
							}
							if (input_check_pressed("dragonpunchR", player) && currentSpecial >= 2)
							{
								sprite_index = spr_WindGuySpecialZaeshRUStart;
								image_index = 0;
								currentSpecial -= 2;
								isAttacking = 16;
							}
							if (input_check_pressed("hadoukenL", player) && currentSpecial >= 1 && (hit == 1 || hit == 2 || hit == 4 || hit == 5|| hit == 7 || hit == 8))
							{
								sprite_index = spr_WindGuySpecialZaeshRStart;
								image_index = 0;
								if (global.UsingFMod == false) 
									audio_play_sound(TeleportSound, 1, 0);
								else
									fmod_system_play_sound(global.Sheer_SpecialZaeshDashGroundSound, false);
								currentSpecial -= 1;
								isAttacking = 15;
							}
						}
						if (facing == -1)
						{
							if (left && mediumattack)
							{
								sprite_index = spr_WindGuyMediumForwardStart;
								image_index = 0;
								isAttacking = 21;
							}
							if (input_check_pressed("dragonpunchL", player) && currentSpecial >= 2)
							{
								sprite_index = spr_WindGuySpecialZaeshLUStart;
								image_index = 0;
								currentSpecial -= 2;
								isAttacking = 16;
							}
							if (input_check_pressed("hadoukenR", player) && currentSpecial >= 1 && (hit == 1 || hit == 2 || hit == 4 || hit == 5 || hit == 7 || hit == 8))
							{
								sprite_index = spr_WindGuySpecialZaeshLStart;
								if (global.UsingFMod == false) 
									audio_play_sound(TeleportSound, 1, 0);
								else
									fmod_system_play_sound(global.Sheer_SpecialZaeshDashGroundSound, false);
								image_index = 0;
								currentSpecial -= 1;
								isAttacking = 15;
							}
						}
					}
					if (image_index >= 44)
					{
						sprite_index = spr_WindGuy;
						if (down)
							sprite_index = spr_WindGuyCrouch
						isGlissade = 0;
					}
					if (image_index > 8 && image_index < 23)
						isGlissade = 0;
					if (image_index >= 23)
						isGlissade = 0;
				}
				if (sprite_get_name(sprite_index) == "spr_WindGuyMediumDownAir")	//12
				{
					if (image_index == 0)
					{
						canShah = true;
						isinstartingframes = true;
						ProximityBox_create(680 * facing, -500, 14)	
						fx = Fx_create(spr_FxMediumDownAir, 300 * facing, -400, true)
					}
					if (image_index == 12)
					{
						
						if (global.UsingFMod == false) 
							audio_play_sound(WhooshMediumSound, 1, 0);
							else
					fmod_system_play_sound(global.Sheer_MediumCrouchWhiffSound, false);
						hitbox = HitBox_create(340 * facing, -500, 150 *facing, 0, 4, 0, jumpheight, 1, 1, global.WindGuyMediumAttackCrouchDamage, 40, 1);
					}
					if (hit == 12)
					{

						if (facing == 1)
						{
							if (input_check_pressed("dragonpunchR", player) && currentSpecial >= 2)
							{
								sprite_index = spr_WindGuySpecialZaeshRUStart;
								image_index = 0;
								currentSpecial -= 2;
								isAttacking = 16;
							}
							if (input_check_pressed("hadoukenL", player) && currentSpecial >= 1 && (hit == 6 || hit == 3 || hit == 13 || hit == 17))
							{
								sprite_index = spr_WindGuySpecialZaeshRDStart;
								image_index = 0;
								if (global.UsingFMod == false)
									audio_play_sound(TeleportSound, 1, 0);
								else
									fmod_system_play_sound(global.Sheer_SpecialZaeshDashAirSound, false);
								currentSpecial -= 1;
								isAttacking = 16;
							}
						}
						if (facing == -1)
						{
							if (input_check_pressed("dragonpunchL", player) && currentSpecial >= 2)// A MODIFIER QUAND Y'AURA JUMP STARTUP
							{
								sprite_index = spr_WindGuySpecialZaeshLUStart;
								image_index = 0;
								currentSpecial -= 2;
								isAttacking = 16;
							}
							if (input_check_pressed("hadoukenR", player) && currentSpecial >= 1 && (hit == 6 || hit == 3 || hit == 13 || hit == 17))
							{
								sprite_index = spr_WindGuySpecialZaeshLDStart;
								if (global.UsingFMod == false) 
									audio_play_sound(TeleportSound, 1, 0);
								else
									fmod_system_play_sound(global.Sheer_SpecialZaeshDashAirSound, false);
								image_index = 0;
								currentSpecial -= 1;
								isAttacking = 16;
							}
						}
					}
					image_speed = 1;
					if (image_index >= 27)
					{
						sprite_index = spr_WindGuy;
					}
				}
				if (sprite_get_name(sprite_index) == "spr_WindGuyMediumAir")		//6
				{
					if (image_index == 0)
					{
						canShah = true;
						isinstartingframes = true;
						ProximityBox_create(880 * facing, -500, 12)
						fx = Fx_create(spr_FxMediumAir, 100 * facing, -600, true)
					}
					image_speed = 1;
					if (image_index == 10)
					{
						
						if (global.UsingFMod == false) 
							audio_play_sound(WhooshMediumSound, 1, 0);
						else
							fmod_system_play_sound(global.Sheer_MediumAirWhiffSound, false);
						hitbox = HitBox_create(240* facing, 240, 150 *facing, -500, 4, global.MediumAttackPushBack *facing, 0, 1, 1, global.WindGuyMediumAttackBackAirDamage, 30, 20);
					//					
					}
					if (image_index >= 11)
					{
						if (hit == 6)
						{
							if (image_index == 11)
								fx3 = Fx_create(spr_FxMediumAirBlow, 100 * facing, -600, false)
							if (mediumattack && !down && !left && !right && isAutoComboing == true)
							{
								isAutoComboing = true;
								isAttacking = 17;
								image_index = 0;
								sprite_index = spr_WindGuyMediumBackAir;
							}	
							if ((mediumattack && down) || (mediumattackhs && downhs))
							{
								sprite_index = spr_WindGuyMediumDownAir;
								image_index = 0;
								isAttacking = 12;
							}
							if ((heavyattack || heavyattackhs) && !left && !right && !down)
							{
								sprite_index = spr_WindGuyHeavyDownAir;
								image_index = 0;
								isAttacking = 13;
							}
							if ((heavyattack || heavyattackhs) && !left && !right && down)
							{
								sprite_index = spr_WindGuyHeavySpikeStart;
								image_index = 0;
								isAttacking = 20;
							}
							if (facing == 1)
							{
								if ((mediumattack && left) || (mediumattackhs && lefths))
								{
									sprite_index = spr_WindGuyMediumBackAir;
									image_index = 0;
									isAttacking = 17;
								}
								if (input_check("hadoukenL", player) && currentSpecial >= 3)
								{
									sprite_index = spr_WindGuySpecialZaeshRDStart;
									image_index = 0;
									currentSpecial -= 3;
									isAttacking = 16;
								}
								if (input_check_pressed("dragonpunchR", player) && currentSpecial >= 2)
								{
									sprite_index = spr_WindGuySpecialZaeshRUStart;
									image_index = 0;
									currentSpecial -= 2;
									isAttacking = 16;
								}
							}
							if (facing == -1)
							{
								if (input_check_pressed("dragonpunchL", player) && currentSpecial >= 2)// A MODIFIER QUAND Y'AURA JUMP STARTUP
								{
									sprite_index = spr_WindGuySpecialZaeshLUStart;
									image_index = 0;
									currentSpecial -= 2;
									isAttacking = 16;
								}
								if ((mediumattack && right) || (mediumattackhs && righths))
								{
									sprite_index = spr_WindGuyMediumBackAir;
									image_index = 0;
									isAttacking = 17;
								}
								if (input_check_pressed("hadoukenR", player) && currentSpecial >= 3)
								{
									sprite_index = spr_WindGuySpecialZaeshLDStart;
									image_index = 0;
									currentSpecial -= 3;
									isAttacking = 16;
								}
							}
						}
					}
					if (image_index >= 23 && sprite_get_name(sprite_index) == "spr_WindGuyMediumAir")
					{
						sprite_index = spr_WindGuy;
					}
		
				}
				if (sprite_get_name(sprite_index) == "spr_WindGuyHeavyDownAir")		//13
				{
					if (image_index == 0)
					{
						canShah = true;
						isinstartingframes = true;
						ProximityBox_create(1200 * facing, -500, 15);
						fx = Fx_create(spr_FxHeavyAir, 400*facing, -400, true);
					}
					image_speed = 1;
					if (image_index == 13)
					{
						
						if (global.UsingFMod == false) 
							audio_play_sound(WhooshMediumSound, 1, 0);
							else
					fmod_system_play_sound(global.Sheer_HeavyDownAirSound, false);
						hitbox = HitBox_create(640* facing, 220, -150 *facing, -500, 3, 90 * facing, 0, 2, 1, global.WindGuyHeavyAttackBackAirDamage, 200, 34);
					}
					if (image_index > 13 && hit == 13)
					{
						if (image_index == 14 && opponent.isinhit == true)
						{
							instance_create_layer(opponent.x, opponent.y -150, "Instances_1", o_HeavyAir);
						}
						if (input_check_pressed("reversehadoukenL", player))
						{
							sprite_index = spr_WindGuyJump;
							image_index = 0;
							isAttacking = 0;
							horizontalspeed = -40;
							verticalspeed = -70;
							hascommandjumped = 1;
							fx3 = Fx_create(spr_FxCmdJump, 0, 0, false, true);
							fx3.image_xscale = -1;
						}
						if (input_check_pressed("reversehadoukenR", player))
						{
							sprite_index = spr_WindGuyJump;
							image_index = 0;
							isAttacking = 0;
							horizontalspeed = 40;
							verticalspeed = -70;
							hascommandjumped = 1;
							fx3 = Fx_create(spr_FxCmdJump, 0, 0, false, true);
						}
					}
					if (image_index >= 38)
					{
						if (place_meeting(x, y + 10, o_Ground))
							sprite_index = spr_WindGuy;
						else
							sprite_index = spr_WindGuyJump;
					}
		
				}
				if (sprite_get_name(sprite_index) == "spr_WindGuyHeavyStand")		// 7
				{
					if (image_index == 0)
					{
						canShah = true;
						isinstartingframes = true;
						ProximityBox_create(880 * facing, -500, 11)
					}
					image_speed = 1;
					if (image_index > 11 && image_index <= 28 && !heavyattack)
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
						
						heavycharge = -1;
						if (global.UsingFMod == false) 
							audio_play_sound(WhooshHeavySound, 1, 0);
						else
							fmod_system_play_sound(global.Sheer_HeavyChargeWhiffSound, false);
						hitbox = HitBox_create(128* facing , 128, 1200 * facing , -646, 1, 0, 0, 1, 2, global.WindGuyHeavyAttackStandDamage, 63, 36);
						
					}
					if (hit == 7)
					{
						if (facing == 1)
						{
							if (input_check_pressed("hadoukenL", player) && currentSpecial >= 2)
							{
								sprite_index = spr_WindGuySpecialZaeshRStart;
								image_index = 0;
								if (global.UsingFMod == false) 
									audio_play_sound(TeleportSound, 1, 0);
								else
									fmod_system_play_sound(global.Sheer_SpecialZaeshDashGroundSound, false);
								currentSpecial -= 2;
								isAttacking = 15;
							}
							if (input_check_pressed("dragonpunchR", player) && currentSpecial >= 2)
							{
								sprite_index = spr_WindGuySpecialZaeshRUStart;
								image_index = 0;
								currentSpecial -= 2;
								isAttacking = 16;
							}
						}
						if (facing == -1)
						{
							if (input_check_pressed("hadoukenR", player) && currentSpecial >= 2)
							{
								sprite_index = spr_WindGuySpecialZaeshLStart;
								if (global.UsingFMod == false) 
									audio_play_sound(TeleportSound, 1, 0);
								else
									fmod_system_play_sound(global.Sheer_SpecialZaeshDashGroundSound, false);
								image_index = 0;
								currentSpecial -= 2;
								isAttacking = 15;
							}
							if (input_check_pressed("dragonpunchL", player) && currentSpecial >= 2)// A MODIFIER QUAND Y'AURA JUMP STARTUP
							{
								sprite_index = spr_WindGuySpecialZaeshLUStart;
								image_index = 0;
								currentSpecial -= 2;
								isAttacking = 16;
							}
						}
					}
					if (image_index >= 54)
					{
						sprite_index = spr_WindGuy;
					}
		
				}
				if (sprite_get_name(sprite_index) == "spr_WindGuyHeavyStandLight")	//7.1
				{
					if (image_index == 0)
					{
						canShah = true;
						
					}
					if (image_index == 0)
					{
						if (global.UsingFMod == false) 
							audio_play_sound(WhooshHeavySound, 1, 0);
							else
					fmod_system_play_sound(global.Sheer_HeavyChargeWhiffSound, false);
						hitbox = HitBox_create(128* facing , 128, 620 * facing , -646, 1, 0, 0, 1, 2, global.WindGuyHeavyAttackStandDamage, 25, 15);
					}

					if (image_index == 26)
					{
						sprite_index = spr_WindGuy;
						heavycharge = -1;
					}
				}
				if (sprite_get_name(sprite_index) == "spr_WindGuyHeavyStandMedium") //7.2
				{
					if (image_index == 0)
					{
						canShah = true;
						isinstartingframes =false;
					}
					if (image_index == 0)
					{
						if (global.UsingFMod == false) 
							audio_play_sound(WhooshHeavySound, 1, 0);
							else
					fmod_system_play_sound(global.Sheer_HeavyChargeWhiffSound, false);
						hitbox = HitBox_create(128* facing , 128, 860 * facing , -646, 1, 0, 0, 1, 2, global.WindGuyHeavyAttackStandDamage, 31, 26);
						
					}
					if (image_index == 26)
					{
						sprite_index = spr_WindGuy;
						heavycharge = -1;
					}
				}
				if (sprite_get_name(sprite_index) == "spr_WindGuyHeavyOverHead")	//9
				{
					if (image_index == 0)
					{
						canShah = true;
						isinstartingframes = true;
						ProximityBox_create(880 * facing, -500, 9)
					}
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
						
						if (global.UsingFMod == false) 
							audio_play_sound(WhooshHeavySound, 1, 0);
							else
					fmod_system_play_sound(global.Sheer_HeavyChargeWhiffSound, false);
						hitbox = HitBox_create(128* facing , 128, 1200 * facing , -646, 1, 0, 0, 1, 1, global.WindGuyHeavyAttackStandDamage, 40, 36);
					}
					if (image_index == 29 && heavycharge == 2)
					{
						
						if (global.UsingFMod == false) 
							audio_play_sound(WhooshHeavySound, 1, 0);
							else
					fmod_system_play_sound(global.Sheer_HeavyChargeWhiffSound, false);
						hitbox = HitBox_create(128* facing , 128, 860 * facing , -646, 1, 0, 0, 1, 1, global.WindGuyHeavyAttackStandDamage, 31, 26);
					}
					if (image_index == 30 && heavycharge == 1)
					{
						
						if (global.UsingFMod == false) 
							audio_play_sound(WhooshHeavySound, 1, 0);
							else
					fmod_system_play_sound(global.Sheer_HeavyChargeWhiffSound, false);
						hitbox = HitBox_create(128* facing , 128, 620 * facing , -646, 1, 0, 0, 1, 1, global.WindGuyHeavyAttackStandDamage, 25, 15);
					}
					if (image_index >= 56)
					{
						sprite_index = spr_WindGuy;
						heavycharge = -1;
					}
		
				}
				if (sprite_get_name(sprite_index) == "spr_WindGuyHeavyCrouch")		//8
				{
					if (image_index == 0)
					{
						canShah = true;
						isinstartingframes = true;
					}
					image_speed = 1;
					if (image_index == 30)
					{
						
						if (global.UsingFMod == false) 
							audio_play_sound(WhooshHeavySound, 1, 0);
							else
					fmod_system_play_sound(global.Sheer_HeavyChargeWhiffSound, false);
						hitbox = HitBox_create(1280* facing , 128, 128 * facing , -200, 1, 0, 0, 1, 2, global.WindGuyHeavyAttackStandDamage, 63, 36);
					}
					if (hit == 8)
					{
						if (facing == 1)
						{
							if (input_check_pressed("hadoukenL", player) && currentSpecial >= 1 && (hit == 1 || hit == 2 || hit == 4 || hit == 5|| hit == 7 || hit == 8))
							{
								sprite_index = spr_WindGuySpecialZaeshRStart;
								image_index = 0;
								if (global.UsingFMod == false) 
									audio_play_sound(TeleportSound, 1, 0);
								else
									fmod_system_play_sound(global.Sheer_SpecialZaeshDashGroundSound, false);
								currentSpecial -= 1;
								isAttacking = 15;
							}
							if (input_check_pressed("dragonpunchR", player) && currentSpecial >= 2)
							{
								sprite_index = spr_WindGuySpecialZaeshRUStart;
								image_index = 0;
								currentSpecial -= 2;
								isAttacking = 16;
							}
						}
						if (facing == -1)
						{
							if (input_check_pressed("hadoukenR", player) && currentSpecial >= 1 && (hit == 1 || hit == 2 || hit == 4 || hit == 5 || hit == 7 || hit == 8))
							{
								sprite_index = spr_WindGuySpecialZaeshLStart;
								if (global.UsingFMod == false) 
									audio_play_sound(TeleportSound, 1, 0);
								else
									fmod_system_play_sound(global.Sheer_SpecialZaeshDashGroundSound, false);
								image_index = 0;
								currentSpecial -= 1;
								isAttacking = 15;
							}
							if (input_check_pressed("dragonpunchL", player) && currentSpecial >= 2)// A MODIFIER QUAND Y'AURA JUMP STARTUP
							{
								sprite_index = spr_WindGuySpecialZaeshLUStart;
								image_index = 0;
								currentSpecial -= 2;
								isAttacking = 16;
							}
						}
					}
					if (image_index >= 56)
					{
						heavycharge = -1;
						sprite_index = spr_WindGuy;
						if (down)
							sprite_index = spr_WindGuyCrouch
					}
		
				}
				if (sprite_get_name(sprite_index) == "spr_WindGuyHeavyAir")			//10
				{
					if (image_index == 0)
					{
						canShah = true;
						isinstartingframes = true;
					}
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
						if (global.UsingFMod == false) 
							audio_play_sound(WhooshHeavySound, 1, 0);
							else
					fmod_system_play_sound(global.Sheer_HeavyChargeWhiffSound, false);
						instance_create_layer(x + ((1100 + hitDirectionModifier) * facing), y + 100, "Instances", o_WindHeavyStand);
					}
					if (image_index == 29 && heavycharge == 2)
					{
						if (global.UsingFMod == false) 
							audio_play_sound(WhooshHeavySound, 1, 0);
							else
					fmod_system_play_sound(global.Sheer_HeavyChargeWhiffSound, false);
						if (instance_exists(o_WindHeavyStand))
							instance_destroy(o_WindHeavyStand)
						instance_create_layer(x + ((860 + hitDirectionModifier) * facing), y - 100, "Instances", o_WindHeavyStand);
					}
					if (image_index == 30 && heavycharge == 1)
					{
						if (global.UsingFMod == false) 
							audio_play_sound(WhooshHeavySound, 1, 0);
							else
					fmod_system_play_sound(global.Sheer_HeavyChargeWhiffSound, false);
						if (instance_exists(o_WindHeavyStand))
							instance_destroy(o_WindHeavyStand)
						instance_create_layer(x + ((620 + hitDirectionModifier) * facing), y -200, "Instances", o_WindHeavyStand);
					}
					if (image_index == 31)
					{
						instance_destroy(o_WindHeavyStand);
					}
					if (image_index >= 50)
					{
						if (!place_meeting(x, y + 1, o_Ground))
						sprite_index = spr_WindGuyJump;
						if (place_meeting(x, y + 1, o_Ground))
						sprite_index = spr_WindGuy;
					}
		
				}
				if (sprite_get_name(sprite_index) == "spr_WindGuyGrabAir")			//11
				{
					if (image_index == 0)
					{
						isinstartingframes = true;
						fx = Fx_create(spr_FxAirGrab, 150 * facing, 0, true)
						initialspeedx = horizontalspeed;
						initialspeedy = verticalspeed;
					}
					image_speed = 1
					if (image_index >= 0 && image_index <= 108)
					{
						var slower_factor = 0.5; // Adjust this value as needed

    // Interpolate between initial speed and slower speed
						if (initialspeedy < 0)
							verticalspeed = -3;
						else
							verticalspeed = 7;
						hasdashedinair = 0;
					}
					if (image_index == 4)
					{
						if (global.UsingFMod == false) 
							audio_play_sound(WhooshMediumSound, 1, 0);
							else
					fmod_system_play_sound(global.Sheer_AirGrabWhiffSound, false);
						hitbox = HitBox_create(600 * facing, 256, 400 * facing, 100, 4, 0, 0, 5, 5, 0, 50, 0);					
					}
					if (hit == 11 && image_index <= 8 && !place_meeting(opponent.x, opponent.y + 1, o_Ground))
					{
						image_index = 54;
					}
					if (image_index == 109)
					{
						verticalspeed = -80;
						speedbonus = 40;
						hitbox = HitBox_create(440* facing, 440, -150 *facing, 0, 1, 90 * facing, 180, 2, 1, global.WindGuyMediumAttackBackAirDamage, 800);
					}
					if (image_index == 53)
					{
						sprite_index = spr_WindGuyJump;
						horizontalspeed = initialspeedx;
						verticalspeed = initialspeedy;
					}
					if (image_index >= 122)
					{
						sprite_index = spr_WindGuyJump;
					}
		
				}
				if (sprite_get_name(sprite_index) == "spr_WindGuySpecialProjo")		//14
				{
					if (image_index == 0)
					{
						isinstartingframes = true;
						fx = Fx_create(spr_FxShuiroCharge, 0, -400, true, false)
						if (global.UsingFMod == false) 
							audio_play_sound(ProjoSound, 1, 0);
						else
							fmod_system_play_sound(global.Sheer_SpecialProjoChargeSound, false);
						_canshootprojo = 0;
					}
					image_speed = 1;
					if (image_index < 59 && fx == -1)
						fx = Fx_create(spr_FxShuiroCharge, 0, -400, true, false);
					if (image_index <= 59 && !specialattack)
					{
						audio_stop_sound(ProjoSound);
						fx = Fx_create(spr_FxShuiroShoot, 0, 0, true, false);
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
						if (image_index > 50 && image_index < 60)
						{
							image_index = 60;
						}
					}
					if (image_index > 59)
					{
						
						audio_stop_sound(ProjoSound);
						if (done3lol == 0)
						{
							if (currentSpecial >= 2)
							{
								_canshootprojo = 1;
								currentSpecial -= 2;
							}
							done3lol = 1;
						}
					}
					if (image_index == 70 && _canshootprojo == 1)
					{
						if (global.UsingFMod == false) 
							audio_play_sound(AirSlash01Sound, 1, 0);
							else
					fmod_system_play_sound(global.Sheer_SpecialProjoStartSound, false);
						Fx_create(spr_FxShuiroProjo, 0, -546, false, false);
						hitbox = HitBox_create(2600 * facing, 128, -150 * facing , -546, 2, 0, 0, 1, 2, global.WindGuyProjoDamage, 10, 7);
					}
					if (image_index == 68 && _canshootprojo == 1)
					{
						if (global.UsingFMod == false) 
							audio_play_sound(AirSlash02Sound, 1, 0);
						else
							fmod_system_play_sound(global.Sheer_SpecialProjoStartSound, false);
						Fx_create(spr_FxShuiroProjo, 0, -346, false, false);
						hitbox = HitBox_create(2600 * facing, 128, -150 * facing , -346, 2, 0, 0, 1, 2, global.WindGuyProjoDamage, 10, 7);
					}
					if (image_index == 66 && _canshootprojo == 1)
					{
						Fx_create(spr_FxShuiroProjo, 0, -746, false, false);
						if (global.UsingFMod == false) 
							audio_play_sound(AirSlash03Sound, 1, 0);
						else
							fmod_system_play_sound(global.Sheer_SpecialProjoStartSound, false);
						hitbox = HitBox_create(2600 * facing, 128, -150 * facing , -446, 2, 0, 0, 1, 2, global.WindGuyProjoDamage, 10, 7);
					}
					if (image_index == 64 && _canshootprojo == 1)
					{
						Fx_create(spr_FxShuiroProjo, 0, -546, false, false);
						if (global.UsingFMod == false) 
							audio_play_sound(AirSlash04Sound, 1, 0);
						else
							fmod_system_play_sound(global.Sheer_SpecialProjoStartSound, false);
						hitbox = HitBox_create(2600 * facing, 128, -150 * facing , -546, 2, 0, 0, 1, 2, global.WindGuyProjoDamage, 10, 7);
					}
					if (image_index == 62 && _canshootprojo == 1)
					{
						Fx_create(spr_FxShuiroProjo, 0, -646, false, false);
						if (global.UsingFMod == false) 
							audio_play_sound(AirSlash05Sound, 1, 0);
						else
							fmod_system_play_sound(global.Sheer_SpecialProjoStartSound, false);
						hitbox = HitBox_create(2600 * facing, 128, -150 * facing , -546, 2, 0, 0, 1, 2, global.WindGuyProjoDamage, 10, 7);
					}
					if (image_index == 60 && _canshootprojo == 1)
					{
						Fx_create(spr_FxShuiroProjo, 0, -446, false, false);
						fx = Fx_create(spr_FxShuiroShoot, 0, 0, true, true);
						if (global.UsingFMod == false) 
							audio_play_sound(AirSlash06Sound, 1, 0);
						else
							fmod_system_play_sound(global.Sheer_SpecialProjoStartSound, false);
						hitbox = HitBox_create(2600 * facing, 128, -150 * facing , -446, 2, 0, 0, 1, 2, global.WindGuyProjoDamage, 10, 7);
					}
					if (image_index >= 77)
					{
						sprite_index = spr_WindGuy;
						_canshootprojo = 0;
					}
		
				}
				if (sprite_get_name(sprite_index) == "spr_WindGuySpecialFakeProjo") //19
				{
					if (image_index == 0)
					{
						isinstartingframes = true;
					}
					if (image_index == 0)
						if (global.UsingFMod == false) 
							audio_play_sound(ProjoSound, 1, 0);
						else
							fmod_system_play_sound(global.Sheer_SpecialProjoChargeSound, false);
					if (special2)
					{
						if (image_index == 41)
							image_index = 9;
					}
					if (facing == 1)
					{
						if ((!special2 || !left) && image_index < 42)
						{
							audio_stop_sound(ProjoSound);
							image_index = 42
						}
					}
					if (facing == -1)
					{
						if ((!special2 || !right) && image_index < 42)
						{
							audio_stop_sound(ProjoSound);
							image_index = 42
						}
					}
					if (image_index >= 50)
					{
						isAttacking = 0;
						sprite_index = spr_WindGuy;
					}
				}
				if (sprite_get_name(sprite_index) == "spr_WindGuyHeavySpikeStart")
				{
					if (image_index == 0)
					{
							isinstartingframes = true;
					}
					if (image_index >= 9)
					{
						sprite_index = spr_WindGuyHeavySpikeActive;
						image_index = 0;
						horizontalspeed = 0;
						verticalspeed = 50;
					}
				}
				if (sprite_get_name(sprite_index) == "spr_WindGuyHeavySpikeActive")
				{
					
					if (image_index == 1)
					{
						hitbox = HitBox_create(70 * facing, 120, -285 * facing, 200, 1, 5 * facing, 50, 1, 1, 10, 6, 10);
						if (global.UsingFMod == false) 
							audio_play_sound(WhooshHeavySound, 1, 0);
						else
							fmod_system_play_sound(global.Sheer_LightWhiffSound, false);
						fx = Fx_create(spr_HeavyDownAir, 0, 0, true)
					}
					if (image_index == 3)
					{
						hitbox = HitBox_create(70 * facing, 120, 200 * facing, 200, 1, -20 * facing, 50, 1, 1, 10, 6, 10);
						if (global.UsingFMod == false) 
							audio_play_sound(WhooshSound, 1, 0);
						else
							fmod_system_play_sound(global.Sheer_LightWhiffSound, false);
					}
					if (image_index ==5)
					{
						hitbox = HitBox_create(70 * -facing, 120, -150 * facing, 200, 1, 5 * facing, 50, 1, 1, 10, 6, 10);
						if (global.UsingFMod == false) 
							audio_play_sound(WhooshMediumSound, 1, 0);
						else
							fmod_system_play_sound(global.Sheer_LightWhiffSound, false);
					}
					if (image_index == 7)
					{
						hitbox = HitBox_create(70 * facing, 120, 150 * facing, 200, 1, 5 * facing, 50, 1, 1, 10, 6, 10);
						if (global.UsingFMod == false) 
							audio_play_sound(WhooshSound, 1, 0);
							else
					fmod_system_play_sound(global.Sheer_LightWhiffSound, false);
					}
					if (image_index == 9)
					{
						hitbox = HitBox_create(70 * -facing, 120, -200 * facing, 200, 1, 20 * facing, 50, 1, 1, 10, 6, 10);
						if (global.UsingFMod == false) 
							audio_play_sound(WhooshMediumSound, 1, 0);
							else
					fmod_system_play_sound(global.Sheer_LightWhiffSound, false);
						image_index = 0;
					}
					if (y > 5330)
					{
						sprite_index = spr_WindGuyHeavySpikeReco;
						image_index = 0;
					}
				}
				if (sprite_get_name(sprite_index) == "spr_WindGuyHeavySpikeReco")
				{
					
					if (image_index >= 21)
					{
						sprite_index = spr_WindGuy;
						image_index = 0;
						isAttacking = 0;
						IsJumpingN = 0;
						isJumpingL = 0;
						isJumpingR = 0;
					}
				}
				if (sprite_get_name(sprite_index) == "spr_WindGuyMediumForwardStart")//21
				{
					if (image_index == 0)
					{
						ProximityBox_create(880 * facing, -500, 12)
					}
					if (facing == 1 && image_index < 32)
					{
						if (input_check_pressed("hadoukenL", player) && currentSpecial >= 2)
						{
							isAttacking = 15;
							sprite_index = spr_WindGuySpecialZaeshRDStart;
							image_index = 0;
							currentSpecial -= 2
						}
					}
					if (facing == -1 && image_index < 32)
					{
						if (input_check_pressed("hadoukenR", player) && currentSpecial >= 2)
						{
							isAttacking = 15;
							sprite_index = spr_WindGuySpecialZaeshLDStart;
							image_index = 0;
							currentSpecial -= 2
						}
					}
					if (image_index == 12)
					{
						hascommandjumped = 1;
						verticalspeed = -85;
						horizontalspeed = 30 *facing;
						if (global.UsingFMod == false) 
							audio_play_sound(WhooshSound, 1, 0);
						else
							fmod_system_play_sound(global.Sheer_LightWhiffSound, false);
						hitbox = HitBox_create(256 * facing, 256, 150 * facing, -800, 10, 0, 0, 5, 5, 0, 50, 0);
					}
					if (image_index < 32 && hit == 21)
					{
						sprite_index = spr_WindGuyMediumForwardGrab;
						image_index = 0;
					}
					if (image_index == 24)
					{
						fx = Fx_create(spr_FxMediumForward, -90 *facing, -850, true, false)
					}
					if (image_index == 32)
					{
						
						verticalspeed = 55;
						horizontalspeed = 70 *facing;
						if (global.UsingFMod == false) 
							audio_play_sound(WhooshMediumSound, 1, 0);
							else
					fmod_system_play_sound(global.Sheer_LightWhiffSound, false);
						hitbox = HitBox_create(556 * facing, 128, 150 * facing, - 400, 5, 40 * facing, 0, 2,2, global.WindGuyMediumAttackStandDamage, 50, 20);
						ProximityBox_create(880 * facing, -500, 5)
					}
					if (place_meeting(x, y +1, o_Ground) && image_index >= 37)
					{
						if (facing == 1)
						{
							if (place_meeting(x +20, y, opponent))
							{
								if (!place_meeting(opponent.x +20, y, o_Ground))
								{
									opponent.x += 20;
									x += 20;
								}
							}
							else
								x += 20;
						}
						if (facing == -1)
						{
							if (place_meeting(x -20, y, opponent))
							{
								if (!place_meeting(opponent.x -20, y, o_Ground))
								{
									opponent.x -= 20;
									x -= 20;
								}
							}
							else
								x -= 20;
						}
						if (horizontalspeed != 0)
							if (global.UsingFMod == false) 
								audio_play_sound(ThumpSound, 1, 0);
								else
					fmod_system_play_sound(global.All_WallBounceSound, false);
						horizontalspeed = 0;
					}
					if (image_index >= 48)
					{
						sprite_index = spr_WindGuy;
						isAttacking = 0;
					}
				}
				if (sprite_get_name(sprite_index) == "spr_WindGuyMediumForwardGrab")//22
				{
					if (image_index < 12)
					{
						opponent.verticalspeed = verticalspeed;
						opponent.horizontalspeed = horizontalspeed;
						if (facing == 1 && horizontalspeed > 4)
							horizontalspeed -= 4;
						if (facing == -1 && horizontalspeed < -4)
							horizontalspeed += 4;
					}
					if (horizontalspeed > -4 && horizontalspeed < -4)
						horizontalspeed = 0;
					if opponent.y < y && image_index >= 8 && image_index < 12
					{
						opponent.y +=100;
					}
					if (image_index == 12)
					{
						hitbox = HitBox_create(256 * facing, 256, 150 * facing, -600, 10, 40 * facing, -50, 2, 2, global.WindGuyMediumAttackStandDamage, 100, 0);
					}
					if (image_index >= 45)
					{
						isAttacking = 0;
						sprite_index = spr_WindGuyJump;
					}
				}
				if (sprite_get_name(sprite_index) == "spr_WindGuySpecialZaeshRStart")//15
				{
					if (image_index == 0)
					{
						isinstartingframes = true;
						fx = Fx_create(spr_FxZaeshR, 0, -150, false, true);
						fx5 = Fx_create(spr_FxZaeshDragon, 1200, 0, false, true)
					}
					image_speed = 1;
					if (image_index >= 0 && image_index <= 14)
					{
						
						if image_index == 0
						{
							horizontalspeed = 0;
							if (global.UsingFMod == false) 
								audio_play_sound(TeleportSound, 1, 0);
								else
					fmod_system_play_sound(global.Sheer_SpecialZaeshDashGroundSound, false);
						}
						if (!place_meeting(x+ horizontalspeed -0.1, y, o_Ground))
							horizontalspeed -= 0.1;
					}
					//Part DASH
					if (image_index >= 15 && image_index <= 19 && toutvabien = 1)  
					{
						if (image_index == 15)
						{
							horizontalspeed = 0;
							zaeshStartX = x;
						}
						else if (x + 250 < opponent.x)
							horizontalspeed += 260;
						if(place_meeting(x, y, opponent))
						{
							if (place_meeting(x, y, opponent))
							{
								if (place_meeting(opponent.x + 10, opponent.y -100, o_Ground))
								{
									if (place_meeting(x + horizontalspeed, y -10, opponent))
									{
										while (!place_meeting(x+ sign(horizontalspeed), y, opponent)&& horizontalspeed != 0)
										{
											x = x + sign(horizontalspeed);
										}
										horizontalspeed = 0;
									
									}
									if (!place_meeting(x +10, y, o_Ground))
										x += 10;
									opponent.x -= 10;
								}
							}
							if (!place_meeting(x +10, y, o_Ground))
								x -= 10;
							opponent.x +=10
						}
						if (image_index == 19 && x < opponent.x)
						{
							sprite_index = spr_WindGuySpecialZaeshEndF;
							image_index = 0;
							horizontalspeed = 0;
						}
						if (image_index == 19 && x > opponent.x)
						{
							sprite_index = spr_WindGuySpecialZaeshEndB;
							image_index = 0;
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
				if (sprite_get_name(sprite_index) == "spr_WindGuySpecialZaeshLStart")//15
				{
					if (image_index == 0)
					{
						isinstartingframes = true;
						fx = Fx_create(spr_FxZaeshL, 0, -150, false, true);
						fx5 = Fx_create(spr_FxZaeshDragon, -1200, 0, false, true)
					}
					image_speed = 1;
					if (image_index >= 0 && image_index <= 14)
					{
						if image_index == 0
						{
							horizontalspeed = 0;
							if (global.UsingFMod == false) 
								audio_play_sound(TeleportSound, 1, 0);
								else
					fmod_system_play_sound(global.Sheer_SpecialZaeshDashGroundSound, false);
						}
						if (!place_meeting(x+ horizontalspeed -0.1, y, o_Ground))
							horizontalspeed += 0.1;
					}
					if (image_index >= 15 && image_index <= 19 && toutvabien = 1)
					{
						if (image_index == 15)
						{
							horizontalspeed = 0;
							zaeshStartX = x;
						}
						else if (x - 250 > opponent.x)
							horizontalspeed -= 260;
						if (place_meeting(x, y, opponent))
						{
							if (place_meeting(opponent.x - 10, opponent.y -100, o_Ground))
							{
								if (place_meeting(x + horizontalspeed, y-10, opponent))
								{
									while (!place_meeting(x+ sign(horizontalspeed), y, opponent)  && horizontalspeed != 0)
									{
										x = x + sign(horizontalspeed);
									}
									horizontalspeed = 0;
								}
							}
							if (!place_meeting(x -10, y, o_Ground))
								x -= 10;
							opponent.x += 10;
						}
						if (image_index == 19 && x < opponent.x)
						{
							sprite_index = spr_WindGuySpecialZaeshEndB;
							image_index = 0;
							horizontalspeed = 0;
						}
						if (image_index == 19 && x > opponent.x)
						{
							sprite_index = spr_WindGuySpecialZaeshEndF;
							image_index = 0;
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
				if (sprite_get_name(sprite_index) == "spr_WindGuySpecialZaeshEndF")//15
				{
					
					if (global.BigAssHitStop == 0 && global.HitStop == 0)
						image_speed = 1;
					if (image_index == 0)
					{
						if (facing == -1)
						{
							fx4 = Fx_create(spr_DashEffect, 200, 0, false, true)
							fx5 = Fx_create(spr_FxLand, 0, 0, false, true)
							horizontalspeed = -30;
							hitbox = HitBox_create(x - zaeshStartX, 128, 1200 * -facing , -60, 4, 0, 0, 1, 3, global.WindGuyHeavyAttackStandDamage, 40, 13);
						}
						if (facing == 1)
						{
							fx4 = Fx_create(spr_DashEffect, -200, 0, false, true)
							fx4.image_xscale = -1;
							fx5 = Fx_create(spr_FxLand, 0, 0, false, true)
							fx5.image_xscale = -1;
							horizontalspeed = 30;
							hitbox = HitBox_create(x - zaeshStartX, 128, 1200 * -facing , -60, 4, 0, 0, 1, 3, global.WindGuyHeavyAttackStandDamage, 40, 13);
						}
					}
					if (!place_meeting(x + horizontalspeed, y, o_Ground))
					{
						if (facing == 1 && !place_meeting(opponent.x +10, opponent.y, o_Ground))
							x = x + horizontalspeed;
						if (facing ==- 1 && !place_meeting(opponent.x -10, opponent.y, o_Ground))
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
				if (sprite_get_name(sprite_index) == "spr_WindGuySpecialZaeshEndB")//15
				{
					
					if (place_meeting(x, y, opponent))
					{
						if (facing == -1)
						{
							
							if (!place_meeting(x +10, y, o_Ground))
								x += 10;
							opponent.x -=10
						}
						if (facing == 1)
						{
							
							if (!place_meeting(x +10, y, o_Ground))
								x -= 10;
							opponent.x +=10
						}
					}
					if (global.BigAssHitStop == 0 && global.HitStop == 0)
						image_speed = 1;
					if (image_index == 0)
					{
						fx3 = Fx_create(spr_FxZaeshBarre, 0, -300, false, true)
						if (facing == 1)
						{
							fx4 = Fx_create(spr_DashEffect, -200, 0, false, true)
							fx5 = Fx_create(spr_FxLand, 0, 0, false, true)
							horizontalspeed = -10;
							hitbox = HitBox_create((x - zaeshStartX) * -facing, 128, -150 * facing , -60, 4, 0, 0, 1, 3, global.WindGuyHeavyAttackStandDamage, 40, 13);
						}
						if (facing == -1)
						{
							fx4 = Fx_create(spr_DashEffect, -200, 0, false, true)
							fx4.image_xscale = -1;
							fx5 = Fx_create(spr_FxLand, 0, 0, false, true)
							fx5.image_xscale = -1;
							horizontalspeed = 10;
							hitbox = HitBox_create((x - zaeshStartX) * facing, 128, -150 * facing , -60, 4, 0, 0, 1, 3, global.WindGuyHeavyAttackStandDamage, 40, 13);
						}
					}
					if (!place_meeting(x + horizontalspeed, y, o_Ground))
					{
						if (facing == 1 && !place_meeting(opponent.x +10, opponent.y, o_Ground))
							x = x + horizontalspeed;
						if (facing ==- 1 && !place_meeting(opponent.x -10, opponent.y, o_Ground))
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
				if (sprite_get_name(sprite_index) == "spr_WindGuySpecialZaeshRUStart")//16
				{
					if (image_index == 0)
					{
						isinstartingframes = true;
						fx4 = Fx_create(spr_FxZaeshDragon, 600, -500, false, false)
						fx = Fx_create(spr_FxZaeshR, 0, -150, false, true);
						fx.image_angle = 45;
					}
					image_speed = 1;
					if (image_index >= 0 && image_index <= 12)
					{
						if image_index == 0
						{
							horizontalspeed = 0;
							if (global.UsingFMod == false) 
								audio_play_sound(TeleportSound, 1, 0);
								else
					fmod_system_play_sound(global.Sheer_SpecialZaeshDashAirSound, false);
						}
						if (!place_meeting(x+ horizontalspeed -0.1, y, o_Ground))
							horizontalspeed -= 0.1;
					}
					if (image_index >= 13 && image_index <= 16 && toutvabien = 1)
					{
						if (image_index == 13)
						{
							zaeshStartX = x;
							zaeshStartY = y;
						}
						if (image_index == 13 || image_index == 16)
						{
							horizontalspeed = 0;
						}
						else if (!place_meeting(x + horizontalspeed, y, o_Ground))
							horizontalspeed += 260;
						y -= 380;
						if (x -opponent.x > -100 && x -opponent.x < 100)
							opponent.x -= 100;
						if (image_index == 16 && x < opponent.x)
						{
							sprite_index = spr_WindGuySpecialZaeshUEndF;
							image_index = 0;
							horizontalspeed = 0;
						}
						if (image_index == 16 && x > opponent.x)
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
				}
				if (sprite_get_name(sprite_index) == "spr_WindGuySpecialZaeshLUStart")//16
				{
					if (image_index == 0)
					{
						isinstartingframes = true;
						fx4 = Fx_create(spr_FxZaeshDragon, -600, -500, false, false)
						fx = Fx_create(spr_FxZaeshR, 0, -150, false, true);
						fx.image_angle = -45;
					}
					image_speed = 1;
					if (image_index >= 0 && image_index <= 12)
					{
						if image_index == 0
						{
							horizontalspeed = 0;
							if (global.UsingFMod == false) 
								audio_play_sound(TeleportSound, 1, 0);
								else
					fmod_system_play_sound(global.Sheer_SpecialZaeshDashAirSound, false);
						}
						if (!place_meeting(x+ horizontalspeed +0.1, y, o_Ground))
							horizontalspeed += 0.1;
					}
					if (image_index >= 13 && image_index <= 16 && toutvabien = 1)
					{
						if (x -opponent.x > -100 && x -opponent.x < 100)
							opponent.x += 100;
						if (image_index == 13)
						{
							zaeshStartX = x;
							zaeshStartY = y;
						}
						if (image_index == 13 || image_index == 16)
						{
							horizontalspeed = 0;
				
						}
						else if (!place_meeting(x + horizontalspeed, y, o_Ground))
							horizontalspeed -= 260;
						y -= 380;
						if (place_meeting(x + horizontalspeed, y, o_Ground))
						{
							while (!place_meeting(x+ sign(horizontalspeed), y, o_Ground) && horizontalspeed != 0)
							{
								x = x + sign(horizontalspeed);
							}
							horizontalspeed = 0;
						}
						if (place_meeting(opponent.x + 10, opponent.y -100, o_Ground))
						{
							if (place_meeting(x + horizontalspeed, y, opponent))
							{
								while (!place_meeting(x+ sign(horizontalspeed), y, opponent)  && horizontalspeed != 0)
								{
									x = x + sign(horizontalspeed);
								}
								horizontalspeed = 0;
							}
							if (!place_meeting(x + 10, y, o_Ground))
								x += 10
							opponent.x -= 10
						}
						if (image_index == 16 && x < opponent.x)
						{
							sprite_index = spr_WindGuySpecialZaeshUEndB;
							image_index = 0;
							horizontalspeed = 0;
						}
						if (image_index == 16 && x > opponent.x)
						{
							sprite_index = spr_WindGuySpecialZaeshUEndF;
							image_index = 0;
							horizontalspeed = 0;
						}
					}
					x += horizontalspeed;
					y += verticalspeed;
				}
				if (sprite_get_name(sprite_index) == "spr_WindGuySpecialZaeshUEndF")//16
				{
				
					if (image_index == 0)
					{
						if (facing == -1)
						{
							fx3 = Fx_create(spr_FxZaeshBarre, 300, 300, false, true)
							fx3.image_angle=-45;
							horizontalspeed = -30;
							hitbox = HitBox_create((x - zaeshStartX) * -1, zaeshStartY - y, 150 * -facing , -60, 4, 30, -50, 1, 2, global.WindGuyHeavyAttackStandDamage, 40, 4);
						}
						if (facing == 1)
						{
							fx3 = Fx_create(spr_FxZaeshBarre, 300, 300, false, true)
							fx3.image_angle=45
							horizontalspeed = 30;
							hitbox = HitBox_create((x - zaeshStartX) * -1, zaeshStartY - y, -150, -60, 4, -30, -50, 1, 2, global.WindGuyHeavyAttackStandDamage, 40, 4);
						}
					}
					if (!place_meeting(x + horizontalspeed, y, o_Ground))
					{
						if (facing == 1 && !place_meeting(opponent.x +10, opponent.y, o_Ground))
							x = x + horizontalspeed;
						if (facing ==- 1 && !place_meeting(opponent.x -10, opponent.y, o_Ground))
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
						sprite_index = spr_WindGuyJump;
					}
				}
				if (sprite_get_name(sprite_index) == "spr_WindGuySpecialZaeshUEndB")//16
				{
					
					if (global.BigAssHitStop == 0 && global.HitStop == 0)
						image_speed = 1;
					if (image_index == 0)
					{
						if (facing == -1 && hit != 16)
						{
							fx3 = Fx_create(spr_FxZaeshBarre, 300, 300, false, true)
							fx3.image_angle=45
							horizontalspeed = 30;
							hitbox = HitBox_create((x - zaeshStartX) * -1, zaeshStartY - y, 150 * -facing , -60, 4, 30, -100, 2, 2, global.WindGuyHeavyAttackStandDamage, 90, 4);
						}
						if (facing == 1 && hit != 16)
						{
							fx3 = Fx_create(spr_FxZaeshBarre, -300, 300, false, true)
							fx3.image_angle=-45
							horizontalspeed = -30;
							hitbox = HitBox_create((x - zaeshStartX) * -1, zaeshStartY - y, 150 * -facing , -60, 4, -30, -100, 2, 2, global.WindGuyHeavyAttackStandDamage, 90, 4);
						}
					}
					if (image_index >=5 && facing == 1 && input_check_pressed("hadoukenL", player))
					{
						sprite_index = spr_WindGuySpecialZaeshRDStart;
						image_index = 0;
						isAttacking = 15;
					}
					if (image_index >=5 && facing == -1 && input_check_pressed("hadoukenR", player))
					{
						sprite_index = spr_WindGuySpecialZaeshLDStart;
						image_index = 0;
						isAttacking = 15;
					}
					if (!place_meeting(x + horizontalspeed, y, o_Ground))
					{
						if (facing == 1 && !place_meeting(opponent.x +10, opponent.y, o_Ground))
							x = x + horizontalspeed;
						if (facing ==- 1 && !place_meeting(opponent.x -10, opponent.y, o_Ground))
							x = x + horizontalspeed;
					}
					if (horizontalspeed < 0 && x > zaeshStartX)
						horizontalspeed++;
					if (horizontalspeed > 0 && x < zaeshStartX)
						horizontalspeed--;
					if (image_index == 33)
					{
						isAttacking = 0;
						haschargedenough = 0;
						horizontalspeed = 0;
						CanSpecialCancel = 0;
						sprite_index = spr_WindGuyJump;
					}
				}
				if (sprite_get_name(sprite_index) == "spr_WindGuySpecialZaeshRDStart")//15
				{
					if (image_index == 0)
					{
						fx6 = Fx_create(spr_FxZaeshDragon, 700, 900, false, false)
						isinstartingframes = true;
						fx = Fx_create(spr_FxZaeshR, 0, -150, false, true);
						fx.image_angle = -45;
					}
					if (image_index == 15 && hit != 0)
					{
						horizontalspeed = 0;
						verticalspeed = 0;
					}
					image_speed = 1;
					if (image_index >= 0 && image_index <= 15)
					{
						if image_index == 0
						{
							horizontalspeed = 0;
							verticalspeed = 0;
							if (global.UsingFMod == false) 
								audio_play_sound(TeleportSound, 1, 0);
								else
					fmod_system_play_sound(global.Sheer_SpecialZaeshDashAirSound, false);
						}
						if (!place_meeting(x+ horizontalspeed -0.1, y, o_Ground))
						{
							horizontalspeed -= 0.1;
							verticalspeed -= 0.1;
						}
					}
					if (image_index >= 16 && image_index <= 19 && toutvabien = 1)
					{
						if (image_index == 16)
						{
							zaeshStartX = x;
							zaeshStartY = y;
						}
						if (image_index == 16 || x > 8512)
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
						if (image_index == 19 && x < opponent.x)
						{
							sprite_index = spr_WindGuySpecialZaeshDEndF;
							horizontalspeed = 0;
							image_index = 0;
						}
						if (image_index == 19 && x > opponent.x)
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
				if (sprite_get_name(sprite_index) == "spr_WindGuySpecialZaeshLDStart")//15
				{
					if (image_index == 0)
					{
						isinstartingframes = true;
						fx6 = Fx_create(spr_FxZaeshDragon, -700, 900, false, false)
						fx = Fx_create(spr_FxZaeshL, 0, -150, false, true);
						fx.image_angle = 45;
					}
					if (image_index == 15 && hit != 0)
					{
						horizontalspeed = 0;
						verticalspeed = 0;
					}
					image_speed = 1;
					if (image_index >= 0 && image_index <= 15)
					{
						if image_index == 0
						{
							horizontalspeed = 0;
							verticalspeed = 0;
							if (global.UsingFMod == false) 
								audio_play_sound(TeleportSound, 1, 0);
								else
					fmod_system_play_sound(global.Sheer_SpecialZaeshDashAirSound, false);
						}
						if (!place_meeting(x+ horizontalspeed -0.1, y, o_Ground))
						{
							horizontalspeed += 0.1;
							verticalspeed -= 0.1;
						}
					}
					if (image_index >= 16 && image_index <= 19 && toutvabien = 1)
					{
						if (image_index == 16)
						{
							zaeshStartX = x;
							zaeshStartY = y;
						}
						if (image_index == 16 || x < 1600)
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
						if (image_index == 19 && x < opponent.x)
						{
							sprite_index = spr_WindGuySpecialZaeshDEndB;
							horizontalspeed = 0;
							image_index = 0;
						}
						if (image_index == 19 && x > opponent.x)
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
					landed = 1;
					if (place_meeting(x, y, opponent))
					{
						if (facing == -1)
						{
							if (!place_meeting(x +10, y, o_Ground))
								x += 10;
							opponent.x -=10
						}
						if (facing == 1)
						{
							if (!place_meeting(x +10, y, o_Ground))
								x -= 10;
							opponent.x +=10
						}
					}
					if (image_index == 0)
					{
						if (facing == 1)
						{
							if (sprite_get_name(sprite_index) == "spr_WindGuySpecialZaeshDEndF")
							{
								fx3 = Fx_create(spr_FxZaeshBarre, 300, -300, false, true)
								fx3.image_angle = -45
								fx4 = Fx_create(spr_DashEffect, -200, 0, false, true)
								fx4.image_xscale = -1;
								fx5 = Fx_create(spr_FxLand, 0, 0, false, true)
								fx5.image_xscale = -1;
								horizontalspeed = 30;
							}
							if (sprite_get_name(sprite_index) == "spr_WindGuySpecialZaeshDEndB")
							{
								fx3 = Fx_create(spr_FxZaeshBarre, -300, -300, false, true)
								fx3.image_angle=45
								fx4 = Fx_create(spr_DashEffect, -200, 0, false, true)
								fx5 = Fx_create(spr_FxLand, 0, 0, false, true)
								horizontalspeed = -30;
							}
							hitbox = HitBox_create((x - zaeshStartX) * -facing, zaeshStartY - y, 150 * facing , -60, 4, 60 * -facing, 0, 2, 1, global.WindGuyHeavyAttackStandDamage, 200, 13);
						}
						if (facing == -1)
						{
							if (sprite_get_name(sprite_index) == "spr_WindGuySpecialZaeshDEndF")
							{
								fx3 = Fx_create(spr_FxZaeshBarre, -300, -300, false, true)
								fx3.image_angle=45
								fx4 = Fx_create(spr_DashEffect, -200, 0, false, true)
								fx5 = Fx_create(spr_FxLand, 0, 0, false, true)
								horizontalspeed = -30;
							}
							if (sprite_get_name(sprite_index) == "spr_WindGuySpecialZaeshDEndB")
							{
								fx3 = Fx_create(spr_FxZaeshBarre, 300, -300, false, true)
								fx3.image_angle=-45
								fx4 = Fx_create(spr_DashEffect, -200, 0, false, true)
								fx4.image_xscale = -1;
								fx5 = Fx_create(spr_FxLand, 0, 0, false, true)
								fx5.image_xscale = -1;
								horizontalspeed = 30;
							}
							hitbox = HitBox_create((x - zaeshStartX) * -1, zaeshStartY - y, 150 * facing , -60, 4, 60 * -facing, 0, 2, 1, global.WindGuyHeavyAttackStandDamage, 200, 13);
						}
					}
					if (!place_meeting(x + horizontalspeed, y, o_Ground))
					{
						if (facing == 1 && !place_meeting(opponent.x +10, opponent.y, o_Ground))
							x = x + horizontalspeed;
						if (facing ==- 1 && !place_meeting(opponent.x -10, opponent.y, o_Ground))
							x = x + horizontalspeed;
					}
					if (horizontalspeed < 0 && facing == -1)
						horizontalspeed++;
					if (horizontalspeed > 0 && facing == 1)
						horizontalspeed--;
					while (!place_meeting(x, y+1, o_Ground))
						y += 1;
					if (image_index == 33)
					{
						isAttacking = 0;
						haschargedenough = 0;
						horizontalspeed = 0;
						verticalspeed = 0;
						CanSpecialCancel = 0;
						sprite_index = spr_WindGuy;
					}
				}
			}
		}
	/// IF IS IN HIT
		if (isinhit == true || pushbackwhileattacking)
		{
			if (horizontalspeed > 0 && sprite_get_name(sprite_index) == "spr_MokujinHitFalling")
				image_xscale = -1;
			if (horizontalspeed < 0 && sprite_get_name(sprite_index) == "spr_MokujinHitFalling")
				image_xscale = 1;
			if (typeOfHit == 2 && verticalspeed > horizontalspeed * -facing && verticalspeed > 0 && (horizontalspeed * facing) > 0)
				sprite_index = spr_MokujinHitFalling;
			if (typeOfHit == 1 && hitStun == 11 && sprite_get_name(sprite_index) != "spr_MokujinHitKND")
				sprite_index = spr_MokujinHitTrueEnd;
			if (typeOfHit == 5)
			{
				if (facing == -1 && y > opponent.y + 300)
						move_towards_point(opponent.x + 300, opponent.y + 300, 70);
				if (facing == 1 && y > opponent.y + 300)
						move_towards_point(opponent.x - 300, opponent.y + 300, 70);
				if (y < opponent.y + 300)
					move_towards_point(x, y + 1, 1);
				if (y == opponent.y + 300)
					speed = 0;
			}
			if (bouncedagainstwall && verticalspeed > horizontalspeed * facing && verticalspeed > 0 && (horizontalspeed * facing) > 0)
				sprite_index = spr_MokujinHitWallFallingTrue;
			if (bouncedagainstground && horizontalspeed != 0 && verticalspeed == 0 && place_meeting(x, y+1, o_Ground))
				sprite_index = spr_MokujinHitFalling; 
			hitStun--;
			if (horizontalspeed > 0)
			{
				horizontalspeed -= airfric;
			}
			if (horizontalspeed < 0)
			{
				horizontalspeed += airfric;
			}
			if (hitStun == 0)
			{
				if (sprite_get_name(sprite_index) != "spr_MokujinHitKND")
				{
					sprite_index = spr_WindGuy;
				}
				else
				{
					isknockeddown = true;
					sprite_index = spr_MokujinKnockedDownFD;
				}
				isinhit = false;
				typeOfHit = 0;
				shahnogravity = false;
			}
			if (horizontalspeed == 0 && verticalspeed == 0 && place_meeting(x, y+1, o_Ground) && (sprite_get_name(sprite_index) == "spr_MokujinHitWallFallingTrue" || sprite_get_name(sprite_index) == "spr_MokujinHitGroundTrue" || sprite_get_name(sprite_index) == "spr_MokujinHitFalling" || sprite_get_name(sprite_index) == "spr_MokujinHitWallTrue"))
			{
				if (global.UsingFMod == false) 
					audio_play_sound(ThumpSound, 1, 0);
				else
					fmod_system_play_sound(global.All_WallBounceSound, false);
				isinhit = false;
				hitStun = 0;
				isknockeddown = true;
				sprite_index = spr_MokujinIsKnockedDownTrue;
			}
		}
	/// IF KNOCKED DOWN	
		if (isknockeddown == true)
		{
			instance_deactivate_object(hurtbox);
			if (knockeddowncurrenttime < knockeddowntime)
			{
				knockeddowncurrenttime++;
			}
			if (knockeddowncurrenttime >= knockeddowntime && currentHealth > 0)
			{
				if (sprite_get_name(sprite_index) == "spr_MokujinIsKnockedDownTrue")
					sprite_index = spr_MokujinWakeUpTrue;
				if (sprite_get_name(sprite_index) == "spr_MokujinKnockedDownFD")
					sprite_index = spr_MokujinWakeUpFD;
			}
			if (sprite_get_name(sprite_index) == "spr_MokujinWakeUpTrue" && image_index >= 49)
			{
				isknockeddown = 0;
				knockeddowncurrenttime = 0;
				instance_activate_object(hurtbox);
				sprite_index = spr_WindGuy;
			}
			if (sprite_get_name(sprite_index) == "spr_MokujinWakeUpFD" && image_index >= 33)
			{
				isknockeddown = 0;
				knockeddowncurrenttime = 0;
				instance_activate_object(hurtbox);
				sprite_index = spr_WindGuy;
			}
		}
	/// IF BLOCKING	
		if (isinblock != 0)
		{
			if ((input_check_pressed("assist", player)|| input_check_pressed("dashu", player)|| input_check_pressed("dashd", player)|| input_check_pressed("dashl", player)|| input_check_pressed("dashr", player)) && can_dash && isStartingJump == 0 && (isAttacking == 0 || isAttacking == 13))
			{
				isAttacking = 0;
				done2 = 0;
			    dash = true;
			
				if (!place_meeting(x, y +10, o_Ground))
					hasdashedinair = 1;
			    alarm[0] = room_speed / 16; // dash for eight of a second
				if input_check("right", player) 
				{
					dash_dir = 0;
					if (place_meeting(x, y+10, o_Ground))
						alarm[0] = room_speed / 8;
				}
			    else if input_check("left", player)
				{
					dash_dir = 180;
					if (place_meeting(x, y+10, o_Ground))
						alarm[0] = room_speed / 8;
				}
				 else if  (input_check("up", player) && place_meeting(x, y+10, o_Ground))
				{
					dash = false
				}
			    else if input_check("down", player)
				{

					dash_dir = 270;
					if (y < 5100)
					{
						verticalspeed = 0;
						alarm[0] = room_speed / 2;
					}
				}
				else if (facing == 1 && !input_check("down", player) && !input_check("left", player) && !input_check("right", player))
				{
					dash_dir = 0;
					if (place_meeting(x, y+10, o_Ground))
						alarm[0] = room_speed / 8;
				}
				else if (facing == -1 && !input_check("down", player) && !input_check("left", player) && !input_check("right", player))
				{
					dash_dir = 180;
					if (place_meeting(x, y+10, o_Ground))
						alarm[0] = room_speed / 8;
				}
			}
			if (facing == -1 && dash_dir = 0 && global.CurrentDistance + dash_spd > global.MaxDistance)
				dash = false;
			if (facing == 1 && dash_dir = 180 && global.CurrentDistance + dash_spd > global.MaxDistance)
				dash = false;
			if dash && dash_dir == 270 && place_meeting(x , y + dash_spd, o_Ground)
				dash = false;
			if dash && dash_dir == 270 && place_meeting(x , y + dash_spd, opponent)
			{
				if (x < opponent.x)
				{
					while ( place_meeting(x , y + dash_spd, opponent))
					{
						if (!place_meeting(x - 5, y, o_Ground))
							x -= 5;
						else
							opponent.x += 5;
					}
				}
				if (x > opponent.x)
				{
					while ( place_meeting(x , y + dash_spd, opponent))
					{
						if (!place_meeting(x + 5, y, o_Ground))
							x += 5;
						else
							opponent.x -= 5;
					}
				}
			}
			if dash && dash_dir == 0 && place_meeting(x + dash_spd , y - 10, o_Ground)
				dash = false;	
			if dash && dash_dir == 0 && place_meeting(x + dash_spd , y, opponent)
				dash = false;
			if dash && dash_dir == 180 && place_meeting(x - dash_spd , y, o_Ground)
				dash = false;	
			if dash && dash_dir == 180 && place_meeting(x - dash_spd, y, opponent)
				dash = false;
			if (place_meeting(x, y +10, o_Ground) && currentSpecial >= 3 && dash == true && done1 == 0)
					currentSpecial -= 3;
			else if (place_meeting(x, y +10, o_Ground) && currentSpecial < 3 && done1 == 0)
				dash = false;
			if (!place_meeting(x, y +10, o_Ground) && currentSpecial >= 2 && dash == true && done1 == 0)
					currentSpecial -= 2;
			else if (!place_meeting(x, y +10, o_Ground) && currentSpecial < 2 && done1 == 0)
				dash = false;
			if (dash == false)
				alarm[0] = -1;
			if dash 
			{
				isinblock = false;
				if (dash_dir= 0 && done1 == 0)
				{
					done1 = 1;
					sprite_index = spr_DashHor;
					if (global.UsingFMod == false) 
						audio_play_sound(DashSoundF, 1, 0);
						else
					fmod_system_play_sound(global.Sheer_DashAirSound, false);
					
				}
				if (dash_dir = 180 && done1 == 0)
				{
					done1 = 1;
					sprite_index = spr_DashHor;
					if (global.UsingFMod == false) 
						audio_play_sound(DashSoundB, 1, 0);
						else
					fmod_system_play_sound(global.Sheer_DashAirSound, false);
					
				}
				if (dash_dir = 90 && done1 == 0)
				{
					done1 = 1;
					sprite_index = spr_DashVer;
					if (global.UsingFMod == false) 
						audio_play_sound(DashSoundB, 1, 0);
						else
					fmod_system_play_sound(global.Sheer_DashAirSound, false);
					instance_create_layer(x - 80, y -30, "Instances_1", o_DoubleJump);
				}
				if (dash_dir = 270 && done1 == 0)
				{
					done1 = 1;
					if (global.UsingFMod == false) 
						audio_play_sound(DashSoundF, 1, 0);
						else
					fmod_system_play_sound(global.Sheer_DashAirSound, false);
					sprite_index = spr_DashVer;
					
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
			else
			{
				blockStun--;
				if (isblocking == 1)
				{
					if (blockStun > 5)
						sprite_index = spr_MokujinBlockTrue;
					else
						sprite_index = spr_MokujinBlockTrueEnd;
				}
				if ( isblocking == 4)
				{
					if (blockStun > 5)
						sprite_index = spr_MokujinBlockAir;
					else
						sprite_index = spr_MokujinBlockAirEnd;
				}
				if (isblocking == 2)
				{
					if (blockStun > 5)
						sprite_index = spr_MokujinBlockCrouchTrue;
					else
						sprite_index = spr_MokujinBlockCrouchTrueEnd;
				}
				if (blockStun <= 0)
				{
					if (isblocking == 1)
						sprite_index = spr_WindGuy;
					if (isblocking == 4)
						sprite_index = spr_WindGuyJump;
					if (isblocking == 2)
						sprite_index = spr_WindGuyCrouch;
					isinblock = false;
					typeOfHit = 0;
				}
			}
		}
		
	///ALL THE TIME DURING NO HITSTOP
	//JUMP STUFF
		if (isAttacking != 15 && isAttacking != 16 && isAttacking != 11 && isinhit == false && isinblock == false && sprite_get_name(sprite_index) != "spr_WindGuyHeavySpikeActive"&& sprite_get_name(sprite_index) != "spr_WindGuyHeavySpikeReco")
		{
			if (isJumpingR == 1 && !place_meeting(x + 18, y, o_Ground)&& !place_meeting(x + 18, y, opponent) && hasdashedinair == 0)
				{
					if (facing == -1 && global.CurrentDistance +18 < global.MaxDistance)
						x += 18;
					if (facing == 1)
						x += 18;
					if (verticalspeed < 0 && sprite_get_name(sprite_index) == "spr_WindGuyJump")
						image_index = 0;
					if (verticalspeed > 0 && sprite_get_name(sprite_index) == "spr_WindGuyJump")
						image_index = 1;
					if (verticalspeed > 0 && y > 5950 && isJumpingR)
					{
						sprite_index = spr_WindGuyLand;
						isAttacking = 0
					}
				}
			if (isJumpingR == 2 && !place_meeting(x + 22, y, o_Ground)&& !place_meeting(x + 22, y, opponent) && hasdashedinair == 0)
			{
				if (facing == -1 && global.CurrentDistance +22 < global.MaxDistance)
					x += 22;
				if (facing == 1)
					x += 22;
				if (verticalspeed < 0 && sprite_get_name(sprite_index) == "spr_WindGuyJump")
					image_index = 0;
				if (verticalspeed > 0 && sprite_get_name(sprite_index) == "spr_WindGuyJump")
					image_index = 1;
				if (verticalspeed > 0 && y > 5950 && isJumpingR)
				{
					sprite_index = spr_WindGuyLand;
					isAttacking = 0
				}
			}
			if (isJumpingL == 1 && !place_meeting(x - 18, y, o_Ground) && !place_meeting(x - 18, y, opponent) && hasdashedinair == 0)
			{
				if (facing == 1 && global.CurrentDistance -18 < global.MaxDistance)
					x -= 18;
				else if (facing == -1)
					x -= 18;
				if (verticalspeed < 0 && sprite_get_name(sprite_index) == "spr_WindGuyJump")
					image_index = 0;
				if (verticalspeed > 0 && sprite_get_name(sprite_index) == "spr_WindGuyJump")
					image_index = 1;
				if (verticalspeed > 0 && y > 5950 && isJumpingL)
				{
					sprite_index = spr_WindGuyLand;
					isAttacking = 0
				}
			}
			if (isJumpingL == 2 && !place_meeting(x - 22, y, o_Ground) && !place_meeting(x - 22, y, opponent) && hasdashedinair == 0)
			{
				if (facing == 1 && global.CurrentDistance -22 < global.MaxDistance)
					x -= 22;
				else if (facing == -1)
					x -= 22;
				if (verticalspeed < 0 && sprite_get_name(sprite_index) == "spr_WindGuyJump")
					image_index = 0;
				if (verticalspeed > 0 && sprite_get_name(sprite_index) == "spr_WindGuyJump")
					image_index = 1;
				if (verticalspeed > 0 && y > 5950 && isJumpingL)
				{
					sprite_index = spr_WindGuyLand;
					isAttacking = 0
				}
			}
			if (IsJumpingN)
			{
				if (verticalspeed < 0 && sprite_get_name(sprite_index) == "spr_WindGuyJump")
					image_index = 0;
				if (verticalspeed > 0 && sprite_get_name(sprite_index) == "spr_WindGuyJump")
					image_index = 1;
				if (verticalspeed > 0 && y > 5950 && IsJumpingN)
				{
					sprite_index = spr_WindGuyLand;
					isAttacking = 0
				}
			}
		}
	//GRAVITY
		if (isAttacking != 15 && isAttacking != 16 && isAttacking != 11 && typeOfHit != 5 && shahnogravity = false && !dash)
			verticalspeed = verticalspeed + grv;
		if (hitStun == 0 || typeOfHit != 2)
			grv = 7;
	//FOR THE HITSTOP SHAKE
		if (typeOfHit != 5)
		speed = 0;
		if (hasstartedshake == 1)
		{
			x = shakestartx;
			hasstartedshake = 0;
		}
	///CHECK pos du joueur par rapport au J2
		if (x - opponent.x > 0)		
		{
			facing = -1;
			hitDirectionModifier = 300;
			mediumHitDirectionModifier = 480;
		}
		if (x - opponent.x < 0)
		{
			facing = 1;
			hitDirectionModifier = 1;
			mediumHitDirectionModifier = 1;
		}
		if facing == 1 && isinhit == 0
			image_xscale = 1;
		else if facing == -1 && isinhit == 0
			image_xscale = -1;
	///JUST BECAUSE
		image_speed = 1;
	//FOR THE AIR BACK HEAVY PUSHBACK
		if (hit == 13 && image_index == 16)
		{
			verticalspeed = -20;
			horizontalspeed = 30 * -facing;
			hasdashedinair = 1;
		}
	//FOR SHAH
		if ((isinstartingframes == false) && !special2/*!keyboard_check(ord("K")*/)
		{
			
			for (var i = 0; i < instance_number(o_ShahOver); i++)
			{
			    // Get the instance ID of the i-th instance
			    var currentInstance = instance_find(o_ShahOver, i);

			    // Check the value of the variable 'myVariable' in the current instance
			    var variableValue = currentInstance.owner;

			    // Perform your checks or actions based on the variable value
			    if (variableValue == id)
			    {
					if (currentInstance.opponent != -1 && currentInstance.state == 1)
					{
						currentInstance.state = 2;
						if (global.BigAssHitStop == 0)
							global.BigAssHitStop = 1;
						global.GetShaedJ1 = true;
						playseq = true;
					}
			        // Do something
			    }
			}
			for (var i = 0; i < instance_number(o_ShahUnder); i++)
			{
			    // Get the instance ID of the i-th instance
			    var currentInstance = instance_find(o_ShahUnder, i);

			    // Check the value of the variable 'myVariable' in the current instance
			    var variableValue = currentInstance.owner;

			    // Perform your checks or actions based on the variable value
			    if (variableValue == id)
			    {
					if (currentInstance.opponent != -1 && currentInstance.state == 1)
						currentInstance.state = 2;
			        // Do something
			    }
			}
		}
	//FOR TAKING HITS
		if (gettingHit == true && (opponent.hitbox != -1 || instance_exists(o_ShahOver)|| instance_exists(o_ShahUnder)))
		{
			
			//if (!instance_exists(o_ShahUnder) && !instance_exists(o_ShahOver))
			//	hitBy = opponent.hitbox;
			if ((isblocking == 0 && hitBy.placeOfAttack > 0 && hitBy.placeOfAttack < 4)|| (isblocking == 2 && hitBy.placeOfAttack == 1) || (isblocking == 1 && hitBy.placeOfAttack == 3))
			{
				if (fx2 == -1 && opponent.hit == 4)
				{
					fx2 = Fx_create(spr_FxMediumHit, 0, -700, false)
				}
				if (fx2 == -1 && (opponent.hit == 1 || opponent.hit == 3))
				{
					fx2 = Fx_create(spr_SmallHitEffect, 0, -500, false)
				}
				if (fx2 == -1 && opponent.hit == 2)
				{
					fx2 = Fx_create(spr_SmallHitEffect, 0, -300, false);
				}
				if (fx2 == -1 && (opponent.hit == 6 || opponent.hit == 21))
				{
					fx2 = Fx_create(spr_FxMediumAirHit, -0 *facing, -800, false)
				}
				if (fx2 == -1 && opponent.hit == 17)
				{
					fx2 = Fx_create(spr_FxMediumBackAirHit, 0, -800, false)
				}
				if (fx2 == -1 && (opponent.hit == 7 || opponent.hit == 8 || opponent.hit == 9))
				{
					fx2 = Fx_create(spr_FxHeavyHit, 0, -400, false)
					audio_play_sound(RidleySound, 1, 0);
				}
				if (fx2 == -1 && (opponent.hit == 15 || opponent.hit == 16))
				{
					fx2 = Fx_create(spr_FxZaeshHit, 0, -400, false);
				}
				if (hitBy.typeOfAttack == 1) //Normal Hit
				{
					var _hiteffect = -1;
					var _hiteffectunder = -1;
					sprite_index = spr_MokujinHitTrue;
					if (hitBy.hitStun <= 30)
					{
						if (global.UsingFMod == false) 
							audio_play_sound(Hit02Sound, 1, 0);
						else
							fmod_system_play_sound(global.All_LightHitSound, false);
						global.HitStop = 1;
						
					}
					if (hitBy.hitStun > 30)
					{
						fx2 = Fx_create(spr_FxMediumDownAirHit, 150* facing, -400, true)
						if (global.UsingFMod == false) 
							audio_play_sound(Hit02Sound, 1, 0);
						else
							fmod_system_play_sound(global.All_LightHitSound, false);
						global.HitStop = 1;
						if (opponent.hit == 7 || opponent.hit == 8)
						{
							sprite_index = spr_MokujinHitKND;
						}
					}
					else if (hitBy.hitStun > 30)
					{
						if (hitBy.placeOfAttack == 1)
						{
							_hiteffect = instance_create_layer(x + 150 * facing, y - 650, "Instances_1", o_HitEffect)
							_hiteffectunder = instance_create_layer(x + 150 * facing, y -650, "Instances_2", o_BigHitEffectUnder)
							_hiteffect.image_xscale = -facing;
							_hiteffect.image_angle = point_distance(0, 0, hitBy.xPushBack, hitBy.yPushBack)
							_hiteffectunder.image_xscale = -facing;
							_hiteffectunder.image_angle = point_distance(0, 0, hitBy.xPushBack, hitBy.yPushBack)
						}
						if (hitBy.placeOfAttack == 2)
						{
							_hiteffect = instance_create_layer(x + 150 * facing, y - 650, "Instances_1", o_HitEffect)
							_hiteffectunder = instance_create_layer(x + 150 * facing, y -650, "Instances_2", o_BigHitEffectUnder)
							_hiteffect.image_xscale = -facing;
							_hiteffect.image_angle = point_distance(0, 0, hitBy.xPushBack, hitBy.yPushBack)
							_hiteffectunder.image_xscale = -facing;
							_hiteffectunder.image_angle = point_distance(0, 0, hitBy.xPushBack, hitBy.yPushBack)
						}
						if (hitBy.placeOfAttack == 3)
						{
							_hiteffect = instance_create_layer(x + 150 * facing, y - 650, "Instances_1", o_HitEffect)
							_hiteffectunder = instance_create_layer(x + 150 * facing, y -650, "Instances_2", o_BigHitEffectUnder)
							_hiteffect.image_xscale = -facing;
							_hiteffect.image_angle = point_distance(0, 0, hitBy.xPushBack, hitBy.yPushBack)
							_hiteffectunder.image_xscale = -facing;
							_hiteffectunder.image_angle = point_distance(0, 0, hitBy.xPushBack, hitBy.yPushBack)
						}
						if (global.UsingFMod == false) 
							audio_play_sound(Hit03Sound, 1, 0);
							else
					fmod_system_play_sound(global.Sheer_HeavyHitSound, false);
						global.BigAssHitStop = 1;
					}
				}
				if (hitBy.typeOfAttack == 2) //Project Hit
				{
					global.DoTheZoom = true;
					if (hitBy.xPushBack * -facing > hitBy.yPushBack)
						sprite_index = spr_MokujinHitDownHeavyAirTrue;
					else
						sprite_index = spr_MokujinHitBackMediumAirTrue;
					if (global.UsingFMod == false) 
						audio_play_sound(DBHitSound, 1, 0);
						else
					fmod_system_play_sound(global.All_BigImpactSound, false);
					mask_index = spr_SheerFlingCollisionMask;
					if (opponent.hit != 21)
						global.BigAssHitStop = 1;
					else
						global.MediumAssHitStop = 1;
					grv = 4;
				}
				if (hitBy.typeOfAttack == 6) //Projectile hit
				{
					var _hiteffect = -1;
					sprite_index = spr_MokujinHitTrue;
					if (hitBy.hitStun <= 20)
					{
						if (global.UsingFMod == false) 
							audio_play_sound(Hit02Sound, 1, 0);
							else
					fmod_system_play_sound(global.All_LightHitSound, false);
						if (hitBy.placeOfAttack == 2)
						{
							_hiteffect = instance_create_layer(x + 150 * facing, y - 650, "Instances_1", o_HitEffectSmall)
							_hiteffect.image_xscale = -facing;
							_hiteffect.image_angle = point_distance(0, 0, hitBy.xPushBack, hitBy.yPushBack)
						}
					}
				}
				isinhit = true;
				
				currentHealth -= hitBy.damage;
				if (currentHealth <= 0)
				{
					hitBy.typeOfAttack = 2;
					hitBy.hitStun = 90;
					hitBy.xPushBack = 50 * -facing;
					hitBy.yPushBack = -50;
				}
				if (hitBy.dothestep = true)
					horizontalspeed = hitBy.xPushBack;
				if (hitBy.yPushBack != 0)
					verticalspeed = hitBy.yPushBack;
				if (hitBy.dothestep = false)
				{
					 verticalspeed = 0;
				}
				hitStun = hitBy.hitStun - isgettingcomboed;
				typeOfHit = hitBy.typeOfAttack;
				//image_xscale = 1.2 * facing;
				//image_yscale = 1.2;
				isgettingcomboed++;
				isknockeddown = false;
				instance_activate_object(hurtbox);
			}
			if (hitBy.placeOfAttack == 5 && !place_meeting(x, y+1, o_Ground)) //Air Grab Hit
			{
				isinhit = true;
				horizontalspeed = hitBy.xPushBack;
				verticalspeed = hitBy.yPushBack;
				hitStun = hitBy.hitStun;
				currentHealth -= hitBy.damage;
				typeOfHit = hitBy.typeOfAttack;
				isgettingcomboed++;
				sprite_index = spr_MokujinHitWallTrue;
			}
			if (((isblocking == 1 || isblocking == 4) && (hitBy.placeOfAttack == 1 || hitBy.placeOfAttack == 2)) || ((isblocking == 2 || isblocking == 4) && (hitBy.placeOfAttack == 3 || hitBy.placeOfAttack == 2)))
			{
				blockStun = hitBy.blockStun;
				isinblock = true;
				horizontalspeed = hitBy.xPushBack /2;
				if (place_meeting(x+horizontalspeed, y, o_Ground))
				{
					horizontalspeed = 0;
					opponent.pushbackwhileattacking = true
					opponent.horizontalspeed = -hitBy.xPushBack;
					if (global.UsingFMod == false) 
						audio_play_sound(DBHitSound, 1, 0)
					else
					fmod_system_play_sound(global.All_BigImpactSound, false);
				}
				if (isblocking == 1)
				{
					var _blockeffect = -1;
					if (hitBy.blockStun <= 20)
					{
						if (global.UsingFMod == false) 
							audio_play_sound(BlockSound, 1, 0);
							else
					fmod_system_play_sound(global.All_BlockSound, false);
						if (hitBy.placeOfAttack == 1)
						{
							_blockeffect = instance_create_layer(x + 150 * facing, y - 650, "Instances_1", o_BlockEffect)
							_blockeffect.image_xscale = -facing;
							_blockeffect.image_angle = point_distance(0, 0, hitBy.xPushBack, hitBy.yPushBack)
						}
						if (hitBy.placeOfAttack == 2)
						{
							_blockeffect = instance_create_layer(hitBy.x, y - 450, "Instances_1", o_BlockEffect)
							_blockeffect.image_xscale = -facing;
							_blockeffect.image_angle = point_distance(0, 0, hitBy.xPushBack, hitBy.yPushBack)
						}
					}
					else
					{
						if (global.UsingFMod == false) 
							audio_play_sound(BlockSound, 1, 0);
							else
					fmod_system_play_sound(global.All_BlockSound, false);
						_blockeffect = instance_create_layer(x + 150 * facing, y - 450, "Instances_1", o_BlockEffect)
						_blockeffect.image_xscale = -facing;
						_blockeffect.image_angle = point_distance(0, 0, hitBy.xPushBack, hitBy.yPushBack)
					}
				}
				if (isblocking == 2)
				{
					var _blockeffect = -1;
					if (hitBy.blockStun <= 20)
					{
						if (global.UsingFMod == false) 
							audio_play_sound(BlockSound, 1, 0);
							else
					fmod_system_play_sound(global.All_BlockSound, false);
						if (hitBy.placeOfAttack == 3)
						{
							_blockeffect = instance_create_layer(x + 150 * facing, y - 200, "Instances_1", o_BlockEffect)
							_blockeffect.image_xscale = -facing;
							_blockeffect.image_angle = point_distance(0, 0, hitBy.xPushBack, hitBy.yPushBack)
						}
						if (hitBy.placeOfAttack == 2)
						{
							_blockeffect = instance_create_layer(hitBy.x, y - 450, "Instances_1", o_BlockEffect)
							_blockeffect.image_xscale = -facing;
							_blockeffect.image_angle = point_distance(0, 0, hitBy.xPushBack, hitBy.yPushBack)
						}
					}
					else
					{
						if (global.UsingFMod == false) 
							audio_play_sound(BlockSound, 1, 0);
							else
					fmod_system_play_sound(global.All_BlockSound, false);
						_blockeffect = instance_create_layer(x + 150 * facing, y - 450, "Instances_1", o_BlockEffect)
						_blockeffect.image_xscale = -facing;
						_blockeffect.image_angle = point_distance(0, 0, hitBy.xPushBack, hitBy.yPushBack)
					}
				}
				if (isblocking == 4)
				{
					var _blockeffect = -1;
					if (hitBy.blockStun <= 20)
					{
						if (global.UsingFMod == false) 
							audio_play_sound(BlockSound, 1, 0);
							else
					fmod_system_play_sound(global.All_BlockSound, false);
						_blockeffect = instance_create_layer(x + 150 * facing, y - 450, "Instances_1", o_BlockEffect)
						_blockeffect.image_xscale = -facing;
						_blockeffect.image_angle = point_distance(0, 0, hitBy.xPushBack, hitBy.yPushBack)
					}
					else
					{
						if (global.UsingFMod == false) 
							audio_play_sound(BlockSound, 1, 0);
							else
					fmod_system_play_sound(global.All_BlockSound, false);
						_blockeffect = instance_create_layer(x + 150 * facing, y - 450, "Instances_1", o_BlockEffect)
						_blockeffect.image_xscale = -facing;
						_blockeffect.image_angle = point_distance(0, 0, hitBy.xPushBack, hitBy.yPushBack)
					}
				}
			}
			
			gettingHit = false;
			hitBy = -1;
			hitBy2 = -1;
		}
	//FOR LANDING AND RESETTING AIRBORNE STUFF
		if (place_meeting(x, y+1, o_Ground))
		{
			if (landed == 0 && IsJumpingN)
			{
				if (global.UsingFMod == false) 
					audio_play_sound(LandingSound, 1, 0);
					else
					fmod_system_play_sound(global.All_BlockSound, false);
				instance_create_layer(x, y +100, "Instances_1", o_FxLand);
				landed = 1;
			}
			if (landed == 0 && (isJumpingL || isJumpingR))
			{
				if (global.UsingFMod == false) 
					audio_play_sound(LandingSound02, 1, 0);
					else
					fmod_system_play_sound(global.Sheer_JumpLandSound, false);
				instance_create_layer(x, y +100, "Instances_1", o_FxLand)
				landed = 1;
			}
			isJumpingR = 0;
			IsJumpingN = 0;
			isJumpingL = 0;
			hasdashedinair = 0;
			hasjumpcanceled = 0;
			CanSpecialCancel = 0;
			isdoingledeuxiemecouprelou = 0;
			if (alarm_get(1) == 0 || (!alarm[1] && !alarm[2]))
			can_dash = 1;
		}
		if (sprite_get_name(sprite_index) == "spr_WindGuyLand" && image_index >= 10)
		{
			sprite_index = spr_WindGuy;
			image_index = 0;
		}
	//FOR COLLISIONS WITH OPPONENT
		if (place_meeting(x + 1, y, opponent) && right && facing == 1 && isAttacking == 0 && isknockeddown == 0 && isinblock == 0 && isinhit == 0)
		{
		
			if (!place_meeting(opponent.x + 10, opponent.y, o_Ground))
			{
				x += 10;
				opponent.x += 10;
			}
			horizontalspeed = 0;
		}
		if (place_meeting(x - 1, y, opponent) && left && facing == -1 && isAttacking == 0 && isknockeddown == 0 && isinblock == 0 && isinhit == 0)
		{
			if (!place_meeting(opponent.x - 10, opponent.y, o_Ground))
			{
				x -= 10;
				opponent.x -= 10;
			}
			horizontalspeed = 0;
		}
		if (place_meeting(x, y + verticalspeed, opponent) && y < opponent.y) //si le joueur arrive sur la tete du J2 
		{
			if (x < opponent.x)
			{
				while (place_meeting(x, y + verticalspeed, opponent))
				{
					if (!place_meeting(x - 10, y, o_Ground))
						x -= 10;
					if (!place_meeting(opponent.x + 10, opponent.y, o_Ground))
						opponent.x += 10;
				}
			}
			if (x > opponent.x)
			{
				while (place_meeting(x, y + verticalspeed, opponent))
				{
					if (!place_meeting(x + 10, y, o_Ground))
						x += 10;
					if (!place_meeting(opponent.x - 10, opponent.y, o_Ground))
						opponent.x -= 10;
				}
			}
			if (x == opponent.x)
			{
				if (x > 3000)
					x -= 10
				else 
					x += 10
			}
		}
	//FOR RESETTING STUFF
		if (isinblock || isinhit)
		{
			isinstartingframes = false;
			haschargedenough = 0;
			isStartingJump = 0;
			_canshootprojo = 0;
			for (var i = 0; i < instance_number(o_ShahOver); i++)
			{
			    // Get the instance ID of the i-th instance
			    var currentInstance = instance_find(o_ShahOver, i);

			    // Check the value of the variable 'myVariable' in the current instance
			    var variableValue = currentInstance.owner;

			    // Perform your checks or actions based on the variable value
			    if (variableValue == id)
			    {
					instance_destroy(currentInstance);
			        // Do something
			    }
			}
			for (var i = 0; i < instance_number(o_ShahUnder); i++)
			{
			    // Get the instance ID of the i-th instance
			    var currentInstance = instance_find(o_ShahUnder, i);

			    // Check the value of the variable 'myVariable' in the current instance
			    var variableValue = currentInstance.owner;

			    // Perform your checks or actions based on the variable value
			    if (variableValue == id)
			    {
					instance_destroy(currentInstance);
			        // Do something
			    }
			}
		}
		if (!dash)
			done1 = 0;
	//FOR BLOCKING
		if (left && !down && facing == 1 && isAttacking == 0 && isinhit == 0 && place_meeting(x, y + 1, o_Ground))
			 isblocking = 1;
		if (left && facing == 1 && isAttacking == 0 && isinhit == 0 && !place_meeting(x, y + 1, o_Ground))
			 isblocking = 4;
		if (left && down && facing == 1 && isinhit == 0 && isAttacking == 0 && place_meeting(x, y + 1, o_Ground))
		{
			isblocking = 2;
		}
		if (right && !down && facing == -1 && isAttacking == 0 && isinhit == 0 && place_meeting(x, y + 1, o_Ground))
			isblocking = 1;
		if (right && facing == -1 && isAttacking == 0 && isinhit == 0 && !place_meeting(x, y + 1, o_Ground))
			isblocking = 4;
		if (right && down && facing == -1 && isAttacking == 0 && isinhit == 0 && place_meeting(x, y + 1, o_Ground))
			isblocking = 2;
		if ((!right && facing == -1) || (sprite_get_name(sprite_index) != "spr_WindGuy" && sprite_get_name(sprite_index) != "spr_WindGuyJump"  && sprite_get_name(sprite_index) != "spr_WindGuyCrouch" && sprite_get_name(sprite_index) != "spr_MokujinBlockTrue"&& sprite_get_name(sprite_index) != "spr_MokujinBlockAir"  && sprite_get_name(sprite_index) != "spr_MokujinBlockCrouchTrue") && sprite_get_name(sprite_index) != "spr_WindGuyWalk")
			isblocking = 0;
		if ((!left && facing == 1) || (sprite_get_name(sprite_index) != "spr_WindGuy" && sprite_get_name(sprite_index) != "spr_WindGuyJump"  && sprite_get_name(sprite_index) != "spr_WindGuyCrouch" && sprite_get_name(sprite_index) != "spr_MokujinBlockTrue" && sprite_get_name(sprite_index) != "spr_MokujinBlockAir" && sprite_get_name(sprite_index) != "spr_MokujinBlockCrouchTrue") && sprite_get_name(sprite_index) != "spr_WindGuyWalk")
			isblocking = 0;
		if (sprite_get_name(sprite_index) == "spr_MokujinBlockTrue" && fx2 == -1)
		{
			fx2 = Fx_create(spr_FxGuard, 100 * facing, -400, true, false);
		}
		if (sprite_get_name(sprite_index) == "spr_MokujinBlockAir" && fx2 == -1)
		{
			fx2 = Fx_create(spr_FxGuard, 100 * facing, -400, true, false);
		}
		if (sprite_get_name(sprite_index) == "spr_MokujinBlockCrouchTrue" && fx2 == -1)
		{
			fx2 = Fx_create(spr_FxGuard, 100 * facing, -200, true, false);
		}
		if (sprite_get_name(sprite_index) != "spr_MokujinBlockTrue" && sprite_get_name(sprite_index) != "spr_MokujinBlockCrouchTrue" && sprite_get_name(sprite_index) != "spr_MokujinBlockAir" && fx2 != -1 && isinhit = false)
		{
			fx2.image_alpha -= 0.05;
		}
	//FOR DEBUG REASONS
		if (place_meeting(x, y, o_Ground) && facing == -1)
			x-=1;
		if (place_meeting(x, y, o_Ground) && facing == 1)
			x+=1;
		
	//Combo Scale
		if (isgettingcomboed != isgettingcomboedpreviouswindguy)
		{
			if (isgettingcomboed > 1 && global.DamageReduction > 0.3)
				global.DamageReduction -= 0.2;
			o_GameManager.textxScale = 1.4;
			o_GameManager.textyScale = 1.4;
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

	//Movement
		if (sprite_get_name(sprite_index) == "spr_WindGuy" ||sprite_get_name(sprite_index) == "spr_WindGuyJump" || sprite_get_name(sprite_index) == "spr_WindGuyCrouch")
		{
			isAttacking = 0;
			done2 = 0;
		}
		if (facing == 1 && horizontalspeed < 0 && global.CurrentDistance + horizontalspeed > global.MaxDistance)
			horizontalspeed = 0;
		if (facing == -1 && horizontalspeed > 0 && global.CurrentDistance + horizontalspeed > global.MaxDistance)
			horizontalspeed = 0;
		if (place_meeting(x + horizontalspeed, y, o_Ground))
		{
			while (!place_meeting(x+ sign(horizontalspeed), y, o_Ground))
			{
				x = x + sign(horizontalspeed);
			}
			if (typeOfHit != 2)
			{
				if (isinhit)
				{
					opponent.horizontalspeed = -horizontalspeed;
					opponent.pushbackwhileattacking = true;
				}
				horizontalspeed = 0;
			}
				
			else
			{
				horizontalspeed = -horizontalspeed div 2;
				sprite_index = spr_MokujinHitWallTrue;
				if (global.UsingFMod == false) 
					audio_play_sound(ThumpSound, 1, 0);
				else
					fmod_system_play_sound(global.All_WallBounceSound, false);
				bouncedagainstwall = true;
				typeOfHit = 0;
			}
		}
		if (place_meeting(x, y + verticalspeed, o_Ground))
		{
			while (!place_meeting(x, y+ sign(verticalspeed), o_Ground))
			{
				y = y + sign(verticalspeed);
			}
			if (typeOfHit != 2)
				verticalspeed = 0;
			else
			{
				verticalspeed = -verticalspeed div 2;
				sprite_index = spr_MokujinHitGroundTrue;
				if (global.UsingFMod == false) 
					audio_play_sound(ThumpSound, 1, 0);
					else
					fmod_system_play_sound(global.All_WallBounceSound, false);
				bouncedagainstground = true;
				typeOfHit = 0;
			}
		}
		if (isAttacking != 15 && isAttacking != 16)
		{
			if (place_meeting(x, y+1, o_Ground) && (sprite_get_name(sprite_index) == "spr_WindGuy" ||sprite_get_name(sprite_index) == "spr_WindGuyJump" || sprite_get_name(sprite_index) == "spr_WindGuyWalk"))
			{
				if (horizontalspeed != 0 && ((right && facing == 1) || (left && facing == -1)))
					sprite_index = spr_WindGuyWalk;
				if (horizontalspeed != 0 && ((left && facing == 1) || (right && facing == -1)))
					sprite_index = spr_WindGuyWalk;
				else if (horizontalspeed == 0)
					sprite_index = spr_WindGuy;
				x = x + horizontalspeed;
			}
			else if (hasdashedinair == 1 || hascommandjumped == 1 || isinhit == true || pushbackwhileattacking == true || (isinblock && opponent.hit != 0))
			{
				x = x + horizontalspeed;	
			}
			else if (speedbonus > 0 && !place_meeting(x + (speedbonus * -facing), y, o_Ground))
			{
				x = x - (speedbonus * facing);
				speedbonus--;
			}
			y = y + verticalspeed;
		}
		
	//Reset HitStop Buffer
		lefths = 0;
		righths = 0;
		jumphs = 0;
		downhs = 0;
		lightattackhs = 0;
		mediumattackhs = 0;
		heavyattackhs = 0;
		specialattackhs = 0;
	}
}

