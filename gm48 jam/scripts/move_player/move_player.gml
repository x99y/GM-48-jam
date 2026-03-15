function move_player(lane, _time_to){
	with oBoardRenderer{
		player_xto = get_lane_x(lane)
		player_time_to = _time_to
		player_startx = player_x
		
		player_time = 0
	}
	
	oPlayerController.current_lane = lane
}

function move_entity(_entity, _lane, _time_to) {
    _entity.x_to = get_lane_x(_lane)
    _entity.move_time_to = _time_to
    _entity.start_x = _entity.x
    _entity.move_time = 0
    _entity.lane = _lane
}