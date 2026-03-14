
function player_playing_card(){

	show_debug_message(select_finger())

	if keyboard_check_pressed(vk_escape){
		switch_state(player_on_board)
		draw_card(selected_card)
		selected_card = noone
	}

}