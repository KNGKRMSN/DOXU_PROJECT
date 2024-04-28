/// @description Open-transition
	//create and play opening sequence
	var _sequ = CurrentPanel.animopen;
	var _layer = "UI_seq";
	//var dis_x = display_get_gui_width();
	//var dis_y = display_get_gui_height();
	var dis_x = camera_get_view_x(view_camera[0]);
	var dis_y = camera_get_view_y(view_camera[0]);
	var dis_x2 = camera_get_view_width(view_camera[0]);
	var dis_y2 = camera_get_view_height(view_camera[0]);

	//var dis_y = display_get_gui_height();
	if (_sequ != noone)
	{
		layersequence = layer_sequence_create(_layer, dis_x + dis_x2/2, dis_y + dis_y2/2,_sequ);
	}
	//layer_sequence_x(layersequence,dis_x/2);
	//layer_sequence_y(layersequence,dis_y/2);
