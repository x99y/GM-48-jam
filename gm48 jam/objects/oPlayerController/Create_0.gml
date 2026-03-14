selected_start_mousex = 0
selected_start_mousey = 0

clicked = false

global.current_deck = ds_list_create()
global.hand = ds_list_create()

deck_pos = 0
deck_pos_to = deck_pos
last_pos = deck_pos
time = 0

//populate the deck
repeat(15){
	ds_list_add(global.current_deck, variable_clone(global.base_cards[irandom_range(1,2)].card_object))	
}

repeat (4){
	draw_card()	
}	

state = player_in_hand

selected_card = noone

sorted_list = ds_list_create()

//Init stats via database
init_player_stats_database()
for(var i = 0; i < array_length(DATA_stats_keyword); i ++){
	variable_instance_set(id,DATA_stats_keyword[i].var_name,1)
}


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
			
			var _selection_array = selected_card.play_selection_requirement
			
			if _selection_array == noone{
				//TODO play the card insantly
				//temp
				switch_state(player_on_board) //we can play the card instantly
				
				break
			}
			
			play_selection_requirement = [] 
			array_copy(play_selection_requirement,0,_selection_array, 0, array_length(_selection_array))
			
			revert_info = -1
			
			revert_info = array_create(array_length(play_selection_requirement),-1)
			selected_info = array_create(array_length(play_selection_requirement),-1)
			
			
			current_selection = 0
			init_new_selection()	
			
			
			
			
		break
		
		case player_viewing_deck:
		break


		default: break;	
	}
	
	state = _state
	
}

