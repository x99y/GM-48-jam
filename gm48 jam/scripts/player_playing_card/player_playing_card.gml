
function player_playing_card(){
	
	var _selection = script_execute(selection_script, current_selection_args)	

	if _selection != undefined{
		var _effect;
		/////////////////////////////////////////////////////////////////////////////////////////////
		//Preform actions based on what was picked
		switch(current_selection_type){
			case SELECTION_TYPE.FINGER: 
			
				_effect = current_selection_args[2]
			
				if !is_array(_selection){
					_selection = [_selection]	
				}
				
				for(var i = 0; i < array_length(_selection); i ++){
					var cur = global.player_fingers[_selection[i]]
					
					
					//Can change this if needed
					script_execute(add_effect_to_finger, cur, _effect)
				}
				
				
			break;
			
			/////////////////////////////////////////////////////////////////////////////////////////////
			case SELECTION_TYPE.LANE: 
			
				_effect = current_selection_args[2]
			
				if !is_array(_selection){
					_selection = [_selection]	
				}
				
				for(var i = 0; i < array_length(_selection); i ++){
					var cur = _selection[i]
					
					script_execute(add_effect_to_lane, cur, _effect)
				}
				
				
			break;
			
		}

		selected_info[current_selection] = _selection
		array_push(node_history, current_node)
		current_node = current_node.next

		if current_node != noone {
			current_selection ++
			init_new_selection()	
		}else{
			//Finished playing the card ---------------------------------------------------------------------------
			//preform all final scripts
			run_script_nodes(selected_card.play_script_node)
			
			
			ds_list_add(global.discard, selected_card)
			
			switch_state(player_on_board)
			selected_card = noone
			
			hide_flesh()
			
		}
		
	}

	if keyboard_check_pressed(vk_escape){
		audio_play_sound(snd_exit,6,0,2)
		
		if current_selection <= 0{
		
			switch_state(player_in_hand)
			draw_card(selected_card)
			selected_card = noone
			hide_flesh()
			
		}else{
			//show_message(revert_info[current_selection - 1] == [])
	        if revert_info[current_selection - 1] == -1 or revert_info[current_selection - 1][0] == -1{

	            popup_handler.add_warning("Cannot UNDO past damage!", VIEW_WIDTH*0.35, VIEW_HEIGHT/2, c_white, 80)
	            return
	        }
			//Revert all selections we did
	        current_node = array_pop(node_history)
	        current_selection--
					
			init_new_selection()
			

			
			switch(current_selection_type){
				//Revert changes to fingers !
				case SELECTION_TYPE.FINGER: 
					//revert_info[current_selection])
				
					if revert_info[current_selection] == noone{
						break	
					}
					
					while array_length(selected_info[current_selection]) > 0{
						var _finger_to_restore = global.player_fingers[array_pop(selected_info[current_selection])]
						var _value_to_restore = array_pop(revert_info[current_selection])
						
						if !is_array(current_selection_args[2]){
							_finger_to_restore.state =	_value_to_restore
							
							//will be changed
							_finger_to_restore.image_index = 0
							
						}else{
							//We are changing a status effect instead

							var _status_effect = current_selection_args[2][0]		
							
						    if _status_effect == STATUS_EFFECT.DMG {
						        _finger_to_restore.hp = _value_to_restore
						        if _finger_to_restore.hp <= 0 {
						            _finger_to_restore.state       = FINGER_STATE.DESTROYED
						            _finger_to_restore.image_index = 1
						        } else {
						            _finger_to_restore.state       = array_pop(revert_info[current_selection])
						            _finger_to_restore.image_index = 0
						        }
						    } else {
						        _finger_to_restore.status_effects[_status_effect] = _value_to_restore
						    }					
		
							
						}	
						
					}
					
					animate("idle")
					
					
				break;
				
            
	            case SELECTION_TYPE.LANE:
	                var _value_to_restore = array_pop(revert_info[current_selection])
                
	                switch(current_selection_args[2]){
	                    case LANE_EFFECTS.MOVE:
	                        move_player(_value_to_restore, 15)
	                    break
	                    case LANE_EFFECTS.SHOVE_LEFT:
						    if is_array(_value_to_restore) {
								//do nothing, we missed
							}else{
	                            var _target = global.lane[_value_to_restore - 1]
	                            global.lane[_value_to_restore - 1] = noone
	                            global.lane[_value_to_restore] = _target
	                            _target.move_to_lane(_value_to_restore, 15)
	                        }
	                    break
						case LANE_EFFECTS.SHOVE_RIGHT:
						    if is_array(_value_to_restore) {
						        // Do nothing, we missed
						    } else {
						        var _target = global.lane[_value_to_restore + 1]
						        global.lane[_value_to_restore + 1] = noone
						        global.lane[_value_to_restore] = _target
						        _target.move_to_lane(_value_to_restore, 15)
						    }
						break
	                }
	            break           
	        }
			
		}
	}

}