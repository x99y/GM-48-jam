selected_start_mousex = 0
selected_start_mousey = 0

clicked = false

global.current_deck = ds_list_create()

//populate the deck
repeat(15){
	ds_list_add(global.current_deck, variable_clone(global.base_cards[irandom_range(1,2)].card_object))	
}

global.hand = ds_list_create()


state = noone//player_in_hand

selected_card = noone

function switch_state(_state){
	switch(_state){
		default: break;	
	}
	
	state = _state
	
}