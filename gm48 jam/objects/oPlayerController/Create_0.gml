selected_start_mousex = 0
selected_start_mousey = 0

clicked = false

global.current_deck = ds_list_create()
global.hand = ds_list_create()


//populate the deck
repeat(15){
	ds_list_add(global.current_deck, variable_clone(global.base_cards[irandom_range(1,2)].card_object))	
}

repeat (4){
	draw_card()	
}	



state = player_in_hand

selected_card = noone

function switch_state(_state){
	switch(_state){
		
		case player_on_board:
			hide_hand()
		break
		
		case player_in_hand:
			show_hand()
		break
		
		case displaying_selected_card:
			selected_card.move_to(GUI_DISPLAYED_CARD_X,GUI_DISPLAYED_CARD_Y,CARD_STATE.DISPLAY,15)
			state = displaying_selected_card	
		break
		
		case dragging_card:
			locked = true
			selected_card.switch_state(CARD_STATE.HELD)
		break
		
		case player_playing_card:
			selected_card.move_to(0,0)
			
			oHandRenderer.move_to(GUI_HAND_SHOWN_X,GUI_HAND_SHOWN_Y,15)
			oHandRenderer.shake = true
			
			selected = -1
		break
		
		default: break;	
	}
	
	state = _state
	
}