function select_finger(){
	
	var _mouse_y = device_mouse_y_to_gui(0)
	var _mouse_x = device_mouse_x_to_gui(0)
	
	var _finger_count = array_length(global.player_fingers)

	var _closest = -1
	var _closest_dist = infinity

	for (var _j = 0; _j < _finger_count; _j++){
		
		var _cur = global.player_fingers[_j];

		// get scaled bbox
		var _left   = sprite_get_bbox_left(_cur.sprite_index)
		var _right  = sprite_get_bbox_right(_cur.sprite_index)
		var _top    = sprite_get_bbox_top(_cur.sprite_index)
		var _bottom = sprite_get_bbox_bottom(_cur.sprite_index)

		var _ox = sprite_get_xoffset(_cur.sprite_index)
		var _oy = sprite_get_yoffset(_cur.sprite_index)

		var _x1 = _cur.x + (_left  - _ox) * _cur.xscale;
		var _x2 = _cur.x + (_right - _ox) * _cur.xscale;
		var _y1 = _cur.y + (_top   - _oy) * _cur.yscale;
		var _y2 = _cur.y + (_bottom- _oy) * _cur.yscale;

		var _minx = min(_x1,_x2);
		var _maxx = max(_x1,_x2);
		var _miny = min(_y1,_y2);
		var _maxy = max(_y1,_y2);

		// closest point on rectangle
		var _cx = clamp(_mouse_x,_minx,_maxx);
		var _cy = clamp(_mouse_y,_miny,_maxy);

		var _dist = point_distance(_mouse_x,_mouse_y,_cx,_cy);

		if (_dist < _closest_dist){
			_closest_dist = _dist;
			_closest = _j;
		}
	}

	return _closest;
}