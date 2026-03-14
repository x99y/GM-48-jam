
function update_finger_pos(){
	with oHandRenderer{
		var _xscale = x_scale
		var _yscale = y_scale
	
		for(var _i = 0; _i < array_length(global.player_fingers); _i ++){	
		
			var _cur = global.player_fingers[_i];
			
			_cur.x = x + _cur.x_offset*_xscale
			_cur.y = y + _cur.y_offset*_yscale
			
			_cur.xscale = x_scale
			_cur.yscale = y_scale
		}
	}
}
