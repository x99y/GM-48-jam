if mouse_check_button_pressed(mb_left){
	current_card ++	
}

if mouse_check_button_pressed(mb_right){
	current_card --
}

current_card = clamp(current_card, 0, _length-1)

draw_text(10,10,global.base_cards[current_card].card_object.play_selection_requirement)