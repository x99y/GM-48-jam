function add_effect_to_lane(_lane, _args){
	
	switch (_args){
		//Moving the player
		case LANE_EFFECTS.MOVE:
			
			array_push(revert_info[current_selection],current_lane)
			
			
			move_player(_lane,15)

		break
		case LANE_EFFECTS.SHOVE_LEFT:
		
		break
		case LANE_EFFECTS.SHOVE_RIGHT:
		
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