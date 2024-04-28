/// @description Insérez la description ici
// Vous pouvez écrire votre code dans cet éditeur
instances = layer_get_all_elements("Instances");
instances_1 = layer_get_all_elements("Instances_1")
background = layer_get_all_elements("Background");

// Initialise Viewports
view_enabled = true;
view_visible[0] = true;
view_xport[0] = 0;
view_yport[0] = 0;
view_wport[0] = 3008;
view_hport[0] = 1692;
view_camera[0] = camera_create_view(0, 0, view_wport[0], view_hport[0], 0, noone, -1, -1, 200, 250);
cam1 = view_camera[0];

view_enabled = true;
view_visible[1] = false;
view_xport[1] = 0;
view_yport[1] = 0;
view_wport[1] = 3008;
view_hport[1] = 1692;
view_camera[1] = camera_create_view(0, 0, view_wport[1], view_hport[1], 0, noone, -1, -1, 200, 250);
cam2 = view_camera[1];

var _dwidth = 1920//display_get_width();
var _dheight = 1080//display_get_height();
var _xpos = (_dwidth / 2) - 680;
var _ypos = (_dheight /2) -470;
window_set_rectangle(_xpos, _ypos, _dwidth, _dheight);
surface_resize(application_surface, _dwidth, _dheight);
window_set_fullscreen(true);

shakepower = 5;
shakevalue = 0;
global.Zoom = 1;
global.DoTheZoom = false;
initialViewWidth = camera_get_view_width(view_camera[0]);
initialViewHeight = camera_get_view_height(view_camera[0]);
global.targetWidth = 0
global.targetHeight = 0
global.currentWidth = camera_get_view_width(view_camera[0]);
global.currentHeight = camera_get_view_height(view_camera[0]);

_viewMat = 0;
_projMat = 0;

camDist = -800;
camFov  = 90;
camAsp  = camera_get_view_width(view_camera[1]) / camera_get_view_height(view_camera[1]);
i = 0;
i2 = 0;
global.stayfocused = false;
global.smoothback = false;
_camX2 = 0;
_camY2 = 0;
_camX   = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2;
_camY   = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])/ 2;
global.GetShaedJ1 = false;
//gpu_set_ztestenable(true);
//gpu_set_alphatestenable(true);
//	gpu_set_texrepeat(true);