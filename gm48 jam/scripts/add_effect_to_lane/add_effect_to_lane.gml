function add_effect_to_lane(_lane, _args){
	
	var _effect_x= (get_lane_x(_lane) / room_width) * VIEW_WIDTH
	var _effect_y =LANE_ENEMY_Y/room_height * VIEW_HEIGHT
	
	var _target
//hard coded functions
	
	switch (_args){
		//Moving the player
		case LANE_EFFECTS.MOVE:
			
			array_push(revert_info[current_selection],current_lane)
			
			
			move_player(_lane,15)

		break
		
		case LANE_EFFECTS.SHOVE_LEFT:
		    _target = global.lane[_lane]

		    if (_target == noone) {
				//Miss, there is nothing to undo
		        array_push(revert_info[current_selection], [])
		        popup_handler.add("Wiff!", _effect_x, _effect_y, c_white, 35)
		    } else {
		        var _lane_left = _lane - 1
		        if (_lane_left < 0 or global.lane[_lane_left] != noone) {
					
					//Dmg delt, cannot undo past here
					
		            array_push(revert_info[current_selection], -1)
					
					
		            popup_handler.add("Crunch", _effect_x, _effect_y, c_white, 35)
		            _target.move_and_back(_lane_left, 4, 0.4)
		            
					camera_shake(6, 0.75)
					
		            player_deal_dmg(_target, DMG_TYPE.CRUSH, 4)
		            if _lane_left >= 0 {
		                player_deal_dmg(global.lane[_lane_left], DMG_TYPE.CRUSH, 4)
		            }
		        } else {
					// Successful move, can be undone
					
		            array_push(revert_info[current_selection], _lane) 
		            global.lane[_lane] = noone
		            global.lane[_lane_left] = _target
		            _target.move_to_lane(_lane_left, 15)
		        }
		    }
		break

		case LANE_EFFECTS.SHOVE_RIGHT:
		    _target = global.lane[_lane]
			
		    if (_target == noone) {
		        // Miss, there is nothing to undo
		        array_push(revert_info[current_selection], [])
		        popup_handler.add("Wiff!", _effect_x, _effect_y, c_white, 35)
		    } else {
		        var _lane_right = _lane + 1
		        if (_lane_right >= 4 or global.lane[_lane_right] != noone) {
            
		            // Dmg dealt, cannot undo past here
		            array_push(revert_info[current_selection], -1)
            
		            popup_handler.add("Crunch", _effect_x, _effect_y, c_white, 35)
		            _target.move_and_back(_lane_right, 4, 0.4)
            
		            camera_shake(6, 0.75)
            
		            player_deal_dmg(_target, DMG_TYPE.CRUSH, 4)
		            if _lane_right < 4 {
		                player_deal_dmg(global.lane[_lane_right], DMG_TYPE.CRUSH, 4)
		            }
		        } else {
		            // Successful move, can be undone
					
		            array_push(revert_info[current_selection], _lane)
		            global.lane[_lane] = noone
		            global.lane[_lane_right] = _target
		            _target.move_to_lane(_lane_right, 15)
		        }
		    }
		break


		default:
			
		if !is_array(_args){
			return false
		}
		
		var _effect_type = _args[0]
		
		switch (_effect_type){
			case LANE_EFFECTS.DMG:		break;
			case LANE_EFFECTS.STATUS:	break;
		}
		break
	}
	
	return 
}


function get_string_number(_formula){
	if !safe_real(_formula, false){
		//find if we have this  -------------------------------------------------------------------------------------------------------------------
		if struct_exists(selected_card, _formula){
			_formula = struct_get(selected_card,_formula)
			if is_string(_formula){
			_formula = string_to_formula(_formula)
			}
		}
	}else{
		_formula = safe_real(_formula)
	}
	
	return _formula
}