function init_new_selection(){
	selected = -1

	var _prev_selection_type = -1
	if current_selection > 0{
		_prev_selection_type = current_selection_type
	}
	
 
	current_selection_type = (play_selection_requirement[current_selection][0])
	current_selection_args = []
	array_copy(current_selection_args,0,play_selection_requirement[current_selection],1,array_length(play_selection_requirement[current_selection])-1)
	
	
	var _active = (_prev_selection_type == current_selection_type)
	
	return_selection = noone
	
	//init what is needed
	switch(current_selection_type){
		case SELECTION_TYPE.FINGER: 	
			if !_active{
				show_flesh()
			}
			selection_script = player_selecting_finger
			
			//reset all fingers
			for(var i = 0; i <  array_length(global.player_fingers); i ++){
				global.player_fingers[i].selected = false
			}
				
		break
		case SELECTION_TYPE.LANE:
		
			selection_script = player_selecting_lane
			
		break
		
	}
	
	//info for reverting
	if revert_info[current_selection] = -1{
		revert_info[current_selection] = []
	}
}