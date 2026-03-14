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
			if !struct_exists(_finger, _args[0]){
				show_debug_message($"effect {_args[0]} is not in the finger")
				return false
			}
			array_push(revert_info[current_selection],_finger._args[0])
			_finger._args[0] += _args[1]
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