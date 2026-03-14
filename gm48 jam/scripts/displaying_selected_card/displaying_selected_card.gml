function displaying_selected_card(){
	
	var _mouse_x = device_mouse_x_to_gui(0)
	var _mouse_y = device_mouse_y_to_gui(0)
					


	if mouse_check_button_pressed(mb_left){
		
		if selected_card.point_colliding(_mouse_x,_mouse_y){
			switch_state(dragging_card)
		}else{

		
			//rearrange hand
			var _xx = selected_card.x_start

			for(var i = 0; i < ds_list_size(global.hand); i++){
				if global.hand[| i].x > _xx{
					break
				}
			}
			ds_list_insert(global.hand,i,selected_card)		
			selected_card.switch_state(CARD_STATE.IDLE)
			selected_card = noone
			switch_state(player_in_hand)		
		}	
		rearrange_hand()
	}
}
