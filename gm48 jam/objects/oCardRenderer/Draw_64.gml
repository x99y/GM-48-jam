shader_set(shPalette)
draw_player_hand()

if deck_shown {
	draw_deck(sorted_list)	
}


//Draw selected card infront
if oPlayerController.selected_card != noone{
	var _cur_selected_card = oPlayerController.selected_card
		
	_cur_selected_card.draw();
	_cur_selected_card.step()
}


shader_reset();