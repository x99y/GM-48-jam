function player_on_flesh(){
	var _new_selected = select_finger()
    var _mouse_y = device_mouse_y_to_gui(0)
    var _mouse_x = device_mouse_x_to_gui(0)
    
	
	if selected != _new_selected{
		
		
		if selected != -1 {
			global.player_fingers[selected].glow = false
			global.player_fingers[selected].glow_alpha = 0
			global.player_fingers[selected].glow_phase = 1
		}
		

		if _new_selected != -1{
				
			var _cur = global.player_fingers[_new_selected]


			_cur.glow = true;
			_cur.glow_alpha = 0
			_cur.glow_phase = 1

		}
		
		selected = _new_selected
	}

	var _ox = sprite_get_xoffset(sHand);
	var _oy = sprite_get_yoffset(sHand);
	var _x = GUI_HAND_SHOWN_X + (sprite_get_bbox_right(sHand) - _ox) * oHandRenderer.x_scale;
	var _y = GUI_HAND_SHOWN_Y + (sprite_get_bbox_top(sHand)   - _oy) * oHandRenderer.y_scale;

	var _in_bounds = (_mouse_x <= _x and _mouse_y >=_y)
	if !_in_bounds{
		switch_state(player_on_board)
		hide_flesh()
	}

}