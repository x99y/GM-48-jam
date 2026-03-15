

function is_biological(_selection_to_check){
    var _fingers = oPlayerController.selected_info[_selection_to_check]
    
    if !is_array(_fingers) or array_length(_fingers) == 0{
        return false
    }
    
    for (var _i = 0; _i < array_length(_fingers); _i++){
        var _finger = global.player_fingers[_fingers[_i]]
        
        if _finger == noone{
            return false
        }
        
        if _finger.state != FINGER_STATE.BIOLOGICAL{
            return false
        }
    }
    
    return true
}