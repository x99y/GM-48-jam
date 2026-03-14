
function player_playing_card(){
	
	show_debug_message(select_lane())
	
	var _new_selected = select_finger()
	
	if selected != _new_selected{
		
		if selected != -1 {
			global.player_fingers[selected].glow = false
			global.player_fingers[selected].glow_alpha = 0
			global.player_fingers[selected].glow_phase = 1
		}
		
		if _new_selected != -1 global.player_fingers[_new_selected].glow = true;
		
		selected = _new_selected

	}

	if keyboard_check_pressed(vk_escape){
		switch_state(player_on_board)
		draw_card(selected_card)
		selected_card = noone
	}

}