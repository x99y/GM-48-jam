function player_selecting_finger(args){
	
	var _valid_type = args[0]
	
	var _can_select_bio = false
	var _can_select_mech = false
	var _can_select_destroyed = false
	
	for(var i = 0; i < array_length(_valid_type); i ++){
		switch (_valid_type[i]){
			case SELECTION_FINGER_TYPE.BIOLOGICAL: 
			_can_select_bio = true
			break;
			case SELECTION_FINGER_TYPE.DESTROYED: 
			_can_select_destroyed = true
			break;
			case SELECTION_FINGER_TYPE.MECHANICAL: 
			_can_select_mech = true
			break;
			case SELECTION_FINGER_TYPE.ALL: 
			_can_select_bio = true
			_can_select_mech = true
			_can_select_destroyed = true
			break;
			
		}
	}
	

	var _number_to_select = args[1]

	var _new_selected = select_finger()

	
	if selected != _new_selected{
		
		
		if selected != -1 {
			global.player_fingers[selected].glow = false
			global.player_fingers[selected].glow_alpha = 0
			global.player_fingers[selected].glow_phase = 1
		}
		

		if _new_selected != -1{
				
			var _cur = global.player_fingers[_new_selected]

			if ((_can_select_bio and _cur.state = FINGER_STATE.BIOLOGICAL) or 
				(_can_select_destroyed and _cur.state = FINGER_STATE.DESTROYED) or 
				(_can_select_mech and _cur.state = FINGER_STATE.MECHANICAL)) and 
				global.player_fingers[_new_selected].selected = false{
	
	
				_cur.glow = true;
				
			}else{
				_new_selected = -1
			}
		}
		
		selected = _new_selected
	}
	
	//Select a finger
	if mouse_check_button_pressed(mb_left){
		if selected != -1{
			//If there is only one
			if _number_to_select <= 1{
				return_selection = selected
		
				global.player_fingers[selected].glow = false
				global.player_fingers[selected].glow_alpha = 0
				global.player_fingers[selected].glow_phase = 1
			}else{
				
				//if we need to choose more than one
				if return_selection == noone{
					return_selection = [selected]
					
				}else{
					array_push(return_selection,selected)
				}
				
				
				global.player_fingers[selected].selected = true
				
				
				
				global.player_fingers[selected].glow = false
				global.player_fingers[selected].glow_alpha = 0
				global.player_fingers[selected].glow_phase = 1
				selected = 	-1
				
				if array_length(return_selection) != _number_to_select{
					return
				}
				
				
			}

			return return_selection
		}
	}
}