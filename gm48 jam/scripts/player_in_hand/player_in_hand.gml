function player_in_hand(){
	/*selected_card = noone

	
	var _mouse_y = device_mouse_y_to_gui(0)
	var _mouse_x = device_mouse_x_to_gui(0)

	if _mouse_y < GUI_HAND_BORDER_TOP_Y{
		//if the cards are hidden, we are looking at the map
		//switch_state(player_on_board)
		show_debug_message("Not on cards!")
	}
	
	
	var hand_size = ds_list_size(global.hand)
	var sep = ((GUI_HAND_MAX_WIDTH) - ((GUI_CARD_WIDTH) * hand_size)) / hand_size
	var _card = clamp((_mouse_x-GUI_HAND_MARGIN_SIDE) div ( GUI_CARD_WIDTH + sep),0,hand_size - 1)
		
	var _cur_card = global.hand[| _card]
		
	if _cur_card.point_colliding(_mouse_x, _mouse_y) == true{
				
		//This is our selected card
		if _cur_card.state = CARD_STATE.IN_HAND || _cur_card.state = CARD_STATE.HOVER{
			selected_card =_cur_card
			_cur_card.switch_state(CARD_STATE.HOVER)
		}

						
		if mouse_check_button_pressed(mb_left){
				
			lock_cards()
				
			//Remove card from list
			selected_card = _cur_card
			ds_list_delete(global.hand, _card)		
			selected_start_mousex = _mouse_x
			selected_start_mousey = _mouse_y
				
			switch_state(mouse_down_over_card)					
		}
	}
		

	
	if oBodyController.mouse_over(){
		switch_state(player_on_body_combat)	
		oHandRender.switch_state(cards_not_in_focus)
	}
	
	if keyboard_check_pressed(ord("D")) ||  (point_on_deck(_mouse_x,_mouse_y) and mouse_check_button_pressed(mb_left)){
		oHandRender.switch_state(reveal_deck)
		deck_pos = 0
		deck_pos_to = 0
		selected_card = noone
		switch_state(displaying_deck)
	}*/
}