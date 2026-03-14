function dragging_card(){
	
	var _mouse_Y = device_mouse_y_to_gui(0)
	var _mouse_x = device_mouse_x_to_gui(0)
	
	selected_card.x_dest = _mouse_x
	selected_card.y_dest = _mouse_Y
	if device_mouse_y_to_gui(0) >= GUI_HAND_BORDER_TOP_Y{
		
		if device_mouse_x_to_gui(0) >= GUI_HAND_MARGIN_SIDE_HELD_CARD and device_mouse_x_to_gui(0) <= VIEW_WIDTH-GUI_HAND_MARGIN_SIDE_HELD_CARD{
			rearrange_hand_with_selected()
		}else{
			rearrange_hand()	
		}
		
		if !locked{
			show_hand()
			locked = true
		}
		
	}else{
		if locked {
			locked = !locked 
			rearrange_hand()
			hide_hand()
			
		}
	}
	
	

	if !mouse_check_button(mb_left){
		if _mouse_Y < GUI_HAND_BORDER_TOP_Y/* and oGameController.is_players_turn()*/{
			switch_state(player_playing_card)
		}else{
			//reinsert the held card
			for(var i = 0; i < ds_list_size(global.hand); i++){ //<--------------- can be MOVEd to a function dipshit 
				if global.hand[| i].x > _mouse_x{
					break
				}
			}
			ds_list_insert(global.hand,i,selected_card)
			rearrange_hand()
			switch_state(player_in_hand)
		}

	}
	
}	