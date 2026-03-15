function move_player(lane, _time_to){
	with oBoardRenderer{
		player_xto = get_lane_x(lane)
		player_time_to = _time_to
		player_startx = player_x
		
		player_time = 0
	}
	
	oPlayerController.current_lane = lane
}