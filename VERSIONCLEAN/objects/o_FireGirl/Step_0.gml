var _hor = input_check("right", player) - input_check("left", player);
var _ver = input_check("down", player) - input_check("up", player);

// camera 
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

//COURSE
	if (facing = 1)
		runR = input_check_pressed("dashr", player);
	if (facing = -1)
		runL = input_check_pressed("dashl", player);
	if (facing = -1)
		BackrunR = input_check_pressed("dashr", player);
	if (facing = 1)
		BackrunL = input_check_pressed("dashl", player);
	if (runspeed != movespeed)
			var Runjump = runspeed;

///GRAVITÉ
	verticalspeed = verticalspeed + grv;
	
//SI AU SOL (DEPLACEMENTS, ATTAQUES AU SOL)
	if (place_meeting(x, y + 1, o_Ground) && isAttacking == 0) 
	{
		var move = right-left;
		if (Run = false)
			horizontalspeed = move * movespeed;
		if (Run = true)
			horizontalspeed = move * runspeed;
		isJumpingL = 0;
		isJumpingR = 0;
		
		if (Run && runspeed < Maxrunspeed)
			runspeed ++;
		if (Run = false)
			runspeed = movespeed;
		if (BackrunL)
		{
			dash = -1;
			alarm[0] = room_speed / 5;
		}
		if (BackrunR)
		{
			dash = 1;
			alarm[0] = 2;
		}
		
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
		}
		if (runL)
		{
			if (left)
				Run = true;	
		}
		
		if (runR)
			Run = true;
			
		if (facing = 1)
		{
			if (Run)
			{
				if(right)
					Run = true;
				else
				{			
					Run = false;
				}
			}
		}
		if (facing = -1)
		{
			if (Run)
			{
				if(left)
					Run = true;
				else
					Run = false;
			}
		}
		if (dash = -1)
		{
			if (horizontalspeed > -200)
				horizontalspeed-=50
		}
		if (dash = 1)
		{
			if (horizontalspeed < 200)
				horizontalspeed+=50;
		}
		if (lightattack && !down)
		{
			Atktemp = 10;
			isAttacking = 1;
			Atkframe = 0;
		}
		if (lightattack && down)
		{
			Atktemp = 9;
			isAttacking = 2;
			Atkframe = 0;
		}
		if (mediumattack && !down && !left && !right)
		{
			Atktemp = 15;
			isAttacking = 4;
			Atkframe = 0;
		}
		if (mediumattack && down)
		{
			Atktemp = 16;
			isAttacking = 7;
			Atkframe = 0;
		}
		if (facing == 1)
		{
			if (mediumattack && !down && right)
			{
				Atktemp = 15;
				isAttacking = 8;
				Atkframe = 0;
			}
		}
		if (facing == -1)
		{
			if (mediumattack && !down && left)
			{
				Atktemp = 15;
				isAttacking = 8;
				Atkframe = 0;
			}
		}
	}
	
///SI EN L'AIR (DEPLACEMENT, ATTAQUES EN L'AIR)
	if (!place_meeting(x, y + 1, o_Ground)) //si il n'est au sol
	{
		if (lightattack && !down)
		{
			Atktemp = 11;
			isAttacking = 3;
			Atkframe = 0;
		}
	}
	
///SI EN TRAIN DE TAPER (STARTUP, ACTIVE, RECO)
	if (isAttacking != 0)
	{
		Atkframe++;
		if (isAttacking == 1) /// JAB
		{
			if (Atkframe >= Atktemp && Atkreco == 0)
			{
				hitbox = HitBox_create(128 * facing, 128, 150 * facing, -500, 2, 10 * facing, 0, 1, 2, 0, 10, 16);
				Atkreco = 9;
				Atkframe = 0;
			}
		}
		if (isAttacking == 2)/// CROUCH JAB
		{
			if (Atkframe >= Atktemp && Atkreco == 0)
			{
				hitbox = HitBox_create(128 * facing, 128, 150 * facing, -100, 2, 10 * facing, 0, 1, 2, 0, 10, 16);
				Atkreco = 9;
				Atkframe = 0;
			}
		}
		if (isAttacking == 3)/// AIR JAB
		{
			if (Atkframe >= Atktemp && Atkreco == 0)
			{
				hitbox = HitBox_create(128 * facing, 128, 150 * facing, -100, 2, 10 * facing, -10, 1, 1, 0, 20, 16);
				Atkreco = 10;
				Atkframe = 0;
			}
		}
		if (isAttacking == 4) /// STAND MEDIUM 1
		{
			if (Atkframe >= Atktemp && Atkreco == 0)
			{
				hitbox = HitBox_create(500 * facing, 128, 100 * facing, -500, 2, 10 * facing, 0, 1, 2, 0, 18, 46);
				Atkreco = 45;
				Atkframe = 0;
			}
		}
		if (isAttacking == 5) /// STAND MEDIUM 2
		{
			if (Atkframe >= Atktemp && Atkreco == 0)
			{
				hitbox = HitBox_create(500 * facing, 128, 100 * facing, -500, 2, 10 * facing, 0, 1, 2, 0, 20, 20);
				Atkreco = 45;
				Atkframe = 0;
			}
		}
		if (isAttacking == 6) /// STAND MEDIUM 3
		{ 
			if (Atkframe >= Atktemp && Atkreco == 0)
			{
				hitbox = HitBox_create(500 * facing, 128, 100 * facing, -500, 2, 100 * facing, 0, 2, 2, 0, 90, 16);
				Atkreco = 9;
				Atkframe = 0;
			}
		}
		if (isAttacking == 7) /// CROUCH MEDIUM AKA QUICK LOW
		{
			if (Atkframe >= Atktemp && Atkreco == 0)
			{
				hitbox = HitBox_create(400 * facing, 200, 150 * facing, -100, 4, 20 *facing, 0, 1, 3, 0, 30, 16);
				Atkreco = 25;
				Atkframe = 0;
			}
		}
		if (isAttacking == 8)/// FORWARD MEDIUM AKA ANTI AIR
		{
			if (Atkframe >= Atktemp && Atkreco == 0)
			{
				hitbox = HitBox_create(250 * facing, 500, 150 * facing, -700, 4, 0, -100, 2, 2, 0, 60, 16);
				Atkreco = 25;
				Atkframe = 0;
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
			if (isAttacking == 7 && mediumattack && !down)
			{
				Atktemp = 15;
				isAttacking = 4;
				Atkframe = 0;
				Atkreco = 0;
			}
			if (isAttacking == 4 && mediumattack && hit == 4)
			{
				Atktemp = 15;
				isAttacking = 5;
				Atkframe = 0;
				Atkreco = 0;
			}
			if (isAttacking == 5 && mediumattack && hit == 5)
			{
				Atktemp = 15;
				isAttacking = 6;
				Atkframe = 0;
				Atkreco = 0;
			}
		}
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