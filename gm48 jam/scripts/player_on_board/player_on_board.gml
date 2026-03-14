
function player_on_board(){
	
	var _mouse_y = device_mouse_y_to_gui(0)
	if _mouse_y > GUI_CARD_HIDDEN_Y - GUI_CARD_HEIGHT/2{
		switch_state(player_in_hand)
	}
}