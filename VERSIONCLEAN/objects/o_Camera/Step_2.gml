/// @description Insert description here
// You can write your code in this editor

/*
var PandC = instance_find(o_PlayersAndCharacters, 0);
if (PandC == noone)
	game_end();
var camX = camera_get_view_x(view_camera[0]);
var camY = camera_get_view_y(view_camera[0]);
//var camW = camera_get_view_width(view_camera[0]) * global.Zoom;
//var camH = camera_get_view_height(view_camera[0])* global.Zoom;

// Step event of your camera object

// Define the zoom levels for when gettinghit = 1 and gettinghit = 0
zoomLevelGettingHit = 1.3; // Adjust this value as needed
zoomLevelNotGettingHit = 1.0; // Adjust this value as needed

// Define the zoom speed
zoomSpeed = 0.01; // Adjust this value as needed

// Check if gettinghit is equal to 1
if (global.DoTheZoom == true) {
    camera_set_view_size(view_camera[0], initialViewWidth -700, initialViewHeight -394);
	global.DoTheZoom = false;
} else {
    // If gettinghit is not equal to 1, smoothly dezoom
     global.targetWidth = initialViewWidth;
     global.targetHeight = initialViewHeight;
    global.currentWidth = camera_get_view_width(view_camera[0]);
    global.currentHeight = camera_get_view_height(view_camera[0]);
    
    // Smoothly adjust the zoom
    if (global.currentWidth < global.targetWidth) {
        global.currentWidth += 10;
	}
	if (global.currentHeight < global.targetHeight){
        global.currentHeight += 10;
    if (global.currentHeight > global.targetHeight)
	{
		global.currentHeight = initialViewHeight;
		global.currentWidth = initialViewWidth;
	}
    }
	camera_set_view_size(view_camera[0], global.currentWidth, global.currentHeight);
}

if (global.BigAssHitStop == 1)
	shakevalue = 3;
var	shake = power(shakevalue, 2) * shakepower;
camX += random_range(-shake, shake);
camY += random_range(-shake, shake);

camera_set_view_pos(view_camera[0], camX, camY);
//camera_set_view_size(view_camera[0], camW, camH);

if (shakevalue > 0)
	shakevalue -= 0.1;
