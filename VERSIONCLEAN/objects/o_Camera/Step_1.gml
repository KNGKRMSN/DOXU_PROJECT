/// @description Insert description here
// You can write your code in this editor
var _camW   = camera_get_view_width(view_camera[0]);
var _camH   = camera_get_view_height(view_camera[0]);


if (instance_exists(o_Sheer))
{
	if (global.BigAssHitStop == 0 || global.GetShaedJ1 == true)
	{
		i = 0;
		i2 = 0;
		view_visible[0] = true;
		view_visible[1] = false;
		var targ1 = global._activeplayers[1];
		var targ2 =  global._activeplayers[2];
		if (targ2.isinhit == false && global.stayfocused == true)
		{
			global.stayfocused = false;
			global.smoothback = true;
		}
		if (global.smoothback == true)
		{
			var target_distance = point_distance(targ1.x, targ1.y, targ2.x, targ2.y)
			var target_dir = point_direction(targ1.x, targ1.y, targ2.x, targ2.y)

			var x_middle = lengthdir_x(target_distance/2, target_dir)
			var y_middle = lengthdir_y(target_distance/2, target_dir)
			
			var cam_w = camera_get_view_width(cam1)
			var cam_h = camera_get_view_height(cam1)
			_camX = targ1.x + x_middle - cam_w/2;
			_camY = targ1.y + y_middle - cam_h/2;
			
			// Step size for interpolation
			var step = 0.1; // Adjust this value for speed of interpolation
			var tolerance = 4;
			
			// Smoothly move value1 towards value2
			_camX2 = lerp(_camX2, _camX, step);
			_camY2 = lerp(_camY2, _camY, step);
			camera_set_view_pos(cam1, _camX2, _camY2 - 650)
			if (abs(_camX2 - _camX) < tolerance && abs(_camY2 - _camY) < tolerance)
				 global.smoothback = false;
		}
		if (((targ1.hit == 13 && targ2.isinhit == true) || global.stayfocused == true) && global.smoothback == false)
		{
			global.stayfocused = true
			var cam_w = camera_get_view_width(cam1)
			var cam_h = camera_get_view_height(cam1)
			_camX2 = targ2.x - cam_w/2;
			_camY2 = targ2.y - cam_h/2;
			camera_set_view_pos(cam1, targ2.x - cam_w/2 , (targ2.y - cam_h/2) - 650)
		}
		else if (global.smoothback == false)
		{
		//Camera Position
			var target_distance = point_distance(targ1.x, targ1.y, targ2.x, targ2.y)
			var target_dir = point_direction(targ1.x, targ1.y, targ2.x, targ2.y)

			var x_middle = lengthdir_x(target_distance/2, target_dir)
			var y_middle = lengthdir_y(target_distance/2, target_dir)
		

			var cam_w = camera_get_view_width(cam1)
			var cam_h = camera_get_view_height(cam1)
	
			_camX = targ1.x + x_middle - cam_w/2;
			_camY = targ1.y + y_middle - cam_h/2;
			
			camera_set_view_pos(cam1, targ1.x + x_middle - cam_w/2 , (targ1.y + y_middle - cam_h/2) - 650)
		}
	}
	if (global.BigAssHitStop == 1 && global.GetShaedJ1 == false)
	{
		view_visible[1] = true;
		view_visible[0] = false;
		var targ1 = global._activeplayers[1];
		var targ2 =  global._activeplayers[2];

		if (targ2.isinhit == true && targ1.facing == 1)
		{
			//Camera Position
			var target_distance = point_distance(targ1.x, targ1.y, targ2.x, targ2.y)
			var target_dir = point_direction(targ1.x, targ1.y, targ2.x, targ2.y)

			var x_middle = lengthdir_x(target_distance/2, target_dir)
			var y_middle = lengthdir_y(target_distance/2, target_dir)

			var cam_w = camera_get_view_width(cam2)
			var cam_h = camera_get_view_height(cam2)
	
			_camX = targ1.x + x_middle - cam_w/2;
			_camY = targ1.y + y_middle - cam_h/2;
			_viewMat = matrix_build_lookat(targ1.x -i, _camY , -(target_distance + 400 - i2), targ1.x +i, _camY +i2, 0, 0, 1, 0)
			_projMat = matrix_build_projection_perspective_fov(camFov, camAsp, 3, 30000);
			camera_set_view_pos(cam2, targ1.x + x_middle - cam_w/2 ,(targ1.y + y_middle - cam_h/2) - 650)
			camera_set_view_mat(cam2, _viewMat);
			camera_set_proj_mat(cam2, _projMat);
		
			i+=1;

			if (targ1.isAttacking == 17)
				i2 +=6;
		}
		if (targ2.isinhit == false && targ1.facing == 1)
		{
			//Camera Position
			var target_distance = point_distance(targ1.x, targ1.y, targ2.x, targ2.y)
			var target_dir = point_direction(targ1.x, targ1.y, targ2.x, targ2.y)

			var x_middle = lengthdir_x(target_distance/2, target_dir)
			var y_middle = lengthdir_y(target_distance/2, target_dir)

			var cam_w = camera_get_view_width(cam2)
			var cam_h = camera_get_view_height(cam2)
	
			_camX = targ1.x + x_middle - cam_w/2;
			_camY = targ1.y + y_middle - cam_h/2;
			_viewMat = matrix_build_lookat(targ1.x -i, _camY , -(target_distance + 400 - i2), targ1.x +i, _camY +i2, 0, 0, 1, 0)
			_projMat = matrix_build_projection_perspective_fov(camFov, camAsp, 3, 30000);
			camera_set_view_pos(cam2, targ1.x + x_middle - cam_w/2 ,(targ1.y + y_middle - cam_h/2) - 650)
			camera_set_view_mat(cam2, _viewMat);
			camera_set_proj_mat(cam2, _projMat);
		
			i+=1;
			if (targ1.isAttacking == 17)
				i2 +=6;
		}
		if (targ2.isinhit == true && targ1.facing == -1)
		{
			//Camera Position
			var target_distance = point_distance(targ1.x, targ1.y, targ2.x, targ2.y)
			var target_dir = point_direction(targ1.x, targ1.y, targ2.x, targ2.y)

			var x_middle = lengthdir_x(target_distance/2, target_dir)
			var y_middle = lengthdir_y(target_distance/2, target_dir)

			var cam_w = camera_get_view_width(cam2)
			var cam_h = camera_get_view_height(cam2)
	
			_camX = targ1.x + x_middle - cam_w/2;
			_camY = targ1.y + y_middle - cam_h/2;
			_viewMat = matrix_build_lookat(targ1.x -i, _camY, -(target_distance + 400), targ1.x +i, _camY -i2, 0, 0, 1, 0)
			_projMat = matrix_build_projection_perspective_fov(camFov, camAsp, 3, 30000);
			camera_set_view_pos(cam2, targ1.x + x_middle - cam_w/2 ,(targ1.y + y_middle - cam_h/2) - 650)
			camera_set_view_mat(cam2, _viewMat);
			camera_set_proj_mat(cam2, _projMat);
		
			i-=1;
			if (targ1.isAttacking == 17)
			i2-=6;
		}
		
		if (targ1.isinhit == true && targ2.facing == 1)
		{
			//Camera Position
			var target_distance = point_distance(targ1.x, targ1.y, targ2.x, targ2.y)
			var target_dir = point_direction(targ1.x, targ1.y, targ2.x, targ2.y)

			var x_middle = lengthdir_x(target_distance/2, target_dir)
			var y_middle = lengthdir_y(target_distance/2, target_dir)

			var cam_w = camera_get_view_width(cam2)
			var cam_h = camera_get_view_height(cam2)
	
			_camX = targ1.x + x_middle - cam_w/2;
			_camY = targ1.y + y_middle - cam_h/2;
			_viewMat = matrix_build_lookat(targ2.x -i, _camY , -(target_distance + 400 - i2), targ2.x +i, _camY +i2, 0, 0, 1, 0)
			_projMat = matrix_build_projection_perspective_fov(camFov, camAsp, 3, 30000);
			camera_set_view_pos(cam2, targ2.x + x_middle - cam_w/2 ,(targ2.y + y_middle - cam_h/2) - 650)
			camera_set_view_mat(cam2, _viewMat);
			camera_set_proj_mat(cam2, _projMat);
		
			i+=1;

			if (targ2.isAttacking == 17)
				i2 +=6;
		}
		if (targ1.isinhit == false && targ2.facing == 1)
		{
			//Camera Position
			var target_distance = point_distance(targ1.x, targ1.y, targ2.x, targ2.y)
			var target_dir = point_direction(targ1.x, targ1.y, targ2.x, targ2.y)

			var x_middle = lengthdir_x(target_distance/2, target_dir)
			var y_middle = lengthdir_y(target_distance/2, target_dir)

			var cam_w = camera_get_view_width(cam2)
			var cam_h = camera_get_view_height(cam2)
	
			_camX = targ1.x + x_middle - cam_w/2;
			_camY = targ1.y + y_middle - cam_h/2;
			_viewMat = matrix_build_lookat(targ2.x -i, _camY , -(target_distance + 400 - i2), targ2.x +i, _camY +i2, 0, 0, 1, 0)
			_projMat = matrix_build_projection_perspective_fov(camFov, camAsp, 3, 30000);
			camera_set_view_pos(cam2, targ2.x + x_middle - cam_w/2 ,(targ2.y + y_middle - cam_h/2) - 650)
			camera_set_view_mat(cam2, _viewMat);
			camera_set_proj_mat(cam2, _projMat);
		
			i+=1;
			if (targ2.isAttacking == 17)
				i2 +=6;
		}
		if (targ1.isinhit == true && targ2.facing == -1)
		{
			//Camera Position
			var target_distance = point_distance(targ1.x, targ1.y, targ2.x, targ2.y)
			var target_dir = point_direction(targ1.x, targ1.y, targ2.x, targ2.y)

			var x_middle = lengthdir_x(target_distance/2, target_dir)
			var y_middle = lengthdir_y(target_distance/2, target_dir)

			var cam_w = camera_get_view_width(cam2)
			var cam_h = camera_get_view_height(cam2)
	
			_camX = targ1.x + x_middle - cam_w/2;
			_camY = targ1.y + y_middle - cam_h/2;
			_viewMat = matrix_build_lookat(targ2.x -i, _camY, -(target_distance + 400), targ2.x +i, _camY -i2, 0, 0, 1, 0)
			_projMat = matrix_build_projection_perspective_fov(camFov, camAsp, 3, 30000);
			camera_set_view_pos(cam2, targ2.x + x_middle - cam_w/2 ,(targ2.y + y_middle - cam_h/2) - 650)
			camera_set_view_mat(cam2, _viewMat);
			camera_set_proj_mat(cam2, _projMat);
		
			i-=1;
			if (targ2.isAttacking == 17)
			i2-=6;
		}
	}
}

//



