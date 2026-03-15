
function player_on_board(){
	
	var _lane = select_lane()
	
	if _lane != -1{ 
		if current_info != _lane and global.lane[_lane] != noone {
		
			var _ent = global.lane[_lane]
			oBoardRenderer.info_entity = _ent
			oBoardRenderer.info_timer = 0

			current_info = _lane

		}
	}else{
		if current_info != -1{
			current_info = -1	
			oBoardRenderer.info_entity = noone
		}
	}
	
	
	var _mouse_y = device_mouse_y_to_gui(0)
	if _mouse_y > GUI_CARD_HIDDEN_Y - GUI_CARD_HEIGHT/2{
		switch_state(player_in_hand)
	}
}