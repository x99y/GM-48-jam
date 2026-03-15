function player_selecting_lane(args){
	/*
		SELF, //hit in front of player
		ANY, //hit any lane
		SIDE, //hit a lane in front of the player and one to the side
		NOT_SELF_SIDE, //hit a lane to the side
		NOT_SELF // any that are not in front of the player
	*/
	var _lane_to_select= args[0]
	var _number_to_select = get_string_number(args[1])
	
	var _can_select_self = false
	
	if _lane_to_select = LANE_SELECTION.SELF or
		_lane_to_select = LANE_SELECTION.ANY or 
		_lane_to_select = LANE_SELECTION.SIDE
	{
		_can_select_self = true
	}
	
	
	var _can_select_side = false
	if _lane_to_select = LANE_SELECTION.ANY or
		_lane_to_select = LANE_SELECTION.SIDE or 
		_lane_to_select = LANE_SELECTION.NOT_SELF_SIDE or
		_lane_to_select = LANE_SELECTION.NOT_SELF
	{
		_can_select_side = true
	}

	
	
	var _can_select_far = false
	if _lane_to_select = LANE_SELECTION.ANY or
		_lane_to_select = LANE_SELECTION.NOT_SELF
	{
		_can_select_far = true
	}
	

	var _new_selected = select_lane()


	var _valid = false
	if _new_selected != -1 {
	    var _lane_diff = abs(_new_selected - current_lane)
	    if _lane_diff == 0 and _can_select_self { _valid = true }
	    if _lane_diff == 1 and _can_select_side { _valid = true }
	    if _lane_diff >= 2 and _can_select_far  { _valid = true }
	}
	
	if _valid and selected != _new_selected {
	    selected = _new_selected
	} else if !_valid{
		selected = -1
	}
	
	
	
;

	if selected != -1 {
		var _lane_offsets = [LANE_ONE_XOFFSET, LANE_TWO_XOFFSET, LANE_THREE_XOFFSET, LANE_FOUR_XOFFSET]
		
	    if !instance_exists(oPointer) {
	        instance_create_layer(0, 0, "Instances", oPointer)
	    }
    
	    var _offset = _lane_offsets[selected];
	    var _center_x = (_offset[0] + _offset[1]) / 2
	    var _center_y = LANE_BOT_Y + 2
    
		oPointer.base_y = _center_y;
		oPointer.x = _center_x;
	    oPointer.target_lane = selected
	} else {
	    if instance_exists(oPointer) {
	        instance_destroy(oPointer);
	    }
	}
	
	
	
	if mouse_check_button_pressed(mb_left){
		if selected != -1{
		    
			if instance_exists(oPointer) {
		        instance_destroy(oPointer);
		    }
			
			
			//If there is only one
			if _number_to_select <= 1{
				return_selection = selected
			}else{
				
				//if we need to choose more than one
				if return_selection == noone{
					return_selection = [selected]
				}else{
					array_push(return_selection,selected)
				}
				
				selected = 	-1
				
				if array_length(return_selection) != _number_to_select{
					return
				}
				
				
			}

			return return_selection
		}
	}
	
	/*
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
	}*/
}