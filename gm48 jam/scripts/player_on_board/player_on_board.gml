
function player_on_board(){
	
	var _lane = select_lane()
	
	if _lane != -1{ 
		if current_info != _lane{
			if global.lane[_lane] != noone {
		
				var _ent = global.lane[_lane]
				oBoardRenderer.info_entity = _ent
				oBoardRenderer.info_timer = 0

				current_info = _lane
			}else{
				current_info = -1	
				oBoardRenderer.info_entity = noone	
			}

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
	
	if keyboard_check_pressed(vk_enter){
		switch_state(next_turn)
	}
}