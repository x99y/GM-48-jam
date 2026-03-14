function mouse_down_over_card(){
	//pixels to move mouse before it is considered that the player wants to drag the card
	var move_threshold = 10
	
	if( device_mouse_x_to_gui(0) > selected_start_mousex - move_threshold and selected_start_mousex + move_threshold > device_mouse_x_to_gui(0) and device_mouse_y_to_gui(0) > selected_start_mousey-move_threshold){ 

		//We want to display the card
		if mouse_check_button_released(mb_left){
			switch_state(displaying_selected_card)
		}
	}else{	
		switch_state(dragging_card)
	}
}