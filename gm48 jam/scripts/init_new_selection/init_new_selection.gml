function init_new_selection(){
    selected = -1
    var _prev_selection_type = -1
    if current_selection > 0{
        _prev_selection_type = current_selection_type
    }
    
	//If we have a conditional here
	//keep it as a while in case the next is also a condition
	while current_node.is_condition {
        var _condition = current_node.condition
        var _check = current_node.check
        if _condition(_check){
            current_node = current_node.next_yes
        }else{
            current_node = current_node.next_no
        }
    }
	
    current_selection_type = current_node.type
    current_selection_args = current_node.args
    
    var _active = (_prev_selection_type == current_selection_type)
    
    return_selection = noone
    
    switch(current_selection_type){
        case SELECTION_TYPE.FINGER:    
            if !_active{
                show_flesh()
            }
            selection_script = player_selecting_finger
            
            for(var i = 0; i < array_length(global.player_fingers); i++){
                global.player_fingers[i].selected = false
            }
        break

        case SELECTION_TYPE.LANE:
            selection_script = player_selecting_lane
            if !_active{
                hide_flesh()
            }
        break
    }
    
    // Push fresh slots for this selection step
    array_push(revert_info, [])
    array_push(selected_info, [])
}