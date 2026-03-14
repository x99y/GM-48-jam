
draw_player_hand()


//Draw selected card infront
if oPlayerController.selected_card != noone{
	var _cur_selected_card = oPlayerController.selected_card
		
	_cur_selected_card.draw();
	_cur_selected_card.step()
}
	