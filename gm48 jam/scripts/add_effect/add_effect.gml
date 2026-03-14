function add_effect_to_finger(_finger, _args){

	
	switch (_args){
		case EFFECTS.BIO_HEAL:
			array_push(revert_info[current_selection],_finger.state)
			_finger.state = FINGER_STATE.BIOLOGICAL
		break

		case EFFECTS.MECH_HEAL:
			array_push(revert_info[current_selection],_finger.state)
			_finger.state = FINGER_STATE.MECHANICAL
		break

		case EFFECTS.DESTROY:
			array_push(revert_info[current_selection],_finger.state)
			_finger.state = FINGER_STATE.DESTROYED
			_finger.image_index = 1
		break
		
		default:
			
			if !is_array(_args){
				return false
			}
			
			var _status_effect = _args[0]
			
			if STATUS_EFFECT.COUNT <= _status_effect{ return false}
			
			//Idk why im doing it this way but i am deal with it
			var __effect_data = __status_effect_data()
			
			var _intensity = _args[1]
			
			if !safe_real(_intensity, false){
				//find if we have this  -------------------------------------------------------------------------------------------------------------------
				if struct_exists(selected_card, _intensity){
					_intensity = struct_get(selected_card,_intensity)
					if is_string(_intensity){
						_intensity = string_to_formula(_intensity)
					}
				}
			}
			
			array_push(revert_info[current_selection],_finger.status_effects[_status_effect])
			
			
			_finger.status_effects[_status_effect] += _intensity
			
		break
	}
}

/*
function restore_effect_to_finger(_finger, _args){
	switch (type){
		case EFFECTS.HEAL:
		
		break
		
		case EFFECTS.DESTROY:
			
		break
		
		default:
			if !struct_exists(_finger, _args[0]){
				show_debug_message($"effect {_args[0]} is not in the finger")
				return false	
			}
			
			_finger._args[0] -= _args[1]
		break
	}
}