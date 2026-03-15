
function draw_card(_card = global.current_deck[| 0]){

	with oCardRenderer{
		if _card = undefined{
			
			if ds_list_size(global.discard) = 0{
			
			show_debug_message("No card to add")
			
			}else{
				ds_list_copy(global.current_deck, global.discard)
				ds_list_clear(global.discard)
				ds_list_shuffle(global.current_deck)
				
				card = global.current_deck[| 0]
			}
			return	
		}
		
		_card.x = GUI_DECK_X/2
		_card.y = GUI_DECK_Y/2 - ds_list_size(global.current_deck)
		_card.image_xscale = -GUI_DECK_WIDTH/GUI_DECK_WIDTH
		_card.image_yscale = GUI_DECK_HEIGHT/GUI_DECK_HEIGHT
		
		ds_list_add(global.hand,_card)
		
		if _card = global.current_deck[| 0]{
			ds_list_delete(global.current_deck,0)
		}
		
		rearrange_hand()

	}
}