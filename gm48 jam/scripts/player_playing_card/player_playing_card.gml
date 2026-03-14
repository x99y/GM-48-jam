
function player_playing_card(){
	
	var _selection = script_execute(selection_script, current_selection_args)	

	if _selection != undefined{
		
		
		//Preform actions based on what was picked
		switch(current_selection_type){
			case SELECTION_TYPE.FINGER: 
			
				var _effect = current_selection_args[2]
			
				if !is_array(_selection){
					_selection = [_selection]	
				}
				
				for(var i = 0; i < array_length(_selection); i ++){
					var cur = global.player_fingers[_selection[i]]
					
					
					//Can change this if needed
					script_execute(add_effect_to_finger, cur, _effect)
				}
				
				
			break;
			
		}

		selected_info[current_selection] = _selection

		if current_selection < array_length(play_selection_requirement)-1{
			current_selection ++
			init_new_selection()	
		}else{
			//Finished playing the card ---------------------------------------------------------------------------
			switch_state(player_on_board)
			selected_card = noone
			
			hide_flesh()
			
		}
		
	}

	if keyboard_check_pressed(vk_escape){
		
		if current_selection <= 0{
		
			switch_state(player_in_hand)
			draw_card(selected_card)
			selected_card = noone
			
			//TODO hide anything showing
			hide_flesh()
			
		}else{
			

			//Revert all selections we did
			current_selection --
					
			init_new_selection()

			
			switch(current_selection_type){
				case SELECTION_TYPE.FINGER: 
					//revert_info[current_selection])
				
					if revert_info[current_selection] == noone{
						break	
					}
					
					while array_length(selected_info[current_selection]) > 0{
						var _finger_to_restore = global.player_fingers[array_pop(selected_info[current_selection])]
						var _value_to_restore = array_pop(revert_info[current_selection])
						
						if current_selection_args[2] < EFFECTS.END_OF_TURN{
							_finger_to_restore.state =	_value_to_restore
							
							//will be changed
							_finger_to_restore.image_index = 0
						}
						
					}
					
					
				break;
			}
			
		}
	}

}