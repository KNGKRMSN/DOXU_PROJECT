// camera

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

camera_set_view_pos(view_camera[0], _newX, _newY - 37);

//controle


down = input_check("down", player);
mediumattack = input_check_pressed("medium", player);
heavyattack = input_check("heavy", player);
specialattack = input_check("special", player);
right = input_check("right", player);
left = input_check("left", player);
jump = input_check("up", player);
lightattack = input_check_pressed("light", player);
special2 = input_check("special2", player);


if (o_Pause.pause == false && global.CantPlayYet == 0)
{
	if (state = STATE.SANSSWORD)
		hurtbox.image_blend = c_red;
	if (state = STATE.SWORD)
		hurtbox.image_blend = c_white;
	
	///GRAVITÉ
	
	verticalspeed = verticalspeed + grv;
	if (state = STATE.SANSSWORD)
	{
		if (special2 && Canswitchstat == true)
		{
			Canswitchstat = false;
			alarm[0] = room_speed;
			isAttacking = 0;
			Atkframe = 0;
			Atkreco = 0;
			state = STATE.SWORD;
		}
		
		if (isAttacking == 0 && place_meeting(x, y+1, o_Ground))
		{
			var move = right-left;
			isJumpingL = 0;
			isJumpingR = 0;
			flip = 0;
			
			horizontalspeed = move * movespeed;
			if (jump)  //Jump loin
			{
				verticalspeed = JumpHi;
				if (right && Run = false)
				isJumpingR = 1;
				if (left && Run = false)
				isJumpingL = 1;
				if (right && Run = true)
				isJumpingR = 2;
				if (left && Run = true)
				isJumpingL = 2;
				landed = 0;
			}
			if (lightattack && !down)
		{
			Atktemp = 100;
			isAttacking = 1;
			Atkframe = 0;
		}
			if (mediumattack && !down)
		{
			Atktemp = 80;
			isAttacking = 2;
			Atkframe = 0;
		}
			if (heavyattack && !down)
		{
			Atktemp = 50;
			isAttacking = 3;
			Atkframe = 0;
		}
		}
		if (isAttacking == 0 && !place_meeting(x, y+1, o_Ground))
		{
			if (heavyattack && !down)
			{
				Atktemp = 15;
				isAttacking = 4;
				Atkframe = 0;
			}
		}
		
		if (isAttacking != 0)
		{
			Atkframe++;
			
			if (isAttacking == 1) /// JAB
			{
				if (Atkframe >= Atktemp && Atkreco == 0)
				{
					hitbox = HitBox_create(128 * facing, 128, 300 * facing, -500, 1, 500 * facing, -10, 2, 2, 400, 90, 16);
					Atkreco = 60;
					Atkframe = 0;
				}	
				if (Atkreco != 0)
				{		
					if(Atkframe >= Atkreco)
					{
						isAttacking = 0;
						Atkreco = 0;
						Atkframe = 0;
					}
				}
			}
			if (isAttacking == 2) 
			{
				if (Atkframe >= Atktemp && Atkreco == 0)
				{
					hitbox = HitBox_create(3000 * facing, 500, 150 * facing, -500, 1, 5 * facing, -10, 2, 2, 150, 90, 16);
					Atkreco = 60;
					Atkframe = 0;
				}	
				if (Atkreco != 0)
				{		
					if(Atkframe >= Atkreco)
					{
						isAttacking = 0;
						Atkreco = 0;
						Atkframe = 0;
					}
				}
			}
			if (isAttacking == 3) 
			{ 
				if (Atkframe >= Atktemp && Atkreco == 0)
				{
					hitbox = HitBox_create(250 * facing, -5000, 150 * facing, 0, 8, 5 * facing, -150, 2, 2, 80, 90, 16);
					Atkreco = 60;
					audio_play_sound(DBHitSound, 1, 0);
					Atkframe = 0;
				}	
				if (Atkreco != 0)
				{		
					if(Atkframe >= Atkreco)
					{
						isAttacking = 0;
						Atkreco = 0;
						Atkframe = 0;
					}
				}
			}
			if (isAttacking == 4)
			{
				if (Atkframe >= Atktemp && Atkreco == 0)
				{
					flip ++;
					if (heavyattack)
					{
						hitbox = HitBox_create(250 * facing, -400, 300 * facing, -400, 1, 25 * facing, 0, 1, 2, 20, 5, 16);
						hitbox2 = HitBox_create(250 * facing, 250, 150 * facing, 0, 1, 35 * facing, 0, 1, 2, 50, 20, 10 + (flip % 10));
					 	Atkreco = 12;
					}
				}
				if (Atkreco != 0)
				{		
					if(Atkframe >= Atkreco)
					{
						isAttacking = 0;
						Atkreco = 0;
						Atkframe = 0;
						flip = 0;
					}
				}
			}
			if (isAttacking == 5)
			{
				if (Atkframe >= Atktemp && Atkreco == 0)
				{
					if (lightattack)
					{
						hitbox = HitBox_create(250 * facing, 300, 300 * facing, -400, 2, 15 * facing, 12, 1, 1, 20, 19, 12);
					}
				}
				if (Atkreco != 0)
				{		
					if(Atkframe >= Atkreco)
					{
						isAttacking = 0;
						Atkreco = 0;
						Atkframe = 0;
					}
				}
			}
				if (isAttacking == 6)
			{
				if (Atkframe >= Atktemp && Atkreco == 0)
				{
					if (mediumattack)
					{
						hitbox = HitBox_create(700 * facing, 250, 300 * facing, -400, 7, 75 * facing, 10, 1, 1, 30, 19, 12);
					}
				}
				if (Atkreco != 0)
				{		
					if(Atkframe >= Atkreco)
					{
						isAttacking = 0;
						Atkreco = 0;
						Atkframe = 0;
					}
				}
			}
		}
		
		if (isinhit != 0)
		{
			
		}
			///CHECK DE COLLISIONS
		if (isJumpingR = 1)
		{
			if (isJumpingR == 1 && !place_meeting(x + Jumplen, y, o_Ground)&& !place_meeting(x + Jumplen, y, opponent))
				{
					if (facing == -1 && global.CurrentDistance +Jumplen < global.MaxDistance)
						x += Jumplen;
					if (facing == 1)
						x += Jumplen;
				}
		}
		if (isJumpingL = 1) //Saut
		{
				if (isJumpingL == 1 && !place_meeting(x - Jumplen, y, o_Ground) && !place_meeting(x - Jumplen, y, opponent))
			{
				if (facing == 1 && global.CurrentDistance - Jumplen < global.MaxDistance)
					x -= Jumplen;
				else if (facing == -1)
					x -= Jumplen
			}
		}
		if (isJumpingR = 2) //Grand Saut 
		{
			if (isJumpingR == 2 && !place_meeting(x + Runjump, y, o_Ground)&& !place_meeting(x + Runjump, y, opponent))
				{
					if (facing == -1 && global.CurrentDistance +Runjump < global.MaxDistance)
						x += Runjump;
					if (facing == 1)
						x += Runjump;
				}
			if (Runjump == Maxrunspeed && hitbox == -1)
			{
				hitbox = HitBox_create(300 * facing, -600, 0, -100, 6, 5, 0, 1, 2, 1, 2, 0);
			}
		}
		if (isJumpingL = 2) // Grand Saut
		{
			if (isJumpingL == 2 && !place_meeting(x - Runjump, y, o_Ground) && !place_meeting(x - Runjump, y, opponent))
				{
				if (facing == 1 && global.CurrentDistance - Runjump < global.MaxDistance)
					x -= Runjump;
				else if (facing == -1)
					x -= Runjump;
				}
			if (Runjump == Maxrunspeed && hitbox == -1)
			{
				hitbox = HitBox_create(300 * facing, -600, 0, -100, 6, 5, 0, 1, 2, 1, 2, 0);
			}
		}
		if (place_meeting(x + horizontalspeed, y, o_Ground)) //Run
		{
			while (!place_meeting(x + sign(horizontalspeed), y, o_Ground))
			{
				x = x + sign(horizontalspeed);
			}
			horizontalspeed = 0;
		}
		if (place_meeting(x + horizontalspeed, y, opponent)) //HitBox Run
		{
			while (!place_meeting(x + sign(horizontalspeed), y, opponent))
			{
				x = x + sign(horizontalspeed);
			}
			horizontalspeed = 0;
		}
		if (place_meeting(x, y + verticalspeed, o_Ground))
		{
			while (!place_meeting(x, y + sign(verticalspeed), o_Ground))
			{
				y = y + sign(verticalspeed);
			}
			verticalspeed = 0;
		}
		if (place_meeting(x, y + verticalspeed, opponent) && y < opponent.y) 
		{
			if (x < opponent.x)
			{
				while (place_meeting(x, y + verticalspeed, opponent))
				{
					if (!place_meeting(x - 10, y, o_Ground))
						x -= 10;
					if (!place_meeting(opponent.x + 10, opponent.y - 1, o_Ground))
						opponent.x += 10;
				}
			}
			if (x > opponent.x)
			{
				while (place_meeting(x, y + verticalspeed, opponent))
				{
					if (!place_meeting(x + 10, y, o_Ground))
						x += 10;
					if (!place_meeting(opponent.x - 10, opponent.y - 1, o_Ground))
						opponent.x -= 10;
				}
			}
			if (x == opponent.x)
				{
				if (x > 3000)
					x -= 10;
				else 
					x += 10;
				}
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
						x += 10;
						opponent.x -= 10;
				}
			///CHECK FACING ET IMAGE_XSCALE
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
		else if facing == -1 && isinhit == 0
			image_xscale = -1;

	///MOUVEMENT
		if (place_meeting(x, y + 1, o_Ground) && isAttacking == 0)
			x = x + horizontalspeed;
		y = y + verticalspeed;
	}
	if (state = STATE.SWORD)	
	{
		if (special2 && Canswitchstat == true)
		{
			Canswitchstat = false;
			alarm[0] = room_speed;
			isAttacking = 0;
			Atkframe = 0;
			Atkreco = 0;
			state = STATE.SANSSWORD;
		}
		
		if (isAttacking == 0 && place_meeting(x, y+1, o_Ground))
		{
			var move = right-left;
			isJumpingL = 0;
			isJumpingR = 0;
			
			horizontalspeed = move * movespeed;
			if (jump)  //Jump loin
			{
				verticalspeed = JumpHi;
				if (right && Run = false)
				isJumpingR = 1;
				if (left && Run = false)
				isJumpingL = 1;
				if (right && Run = true)
				isJumpingR = 2;
				if (left && Run = true)
				isJumpingL = 2;
				landed = 0;
			}
		if (lightattack && !down)
			{
				Atktemp = 10;
				isAttacking = 1;
				Atkframe = 0;
			}
				if (mediumattack && !down)
			{
				Atktemp = 13;
				isAttacking = 2;
				Atkframe = 0;
			}
				if (heavyattack && !down)
			{
				Atktemp = 28;
				isAttacking = 3;
				Atkframe = 0;
			}
		}
		if (isAttacking == 0 && !place_meeting(x, y+1, o_Ground))
		{
			
		}
		
		if (isAttacking != 0)
		{
			Atkframe++;
			
			if (isAttacking == 1) /// JAB
			{
				if (Atkframe == 9 && Atkreco == 0 && lightattack)
				{
					hitbox = HitBox_create(128 * facing, 128, 300 * facing, -500, 3, 17 * facing, 0, 1, 2, 35, 20, 13);
					Atkreco = 10;
					Atkframe = 0;
				}	
				if (Atkframe >= Atktemp && Atkreco == 0)
				{
					hitbox = HitBox_create(128 * facing, 128, 300 * facing, -500, 3, 15 * facing, 0, 1, 2, 30, 18, 11);
					Atkreco = 10;
					Atkframe = 0;
				}	
				if (Atkreco != 0)
				{		
					if(Atkframe >= Atkreco)
					{
						isAttacking = 0;
						Atkreco = 0;
						Atkframe = 0;
					}
				}
			}
			if (isAttacking == 2) 
			{
				if (Atkframe >= Atktemp && Atkreco == 0)
				{
					hitbox = HitBox_create(3000 * facing, 500, 150 * facing, -500, 1, 5 * facing, -10, 2, 2, 150, 90, 16);
					Atkreco = 60;
					Atkframe = 0;
				}	
				if (Atkreco != 0)
				{		
					if(Atkframe >= Atkreco)
					{
						isAttacking = 0;
						Atkreco = 0;
						Atkframe = 0;
					}
				}
			}
			if (isAttacking == 3) 
			{
				if (Atkframe >= Atktemp && Atkreco == 0 && Atkactiv == 0)
				{
					hitbox = HitBox_create(250 * facing, -5000, 150 * facing, 0, 1, 5 * facing, -150, 2, 2, 80, 90, 16);
					Atkactiv = 58;
					Atkframe = 0;
				}
				if (Atkactiv != 0)
				{
					if (Atkframe % 3 == 0)
					{
						hitbox = HitBox_create(250 * facing, -5000, 150 * facing, 0, 1, 5 * facing, -150, 2, 2, 80, 90, 16)
					}
					if (Atkframe == Atkactiv)
					{
						Atkreco = 60;
						Atkframe = 0;
						Atkactiv = 0;
					}
				}
				if (Atkreco != 0)
				{		
					if(Atkframe >= Atkreco)
					{
						isAttacking = 0;
						Atkreco = 0;
						Atkframe = 0;
					}
				}
				
			}
		}
		
		if (isinhit != 0)
		{
			
		}
			///CHECK DE COLLISIONS
		if (isJumpingR = 1)
		{
			if (isJumpingR == 1 && !place_meeting(x + Jumplen, y, o_Ground)&& !place_meeting(x + Jumplen, y, opponent))
				{
					if (facing == -1 && global.CurrentDistance +Jumplen < global.MaxDistance)
						x += Jumplen;
					if (facing == 1)
						x += Jumplen;
				}
		}
		if (isJumpingL = 1) //Saut
		{
				if (isJumpingL == 1 && !place_meeting(x - Jumplen, y, o_Ground) && !place_meeting(x - Jumplen, y, opponent))
			{
				if (facing == 1 && global.CurrentDistance - Jumplen < global.MaxDistance)
					x -= Jumplen;
				else if (facing == -1)
					x -= Jumplen
			}
		}
		if (isJumpingR = 2) //Grand Saut 
		{
			if (isJumpingR == 2 && !place_meeting(x + Runjump, y, o_Ground)&& !place_meeting(x + Runjump, y, opponent))
				{
					if (facing == -1 && global.CurrentDistance +Runjump < global.MaxDistance)
						x += Runjump;
					if (facing == 1)
						x += Runjump;
				}
			if (Runjump == Maxrunspeed && hitbox == -1)
			{
				hitbox = HitBox_create(300 * facing, -600, 0, -100, 6, 5, 0, 1, 2, 1, 2, 0);
			}
		}
		if (isJumpingL = 2) // Grand Saut
		{
			if (isJumpingL == 2 && !place_meeting(x - Runjump, y, o_Ground) && !place_meeting(x - Runjump, y, opponent))
				{
				if (facing == 1 && global.CurrentDistance - Runjump < global.MaxDistance)
					x -= Runjump;
				else if (facing == -1)
					x -= Runjump;
				}
			if (Runjump == Maxrunspeed && hitbox == -1)
			{
				hitbox = HitBox_create(300 * facing, -600, 0, -100, 6, 5, 0, 1, 2, 1, 2, 0);
			}
		}
		if (place_meeting(x + horizontalspeed, y, o_Ground)) //Run
		{
			while (!place_meeting(x + sign(horizontalspeed), y, o_Ground))
			{
				x = x + sign(horizontalspeed);
			}
			horizontalspeed = 0;
		}
		if (place_meeting(x + horizontalspeed, y, opponent)) //HitBox Run
		{
			while (!place_meeting(x + sign(horizontalspeed), y, opponent))
			{
				x = x + sign(horizontalspeed);
			}
			horizontalspeed = 0;
		}
		if (place_meeting(x, y + verticalspeed, o_Ground))
		{
			while (!place_meeting(x, y + sign(verticalspeed), o_Ground))
			{
				y = y + sign(verticalspeed);
			}
			verticalspeed = 0;
		}
		if (place_meeting(x, y + verticalspeed, opponent) && y < opponent.y) 
		{
			if (x < opponent.x)
			{
				while (place_meeting(x, y + verticalspeed, opponent))
				{
					if (!place_meeting(x - 10, y, o_Ground))
						x -= 10;
					if (!place_meeting(opponent.x + 10, opponent.y - 1, o_Ground))
						opponent.x += 10;
				}
			}
			if (x > opponent.x)
			{
				while (place_meeting(x, y + verticalspeed, opponent))
				{
					if (!place_meeting(x + 10, y, o_Ground))
						x += 10;
					if (!place_meeting(opponent.x - 10, opponent.y - 1, o_Ground))
						opponent.x -= 10;
				}
			}
			if (x == opponent.x)
				{
				if (x > 3000)
					x -= 10;
				else 
					x += 10;
				}
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
						x += 10;
						opponent.x -= 10;
				}
			///CHECK FACING ET IMAGE_XSCALE
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
		else if facing == -1 && isinhit == 0
			image_xscale = -1;

	///MOUVEMENT
		if (place_meeting(x, y + 1, o_Ground) && isAttacking == 0)
			x = x + horizontalspeed;
		y = y + verticalspeed;
	}
	if (state = STATE.OTC)
	{
	
	}
	if (place_meeting(x, y+1, o_Ground))
		{
			if (landed == 0 && IsJumpingN)
			{
				audio_play_sound(LandingSound, 1, 0);
				landed = 1;
				isJumpingR = 0;
				IsJumpingN = 0;
				isJumpingL = 0;
				isAttacking = 0;
				Atkframe = 0;
				Atkactiv = 0;
				Atkreco = 0;
				Atktemp = 0;
			}
			if (landed == 0 && (isJumpingL || isJumpingR))
			{
				audio_play_sound(LandingSound02, 1, 0);
				landed = 1;
				isJumpingR = 0;
				IsJumpingN = 0;
				isJumpingL = 0;
				isAttacking = 0;
				Atkframe = 0;
				Atkactiv = 0;
				Atkreco = 0;
				Atktemp = 0;
			}
		}
		if (gettingHit == true && (opponent.hitbox != -1 || instance_exists(o_ShahOver)|| instance_exists(o_ShahUnder)))
		{
			
			if (!instance_exists(o_ShahUnder) && !instance_exists(o_ShahOver))
				hitBy = opponent.hitbox;
			if ((isblocking == 0 && hitBy.placeOfAttack > 0 && hitBy.placeOfAttack < 4)|| (isblocking == 2 && hitBy.placeOfAttack == 1) || (isblocking == 1 && hitBy.placeOfAttack == 3))
			{
				if (fx2 == -1 && opponent.hit == 4)
				{
					fx2 = Fx_create(spr_FxMediumHit, 0, -700, false)
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
						audio_play_sound(Hit02Sound, 1, 0);
						global.HitStop = 1;
					}
					if (hitBy.hitStun > 30)
					{
						fx2 = Fx_create(spr_FxMediumDownAirHit, 150* facing, -400, true)
						audio_play_sound(Hit02Sound, 1, 0);
						global.HitStop = 1;
					}
					/*if (hitBy.hitStun > 30 && sprite_get_name(opponent.sprite_index) == "spr_WindGuyHeavyStand")
					{
						audio_play_sound(RidleySound, 1, 0);
						global.BigAssHitStop = 1;
					}*/
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
						audio_play_sound(Hit03Sound, 1, 0);
						global.BigAssHitStop = 1;
					}
				}
				if (hitBy.typeOfAttack == 2) //Project Hit
				{
					if (hitBy.xPushBack * -facing > hitBy.yPushBack)
						sprite_index = spr_MokujinHitDownHeavyAirTrue;
					else
						sprite_index = spr_MokujinHitBackMediumAirTrue;
					audio_play_sound(DBHitSound, 1, 0);
					mask_index = spr_SheerFlingCollisionMask;
					global.BigAssHitStop = 1;
				}
				if (hitBy.typeOfAttack == 6) //Projectile hit
				{
					var _hiteffect = -1;
					sprite_index = spr_MokujinHitTrue;
					if (hitBy.hitStun <= 20)
					{
						audio_play_sound(Hit02Sound, 1, 0);
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
				horizontalspeed = hitBy.xPushBack;
				if (hitBy.yPushBack != 0)
					verticalspeed = hitBy.yPushBack;
				hitStun = hitBy.hitStun - isgettingcomboed;
				typeOfHit = hitBy.typeOfAttack;
				//image_xscale = 1.2 * facing;
				//image_yscale = 1.2;
				isgettingcomboed++;
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
				horizontalspeed = hitBy.xPushBack;
				if (isblocking == 1)
				{
					var _blockeffect = -1;
					if (hitBy.blockStun <= 20)
					{
						audio_play_sound(BlockSound, 1, 0);
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
						audio_play_sound(BlockSound, 1, 0);
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
						audio_play_sound(BlockSound, 1, 0);
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
						audio_play_sound(BlockSound, 1, 0);
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
						audio_play_sound(BlockSound, 1, 0);
						_blockeffect = instance_create_layer(x + 150 * facing, y - 450, "Instances_1", o_BlockEffect)
						_blockeffect.image_xscale = -facing;
						_blockeffect.image_angle = point_distance(0, 0, hitBy.xPushBack, hitBy.yPushBack)
					}
					else
					{
						audio_play_sound(BlockSound, 1, 0);
						_blockeffect = instance_create_layer(x + 150 * facing, y - 450, "Instances_1", o_BlockEffect)
						_blockeffect.image_xscale = -facing;
						_blockeffect.image_angle = point_distance(0, 0, hitBy.xPushBack, hitBy.yPushBack)
					}
				}
			}
			gettingHit = false;
			
		}
		
}
