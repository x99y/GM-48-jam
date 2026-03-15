if draw_count >= 4{
	switch_state(player_on_board)
}else{
	draw_count ++
	draw_card()
	
	if draw_count >= 4{
		alarm[0] = 40	
	}else{
		alarm[0] = 10
	}
}