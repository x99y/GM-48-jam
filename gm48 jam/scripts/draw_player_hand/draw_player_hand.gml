function draw_player_hand(){

	var _deck_size = ds_list_size(global.current_deck)	
	

	//for(var i =0; i < _deck_size; i++){
	//		draw_sprite_ext(GUI_DECK_SPRITE,0,GUI_DECK_X,GUI_DECK_Y-i,GUI_DECK_WIDTH/GUI_DECK_BASE_WIDTH,GUI_DECK_HEIGHT/GUI_DECK_BASE_HEIGHT,0,c_white,1)/
	//	}

	//Draw vars
	var _current_hand_size = ds_list_size(global.hand)

	//Draw Cards
	if _current_hand_size != 0{
		
		for(var i = 0; i < _current_hand_size; i ++){
		
			var _cur_card =  global.hand[| i]

			//Dont draw if the player has seleted this card
			if (oPlayerController.selected_card == _cur_card) { continue }

			//Draw the card
			_cur_card.step()
			_cur_card.draw()

		}
	
	}
}
