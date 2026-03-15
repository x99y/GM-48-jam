

function is_mechanical(_selection_to_check){
	// if the check isnt even for a finger
	if !play_selection_requirement[_selection_to_check][0] = SELECTION_TYPE.FINGER{
		return false	
	}
	
	
	var _fingers = selected_info[_selection_to_check]

	if !is_array(_fingers){
		return global.player_fingers[_fingers].state = FINGER_STATE.MECHANICAL
	}
	
    for (var _i = 0; _i < array_length(_fingers); _i++){
        var _finger = global.player_fingers[_fingers[_i]]
                
        if _finger.state != FINGER_STATE.MECHANICAL{
            return false
        }
    }
	
	return true
}